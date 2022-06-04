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
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<section>
<div class="flex justify-center">
	<form class="w-full max-w-lg justify-center" action="<%=contextPath%>/member/joinProcess" id="memberJoin" method="post">
	  <div class="flex flex-wrap -mx-3 mb-6">
	    <div class="w-full px-3">
	      <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="member_id">
	        아이디
	      </label>
	      <input class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" name="member_id" id="member_id" oninput="checkId()" type="text">
	    	<p class="text-gray-600 text-xs italic" id="id_ok">사용 가능한 아이디 입니다.</p>
			<p class="text-gray-600 text-xs italic" id="id_exist">이미 존재하는 아이디 입니다.</p>
	    </div>
	  </div>
	  <div class="flex flex-wrap -mx-3 mb-6">
	    <div class="w-full px-3">
	      <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-password">
	        비밀번호
	      </label>
	      <input class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" name="member_pw" id="member_pw" type="password">
	    </div>
	  </div>
	  <div class="flex flex-wrap -mx-3 mb-6">
	    <div class="w-full px-3">
	      <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="member_name">
	        이름
	      </label>
	      <input class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" name="member_name" id="member_name" type="text">
	    </div>
	  </div>
	  <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-city">
	  전화번호
	  </label>
	  <div class="flex flex-wrap -mx-3 mb-6">
	    <div class="w-full md:w-1/3 px-3 mb-6 md:mb-0">
	      <input class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" name="member_phone01" id="member_phone01" type="text">
	    </div>
	    <div class="w-full md:w-1/3 px-3 mb-6 md:mb-0">
	      <input class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" name="member_phone02" id="member_phone02" type="text">
	    </div>
	    <div class="w-full md:w-1/3 px-3 mb-6 md:mb-0">
	      <input class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" name="member_phone03" id="member_phone03" type="text">
	    </div>
	  </div>
  
  	  <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-last-name">
	  E-mail
	  </label>
	  <div class="flex flex-wrap -mx-3 mb-6">
	    <div class="w-full md:w-1/2 px-3">
	      <input class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" name="member_mail01" id="member_mail01" type="text">
	    </div>
	    <div class="w-full md:w-1/2 px-3">
	      <input class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" name="member_mail02" id="member_mail02" type="text">
	    </div>
	  </div>
	  <div class="float-right">
	  	<button type="submit" class="bg-teal-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded-full">가입하기</button>
	  </div>
	</form>
</div>
</section>
</body>
</html>