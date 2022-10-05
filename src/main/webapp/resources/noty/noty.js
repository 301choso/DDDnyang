function noty_generate(type) {
  //타입에 따른 버튼 스타일 적용	    	
  btnStyles = {'success': 'btn-success', 'notification': '','error': 'btn-danger', 'information': 'btn-info', 'warning': 'btn-warning','alert': 'btn-inverse'}
  var n = noty({
    text : type,	 
    type : type,
    dismissQueue: true, // 닫기 버튼을 보여준다. 아래 buttons에 상세 정의가 있음.	            
    layout : 'center',   // 위치 설정	            
    theme : 'defaultTheme', 

  });	 
  //console.log(type + ' - ' + n.options.id);	       
  return n;
}				
function noty_control(nType, nText, nTimeout)		{
  	 var retNoty = noty_generate(nType);
     $.noty.setText(retNoty.options.id, nText);  // 상태창에 보여줄 텍스트를 표시한다. 	        	        
     //console.log('success.options.id : '+success.options.id); 	        
     if (nTimeout != '' && nTimeout > 0)  // 값을 0으로 넣으면 꼭 획인버튼을 클릭하도록 하고 있음. 	        
     {
      setTimeout(function () {
        $.noty.close(retNoty.options.id);
      }, nTimeout);
    }
  }
