package project.Service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import project.Dao.MasterDao;
import project.Model.Master;
import project.Model.Member;
import project.Model.Qna;

@Service
public class MasterServiceImple implements MasterService {
	@Autowired
	public MasterDao mdo;

// master 로그인 인증
	@Override
	public Master login(Master ms) {
		return mdo.login(ms);
	}
// Qna 문의 갯수

	@Override
	public int getCount() {

		return mdo.getCount();
	}
// Qna 문의 목록

	@Override
	public List<Qna> getQnaList(int page) {

		return mdo.getQnaList(page);
	}
	
// Qna 문의글 정보 
	public Qna getselect(int qna_num) {
		
		return mdo.getselect(qna_num);
	}
 // 문의 답변
	@Override
	public int reply_ok(Qna qna) {
		// TODO Auto-generated method stub
		return mdo.qnareply(qna);
	}
// 답변 레벨 증가 
	@Override
	public void replyUp(Qna qna) {
		// TODO Auto-generated method stub
		 mdo.replyUp(qna);
		
	}

	@Override
	public Qna getReSelect(int qna_num) {
		return mdo.getReSelect(qna_num);
	}

	@Override
	public int qna_state_update(int qna_num) {
		return mdo.qna_state_update(qna_num);
	}

	

}
