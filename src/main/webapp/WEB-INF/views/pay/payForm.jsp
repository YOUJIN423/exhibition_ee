<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ee Museum of Art_pay</title>

<%@ include file="../common/commonConfig.jsp"%>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>


</head>
<body>

<script>

//IMP 객체 초기화

var IMP = window.IMP; // 생략 가능
IMP.init("imp27163624"); // 예: imp00000000

if('${book.bo_price}' == 0){	// 결제 금액이 0원일 때 
	location.href="<%=request.getContextPath()%>/pay/pay0Result.do?bo_num=${book.bo_num}";
}else{
	window.onload = function() { requestPay(); } 
}	


// 결제 요청하기
 
    function requestPay() {
      // IMP.request_pay(param, callback) 결제창 호출
      IMP.request_pay({ // param
          pg: "html5_inicis",
          pay_method: "card",
          merchant_uid: '${book.bo_re_num}',
          name: '${exhi.ex_name}',	
          amount: '${book.bo_price}',
          buyer_email: "${member.mem_email}@${member.mem_domain}",	
          buyer_name: "${member.mem_name}",
          buyer_tel: "${member.mem_tel1}-${member.mem_tel2}-${member.mem_tel3}",
      }, function (rsp) { // callback
    	  /* alert('pay_num:'+'${book.pay_num}');
    	  alert('ex_num:'+'${book.ex_num}');
    	  alert('bo_price:'+'${book.bo_price}');
    	  alert(rsp.pay_method);
    	  alert('bo_re_num:'+'${book.bo_re_num}'); */
      
			if (rsp.success) { // 결제 성공 시
				var msg = '결제가 완료되었습니다.';
				var result = {
//					"imp_uid"     : rsp.imp_uid,			// 고유 ID
					"pay_num"     : '${book.pay_num}',		// 결제 번호
					"ex_num"      : '${book.ex_num}',		// 전시 번호
					"bo_price"    : '${book.bo_price}',		// 결제 금액
					"pay_payment" : rsp.pay_method, 		// 결제 수단
					"pay_date"    : new Date(), 			// 결제 일자
					"bo_re_num"   : '${book.bo_re_num}',    // 예약 번호
					"bo_num"      : '${book.bo_num}',    	// 예약 번호
					"mem_id"   	  : '${member.mem_id}'		// 회원 아이디
          	  	} 				
				/* console.log('res1:' + res1); */
				/* console.log("결제 성공 " + msg); */
				$.ajax({
					url : "<%=request.getContextPath()%>/pay/payResult.do",
					type : "post", 
					data : JSON.stringify(result),
					contentType:'application/json;charset=utf-8',
					dataType: 'json', // 서버에서 보내줄 데이터 타입
			        success: function(res){
			        	/* alert(res); */
			       		if(res == 1){
							location.href="<%=request.getContextPath()%>/pay/paySuccess.do";
			        	}else{
							console.log("결제에 실패하였습니다. 다시 시도해주세요.");
							location.href="<%=request.getContextPath()%>/pay/payCancel.do?bo_num=${book.bo_num}";
						}
					},
					error:function(){
						console.log("insert ajax 통신 실패");
					}	
				}) // ajax
				
          } else { // 결제 실패 시
        	  var msg = '결제에 실패하였습니다. 다시 시도해주세요.';
              msg += '에러 : ' + rsp.error_msg;
              location.href="<%=request.getContextPath()%>/pay/payCancel.do?bo_num=${book.bo_num}";
          }
			console.log(msg);
      }); // pay
    }

  

  </script>
  
  <div id="paydetail"></div>


</body>
</html>