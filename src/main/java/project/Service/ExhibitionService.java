package project.Service;

import java.util.List;
import java.util.Map;

import project.Model.Exhibition;

public interface ExhibitionService {
	
	// 전시 세부정보
	Exhibition detail(int ex_num);

	// 전시 수
	int getListCount(String ex_end_state);

	// 전시 목록
	List<Exhibition> getBoardList(Map map);

	String getExName(int ex_num);

	List<Exhibition> searchExhibition(String search);
	
	/*[추천 전시]*/
	List<Exhibition> exhibition_bestList();
}
