<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<script>
function goUpdateReply(reply_id) { //글 조회
	$.ajax({
		type: "GET",
        url: "${contextPath}/reply/goUpdateDetail.do",
        data: { 
        	"reply_id" : reply_id
        },
        success: function (data) {
        	$('#replyContent').empty();
        	$('#replyContent').append(data);
        	
        	$('#cmtsBtn').empty();
        	$('#cmtsBtn').append('<a href="javascript:doUpdateReply(' + reply_id + ')">수정</a>');
        },
        error: function () {
            alert('댓글 조회에 실패하였습니다.');
        }
	});  
	
}

function doUpdateReply(reply_id) {
	let reply_content = $("#replyContent").val();
	$.ajax({
		type: "POST",
        url: "${contextPath}/reply/updateReply.do",
        data: { 
        	"reply_id" : reply_id,
        	"reply_content" : reply_content
        },
        success: function (data) {
        	alert('댓글을 수정이 성공하였습니다.');
        	location.reload();
        },
        error: function () {
            alert('댓글 수정에 실패하였습니다.');
        }
	});  
}

function goDeleteReply(reply_id) {
	if(window.confirm("댓글을 삭제하시겠습니까?")) {
		$.ajax({
			type: "POST",
	        url: "${contextPath}/reply/deleteReply.do",
	        data: { 
	        	"reply_id" : reply_id
	        },
	        success: function (data) {
	        	alert('댓글을 삭제 성공하였습니다.');
	        	location.reload();
	        },
	        error: function () {
	            alert('댓글 삭제 실패하였습니다.');
	        }
		});  
	}
}
</script>
<body>	
   <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">	        
       <tbody>
       <c:forEach items="${replyList}" var="reply" varStatus="i">	
           <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">                
               <td class="px-6 py-4 w-1/2">
                   ${reply.reply_content}
               </td>
               <td class="px-1 py-4 w-1/6">
                   ${reply.reply_date}
               </td>
               <td class="px-1 py-4 w-1/6">
                   ${reply.member_id}
               </td>
               <td class="px-1 py-4 w-1/6">
	               <c:if test="${member_num ne 0 && reply.member_num eq member_num}">
	                   <a href="javascript:goUpdateReply(${reply.reply_id})">수정</a> / 
	                   <a href="javascript:goDeleteReply(${reply.reply_id})">삭제</a>
	               </c:if>
               </td>
           </tr>
         </c:forEach>
       </tbody>
   </table>	
</body>
</html>