package member;

import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import java.io.IOException;
import java.io.Reader;
import java.util.Date;
import java.io.File;

public class joinModifyAction extends ActionSupport {
	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private memberVO paramClass; //파라미터를 저장할 객체
	private memberVO resultClass; //쿼리 결과 값을 저장할 객체

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

	// 생성자
	public joinModifyAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml 파일의 설정내용을 가져온다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성.
		reader.close();
	}

	// 게시글 수정
	public String execute() throws Exception {
		
		//파라미터와 리절트 객체 생성.
		paramClass = new memberVO();
		resultClass = new memberVO();

		// 수정할 항목 설정.
		paramClass.setM_id(getM_id());		
		paramClass.setM_pw(getM_pw());
		paramClass.setM_no(getM_no());
		paramClass.setM_jumin1(getM_jumin1());
		paramClass.setM_jumin2(getM_jumin2());
		paramClass.setM_email(getM_email());
		paramClass.setM_phone(getM_phone());
		paramClass.setM_zipcode(getM_zipcode());
		paramClass.setM_addr1(getM_addr1());
		paramClass.setM_addr2(getM_addr2());

		// 일단 항목만 수정한다.
		sqlMapper.update("join.updateMember", paramClass);

		

		// 수정이 끝나면 view 페이지로 이동.
		resultClass = (memberVO) sqlMapper.queryForObject("join.modifyselectOne", getM_id());
		
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

}

