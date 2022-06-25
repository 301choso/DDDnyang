<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
	<script src="https://kit.fontawesome.com/6835579bc4.js" crossorigin="anonymous"></script><!-- 헤더 아이콘 -->
	<link rel="stylesheet" href="https://unpkg.com/flowbite@1.4.7/dist/flowbite.min.css" /><!-- tailwind -->
	<script src="https://cdn.tailwindcss.com"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js"></script>
</head>
<tiles:insertAttribute name="header"/>
<body>
<div id="page">
<tiles:insertAttribute name="body" ignore="true"/>
</div>
<script src="https://unpkg.com/flowbite@1.4.7/dist/flowbite.js"></script><!-- tailwind -->
</body>
</html>