package project.Dao;

import java.util.List;

import project.Model.Master;
import project.Model.Member;
import project.Model.Qna;

public interface MasterDao {

// master 로그인인증

Master login(Master ms);

// 문의 총 갯수
int getCount();
	
// 문의 글 목록 
List<Qna> getQnaList(int page);

// 문의 글 정보
Qna getselect(int qna_num);

// 문의 답변
int qnareply(Qna qna);

// 문의 답변 레벨
public void replyUp(Qna qna);

Qna getReSelect(int qna_num);

int qna_state_update(int qna_num);







	


	
	

}
