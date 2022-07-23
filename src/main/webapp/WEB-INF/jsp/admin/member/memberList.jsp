<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>
<%
	String contextPath = request.getContextPath();
%>
<script type="text/javascript">

$(document).ready(function(){
	setTimeout(() => {
		$('select[name=dataTable_length]').addClass("text-sm w-24");
	}, 300);

	$("#dataTable").DataTable({
		paging: true,
	    info:true,
	    bPaginate: true,
	    responsive: true,
	    processing: true, 
	    ordering: true, 
	    serverSide: false,
	    searching: true,
	    autoWidth:true,
	    lengthMenu: [ 10, 20, 30, 40, 50 ],
	    displayLength: 20,
	    order:[[4, 'desc']],
    	ajax: {
    		  url:"<%=contextPath%>/admin/createTable",
    		  type:"POST",
    		  data : { params : "" },
    		},  		 	 
    		columns: [
		  		{ data: 'MEMBER_ID', render: function(data, type, row){
		  			return data;
		  		}},
		  		{ data: 'MEMBER_EMAIL',render: function(data, type, row){
		  			return data;
		  		}},
		  		{data : 'MEMBER_CALL'},
		  		{data : 'MEMBER_NAME'},
		  		{data : 'MEMBER_JOIN_DATE', render:function(data, type, row){
		  			var dateForm = new Date(data);
		  			return dateForm.getFullYear()+'-'+(dateForm.getMonth()+1)+'-'+dateForm.getDate()
		  		}},
		  		{data : 'MEMBER_YN', render:function(data, type, row){
		  			return data=='Y'? "사용":"휴면계정"
		  		}},
		  		{data : '', render:function(data, type, row){
		  			var button = '<a href="<%=contextPath%>/admin/member/modifyPage?member_id='+row.MEMBER_ID+'">'
		  			+'<input type="button" value="수정" class="block text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">'
		  			+'</a>';
		  			return button;
		  		}}
		  	]
	})


});

</script>
</head>
<body>
<section>
<table id="dataTable">
	<thead>
		<tr>
			<th>아이디</th>
			<th>e-mail</th>
			<th>전화번호</th>
			<th>이름</th>
			<th>가입날짜</th>
			<th>사용여부</th>
			<th>수정</th>
		</tr>	
	</thead>
</table>
</section>
</body>
</html>