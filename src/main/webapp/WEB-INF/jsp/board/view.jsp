<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/flowbite@1.4.4/dist/flowbite.min.css" />
<script>
$(document).ready(function(){
	let likeResult = '${result}';
	if(likeResult > 0){
		$("#likeBtn").css("backgroundColor","pink");
	}	
	
	getListReply();
});

function doLikekBoard() {
	$.ajax({
		type: "GET",
        url: "${contextPath}/myPage/isLikeBoard.do",
        data: {
        	"board_id" : ${boardInfo.board_id}
        },
        success: function (result) {
        	insertOrdeleteLike(result);
        },
        error: function () {
        }
	});  
}

function insertOrdeleteLike(result) {
	
	let url = "doLikeBoard.do";
	let bgColor = "pink";
	
	if(result > 0) {
		url = "delLikeBoard.do";
		bgColor = "";
	} 
	
	$.ajax({
		type: "GET",
	    url: "${contextPath}/myPage/"+url,
	    data: {
	    	"board_id" : ${boardInfo.board_id}
	    },
	    success: function () {
	    	$("#likeBtn").css("backgroundColor",bgColor);
	    },
	    error: function () {
	        alert('게시물 좋아요 실패하였습니다.');
	    }
	});  
}


function getListReply() {
	$.ajax({
		type: "GET",
	    url: "${contextPath}/reply/getListReply.do",
	    data: {
	    	"board_id" : ${boardInfo.board_id}
	    },
	    success: function (replyList) {
	    	$("#replyList").append(replyList);
	    },
	    error: function () {
	    }
	});  
}

function doReply() {
	let replyContent = $("#replyContent").val();
	if('${member_num}' == 0) {
		alert('로그인 후 작성할 수 있습니다.');
		return;
	} else if(replyContent == '') {
		alert('댓글을 입력해주세요.');
		return;
	} else {
		$.ajax({
			type: "POST",
		    url: "${contextPath}/reply/insertReply.do",
		    data: {
		    	"reply_content" : replyContent,
		    	"board_id" : ${boardInfo.board_id}
		    },
		    success: function () {
		    	alert('댓글 입력이 성공했습니다');
		    	getListReply();
		    },
		    error: function () {
		    	alert('댓글 입력이 실패하였습니다');
		    }
		});  
	}
}

