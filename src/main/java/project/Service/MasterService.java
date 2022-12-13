package project.Service;

import java.util.List;

import javax.servlet.http.HttpSession;

import project.Model.Master;
import project.Model.Member;
import project.Model.Qna;


public interface MasterService {

// masters 로그인 인증
public Master login(Master ms);

// Qna 문의 글 갯수 
public int getCount();

// Qna 문의 글 목록
public List<Qna> getQnaList(int page);

// Qna  문의글  정보 
Qna getselect(int qna_num);

//답글 작성
public int reply_ok(Qna qna);

// 답글 레벨 증가
public void replyUp(Qna qna);

// 답변 출력
public Qna getReSelect(int qna_num);

public int qna_state_update(int qna_num);


// master 로그아웃

 

	
}
