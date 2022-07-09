<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/global.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	var responseMessage = "<c:out value="${message}"/>";
	if(responseMessage != ""){
        alert(responseMessage);
    }
})
</script>

</head>
<body>
<section>
    <div class="min-h-1/4 flex items-center">
      <div class="container mx-auto max-w-md shadow-md hover:shadow-lg transition duration-300">
         <div class="py-12 p-10 bg-white rounded-xl">
	         <form id="loginFrm" method="post" action="${contextPath}/member/login.do">
	           <div class="mb-6">
	             <input type="text" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
	             	name="user_id"
	             	required
	               	autofocus
	               	v-model="form.id"
	             	id="user_id" placeholder="아이디">
	           </div>
	           <div class="mb-6">
	             <input type="password" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline"
	             	name="user_pw"
	             	required
	             	autocomplete="current-password"
	             	id="user_pw" placeholder="비밀번호">
	           </div>
	             <button class="w-full mt-6 text-indigo-50 font-bold bg-teal-600 py-3 rounded-md hover:bg-indigo-500 transition duration-300" id="login_btn">로그인</button>
	             <button type="button" class="w-full mt-6 font-bold bg-teal-100 py-3 rounded-md hover:bg-indigo-500 transition duration-300" id="member_join_btn">회원가입</button>
	           <div>
	             <span class="text-sm text-gray-700 inline-block mt-4 hover:text-indigo-600 hover:underline hover:cursor-pointer transition duration-200"><a href="#" style="color: #2E2C2C;">아이디나 비밀번호를 잊으셨나요?</a></span>
	           </div>
	        </form>
        </div>
    </div>
  </div>
</section>

</body>
</html>