function reportContent(){	//신고버튼 기능함수
    var login_num = "<%=String.valueOf(request.getAttribute("member_num"))%>";
    if(login_num=='null' || login_num == 0){
        noty_control('information', '로그인 후 가능합니다.', '3000');
        return;
    }

    $.ajax({
        url : '${contextPath}/report/insert',
        type : 'post',
        data : {
            "original_seq" : "${boardInfo.board_id}",
            "reported_sort" : $("input[type=radio][name=report_sort]:checked").val(),
            "reported_id" : login_num
        },
        success : function(cnt){
        	console.log(cnt)
        	if(cnt==1){
        		 noty_control('success','신고가 접수되었습니다','3000');
        	} else {
        		noty_control('information', '신고는 한 게시글당 한번만 가능합니다.', '3000');
        	}
           
        },
        error : function(){
            noty_control('error','신고접수에 실패했습니다. \n다시 시도해주세요','3000');
        }
    });
}
</script>
<script src="${contextPath}/resources/noty/noty.js"></script><!-- noty 기능 -->
<script src="${contextPath}/resources/noty/notypack.js"></script>
</head>
<body>
<div class="pt-10"></div>	
<div class="max-w-2xl mx-auto pt-10">
	<div>카테고리 : ${boardInfo.board_category}</div>
    <div class="flex items-center py-2 px-3 bg-gray-50 rounded-lg dark:bg-gray-700">       
	    제목 <div id="board_title" rows="1" class="block mx-4 p-2.5 w-full text-sm text-gray-900 bg-white rounded-lg border 
	    border-gray-300 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-800 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
	      ${boardInfo.board_title}
	</div>	         
    </div>
    <div class="py-8">
    	${boardInfo.board_content}
    </div>  
    <c:set value="${sessionScope.member_num}" var="memberNum"/>
 	<c:if test="${member_num ne 0 && memberNum eq member_num}">
    <a type="submit" href="${contextPath}/board/goUpdateDetail.do?board_id=${boardInfo.board_id}"
	class="inline-flex items-center px-5 py-2.5 text-sm font-medium text-center text-white bg-blue-700 rounded-lg focus:ring-4 focus:ring-blue-200 dark:focus:ring-blue-900 hover:bg-blue-800">
        수정
    </a>
    </c:if>
    <a type="submit" href="${contextPath}/board/goBoard.do"
	class="inline-flex items-center px-5 py-2.5 text-sm font-medium text-center text-white bg-blue-700 rounded-lg focus:ring-4 focus:ring-blue-200 dark:focus:ring-blue-900 hover:bg-blue-800">
        목록
    </a>

    <div>
		<c:if test="${member_num ne 0}">
		    <a class="w-16"
		     type="submit" onclick="javascript:doLikekBoard()" id="likeBtn">
		    	<img src="<c:url value='/resources/images/starrate.png'/>">       
		    </a>
	    </c:if>
	</div>

    <div class="max-w-2xl mx-auto pt-10">
        <button class="text-white relative inline-flex items-center justify-center p-0.5 mb-2 mr-2 overflow-hidden text-sm font-medium text-gray-900 rounded-lg group bg-gradient-to-br from-green-400 to-blue-600 group-hover:from-green-400 group-hover:to-blue-600 hover:text-white dark:text-white focus:ring-4 focus:outline-none focus:ring-green-200 dark:focus:ring-green-800"
        data-modal-toggle="report-modal">
            신고하기
        </button>
    </div>

  <!-- Main modal -->
  <div id="report-modal" tabindex="-1" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 w-full md:inset-0 h-modal md:h-full justify-center items-center flex" aria-modal="true" role="dialog">
    <div class="relative p-4 w-full max-w-md h-full md:h-auto">
        <!-- Modal content -->
        <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
            <button type="button" class="absolute top-3 right-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-800 dark:hover:text-white" data-modal-toggle="report-modal">
                <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
                <span class="sr-only">Close modal</span>
            </button>
            <div class="py-6 px-6 lg:px-8">
                <h3 class="mb-4 text-xl font-medium text-gray-900 dark:text-white">콘텐츠 신고</h3>
                <form class="space-y-6" action="#">
                    <ul class="font-medium text-gray-900 bg-white rounded-lg border border-gray-200 dark:bg-gray-700 dark:border-gray-600 dark:text-white">
                        <li class="w-full rounded-t-lg border-b border-gray-200 dark:border-gray-600">
                            <div class="flex items-center pl-3">
                                <input type="radio" value="1" name="report_sort" class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-700 focus:ring-2 dark:bg-gray-600 dark:border-gray-500">
                                <label for="list-radio-license" class="py-3 ml-2 w-full text-sm font-medium text-gray-900 dark:text-gray-300">성적인 콘텐츠</label>
                            </div>
                        </li>
                        <li class="w-full rounded-t-lg border-b border-gray-200 dark:border-gray-600">
                            <div class="flex items-center pl-3">
                                <input type="radio" value="2" name="report_sort" class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-700 focus:ring-2 dark:bg-gray-600 dark:border-gray-500">
                                <label for="list-radio-id" class="py-3 ml-2 w-full text-sm font-medium text-gray-900 dark:text-gray-300">폭력적 또는 혐오스러운 콘텐츠</label>
                            </div>
                        </li>
                        <li class="w-full rounded-t-lg border-b border-gray-200 dark:border-gray-600">
                            <div class="flex items-center pl-3">
                                <input type="radio" value="3" name="report_sort" class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-700 focus:ring-2 dark:bg-gray-600 dark:border-gray-500">
                                <label for="list-radio-millitary" class="py-3 ml-2 w-full text-sm font-medium text-gray-900 dark:text-gray-300">증오 또는 학대하는 콘텐츠</label>
                            </div>
                        </li>
                        <li class="w-full rounded-t-lg border-b border-gray-200 dark:border-gray-600">
                            <div class="flex items-center pl-3">
                                <input type="radio" value="4" name="report_sort" class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-700 focus:ring-2 dark:bg-gray-600 dark:border-gray-500">
                                <label for="list-radio-passport" class="py-3 ml-2 w-full text-sm font-medium text-gray-900 dark:text-gray-300">유해하거나 위험한 행위</label>
                            </div>
                        </li>
                        <li class="w-full rounded-t-lg border-b border-gray-200 dark:border-gray-600">
                            <div class="flex items-center pl-3">
                                <input type="radio" value="5" name="report_sort" class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-700 focus:ring-2 dark:bg-gray-600 dark:border-gray-500">
                                <label for="list-radio-passport" class="py-3 ml-2 w-full text-sm font-medium text-gray-900 dark:text-gray-300">스팸 또는 사용자를 현혹하는 콘텐츠</label>
                            </div>
                        </li>
                    </ul>
                    <button data-modal-toggle="report-modal" type="button" class="text-white bg-red-600 hover:bg-red-800 focus:ring-4 focus:outline-none focus:ring-red-300 dark:focus:ring-red-800 font-medium rounded-lg text-sm inline-flex items-center px-5 py-2.5 text-center mr-2" onclick="reportContent()">
                        신고하기
                    </button>
                    <button data-modal-toggle="report-modal" type="button" class="text-gray-500 bg-white hover:bg-gray-100 focus:ring-4 focus:outline-none focus:ring-gray-200 rounded-lg border border-gray-200 text-sm font-medium px-5 py-2.5 hover:text-gray-900 focus:z-10 dark:bg-gray-700 dark:text-gray-300 dark:border-gray-500 dark:hover:text-white dark:hover:bg-gray-600 dark:focus:ring-gray-600">취소</button>                
                </form>
            </div>
        </div>
    </div>
</div>
<!-- 댓글입력창 -->
	<div class="flex flex-wrap -mx-4">
	   <div class="w-full md:w-1/2 lg:w-1/3 px-4">
         <label for="" class="font-medium text-base text-black block mb-3">
         댓글
        	<!-- 댓글입력버튼 -->
        	<div id="cmtsBtn" class="
				   py-1
				   px-20
				   lg:px-4
				   xl:px-10
				   inline-flex
				   items-center
				   justify-center
				   text-center text-primary text-base
				   border border-primary
				   rounded-md
				   hover:bg-primary hover:border-primary hover:text-white
				   transition
				   float-right">
				<a href="javascript:doReply()">
				입력
				</a>
			</div>
         </label>
         <textarea rows="5" placeholder="댓글을 입력해주세요" id="replyContent" class="
            w-full
            border-[1.5px] border-form-stroke
            rounded-lg
            py-3
            px-5
            font-medium
            text-body-color
            placeholder-body-color
            outline-none
            focus:border-primary
            active:border-primary
            transition
            disabled:bg-[#F5F7FD] disabled:cursor-default
            "></textarea>
	      <div id="replyList"></div>
	   </div>
	</div>  
</div> 
</body>
</html>