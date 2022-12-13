package project.Service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.Dao.ExhibitionDao;
import project.Model.Exhibition;

@Service
public class ExhibitionServiceImpl implements ExhibitionService{
	@Autowired
	private ExhibitionDao ed;

	// 전시 세부정보
	@Override
	public Exhibition detail(int ex_num) {
		return ed.detail(ex_num);
	}
	
	// 전시 개수
	@Override
	public int getListCount(String ex_end_state) {
		return ed.getListCount(ex_end_state);
	}
	
	// 전시 목록 (page, ex_end_state)
	@Override
	public List<Exhibition> getBoardList(Map map) {
		return ed.getBoardList(map);
	}
	
	// 전시명
	@Override
	public String getExName(int ex_num) {
		return ed.getExName(ex_num);
	}

	@Override
	public List<Exhibition> searchExhibition(String search) {
		return ed.searchExhibition(search);
	}
	
	/*[추천 전시]*/
	@Override
	public List<Exhibition> exhibition_bestList() {
		return ed.exhibition_bestList();
	}
}
