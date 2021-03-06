package book;

import java.io.IOException;
import java.io.Reader;
import java.util.Date;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class BookRentAction extends ActionSupport implements SessionAware{

	private int book_no;
	private int book_loannum;
	private Date enddate;
	private bookVO paramClass;
	private bookVO resultClass;
	
	private Map session;
	private int reserveNum;
	
	public static Reader reader;	
	public static SqlMapClient sqlMapper;	
	
	public BookRentAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String form() throws Exception {
		
		return SUCCESS;
	}
	
	public String execute() throws Exception {
		paramClass = new bookVO();
		resultClass = new bookVO();
		
		paramClass.setBook_loannum(getBook_loannum());
		paramClass.setRent_id((String) session.get("session_id"));
		paramClass.setBook_no(book_no);
		
		System.out.println("book_no >> " + book_no);
		sqlMapper.update("book.bookRent", paramClass);
		return SUCCESS;
	}
	
	public String returnBook() throws Exception {
		return SUCCESS;
	}

	public int getBook_no() {
		return book_no;
	}

	public void setBook_no(int book_no) {
		this.book_no = book_no;
	}

	public int getReserveNum() {
		return reserveNum;
	}

	public void setReserveNum(int reserveNum) {
		this.reserveNum = reserveNum;
	}

	@Override
	public void setSession(Map session) {
		// TODO Auto-generated method stub
		this.session = session;
	}

	public Date getEnddate() {
		return enddate;
	}

	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}

	public int getBook_loannum() {
		return book_loannum;
	}

	public void setBook_loannum(int book_loannum) {
		this.book_loannum = book_loannum;
	}
}
