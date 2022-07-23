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
                 <a href="#" class="flex items-center p-2 text-base font-normal text-white rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 hover:text-gray-900">
                    <svg class="flex-shrink-0 w-6 h-6 text-white transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M5 3a2 2 0 00-2 2v2a2 2 0 002 2h2a2 2 0 002-2V5a2 2 0 00-2-2H5zM5 11a2 2 0 00-2 2v2a2 2 0 002 2h2a2 2 0 002-2v-2a2 2 0 00-2-2H5zM11 5a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2V5zM11 13a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2v-2z"></path></svg>
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