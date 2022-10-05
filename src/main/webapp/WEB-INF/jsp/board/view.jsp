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
	    	if(replyList.length > 0) {
	    		$("#replyList").empty();
		    	$("#replyContent").val('');
		    	
		    	for(var i=0; i<replyList.length; i++){
		    		$("#replyList").append(replyList[i].reply_content);
		    	}
	    	}
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
</script>
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
	
	<!-- 댓글입력창 -->
	<div class="flex flex-wrap -mx-4">
	   <div class="w-full md:w-1/2 lg:w-1/3 px-4">
	      <div class="mb-12">
	         <label for="" class="font-medium text-base text-black block mb-3">
	         댓글
	        	<!-- 댓글입력버튼 -->
				<a href="javascript:doReply()" class="
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
				   float-right
				   ">
				입력
				</a>
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
	      </div>
	      <div id="replyList"></div>
	   </div>
	</div>  
</div> 
</body>
</html>