<%@ page contentType="text/html; charset=UTF-8"%>

<script>
	// 달력 내용 생성
    
    // JavaScript 내에서 jstl 사용
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
                
    window.onload = function () { buildCalendar(); }    // 웹 페이지가 로드되면 buildCalendar 함수 실행
    
	// alert("fmt: " + '<fmt:formatDate value="${bo_now_2.bo_date}" pattern="yyyy. MM. dd." type="date"/>');
	// alert(" buildCalendar in ${bo_now_1.bo_date}");	// Fri Nov 11 00:00:00 KST 2022
    
	// Fri Nov 11 00:00:00 KST 2022
	// Tue Nov 01 2022 00:00:00 GMT+0900 (한국 표준시)
    
    let nowMonth = new Date();  	// 현재 달을 페이지를 로드한 날의 달로 초기화
    let today = new Date();     	// 페이지를 로드한 날짜를 저장
    today.setHours(0, 0, 0, 0);    	// 비교 편의를 위해 today의 시간을 초기화
    
    // db에 저장되어 있는 date 꺼내 변수에 저장
	let bo_now_1 = '<fmt:formatDate value="${bo_now_1.bo_date}" pattern="yyyy. MM. dd." type="date"/>';
	let bo_now_2 = '<fmt:formatDate value="${bo_now_2.bo_date}" pattern="yyyy. MM. dd." type="date"/>';
	let bo_now_3 = '<fmt:formatDate value="${bo_now_3.bo_date}" pattern="yyyy. MM. dd." type="date"/>';
	let bo_now_4 = '<fmt:formatDate value="${bo_now_4.bo_date}" pattern="yyyy. MM. dd." type="date"/>';
	let bo_now_5 = '<fmt:formatDate value="${bo_now_5.bo_date}" pattern="yyyy. MM. dd." type="date"/>';
	
    // 달력 생성 : 해당 달에 맞춰 테이블을 만들고, 날짜를 채워 넣음
    function buildCalendar() {

        let firstDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth(), 1);     // 이번 달 1일
        let lastDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, 0);  // 이번 달 마지막 날
        
