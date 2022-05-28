<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../common/header.jsp" %>
<style type="text/css">
#id_ok{
	display: none;
}

#id_exist{
	display: none;
}
</style>

<script type="text/javascript">
	function checkId() {
		var id = $('#member_id').val();
		$.ajax({
			url : '${contextPath}/member/checkId',
			type : 'post',
			data : {'id' : id},
			success : function(cnt){
				if(cnt==0){
					$('#id_exist').css('display','none');
					$('#id_ok').css('display', 'inline-block');
				} else {
					$('#id_ok').css('display','none');
					$('#id_exist').css('display', 'inline-block');
				}
			},
			error : function(){
				console.log('error!!');
			}
		});
	}
</script>
</head>
<body>
<section>
	<div>
		<form action="<%=contextPath%>/member/joinProcess" id="memberJoin" method="post" >
			ID <input type="text" name="member_id" id="member_id" oninput="checkId()">
			<span id="id_ok">사용 가능한 아이디 입니다.</span>
			<span id="id_exist">이미 존재하는 아이디 입니다.</span>
			<p>
			비밀번호 <input type="password" name="member_pw" id="member_pw"><p>
			이름 <input type="text" name="member_name" id="member_name"><p>
			전화번호 <input type="text" name="member_phone" id="member_phone"><p>
			e-mail <input type="text" name="member_mail" id="member_mail"><p>
			<input type="submit" value="가입하기">
		</form>
	</div>
</section>
</body>
</html>