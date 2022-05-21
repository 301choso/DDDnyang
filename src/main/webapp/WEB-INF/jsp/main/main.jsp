<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css" />
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<script type="text/javascript" src="https://unpkg.com/swiper/swiper-bundle.js"></script>
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
<section>
	<article>
	<c:forEach items="${boardList}" var="boardList">	
		<h1>최신글</h1>
		<div>no</div>
		<div>${boardList.board_title}</div>
		<div>value</div>
	</c:forEach>
	</article>
	<article>	
		<h1>공지사항</h1>
		<div>no</div>
		<div>name</div>
		<div>value</div>
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