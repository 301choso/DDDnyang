<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/global.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set value="${memberInfo.MEMBER_YN}" var="member_yn"/>
<script type="text/javascript">
var member_yn ='${member_yn}'
console.log(member_yn)
setTimeout(() => {
	if(member_yn == 'N'){
		$('#member_yn').val('N');
	} else {
		console.log('use!!')
		$('#member_yn').val('Y');
	}
}, 300);

</script>
</head>
<body>
<section>

<form action="${contextPath}/admin/member/infoModify">
    <div class="mb-6">
        <label for="member_id" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300">회원ID</label>
        <input type="text" name="member_id" id="member_email" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" value="${memberInfo.MEMBER_ID}" disabled="disabled">
    </div> 
    <div class="mb-6">
        <label for="member_name" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300">회원 이름</label>
        <input type="text" name="member_id" id="member_name" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" value="${memberInfo.MEMBER_NAME}">
    	<input type="hidden" name="member_id" value=>
    </div> 
    <div class="mb-6">
        <label for="member_email" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300">회원 E-mail</label>
        <input type="text" name="member_email" id="member_email" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" value="${memberInfo.MEMBER_EMAIL}">
    </div> 
    <div class="mb-6">
        <label for="member_call" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300">전화번호</label>
        <input type="text" name="member_call" id="member_call" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" value="${memberInfo.MEMBER_CALL}">
    </div> 
    <div class="mb-6">
		<label for="member_yn" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300">사용 여부</label>
		<select id="member_yn" name="member_yn" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
		  	<option value="Y">사용중</option>
		  	<option value="N">휴면</option>
		</select>
    </div>
    <input type="submit" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800" value="수정">
</form>

</section>
</body>
</html>