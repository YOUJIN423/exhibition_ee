package project.Model;

public class Book {
	private int bo_num; 		// 예약 번호
	private int ex_num; 		// 전시 번호
	private int pay_num; 		// 결제 번호
	private String bo_date; 	// 예약 날짜
	private int bo_time; 		// 예약 시간
	private int bo_count; 		// 예약 인원수
	private int bo_state; 		// 예약 상태
	private String bo_re_num;	// 실제 예약 번호
	private int bo_price; 		// 결제 금액
	private int bo_a_adult; 	// 연령대 : 일반
	private int bo_a_freshman;	// 연령대 : 청년
	private int bo_a_teen;		// 연령대 : 청소년
	private int bo_a_senior;	// 연령대 : 시니어
	private int bo_a_free;		// 연령대 : 무료 대상
	private String mem_id;
	
	public int getBo_num() {
		return bo_num;
	}
	public void setBo_num(int bo_num) {
		this.bo_num = bo_num;
	}
	public int getEx_num() {
		return ex_num;
	}
	public void setEx_num(int ex_num) {
		this.ex_num = ex_num;
	}
	public int getPay_num() {
		return pay_num;
	}
	public void setPay_num(int pay_num) {
		this.pay_num = pay_num;
	}
	public String getBo_date() {
		return bo_date;
	}
	public void setBo_date(String bo_date) {
		this.bo_date = bo_date;
	}
	public int getBo_time() {
		return bo_time;
	}
	public void setBo_time(int bo_time) {
		this.bo_time = bo_time;
	}
	public int getBo_count() {
		return bo_count;
	}
	public void setBo_count(int bo_count) {
		this.bo_count = bo_count;
	}
	public int getBo_state() {
		return bo_state;
	}
	public void setBo_state(int bo_state) {
		this.bo_state = bo_state;
	}
	public String getBo_re_num() {
		return bo_re_num;
	}
	public void setBo_re_num(String bo_re_num) {
		this.bo_re_num = bo_re_num;
	}
	public int getBo_price() {
		return bo_price;
	}
	public void setBo_price(int bo_price) {
		this.bo_price = bo_price;
	}
	public int getBo_a_adult() {
		return bo_a_adult;
	}
	public void setBo_a_adult(int bo_a_adult) {
		this.bo_a_adult = bo_a_adult;
	}
	public int getBo_a_freshman() {
		return bo_a_freshman;
	}
	public void setBo_a_freshman(int bo_a_freshman) {
		this.bo_a_freshman = bo_a_freshman;
	}
	public int getBo_a_teen() {
		return bo_a_teen;
	}
	public void setBo_a_teen(int bo_a_teen) {
		this.bo_a_teen = bo_a_teen;
	}
	public int getBo_a_senior() {
		return bo_a_senior;
	}
	public void setBo_a_senior(int bo_a_senior) {
		this.bo_a_senior = bo_a_senior;
	}
	public int getBo_a_free() {
		return bo_a_free;
	}
	public void setBo_a_free(int bo_a_free) {
		this.bo_a_free = bo_a_free;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	
}