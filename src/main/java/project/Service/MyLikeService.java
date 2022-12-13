package project.Service;

import java.util.List;
import java.util.Map;

import project.Model.Exhibition;
import project.Model.MyLike;

public interface MyLikeService {

	int getMyLike(Map map);

	int updateMyLike(MyLike like);

	int insertMyLike(Map map);

	List<Exhibition> mylikeList(Map map);

	List<Exhibition> mylikeList_recent(String mem_id);

	int getCount(String mem_id);
}
