package project.Service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.Dao.MyLikeDao;
import project.Model.Exhibition;
import project.Model.MyLike;

@Service
public class MyLikeServiceImpl implements MyLikeService{
	@Autowired
	private MyLikeDao ld;

	@Override
	public int getMyLike(Map like) {
		return ld.getMyLike(like);
	}

	@Override
	public int updateMyLike(MyLike like) {
		return ld.updateMyLike(like);
	}

	@Override
	public int insertMyLike(Map map) {
		return ld.insertMyLike(map);
	}

	@Override
	public List<Exhibition> mylikeList(Map map) {
		return ld.mylikeList(map);
	}

	@Override
	public List<Exhibition> mylikeList_recent(String mem_id) {
		return ld.mylikeList_recent(mem_id);
	}

	@Override
	public int getCount(String mem_id) {
		return ld.getCount(mem_id);
	}
}
