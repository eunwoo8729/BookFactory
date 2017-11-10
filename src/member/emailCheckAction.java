package member;


import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.IOException;
import java.io.Reader;

public class emailCheckAction extends ActionSupport{
	
	public static Reader reader; 
	public static SqlMapClient sqlMapper; 
	
	private memberVO resultClass; 
	
	private String m_email;
	private int chkEmail;
	
	public emailCheckAction() throws IOException{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); 
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception{
		resultClass = new memberVO();
		
		resultClass = (memberVO) sqlMapper.queryForObject("EmailCheckSelectOne", getM_email());
		
		if(resultClass == null) {	//이메일이 있는지 확인
			chkEmail = 0; 
		}
		else {
			chkEmail = 1; 
		}		
		return SUCCESS;
		
	}

	public memberVO getResultClass() {
		return resultClass;
	}

	public void setResultClass(memberVO resultClass) {
		this.resultClass = resultClass;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public int getChkEmail() {
		return chkEmail;
	}

	public void setChkEmail(int chkEmail) {
		this.chkEmail = chkEmail;
	}

}