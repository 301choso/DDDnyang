<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/global.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section>
<form action="${contextPath}/admin/member/infoModify">
	<input type="text" naem="member_name" value="${memberInfo.MEMBER_NAME}">
	<input type="text" name="member_email" value="${memberInfo.MEMBER_EMAIL}">
	<input type="text" name="member_call" value="${memberInfo.MEMBER_CALL}">
	<input type="hidden" name="member_id" value="${memberInfo.MEMBER_ID}">
	<select name="member_yn">
		<option value="Y">사용중</option>
		<option value="N">휴면</option>
	</select>
	<input type="submit" value="수정">
</form>



</section>
</body>
</html>