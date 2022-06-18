<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
   <!-- include libraries(jQuery, bootstrap) -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>	
	<!-- include summernote css/js -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	<script type="text/javascript">
        $(document).ready(function () {
            $("#summernote").summernote({
                placeholder: '내용을 입력해 주세요.',
                tabsize: 2,
                height: 480,
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
                            $(this).summernote('editor.insertImage', "/m/resources/images/layout/sending.gif", function ($image) {
                                $image.attr("data-src", "");
                                $image.attr("alt", files[idx].name);
                                sendFile(files[idx], $image);
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

       /*  function sendFile(file, el) {
            var formData = new FormData();
            formData.append('file', file);
            $.ajax({
                type: "post",
                enctype: "multipart/form-data",
                url: "<c:url value='/attach/editor/${attachTypeName}/${attachSubTypeName}/upload.do'/>",
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
        } */

        var snContents = function () {
            return $("#summernote").summernote("code");
        }

        var snView = function (contentsVal) {
            $("#summernote").summernote("code", contentsVal);
            $("div.note-editable img").lazyload();
        }

        function setDefaultFontName() {
            $("#summernote").summernote("fontName", '나눔바른고딕');
        }
    </script>
</head>
<body>
<textarea id="summernote" name="contents"></textarea>
</body>
</html>