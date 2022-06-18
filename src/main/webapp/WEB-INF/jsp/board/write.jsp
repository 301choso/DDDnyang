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
	<c:if test="${isInsUpd eq 'U'}">
		setTextarea(${boardInfo.board_content});
	</c:if>	
});
function insertBoard() {
	let formData = $("#boardForm").serialize();
	
	$.ajax({
		type: "post",
        enctype: "multipart/form-data",
        url: "${contextPath}/board/insertBoard.do",
        data: formData,
        success: function (data) {
        	alert('게시물을 등록하였습니다.');
        },
        error: function () {
            alert('게시물 등록에 실패하였습니다.');
        }
	});
}

function updateBoard() {
	let formData = $("#boardForm").serialize();
	
	$.ajax({
		type: "post",
        enctype: "multipart/form-data",
        url: "${contextPath}/board/updateBoard.do",
        data: formData,
        success: function (data) {
        	alert('게시물을 수정하였습니다.');
        },
        error: function () {
            alert('게시물 수정에 실패하였습니다.');
        }
	});
}
</script>
</head>
<body>
<div class="pt-10"></div>	
<div class="max-w-2xl mx-auto pt-10">
	<form id="boardForm" method="post"  onsubmit="return false;">
		<input type="hidden" name="board_category" value="게시판">
	    <label for="chat" class="sr-only">Your message</label>
	    <div class="flex items-center py-2 px-3 bg-gray-50 rounded-lg dark:bg-gray-700">       
		    제목 <input id="board_title" rows="1" class="block mx-4 p-2.5 w-full text-sm text-gray-900 bg-white rounded-lg border 
		    border-gray-300 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-800 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
		      name="board_title" value="${boardInfo.board_title}" required>	         
	    </div>	 
		<!-- editor -->
	    <div class="edit">
			<iframe id="editor" src="<c:url value='/common/editor.do'/>" width="100%" frameborder="0" scrolling="no" style="overflow:hidden;"></iframe>
		</div>    
	    <c:choose>
			<c:when test="${isInsUpd eq 'U'}">
			    <button type="submit" onclick="updateBoard();"
				class="inline-flex items-center px-5 py-2.5 text-sm font-medium text-center text-white bg-blue-700 rounded-lg focus:ring-4 focus:ring-blue-200 dark:focus:ring-blue-900 hover:bg-blue-800">
			        수정
			    </button>
			</c:when> 
			<c:otherwise>
			    <button type="submit" onclick="insertBoard();"
			    class="inline-flex items-center px-5 py-2.5 text-sm font-medium text-center text-white bg-blue-700 rounded-lg focus:ring-4 focus:ring-blue-200 dark:focus:ring-blue-900 hover:bg-blue-800">
			        등록
			    </button>
			</c:otherwise>
		</c:choose>
    </form>
</div>
</body>
</html>