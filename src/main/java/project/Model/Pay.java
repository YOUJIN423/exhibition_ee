package project.Model;

import java.util.Date;

public class Pay {
	private int pay_num; 			// 결제번호
	private String mem_id; 			// 회원아이디
	private int ex_num; 			// 전시번호
	private int bo_price; 			// 결제금액
	private String pay_payment; 	// 결제수단
	private Date pay_date; 			// 결제날짜
	private Date pay_canceldate; 	// 취소날짜
	private int bo_num; 			// 예약번호
	
	public int getPay_num() {
		return pay_num;
	}
	public void setPay_num(int pay_num) {
		this.pay_num = pay_num;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getEx_num() {
		return ex_num;
	}
	public void setEx_num(int ex_num) {
		this.ex_num = ex_num;
	}
	public int getBo_price() {
		return bo_price;
	}
	public void setBo_price(int bo_price) {
		this.bo_price = bo_price;
	}
	public String getPay_payment() {
		return pay_payment;
	}
	public void setPay_payment(String pay_payment) {
		this.pay_payment = pay_payment;
	}
	public Date getPay_date() {
		return pay_date;
	}
	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}
	public Date getPay_canceldate() {
		return pay_canceldate;
	}
	public void setPay_canceldate(Date pay_canceldate) {
		this.pay_canceldate = pay_canceldate;
	}
	public int getBo_num() {
		return bo_num;
	}
	public void setBo_num(int bo_num) {
		this.bo_num = bo_num;
	}
	
	
}
