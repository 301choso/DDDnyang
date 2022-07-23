<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <!-- include libraries(jQuery, bootstrap) -->
	<!-- <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
	
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>	 -->
	<!-- include summernote css/js -->
	<!-- <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script> -->
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/bootstrap/css/bootstrap.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/summernote/summernote.css'/>"/>
	
    <script type="text/javascript" src="<c:url value='/resources/bootstrap/js/bootstrap.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/summernote/summernote.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/resources/summernote/lang/summernote-ko-KR.js'/>"></script>
	<script type="text/javascript">
        $(document).ready(function () {
            $("#summernote").summernote({
                placeholder: '내용을 입력해 주세요.',
                tabsize: 2,
                height: 400,
                minHeight: null,
                maxHeight: null,
                focus: false,
                disableResizeEditor: true,
                lang: 'ko-KR',
                callbacks: {
                    onImageUpload: function (files) {
                        var idx = 0;
                        for (var i = 0; i < files.length; i++) {
                            //첨부한 이미지를 에디터에 적용시키고 레이어를 닫기
                            $(this).summernote('editor.insertImage', "<c:url value='/resources/images/starrate.png'/>", function ($image) {
                            	var fileName = files[idx].name;
                            	$image.attr("data-src", "");
                                $image.attr("alt", );
                                
                                var formData = new FormData();
                                formData.append('file', files[idx]);
                                $.ajax({
                                    type: "post",
                                    enctype: "multipart/form-data",
                                    url: "${contextPath}/image/editor/upload.do",
                                    encrypt: "multipart/form-data",
                                    contentType: false,
                                    processData: false,
                                    cache: false,
                                    data: formData,
                                    success: function (data) {
                                        //부모노드
                                        //el.parent().css("text-align", "center")
                                        $image.attr("src", data);
                                        $image.attr("data-src", data);
                                        $("#uploadFiles").append('<input type="hidden" value="'+data+'&&fileName='+fileName+'" name="fileInfo"/>');
                                    },
                                    error: function () {
                                        alert('파일 업로드에 실패하였습니다.');
                                    }
                                });
                                //sendFile(files[idx], $image);
                                idx++;
                            });
                            $(this).summernote('editor.insertNode', document.createElement('br'));
                        }
                    },
                    onInit: function () {

                    }
                },
                toolbar: [
                    ['color', ['color']],
                    ['style', ['bold', 'italic', 'underline']],
                    ['fontsize', ['fontsize']],
                    ['para', ['paragraph']],
                    ['insert', ['picture', 'video', 'link']]
                ]
            });
            $('.note-statusbar').hide();
        });

         function sendFile(file, el) {
            var formData = new FormData();
            formData.append('file', file);
            $.ajax({
                type: "post",
                enctype: "multipart/form-data",
                url: "<c:url value='/image/editor/upload.do'/>",
                encrypt: "multipart/form-data",
                contentType: false,
                processData: false,
                cache: false,
                data: formData,
                success: function (data) {
                    //부모노드
                    //el.parent().css("text-align", "center")
                    el.attr("src", data);
                    el.attr("data-src", data);
                },
                error: function () {
                    alert('파일 업로드에 실패하였습니다.');
                }
            });
        } 

        var snContents = function () {
            return $("#summernote").summernote("code");
        }

        var snView = function (contentsVal) {
            $("#summernote").summernote("code", contentsVal);
            //$("div.note-editable img").lazyload();
        }

        function setDefaultFontName() {
            $("#summernote").summernote("fontName", '나눔바른고딕');
        }
    </script>
</head>
<body>
<textarea id="summernote" name="contents"></textarea>

<form id="uploadFiles"></form>

</body>
</html>