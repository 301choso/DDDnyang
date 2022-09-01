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
function doMarkBoard() {
	$.ajax({
		type: "GET",
        url: "${contextPath}/myPage/doMarkBoard.do",
        data: {
        	"board_id" : ${boardInfo.board_id}
        },
        success: function (data) {
        	alert('관심목록 추가에 '+ message +'되었습니다.');
        },
        error: function () {
            alert('게시물 '+ message +'에 실패하였습니다.');
        }
	});  
	 
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
    <a type="submit" onclick="javascript:doMarkBoard()"
	class="inline-flex items-center px-5 py-2.5 text-sm font-medium text-center text-white bg-blue-700 rounded-lg focus:ring-4 focus:ring-blue-200 dark:focus:ring-blue-900 hover:bg-blue-800">
        관심글 등록
    </a>
</div>
</body>
</html>