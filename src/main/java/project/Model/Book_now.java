package project.Model;

import java.util.Date;

public class Book_now {

	private int ex_num;				// 전시 번호
	private Date bo_date;			// 예약 날짜
	private int bo_time_count1;		// 예약 가능 인원 1 : 기본값 5
	private int bo_time_count2;		// 예약 가능 인원 2 : 기본값 5
	private int bo_time_count3;		// 예약 가능 인원 3 : 기본값 5
	private int bo_time_count4;		// 예약 가능 인원 4 : 기본값 5
	
	public int getEx_num() {
		return ex_num;
	}
	public void setEx_num(int ex_num) {
		this.ex_num = ex_num;
	}
	public Date getBo_date() {
		return bo_date;
	}
	public void setBo_date(Date bo_date) {
		this.bo_date = bo_date;
	}
	public int getBo_time_count1() {
		return bo_time_count1;
	}
	public void setBo_time_count1(int bo_time_count1) {
		this.bo_time_count1 = bo_time_count1;
	}
	public int getBo_time_count2() {
		return bo_time_count2;
	}
	public void setBo_time_count2(int bo_time_count2) {
		this.bo_time_count2 = bo_time_count2;
	}
	public int getBo_time_count3() {
		return bo_time_count3;
	}
	public void setBo_time_count3(int bo_time_count3) {
		this.bo_time_count3 = bo_time_count3;
	}
	public int getBo_time_count4() {
		return bo_time_count4;
	}
	public void setBo_time_count4(int bo_time_count4) {
		this.bo_time_count4 = bo_time_count4;
	}
	
}
