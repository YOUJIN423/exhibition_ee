package project.Dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.Model.Book;
import project.Model.Exhibition;
import project.Model.Review;

@Repository
public class ReviewDaoImpl implements ReviewDao {

	@Autowired
	private SqlSessionTemplate st;

	@Override
	public int reviewCheck(Map map) {
		try {
			return st.selectOne("reviewns.reviewCheck",map);
		} catch (NullPointerException e) {
			return 0;
		}
	}

	@Override
	public Book getBook(int bo_num) {
		return st.selectOne("reviewns.getBook",bo_num);
	}

	@Override
	public int writeReview(Review review) {
		return st.insert("reviewns.write",review);
	}

	@Override
	public int updateBookState(int bo_num) {
		return st.update("reviewns.updateBookState",bo_num);
	}

	@Override
	public List<Review> getReviewList(Map map) {
		return st.selectList("reviewns.getReviewList",map);
	}

	@Override
	public int updateReview(Review review) {
		return st.update("reviewns.updateReview",review);
	}

	@Override
	public int deleteReview(int rev_num) {
		return st.delete("reviewns.deleteReview",rev_num);
	}

	@Override
	public int getCount(int ex_num) {
		return st.selectOne("reviewns.getCount",ex_num);
	}

	@Override
	public int getCount(String mem_id) {
		return st.selectOne("reviewns.getCount_id",mem_id);
	}

	@Override
	public List<Review> myreviewList(Map map) {
		return st.selectList("reviewns.getReviewList_id",map);
	}
	
	@Override
	public List<Exhibition> getReviewList_ex(Map map) {
		return st.selectList("reviewns.getReviewList_ex",map);
	}
	
	@Override
	public String getReviewTitle(int rev_num) {
		return st.selectOne("reviewns.getTitle",rev_num);
	}

	@Override
	public String getReviewContent(int rev_num) {
		return st.selectOne("reviewns.getContent",rev_num);
	}

	@Override
	public int getBook_rev(int rev_num) {
		return st.selectOne("reviewns.getBook_rev",rev_num);
	}



}
