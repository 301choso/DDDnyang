<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/global.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function blockBtn(board_id) {
	console.log($('#large-toggle').is(':checked'));
	var checked_yn = $('#large-toggle').is(':checked');
	
	var show_yn = '';
	if(checked_yn){
		show_yn = 'Y';
	} else {
		show_yn = 'N';
	}
	$.ajax({
		url : '${contextPath}/report/contentBlock',
		data : {
			board_id : board_id,
			show_yn : show_yn
		}, 
        success : function(cnt){
        	console.log(cnt)
        	if(cnt==1){
        		if(checked_yn)
        			noty_control('success','게시글 차단 완료','3000');
        		else
        			noty_control('success', '차단 해제 완료', '3000');
        	} else {
        		noty_control('information', '신고는 한 게시글당 한번만 가능합니다.', '3000');
        	}
           
        },
        error : function(){
            noty_control('error','오류가 발생했습니다.','3000');
        }
	})
}

</script>
<script src="${contextPath}/resources/noty/noty.js"></script><!-- noty 기능 -->
<script src="${contextPath}/resources/noty/notypack.js"></script>
</head>
<body>
<section>
	<div class="max-w-2xl mx-auto pt-10">
		<div>카테고리 : ${board.board_category}</div>
	    <div class="flex items-center py-2 px-3 bg-gray-50 rounded-lg dark:bg-gray-700">       
		    제목 <div id="board_title" rows="1" class="block mx-4 p-2.5 w-full text-sm text-gray-900 bg-white rounded-lg border 
		    border-gray-300 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-800 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
		      ${board.board_title}
		</div>	         
	    </div>
	    <div class="py-8">
	    	${board.board_content}
	    </div>  
	</div>
	<c:set var="show_yn" value="${board.show_yn}"/>
	<c:choose>
		<c:when test="${show_yn eq 'Y'}">
	<div class="max-w-2xl mx-auto relative">
		<label for="large-toggle" class="inline-flex relative items-center cursor-pointer">
		<input type="checkbox" id="large-toggle" class="sr-only peer" onclick="blockBtn(${board.board_id})" checked="checked">
		  <div class="w-14 h-7 bg-gray-200 peer-focus:outline-none peer-focus:ring-4 peer-focus:ring-blue-300 dark:peer-focus:ring-blue-800 rounded-full peer dark:bg-gray-700 peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-0.5 after:left-[4px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-6 after:w-6 after:transition-all dark:border-gray-600 peer-checked:bg-blue-600"></div>
		  <span class="ml-3 text-sm font-medium text-gray-900 dark:text-gray-300">차단하기</span>
		</label>
	</div>		
		</c:when>
		<c:otherwise>
	<div class="max-w-2xl mx-auto relative">
		<label for="large-toggle" class="inline-flex relative items-center cursor-pointer">
		<input type="checkbox" id="large-toggle" class="sr-only peer" onclick="blockBtn(${board.board_id})">
		  <div class="w-14 h-7 bg-gray-200 peer-focus:outline-none peer-focus:ring-4 peer-focus:ring-blue-300 dark:peer-focus:ring-blue-800 rounded-full peer dark:bg-gray-700 peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-0.5 after:left-[4px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-6 after:w-6 after:transition-all dark:border-gray-600 peer-checked:bg-blue-600"></div>
		  <span class="ml-3 text-sm font-medium text-gray-900 dark:text-gray-300">차단하기</span>
		</label>
	</div>		
		</c:otherwise>
	</c:choose>

    <div class="overflow-x-auto max-w-2xl mx-auto relative shadow-md sm:rounded-lg">
        <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
            <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                <tr>
                    <th scope="col" class="py-3 px-6">
                        신고된 이유
                    </th>
                    <th scope="col" class="py-3 px-6">
                        신고건수
                    </th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${reported}" var="reported">
                 <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">
                    <td class="py-4 px-6">
                        ${reported.CATEGORY_DES}
                    </td>
                    <td class="py-4 px-6">
                    	${reported.CNT}
                    </td>
                </tr>           
            </c:forEach>
            </tbody>
        </table>
        <div class="max-w-2xl mx-auto relative">
		     <a type="submit" href="<%=contextPath%>/report/reportList"
			class="inline-flex items-center px-5 py-2.5 text-sm font-medium text-center text-white bg-blue-700 rounded-lg focus:ring-4 focus:ring-blue-200 dark:focus:ring-blue-900 hover:bg-blue-800">
		        목록
		    </a>       
        </div>
    </div>
</section>
</body>
</html>