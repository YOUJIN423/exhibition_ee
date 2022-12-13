<script>

$(function(){
	getbo_num();	
});


	// 예매번호 생성
function getbo_num(){
		
	// 난수 발생 (최대 6자리)
	var random = Math.floor(Math.random() * 1000000);
	
	// 날짜 형식 'yyyyMMdd'로 변경하는 함수
	function getFormatDate(date){
    	var year = date.getFullYear();              // yyyy
    	var month = (1 + date.getMonth());          // M
   		month = month >= 10 ? month : '0' + month;  // month 두 자리로 저장
    	var day = date.getDate();                   // d
    	day = day >= 10 ? day : '0' + day;          // day 두자리로 저장
    	return  year + '' + month + '' + day; 
	}
	
	// 현재 날짜 저장
	var date = new Date();
	date = getFormatDate(date);
	
	// 예매번호 생성
	let bo_re_num = date + "-" + random;
		
//	document.getElementsByName("bo_re_num").setAttribute("value", bo_re_num);

	$("#bo_re_num").val(bo_re_num);	// jquery로 코드 변경

	}


</script>