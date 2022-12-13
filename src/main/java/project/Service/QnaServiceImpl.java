package project.Service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.Dao.QnaDao;
import project.Model.Qna;

@Service
public class QnaServiceImpl implements QnaService{
	@Autowired
	private QnaDao qd;
	
	@Override
	public List<Qna> getQnaList(Map map) {
		return qd.getQnaList(map);
	}
	
	@Override
	public String getQnaRe(int qna_num) {
		return qd.getQnaRe(qna_num);
	}

	@Override
	public int insertQna(Qna qna) {
		return qd.insertQna(qna);
	}

}
