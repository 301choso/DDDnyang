<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/flowbite@1.4.4/dist/flowbite.min.css" />
</head>
<body>
<div class="pt-10"></div>	
<div class="max-w-2xl mx-auto pt-10">
    <div class="flex items-center py-2 px-3 bg-gray-50 rounded-lg dark:bg-gray-700">       
	    제목 <div id="board_title" rows="1" class="block mx-4 p-2.5 w-full text-sm text-gray-900 bg-white rounded-lg border 
	    border-gray-300 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-800 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
	      ${notice.NOTICE_TITLE}
	</div>	         
    </div>
    <div class="py-8">
    	${notice.NOTICE_CONTENT}
    </div>  
    <c:set value="${sessionScope.login_id}" var="memberId"/>
 	<c:if test="${memberId eq 'admin'}">
    <a type="submit" href=""
	class="inline-flex items-center px-5 py-2.5 text-sm font-medium text-center text-white bg-blue-700 rounded-lg focus:ring-4 focus:ring-blue-200 dark:focus:ring-blue-900 hover:bg-blue-800">
        수정
    </a>
    </c:if>
    <a type="submit" href="${contextPath}/notice/noticeList"
	class="inline-flex items-center px-5 py-2.5 text-sm font-medium text-center text-white bg-blue-700 rounded-lg focus:ring-4 focus:ring-blue-200 dark:focus:ring-blue-900 hover:bg-blue-800">
        목록
    </a>
</div> 
</body>
</html>