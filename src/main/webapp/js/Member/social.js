function check(){
	 if($.trim($("#mem_name").val())==""){
		 alert("이름을 입력하세요.");
		 $("#mem_name").val("").focus();
		 return false;
	 }
	 if($("#male").is(":checked") == false &&
		$("#female").is(":checked") == false){
		 alert("성별을 선택하세요.");
		 return false;
	 }
	 if($.trim($("#mem_jumin1").val())==""){
		 alert("주민등록번호 앞자리를 입력하세요.");
		 $("#mem_jumin1").val("").focus();
		 return false;
	 }
	 if($.trim($("#mem_jumin2").val())==""){
		 alert("주민등록번호 뒷자리를 입력하세요.");
		 $("#mem_jumin2").val("").focus();
		 return false;
	 }
	 if($.trim($("#mem_email").val())==""){
		 alert("메일 아이디를 입력하세요.");
		 $("#mem_email").val("").focus();
		 return false;
	 }
	 if($.trim($("#mem_domain").val())==""){
		 alert("메일 주소를 입력하세요.");
		 $("#mem_domain").val("").focus();
		 return false;
	 }	
	 
	 if($.trim($("#mem_addr1").val())==""){
		 alert("주소를 입력하세요.");
		 $("#mem_addr1").val("").focus();
		 return false;
	 }
	 if($.trim($("#mem_addr2").val())==""){
		 alert("상세 주소를 입력하세요.");
		 $("#mem_addr2").val("").focus();
		 return false;
	 }
	 if($.trim($("#mem_tel2").val())==""){
		 alert("핸드폰 번호를 입력하세요.");
		 $("#mem_tel2").val("").focus();
		 return false;
	 }
	 if($.trim($("#mem_tel3").val())==""){
		 alert("핸드폰 번호를 입력하세요.");
		 $("#mem_tel3").val("").focus();
		 return false;
	 }
}
 
function post_search(){
	alert("우편번호 검색 버튼을 클릭하세요.");
}

function post_check(){
	window.open("zipcode_find.nhn","우편번호검색",
			"width=420,height=200,scrollbars=yes");
	//폭이 420이고 높이가 200,스크롤바가 생성되는 새로운 공지창을 만듬
}

/*[아이디 중복 체크]*/
function id_check(){
	$("#idcheck").hide();//id_check_area 아이디 영역을 숨긴다.
	var memid=$("#mem_id").val();
	
	//1.입력글자 길이 체크
	if($.trim($("#mem_id").val()).length < 8){
		var newtext='<font color="gray">아이디는 8자 이상이어야 합니다.</font>';
		$("#idcheck").text('');
		$("#idcheck").show();
		$("#idcheck").append(newtext);//span 아이디 영역에 경고문자 추가
		$("#mem_id").val("").focus();
		return false;
	};
	if($.trim($("#mem_id").val()).length >12){
		var newtext='<font color="gray">아이디는 12자 이하이어야 합니다.</font>';
		$("#idcheck").text('');
		$("#idcheck").show();
		$("#idcheck").append(newtext);//span 아이디 영역에 경고문자 추가
		$("#mem_id").val("").focus();
		return false;
	};
	//입력아이디 유효성 검사
	if(!(validate_userid(memid))){
		var newtext='<font color="gray">아이디는 영문 대소문자,숫자 조합만 가능합니다.</font>';
		$("#idcheck").text('');//문자 초기화
		$("#idcheck").show();//span 아이디 영역을 보이게 한다.
		$("#idcheck").append(newtext);
		$("#mem_id").val("").focus();
		return false;
	};
					
	/*[아이디 중복확인]*/
    $.ajax({
        type:"POST",
        url:"member_idcheck.do",   //Controller 클래스로 요청  → @RequestParam으로 값을 받음 
        data: {"memid":memid},         //memid)아이디 중복 체크에서 받아놓음
        success: function (data) { 
        	alert("return success="+data);
      	  if(data==1){	//중복 ID
      		var newtext='<font color="gray">중복 아이디입니다.</font>';
      			$("#idcheck").text(''); //div 영역에 text()함수로 지우기
        		$("#idcheck").show();   //show()함수)나타내기
        		$("#idcheck").append(newtext); 
          		$("#mem_id").val('').focus(); //값 지우고 포커스 
          		return false;
	     
      	  }else{	//사용 가능한 ID
      		var newtext='<font color="green">사용가능한 아이디입니다.</font>';
      		$("#idcheck").text('');
      		$("#idcheck").show();
      		$("#idcheck").append(newtext);
      		$("#mem_passwd").focus();    //비번 입력에 포커스 
      	  }  	    	  
        }
        ,
    	  error:function(e){
    		  alert("data error"+e);
    	  }
      });//$.ajax	
};
/*아이디 중복 체크 끝*/

function validate_userid(memid)
{
  var pattern= new RegExp( /^[a-zA-Z0-9]*$/);
  //숫자 + 영문자 대소문자만 가능한 정규표현식
  return pattern.test(memid);
};
 

/*[도메인 선택]*/
$(document).ready(function(){
	$("#mail_select_list").change(function(){
		if($("#mail_select_list").val()=="0"){		// 직접 입력 선택
			$("#mem_domain").attr("readOnly", false);
			$("#mem_domain").val("").focus();
		}else{										// 도메인을 선택
			$("#mem_domain").val($("#mail_select_list").val());
			$("#mem_domain").attr("readOnly","readOnly");				
		}
	});
	
});