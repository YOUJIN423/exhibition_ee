package project.Model;

import java.util.Date;

public class Exhibition {
	private int ex_num; // 전시번호
	private String ex_name; // 전시명
	private String ex_loc; // 전시장소
	private Date ex_start; // 전시시작
	private Date ex_end; // 전시종료
	private String ex_end_state; // 전시종료상태
	private int ex_ing; // 전시지속
	private String ex_con_img; // 전시 내용 이미지
	private String ex_poster; // 전시 포스터
	private int ex_total_count; // 예약 총 인원 수

	public int getEx_num() {
		return ex_num;
	}

	public void setEx_num(int ex_num) {
		this.ex_num = ex_num;
	}

	public String getEx_name() {
		return ex_name;
	}

	public void setEx_name(String ex_name) {
		this.ex_name = ex_name;
	}

	public String getEx_loc() {
		return ex_loc;
	}

	public void setEx_loc(String ex_loc) {
		this.ex_loc = ex_loc;
	}

	public Date getEx_start() {
		return ex_start;
	}
	
	public void setEx_start(Date ex_start) {
		this.ex_start = ex_start;
	}

	public Date getEx_end() {
		return ex_end;
	}

	public void setEx_end(Date ex_end) {
		this.ex_end = ex_end;
	}

	public String getEx_end_state() {
		return ex_end_state;
	}

	public void setEx_end_state(String ex_end_state) {
		this.ex_end_state = ex_end_state;
	}

	public int getEx_ing() {
		return ex_ing;
	}

	public void setEx_ing(int ex_ing) {
		this.ex_ing = ex_ing;
	}

	public String getEx_con_img() {
		return ex_con_img;
	}

	public void setEx_con_img(String ex_con_img) {
		this.ex_con_img = ex_con_img;
	}

	public String getEx_poster() {
		return ex_poster;
	}

	public void setEx_poster(String ex_poster) {
		this.ex_poster = ex_poster;
	}

	public int getEx_total_count() {
		return ex_total_count;
	}

	public void setEx_total_count(int ex_total_count) {
		this.ex_total_count = ex_total_count;
	}

}