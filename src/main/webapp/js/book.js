function book_check() {

	// 날짜 선택 유무
	if($("[name='choiceDay']").length < 1){
		alert("날짜를 선택하세요.");
		return false;
	}
	
	// 시간 선택 유무
	if($('input[name=bo_time]:checked').length < 1){
		alert("시간을 선택하세요.");
		return false;
	}

	// 인원 수 검사 (0명 이하 체크)
	if(Number($("input:radio[name='bo_a_adult']:checked").val()) + 
	   Number($("input:radio[name='bo_a_freshman']:checked").val()) + 
	   Number($("input:radio[name='bo_a_teen']:checked").val()) + 
	   Number($("input:radio[name='bo_a_senior']:checked").val()) + 
	   Number($("input:radio[name='bo_a_free']:checked").val())	== 0 ) {
			alert("예약 인원을 선택하세요.");
			
			return false;
	}
	
	// 인원 수 검사 (5명 초과 체크)
	if(Number($("input:radio[name='bo_a_adult']:checked").val()) + 
	   Number($("input:radio[name='bo_a_freshman']:checked").val()) + 
	   Number($("input:radio[name='bo_a_teen']:checked").val()) + 
	   Number($("input:radio[name='bo_a_senior']:checked").val()) + 
	   Number($("input:radio[name='bo_a_free']:checked").val())	> 5 ) {
		
//		alert($("input:radio[name='bo_a_adult']:checked").val());
			alert("인원 선택은 최대 5명까지 가능합니다.");
			return false;
	}

//	// 인원 수 검사 (DB에 저장된 예약 가능 인원 체크)
	if(Number($('input[name=bo_count]').val()) > Number($('.checked_time').val())){
		alert("예매 가능 인원은 "+($('.checked_time').val())+"명 입니다.");
		return false;
	}

}

$(function(){

// 시간 선택 시 선택한 태그에 class 추가
	$('input:radio[name=bo_time]').click(function() {
		
		$('#bo_time_count1').removeClass("checked_time");
		$('#bo_time_count2').removeClass("checked_time");
		$('#bo_time_count3').removeClass("checked_time");
		$('#bo_time_count4').removeClass("checked_time");
			
		if($(this).val() == 1){
			$('#bo_time_count1').addClass("checked_time");
		}else if($(this).val() == 2){
			$('#bo_time_count2').addClass("checked_time");
		}else if($(this).val() == 3){
			$('#bo_time_count3').addClass("checked_time");
		}else{
			$('#bo_time_count4').addClass("checked_time");
		}
	});
});


//가격 계산 함수
$(function(){
	
	var adult_total = 0;
	var freshman_total = 0;
	var teen_total = 0;
	var senior_total = 0;
	var free_total = 0;
	var total = 0;
	
    // 일반 클릭 시 가격 계산
	 $("input:radio[name='bo_a_adult']").click(function(){	
		adult_total = $("input:radio[name='bo_a_adult']:checked").val() * 12000;
	 	
	 	total = adult_total + freshman_total + teen_total + senior_total + free_total;		
		$("#total_price").text(total+"원");
		$('input[name=bo_price]').attr('value',total);
	 });
	 
	 // 청년 클릭 시 가격 계산
	 $("input:radio[name='bo_a_freshman']").click(function(){	
		 freshman_total = $("input:radio[name='bo_a_freshman']:checked").val() * 6000;
		 	
		 total = adult_total + freshman_total + teen_total + senior_total + free_total;		
		 $("#total_price").text(total+"원");
		 $('input[name=bo_price]').attr('value',total);
	 });

	 // 청소년 클릭 시 가격 계산
	 $("input:radio[name='bo_a_teen']").click(function(){	
		 teen_total = $("input:radio[name='bo_a_teen']:checked").val() * 6000;
		 	
		 total = adult_total + freshman_total + teen_total + senior_total + free_total;		
		 $("#total_price").text(total+"원");
		 $('input[name=bo_price]').attr('value',total);
		 });
	 
	 // 시니어 클릭 시 가격 계산
	 $("input:radio[name='bo_a_senior']").click(function(){	
		 senior_total = $("input:radio[name='bo_a_senior']:checked").val() * 6000;
		 	
		 total = adult_total + freshman_total + teen_total + senior_total + free_total;		
		 $("#total_price").text(total+"원");
		 $('input[name=bo_price]').attr('value',total);
		 });
	 
	 // 무료대상 클릭 시 가격 계산
	 $("input:radio[name='bo_a_free']").click(function(){	
		 free_total = $("input:radio[name='bo_a_free']:checked").val() * 0;
		 	
		 total = adult_total + freshman_total + teen_total + senior_total + free_total;		
		 $("#total_price").text(total+"원");
		 $('input[name=bo_price]').attr('value',total);
		 });
	
});


// 인원수 계산 함수
$(function(){
	
	var adult_count = 0;
	var freshman_count = 0;
	var teen_count = 0;
	var senior_count = 0;
	var free_count = 0;
	var totalcount = 0;
	
    // 일반 클릭 시 인원수 계산
	 $("input:radio[name='bo_a_adult']").click(function(){	
		adult_count = Number($("input:radio[name='bo_a_adult']:checked").val());
	 	
		totalcount = adult_count + freshman_count + teen_count + senior_count + free_count;		
		$('input[name=bo_count]').attr('value',totalcount);
	 });
	 
	 // 청년 클릭 시 인원수 계산
	 $("input:radio[name='bo_a_freshman']").click(function(){	
		freshman_count = Number($("input:radio[name='bo_a_freshman']:checked").val());
		 	
		totalcount = adult_count + freshman_count + teen_count + senior_count + free_count;		
		$('input[name=bo_count]').attr('value',totalcount);
	 });

	 // 청소년 클릭 시 인원수 계산
	 $("input:radio[name='bo_a_teen']").click(function(){	
		teen_count = Number($("input:radio[name='bo_a_teen']:checked").val());
		 	
		totalcount = adult_count + freshman_count + teen_count + senior_count + free_count;		
		$('input[name=bo_count]').attr('value',totalcount);
		 });
	 
	 // 시니어 클릭 시 인원수 계산
	 $("input:radio[name='bo_a_senior']").click(function(){	
		 senior_count = Number($("input:radio[name='bo_a_senior']:checked").val());
		 	
		totalcount = adult_count + freshman_count + teen_count + senior_count + free_count;		
		$('input[name=bo_count]').attr('value',totalcount);
		 });
	 
	 // 무료대상 클릭 시 인원수 계산
	 $("input:radio[name='bo_a_free']").click(function(){	
		 free_count = Number($("input:radio[name='bo_a_free']:checked").val());
		 	
		totalcount = adult_count + freshman_count + teen_count + senior_count + free_count;		
		$('input[name=bo_count]').attr('value',totalcount);
		 });
	
});




	
