package book;
import java.util.Date;

public class BookCommentVO {
	
	private int book_no;
	private int comment_no;
	private String member_id;
	private String star;
	private String content;
	private Date regdate;
	
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
}