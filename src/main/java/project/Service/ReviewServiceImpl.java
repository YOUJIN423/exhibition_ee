package project.Service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.Dao.ReviewDao;
import project.Model.Book;
import project.Model.Exhibition;
import project.Model.Review;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDao rd;

	@Override
	public int reviewCheck(Map map) {
		return rd.reviewCheck(map);
	}

	@Override
	public Book getBook(int bo_num) {
		return rd.getBook(bo_num);
	}

	@Override
	public int writeReview(Review review) {
		return rd.writeReview(review);
	}

	@Override
	public int updateBookState(int bo_num) {
		return rd.updateBookState(bo_num);
	}

	@Override
	public List<Review> getReviewList(Map map) {
		return rd.getReviewList(map);
	}
	
	@Override
	public List<Exhibition> myReviewList_ex(Map map) {
		return rd.getReviewList_ex(map);
	}
	
	@Override
	public int updateReview(Review review) {
		return rd.updateReview(review);
	}

	@Override
	public int deleteReview(int rev_num) {
		return rd.deleteReview(rev_num);
	}

	@Override
	public int getCount(int ex_num) {
		return rd.getCount(ex_num);
	}

	@Override
	public int getCount(String mem_id) {
		return rd.getCount(mem_id);
	}

	@Override
	public List<Review> myReviewList(Map map) {
		return rd.myreviewList(map);
	}

	@Override
	public String getReviewTitle(int rev_num) {
		return rd.getReviewTitle(rev_num);
	}

	@Override
	public String getReviewContent(int rev_num) {
		return rd.getReviewContent(rev_num);
	}

	@Override
	public int getBook_rev(int rev_num) {
		return rd.getBook_rev(rev_num);
	}


}
