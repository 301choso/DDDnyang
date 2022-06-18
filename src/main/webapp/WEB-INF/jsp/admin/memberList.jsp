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
	    stateSaveParams : function (settings, data) {
			data.search.page = "1";
			data.search.search = "";
			data.search.start = 0;
			data.start = 0;
		},
    	ajax: {
    		  url:"<%=contextPath%>/memberA/createTable",
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
		  		}}
		  	]
	})


});

</script>
</head>
<body>
<section style="padding-top: 90px;">
<table id="dataTable">
	<thead>
		<tr>
			<th>아이디</th>
			<th>e-mail</th>
			<th>전화번호</th>
			<th>이름</th>
			<th>가입날짜</th>
			<th>사용여부</th>
		</tr>	
	</thead>
</table>
</section>
</body>
</html>