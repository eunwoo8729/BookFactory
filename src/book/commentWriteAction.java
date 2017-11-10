package book;


import java.io.IOException;
import java.io.Reader;
import java.util.Calendar;
import java.util.Date;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class commentWriteAction extends ActionSupport{
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private BookCommentVO paramClass;
	private BookCommentVO resultClass;

	
	private int book_no;
	private int comment_no;
	private String member_id;
	private String star;
	private String content;
	private Date regdate;
	
	
	
	Calendar today = Calendar.getInstance();
	private int totalCount;
	


	public commentWriteAction() throws IOException
	{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();

	}
	


	public String execute() throws Exception {
		
		paramClass = new BookCommentVO();
		resultClass = new BookCommentVO();
		
		paramClass.setComment_no(getComment_no());
		paramClass.setBook_no(getBook_no());
		paramClass.setMember_id(getMember_id());
		paramClass.setStar(getStar());	
		paramClass.setContent(getContent());
		paramClass.setRegdate(today.getTime());

		sqlMapper.insert("admin.insertComment", paramClass);
		

		return SUCCESS;
	}



	public BookCommentVO getParamClass() {
		return paramClass;
	}



	public BookCommentVO getResultClass() {
		return resultClass;
	}



	public int getBook_no() {
		return book_no;
	}



	public int getComment_no() {
		return comment_no;
	}



	public String getMember_id() {
		return member_id;
	}



	public String getStar() {
		return star;
	}



	public String getContent() {
		return content;
	}



	public Date getRegdate() {
		return regdate;
	}



	public int getTotalCount() {
		return totalCount;
	}



	public void setParamClass(BookCommentVO paramClass) {
		this.paramClass = paramClass;
	}



	public void setResultClass(BookCommentVO resultClass) {
		this.resultClass = resultClass;
	}



	public void setBook_no(int book_no) {
		this.book_no = book_no;
	}



	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}



	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}



	public void setStar(String star) {
		this.star = star;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}



	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

}

