<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<link rel="stylesheet" href="https://unpkg.com/flowbite@1.4.4/dist/flowbite.min.css" />
<script>
$(document).ready(function(){
	$('#editor').on('load',(function(){
		$('#editor').get(0).contentWindow.snView($('#hiddenContents').html());
	}));
});

function boardAction(action) {
	if(action != '' && action != null) {
		let url = "${contextPath}/board/"+ action +"Board.do";
		if(action == 'insert') {
			message = '입력';
			$('input[name=board_content]').val($("#editor").get(0).contentWindow.snContents());
		} else if(action == 'update') {
			message = '수정';
			$('input[name=board_content]').val($("#editor").get(0).contentWindow.snContents());
		} else if(action == 'delete') {
			message = '삭제';
		}
		doAction(url, message);
	}
	
}
function doAction(url, message) {
	let formData = $('#boardForm').serialize();
	$.ajax({
		type: "post",
        url: url,
        enctype: "multipart/form-data",
        data: formData,
        success: function (data) {
        	alert('게시물을 '+ message +'하였습니다.');
        	//location.href="${contextPath}/board/goBoard.do";
        },
        error: function () {
            alert('게시물 '+ message +'에 실패하였습니다.');
        }
	});  
}
</script>

<div class="pt-10"></div>	
<div class="max-w-2xl mx-auto pt-10">
	<form id="boardForm" method="post" enctype="multipart/form-data" onsubmit="return false;">
		<c:if test="${isInsUpd eq 'U'}">
			<input type="hidden" name="board_id" value="${boardInfo.board_id}">
		</c:if>
		<input type="hidden" name="board_category" value="게시판">
		<input type="hidden" name="board_content" value="">
	    
	    <div class="flex items-center py-2 px-3 bg-gray-50 rounded-lg dark:bg-gray-700">       
		    제목 <input id="board_title" rows="1" class="block mx-4 p-2.5 w-full text-sm text-gray-900 bg-white rounded-lg border 
		    border-gray-300 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-800 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
		      name="board_title" value="${boardInfo.board_title}" required>	         
	    </div>	 
		<!-- editor -->
	    <div class="edit">
			<iframe id="editor" src="<c:url value='/common/editor.do'/>" width="100%" height="400px" frameborder="0" scrolling="no" style="overflow:hidden;"></iframe>
		</div>    
	    <c:choose>
			<c:when test="${isInsUpd eq 'U'}">
			    <button type="submit" onclick="boardAction('update');"
				class="inline-flex items-center px-5 py-2.5 text-sm font-medium text-center text-white bg-blue-700 rounded-lg focus:ring-4 focus:ring-blue-200 dark:focus:ring-blue-900 hover:bg-blue-800">
			        수정
			    </button>
			</c:when> 
			<c:otherwise>
			    <button type="submit" onclick="boardAction('insert');"
			    class="inline-flex items-center px-5 py-2.5 text-sm font-medium text-center text-white bg-blue-700 rounded-lg focus:ring-4 focus:ring-blue-200 dark:focus:ring-blue-900 hover:bg-blue-800">
			        등록
			    </button>
			</c:otherwise>
		</c:choose>
		<a type="submit" onclick="boardAction('delete');"
		class="inline-flex items-center px-5 py-2.5 text-sm font-medium text-center text-white bg-blue-700 rounded-lg focus:ring-4 focus:ring-blue-200 dark:focus:ring-blue-900 hover:bg-blue-800">
		    삭제
	    </a>
    </form>
</div>
<div id="hiddenContents" style="display:none;"><c:out value="${boardInfo.board_content}" escapeXml="false"/></div>
