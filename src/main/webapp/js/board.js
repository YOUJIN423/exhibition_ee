function board_check(){
	
	if($("#board_name").val()==""){
		alert("작성자를 입력하세요.");
		$("#board_name").focus();
		return false;
	}
	if($("#board_title").val()==""){
		alert("제목을 입력하세요.");
		$("#board_title").focus();
		return false;
	}
	if($("#board_date").val()==""){
		alert("작성일을 입력하세요.");
		$("#board_date").focus();
		return false;
	}
	if($("#board_content").val()==""){
		alert("내용을 입력하세요.");
		$("#board_content").focus();
		return false;
	}						
}