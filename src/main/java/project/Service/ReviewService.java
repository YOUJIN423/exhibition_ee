package project.Service;

import java.util.List;
import java.util.Map;

import project.Model.Book;
import project.Model.Exhibition;
import project.Model.Review;

public interface ReviewService {

	int reviewCheck(Map map);

	Book getBook(int bo_num);

	int writeReview(Review review);

	int updateBookState(int bo_num);

	List<Review> getReviewList(Map map);

	int updateReview(Review review);

	int deleteReview(int rev_num);

	int getCount(int ex_num);

	int getCount(String mem_id);

	List<Review> myReviewList(Map map);

	String getReviewTitle(int rev_num);

	String getReviewContent(int rev_num);

	List<Exhibition> myReviewList_ex(Map map);

	int getBook_rev(int rev_num);


}
