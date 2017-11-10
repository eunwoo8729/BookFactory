package adminBook;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import book.bookVO;

public class adminBookViewAction extends ActionSupport implements SessionAware{

	public static Reader reader;	
	public static SqlMapClient sqlMapper;	

	private adminBookVO paramClass = new adminBookVO();
	private adminBookVO resultClass = new adminBookVO(); 
	
	bookVO rParam;
	bookVO rResult;
	
	private Map session;
	private int b_no;			
	private int totalCount;
	
	public adminBookViewAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); 
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);	
		reader.close();
	}
	
	public String execute() throws Exception {

	paramClass.setB_no(getB_no());
	
	sqlMapper.update("admin.updateReadCount", paramClass);
	
	resultClass = (adminBookVO) sqlMapper.queryForObject("admin.selectOne", getB_no());
	
	
	return SUCCESS;
	}
	
	
	public adminBookVO getParamClass() {
		return paramClass;
	}

	public adminBookVO getResultClass() {
		return resultClass;
	}

	public int getB_no() {
		return b_no;
	}

	public void setB_no(int b_no) {
		this.b_no = b_no;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setParamClass(adminBookVO paramClass) {
		this.paramClass = paramClass;
	}

	public void setResultClass(adminBookVO resultClass) {
		this.resultClass = resultClass;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	@Override
	public void setSession(Map session) {
		// TODO Auto-generated method stub
		this.session = session;
	}
}