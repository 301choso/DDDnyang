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

	dataTable();
});

function dataTable(){
	$("#dataTable").DataTable({
		paging: true,
	    info:true,
	    bPaginate: true,
	    responsive: true,
	    processing: true, 
	    ordering: false, 
	    serverSide: false,
	    searching: false,
	    autoWidth:true,
	    lengthMenu: [ 10, 20, 30, 40, 50 ],
	    displayLength: 10,
    	ajax: {
    		  url:"<%=contextPath%>/report/createTable",
    		  type:"POST",
    		  data : { "count" : "" },
    		  contentType: "application/x-www-form-urlencoded; charset=UTF-8",
    		},  		 	 
    		columns: [
		  		{ data: 'ORIGINAL_SEQ'},
		  		{ data: 'BOARD_TITLE', render:function(data, type, row){
		  			var title = '';
	  				title = '<a href="">';
	  				title += data
	  				title += '</a>';
	  				return title;
		  		}},
		  		{data : 'BOARD_VIEWS'},
		  		{data : 'CNT'}
		  	]
	});
}
</script>
</head>
<body>
<section>
<div>

</div>
<div>
	<table id="dataTable">
		<thead>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>조회수</th>
				<th>신고 건수</th>
			</tr>	
		</thead>
	</table>
</div>
</section>
</body>
</html>