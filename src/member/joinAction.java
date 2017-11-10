package member;

import java.io.IOException; 
import java.io.Reader;
import java.util.Date;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class joinAction extends ActionSupport {
	
	public static Reader reader; 
	public static SqlMapClient sqlMapper; 

	private memberVO paramClass; 
	private memberVO resultClass; 
	
	private int m_no;
	private String m_id;
	private String m_pw;
	private String m_name;
	private String m_jumin1;
	private String m_jumin2;
	private String m_email;
	private int m_phone;
	private String m_zipcode;
	private String m_addr1;
	private String m_addr2;
  	
  	private int chkId;
  	
  	boolean reply = false;
  	
	public joinAction() throws IOException {

		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); 
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String form() throws Exception {
		//µî·Ï Æû.
		return SUCCESS;
	}
	
	public String joinAgree() throws Exception{
		return SUCCESS;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		
		paramClass = new memberVO();
		resultClass = new memberVO();
		
		resultClass = (memberVO) sqlMapper.queryForObject("selectMemberOne", getM_id());
		
		if(resultClass != null) {	
			return ERROR;
		}
	
		
		paramClass.setM_id(getM_id());		
		paramClass.setM_pw(getM_pw());
		paramClass.setM_name(getM_name());
		/*paramClass.setM_no(getM_no());*/
		paramClass.setM_jumin1(getM_jumin1());
		paramClass.setM_jumin2(getM_jumin2());
		paramClass.setM_email(getM_email());
		paramClass.setM_phone(getM_phone());
		paramClass.setM_zipcode(getM_zipcode());
		paramClass.setM_addr1(getM_addr1());
		paramClass.setM_addr2(getM_addr2());
	
		sqlMapper.insert("insertjoin", paramClass);
		return SUCCESS;
	}

	public memberVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(memberVO paramClass) {
		this.paramClass = paramClass;
	}

	public memberVO getResultClass() {
		return resultClass;
	}

	public void setResultClass(memberVO resultClass) {
		this.resultClass = resultClass;
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pw() {
		return m_pw;
	}

	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_jumin1() {
		return m_jumin1;
	}

	public void setM_jumin1(String m_jumin1) {
		this.m_jumin1 = m_jumin1;
	}

	public String getM_jumin2() {
		return m_jumin2;
	}

	public void setM_jumin2(String m_jumin2) {
		this.m_jumin2 = m_jumin2;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public int getM_phone() {
		return m_phone;
	}

	public void setM_phone(int m_phone) {
		this.m_phone = m_phone;
	}

	public String getM_zipcode() {
		return m_zipcode;
	}

	public void setM_zipcode(String m_zipcode) {
		this.m_zipcode = m_zipcode;
	}

	public String getM_addr1() {
		return m_addr1;
	}

	public void setM_addr1(String m_addr1) {
		this.m_addr1 = m_addr1;
	}

	public String getM_addr2() {
		return m_addr2;
	}

	public void setM_addr2(String m_addr2) {
		this.m_addr2 = m_addr2;
	}

	public int getChkId() {
		return chkId;
	}

	public void setChkId(int chkId) {
		this.chkId = chkId;
	}
	
	
}
