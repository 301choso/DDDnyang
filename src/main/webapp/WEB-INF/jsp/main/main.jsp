<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<script type="text/javascript" src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<title>메인페이지</title>
<style>
.swiper {
  width: 600px;
  height: 300px;
}
</style>
</head>
<body>
<section>
	<!-- swiper -->
	<div class="swiper">
	  <div class="swiper-wrapper">
	    <div class="swiper-slide">Slide 1</div>
	    <div class="swiper-slide">Slide 2</div>
	    <div class="swiper-slide">Slide 3</div>
	  </div>
	  
	  <div class="swiper-pagination"></div>
	  <div class="swiper-button-prev"></div>
	  <div class="swiper-button-next"></div>
	</div>
	
	<!-- board -->
	<article class="flex justify-center pt-4">	
	<div class="relative overflow-x-auto shadow-md sm:rounded-lg inline-block">
		<span>최신글</span>
		<span><a href="${contextPath}/board/goBoard.do">더보기</a></span>
	    <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
	        <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
	            <tr>
	                <th scope="col" class="px-6 py-3">
	                    번호
	                </th>
	                <th scope="col" class="px-6 py-3">
	                    제목
	                </th>
	                <th scope="col" class="px-6 py-3">
	                    작성일
	                </th>
	                <th scope="col" class="px-6 py-3">
	                    조회수
	                </th>
	                <th scope="col" class="px-6 py-3">
	                    <span class="sr-only">Edit</span>
	                </th>
	            </tr>
	        </thead>
	        <tbody>
	        <c:forEach items="${boardList}" var="bList" varStatus="i">	
	            <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
	                <th scope="row" class="px-6 py-4 font-medium text-gray-900 dark:text-white whitespace-nowrap">
	                    ${i.index+1}
	                </th>
	                <td class="px-6 py-4">
	                    <a href="${contextPath}/board/goView.do?board_id=${bList.board_id}">${bList.board_title}</a>
	                </td>
	                <td class="px-6 py-4">
	                    ${bList.board_date}
	                </td>
	                <td class="px-6 py-4">
	                    ${bList.board_views}
	                </td>
	                <td class="px-6 py-4 text-right">
	                    <a href="${contextPath}/board/boardDetail.do?board_id=${bList.board_id}"
	                    class="font-medium text-blue-600 dark:text-blue-500 hover:underline">Edit</a>
	                </td>
	            </tr>
	          </c:forEach>
	        </tbody>
	    </table>
	</div>
	<div class="pr-4"></div>
	<!-- notice -->
	<div class="relative overflow-x-auto shadow-md sm:rounded-lg inline-block">
		<p>공지사항</p>
	    <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
	        <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
	            <tr>
	                <th scope="col" class="px-6 py-3">
	                    번호
	                </th>
	                <th scope="col" class="px-6 py-3">
	                    제목
	                </th>
	                <th scope="col" class="px-6 py-3">
	                    작성일
	                </th>
	                <th scope="col" class="px-6 py-3">
	                    조회수
	                </th>
	                <th scope="col" class="px-6 py-3">
	                    <span class="sr-only">Edit</span>
	                </th>
	            </tr>
	        </thead>
	        <tbody>
	        <c:forEach items="${boardList}" var="bList" varStatus="i">
	            <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
	                <th scope="row" class="px-6 py-4 font-medium text-gray-900 dark:text-white whitespace-nowrap">
	                    ${i.index+1}
	                </th>
	                <td class="px-6 py-4">
	                    ${bList.board_title}
	                </td>
	                <td class="px-6 py-4">
	                    ${bList.board_date}
	                </td>
	                <td class="px-6 py-4">
	                    ${bList.board_views}
	                </td>
	                <td class="px-6 py-4 text-right">
	                    <a href="#" class="font-medium text-blue-600 dark:text-blue-500 hover:underline">Edit</a>
	                </td>
	            </tr>
	          </c:forEach>
	        </tbody>
	    </table>
	</div>		
	</article>
</section>
<script>
const swiper = new Swiper('.swiper', {
	
	  cssMode: true,
	  loop: true,

	  pagination: {
	    el: '.swiper-pagination',
	    clickable: true
	  },

	  navigation: {
	    nextEl: '.swiper-button-next',
	    prevEl: '.swiper-button-prev',
	  },

	  mousewheel: true,
      keyboard: true
	});
</script>
</body>
</html>