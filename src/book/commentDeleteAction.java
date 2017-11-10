package book;

import com.opensymphony.xwork2.ActionSupport;

import board.BoardVO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.File;
import java.io.Reader;
import java.io.IOException;

public class commentDeleteAction extends ActionSupport{
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private BookCommentVO paramClass;
	private BookCommentVO resultClass;
	
	private int comment_no;
	
	public commentDeleteAction() throws IOException
	{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	public String execute() throws Exception {
		paramClass = new BookCommentVO();
		resultClass = new BookCommentVO();
		
		resultClass = (BookCommentVO) sqlMapper.queryForObject("admin.selectOne", getComment_no());
		paramClass.setComment_no(getComment_no());
		
		sqlMapper.delete("admin.deleteComment",paramClass);
		
		return SUCCESS;
		
		
	}

		
	
	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		commentDeleteAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		commentDeleteAction.sqlMapper = sqlMapper;
	}

	public BookCommentVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(BookCommentVO paramClass) {
		this.paramClass = paramClass;
	}

	public BookCommentVO getResultClass() {
		return resultClass;
	}

	public void setResultClass(BookCommentVO resultClass) {
		this.resultClass = resultClass;
	}

	public int getComment_no() {
		return comment_no;
	}

	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}
	
	
	

	
}
