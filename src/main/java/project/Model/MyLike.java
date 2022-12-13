package project.Model;

import java.util.Date;

public class MyLike {
	private int mylike_num; // 좋아요
	private int ex_num; // 전시번호
	private String mem_id; // 회원 아이디
	private Date mylike_update;  // 좋아요 수정 날짜

	public int getMylike_num() {
		return mylike_num;
	}
	public void setMylike_num(int mylike_num) {
		this.mylike_num = mylike_num;
	}
	public int getEx_num() {
		return ex_num;
	}
	public void setEx_num(int ex_num) {
		this.ex_num = ex_num;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public Date getMylike_update() {
		return mylike_update;
	}
	public void setMylike_update(Date mylike_update) {
		this.mylike_update = mylike_update;
	}
}
