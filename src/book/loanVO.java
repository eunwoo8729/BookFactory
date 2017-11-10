package book;

import java.util.Date;

public class loanVO {

	private int l_no;
	private int m_no;
	private int b_no;
	private Date l_outDate;
	private Date l_inDate;
	
	
	public int getL_no() {
		return l_no;
	}
	public void setL_no(int l_no) {
		this.l_no = l_no;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public Date getL_outDate() {
		return l_outDate;
	}
	public void setL_outDate(Date l_outDate) {
		this.l_outDate = l_outDate;
	}
	public Date getL_inDate() {
		return l_inDate;
	}
	public void setL_inDate(Date l_inDate) {
		this.l_inDate = l_inDate;
	}
	
	
}
