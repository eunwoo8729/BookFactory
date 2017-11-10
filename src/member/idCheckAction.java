package member;

import com.opensymphony.xwork2.ActionSupport; 
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.IOException;
import java.io.Reader;

public class idCheckAction extends ActionSupport{
	
	public static Reader reader; 
	public static SqlMapClient sqlMapper; 
	
	private memberVO resultClass; 
	
	private String m_id;
	private int chkId;
	
	public idCheckAction() throws IOException{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); 
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception{
		resultClass = new memberVO();
		resultClass = (memberVO) sqlMapper.queryForObject("IdCheckSelectOne", getM_id());
		
		if(resultClass == null) {	//아이디가 있는지 확인
			chkId = 0; 
		}
		else {
			chkId = 1; 
		}		
		return SUCCESS;
		
	}

	public memberVO getResultClass() {
		return resultClass;
	}

	public void setResultClass(memberVO resultClass) {
		this.resultClass = resultClass;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public int getChkId() {
		return chkId;
	}

	public void setChkId(int chkId) {
		this.chkId = chkId;
	}

}