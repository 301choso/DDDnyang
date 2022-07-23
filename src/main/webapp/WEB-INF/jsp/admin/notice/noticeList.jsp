<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/global.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>

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
	    ordering: false, 
	    serverSide: false,
	    searching: true,
	    autoWidth:true,
	    lengthMenu: [ 10, 20, 30, 40, 50 ],
	    displayLength: 20,
    	ajax: {
    		  url:"<%=contextPath%>/admin/notice/createList",
    		  type:"POST",
    		  data : { params : "" },
    		  contentType: "application/x-www-form-urlencoded; charset=UTF-8",
    		},  		 	 
    		columns: [
		  		{ data: 'NOTICE_ID'},
		  		{ data: 'NOTICE_TITLE', render:function(data, type, row){
		  			var title = '';
	  				title = '<a href="<%=contextPath%>/admin/notice/viewPage?notice_id='+row.NOTICE_ID+'">';
	  				title += data+'</a>';
	  				return title;
		  		}},
		  		{data : 'NOTICE_VIEWS'},
		  		{data : 'NOTICE_DATE', render:function(data, type, row){
		  			var dateForm = new Date(data);
		  			return dateForm.getFullYear()+'-'+(dateForm.getMonth()+1)+'-'+dateForm.getDate()
		  		}}
		  	]
	})
});
</script>
</head>
<body>
<section>
<div>
	<table id="dataTable">
		<thead>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>조회수</th>
				<th>등록일</th>
			</tr>	
		</thead>
	</table>
	<button type="button" class="text-white bg-emerald-400 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800"
	onclick="location.href='${contextPath}/admin/notice/noticeForm'">글쓰기</button>
</div>
</section>
</body>
</html>