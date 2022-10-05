<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/global.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
aside {
	background-color: #00B992;
	width: 30%;
}
</style>
</head>
<body>
    <aside class="w-1/6 h-full" aria-label="Sidebar" style="float: left;">
        <div class="overflow-y-auto py-4 px-3 rounded dark:bg-gray-800 h-full">
           <ul class="space-y-2">
              <li>
                 <a href="<%=contextPath%>/admin/notice/noticeList" class="flex items-center p-2 text-white font-normal text-white rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 hover:text-gray-900">
                    <span class="ml-3 whitespace-nowrap">공지사항</span>
                 </a>
              </li>
              <li>
                 <a href="<%=contextPath%>/report/reportList" class="flex items-center p-2 text-base font-normal text-white rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 hover:text-gray-900">
                    <span class="flex-1 ml-3 whitespace-nowrap">게시물 관리</span>
                 </a>
              </li>
              <li>
                 <a href="<%=contextPath%>/admin/member/memberList" class="flex items-center p-2 text-base font-normal text-white rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 hover:text-gray-900">
                    <span class="flex-1 ml-3 whitespace-nowrap">회원 관리</span>
                 </a>
              </li>
              <li>
              	<a href="<%=contextPath%>/member/loginOutProcess" class="flex items-center p-2 text-base font-normal text-white rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 hover:text-gray-900">
              		<span class="flex-1 ml-3 whitespace-nowrap">LogOut</span>
              	</a>
              </li>
           </ul>
        </div>
     </aside>   
</body>
</html>