//        alert("firstDate: " +firstDate.toLocaleDateString());		// Tue Nov 01 2022 00:00:00 GMT+0900 (한국 표준시)
        let tbody_Calendar = document.querySelector(".Calendar > tbody");
        document.getElementById("calYear").innerText = nowMonth.getFullYear();             // 연도 숫자 갱신하여 출력
        document.getElementById("calMonth").innerText = leftPad(nowMonth.getMonth() + 1);  // 월 숫자 갱신하여 출력

        // 이전 출력결과가 남아있는 경우 초기화
        while (tbody_Calendar.rows.length > 0) {               
            tbody_Calendar.deleteRow(tbody_Calendar.rows.length - 1);
        }

        let nowRow = tbody_Calendar.insertRow();        // insertRow()로 첫 번째 행 추가         

        for (let j = 0; j < firstDate.getDay(); j++) {  // 이번 달 1일의 요일만큼
            let nowColumn = nowRow.insertCell();        // 열 추가
        }

     	// day는 날짜를 저장하는 변수, 이번 달 마지막 날까지 증가시키며 반복  
        for (let nowDay = firstDate; nowDay <= lastDate; nowDay.setDate(nowDay.getDate() + 1)) {  

            let nowColumn = nowRow.insertCell();        // insertCell()으로 새 열을 추가하고

            let newDIV = document.createElement("p");					// <p></p> 태그를 만듦
            newDIV.innerHTML = leftPad(nowDay.getDate());       		// 추가한 열에 <p></p> 태그 안에 날짜 입력
            newDIV.setAttribute("value", nowDay.toLocaleDateString());	// <p></p>에 value 속성 추가, 해당 날짜가 2022.11.7. 형태로 저장

            nowColumn.appendChild(newDIV);								// <p></p> 태그가 nowColumn 안에 생성됨
            
            let input = document.createElement("input");
            input.type = "hidden";
            input.setAttribute("value", nowDay.toLocaleDateString());
            newDIV.appendChild(input);

			// $("#bo_date").val(nowDay.toLocaleDateString());

            if (nowDay.getDay() == 6) {                 // 토요일인 경우
                nowRow = tbody_Calendar.insertRow();    // 새로운 행 추가
            }

            if (nowDay < today) {                       // 지난날인 경우
            	nowColumn.className = "pastDay";
            }
            else if (nowDay.getFullYear() == today.getFullYear() && nowDay.getMonth() == today.getMonth() && nowDay.getDate() == today.getDate()) { // 오늘인 경우           
            	nowColumn.className = "today";
            //    newDIV.onclick = function () { choiceDate(this); }
            }
            else {                                      // 미래인 경우
            	nowColumn.className = "futureDay";
             //   newDIV.onclick = function () { choiceDate(this); }
            }
            
        	// 예매 가능일 출력
        	// DB에 저장된 날짜와 같은 날짜면 class 속성 변경
        	// today보다 이전 날일 경우 제외함
        	if( (nowDay.toLocaleDateString() == bo_now_1 || nowDay.toLocaleDateString() == bo_now_2 ||
            	nowDay.toLocaleDateString() == bo_now_3 || nowDay.toLocaleDateString() == bo_now_4 ||  
            	nowDay.toLocaleDateString() == bo_now_5) && nowDay >= today ){
        		
              	newDIV.setAttribute("class", "selected_day");
              		
              	newDIV.onclick = function () { 
              		choiceDate(this, input);
              		bo_text();	
              		book_time();							
            	}
        	}else{
            	newDIV.classList.add("unselected_day");
        	} 
        }
    }
 
    // 날짜 선택
    function choiceDate(newDIV, input) {
        if (document.getElementsByClassName("choiceDay")[0]) {                              // 기존에 선택한 날짜가 있으면
            document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay");  // 해당 날짜의 "choiceDay" class 제거
        }
        if (document.getElementsByName("choiceDay")[0]) {                        // 기존에 선택한 날짜가 있으면
            document.getElementsByName("choiceDay")[0].removeAttribute("name");  // 해당 날짜의 "choiceDay" name 제거
        }
        if (document.getElementsByName("bo_date")[0]) {                        // 기존에 선택한 날짜가 있으면
            document.getElementsByName("bo_date")[0].removeAttribute("name");  // 해당 날짜의 "bo_date" class 제거
        }
        
        newDIV.classList.add("choiceDay");          // 선택된 날짜 p 태그에 "choiceDay" class 추가
        newDIV.setAttribute("name", "choiceDay");	// 선택된 날짜 p 태그에 "choiceDay" name 추가
        input.setAttribute("name", "bo_date");		// 선택된 날짜 input 태그에 name 값 추가
    }

	function bo_text(){
		$(".bo_text").text("예매 가능 인원 :");
	}
	
 	// 시간별 예약 가능 인원 출력
 	function book_time(){
 		if($("input[name='bo_date']").val() == bo_now_1){
 			$('.bo_text1').text('${bo_now_1.bo_time_count1}'+"명");
 			$('.bo_text2').text('${bo_now_1.bo_time_count2}'+"명");
 			$('.bo_text3').text('${bo_now_1.bo_time_count3}'+"명");
 			$('.bo_text4').text('${bo_now_1.bo_time_count4}'+"명");
 			$('#bo_time_count1').val('${bo_now_1.bo_time_count1}');
 			$('#bo_time_count2').val('${bo_now_1.bo_time_count2}');
 			$('#bo_time_count3').val('${bo_now_1.bo_time_count3}');
 			$('#bo_time_count4').val('${bo_now_1.bo_time_count4}');
 		}else if($("input[name='bo_date']").val() == bo_now_2){
 			$('.bo_text1').text('${bo_now_2.bo_time_count1}'+"명");
 			$('.bo_text2').text('${bo_now_2.bo_time_count2}'+"명");
 			$('.bo_text3').text('${bo_now_2.bo_time_count3}'+"명");
 			$('.bo_text4').text('${bo_now_2.bo_time_count4}'+"명");
 			$('#bo_time_count1').val('${bo_now_2.bo_time_count1}');
 			$('#bo_time_count2').val('${bo_now_2.bo_time_count2}');
 			$('#bo_time_count3').val('${bo_now_2.bo_time_count3}');
 			$('#bo_time_count4').val('${bo_now_2.bo_time_count4}');
 		}else if($("input[name='bo_date']").val() == bo_now_3){
 			$('.bo_text1').text('${bo_now_3.bo_time_count1}'+"명");
 			$('.bo_text2').text('${bo_now_3.bo_time_count2}'+"명");
 			$('.bo_text3').text('${bo_now_3.bo_time_count3}'+"명");
 			$('.bo_text4').text('${bo_now_3.bo_time_count4}'+"명");
 			$('#bo_time_count1').val('${bo_now_3.bo_time_count1}');
 			$('#bo_time_count2').val('${bo_now_3.bo_time_count2}');
 			$('#bo_time_count3').val('${bo_now_3.bo_time_count3}');
 			$('#bo_time_count4').val('${bo_now_3.bo_time_count4}');
 		}else if($("input[name='bo_date']").val() == bo_now_4){
 			$('.bo_text1').text('${bo_now_4.bo_time_count1}'+"명");
 			$('.bo_text2').text('${bo_now_4.bo_time_count2}'+"명");
 			$('.bo_text3').text('${bo_now_4.bo_time_count3}'+"명");
 			$('.bo_text4').text('${bo_now_4.bo_time_count4}'+"명");
 			$('#bo_time_count1').val('${bo_now_4.bo_time_count1}');
 			$('#bo_time_count2').val('${bo_now_4.bo_time_count2}');
 			$('#bo_time_count3').val('${bo_now_4.bo_time_count3}');
 			$('#bo_time_count4').val('${bo_now_4.bo_time_count4}');
 		}else{
 			$('.bo_text1').text('${bo_now_5.bo_time_count1}'+"명");
 			$('.bo_text2').text('${bo_now_5.bo_time_count2}'+"명");
 			$('.bo_text3').text('${bo_now_5.bo_time_count3}'+"명");
 			$('.bo_text4').text('${bo_now_5.bo_time_count4}'+"명");
 			$('#bo_time_count1').val('${bo_now_5.bo_time_count1}');
 			$('#bo_time_count2').val('${bo_now_5.bo_time_count2}');
 			$('#bo_time_count3').val('${bo_now_5.bo_time_count3}');
 			$('#bo_time_count4').val('${bo_now_5.bo_time_count4}');
 		}
 	}
    

    // 이전달 버튼 클릭
    function prevCalendar() {
        nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() - 1, nowMonth.getDate());   // 현재 달을 1 감소
        buildCalendar();    // 달력 생성 함수 호출
    }
    // 다음달 버튼 클릭
    function nextCalendar() {
        nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, nowMonth.getDate());   // 현재 달을 1 증가
        buildCalendar();    // 달력 생성 함수 호출
    }
    // input 값이 한자리 숫자인 경우 앞에 '0' 붙여주는 함수
    function leftPad(value) {
        if (value < 10) {
            value = "0" + value;
            return value;
        }
        return value;
    }   
    
</script>
