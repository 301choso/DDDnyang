<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/global.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/bootstrap/css/bootstrap.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/summernote/summernote.css'/>"/>
	
    <script type="text/javascript" src="<c:url value='/resources/bootstrap/js/bootstrap.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/summernote/summernote.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/resources/summernote/lang/summernote-ko-KR.js'/>"></script>
    
<script type="text/javascript">
var image_path='';
$(document).ready(function() {
	//여기 아래 부분
	$('#summernote').summernote({
		  height: 400,                 // 에디터 높이
		  minHeight: null,             // 최소 높이
		  maxHeight: null,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
		  placeholder: '공지사항을 입력하세요',	//placeholder 설정
		  callbacks : { 
         	onImageUpload : function(files) {
          // 파일 업로드(다중업로드를 위해 반복문 사용)
          for (var i = files.length - 1; i >= 0; i--) {
  	        uploadSummernoteImageFile(files[i], this);
          		}
          	}
          }
	});
});

function uploadSummernoteImageFile(file, el) {
	data = new FormData();
	data.append("file", file);
	$.ajax({
		data : data,
		type : "POST",
		url : "${contextPath}/admin/notice/uploadImage",
		cache: false,
		contentType : false,
		enctype : 'multipart/form-data',
		processData : false,
		success : function(img_name) {
			image_path = img_name;
			$(el).summernote('editor.insertImage', img_name);
		},

	});
}

function uploadNotice(){
	var params = $('#noticeFrm').serialize();
	params+='&image_path='+image_path;
	$.ajax({
		data : params,
		type : "POST",
		url : "${contextPath}/admin/notice/insertNotice",
		enctype: "multipart/form-data",
		success : function(data) {
			alert("공지사항이 정상적으로 등록되었습니다.");
			location.href='${contextPath}/admin/notice/noticeList';
		},
		error : function(data){
			alert('공지사항 등록 중 문제가 발생했습니다\n다시 시도해주세요');
		}
	});
}
</script>
<title>Insert title here</title>
</head>
<body>
<section>
	<div class="mx-auto pt-10">
		<form id="noticeFrm" method="post" enctype="multipart/form-data">
			
		    <div class="flex items-center py-2 px-3 bg-gray-50 rounded-lg dark:bg-gray-700">       
			    <span class="w-32">제목</span> 
			    <input id="notice_title" class="block mx-4 p-2.5 w-full text-sm text-gray-900 bg-white rounded-lg border 
			    border-gray-300 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-800 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
			      name="notice_title" required>	         
		    </div>	 
			
		    <div>
				<textarea id="summernote" name="notice_contents"></textarea>
			</div>    
	
		    <button type="submit" onclick="uploadNotice();"
		    class="inline-flex items-center px-5 py-2.5 text-sm font-medium text-center text-white bg-blue-700 rounded-lg focus:ring-4 focus:ring-blue-200 dark:focus:ring-blue-900 hover:bg-blue-800">
		        등록
		    </button>
	    </form>
	</div>

</section>

</body>
</html>