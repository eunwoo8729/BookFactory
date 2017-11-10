package adminMember;

import java.io.Reader;
import java.io.IOException;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class adminMemberDeleteAction extends ActionSupport {

	public static Reader reader; // 파일 스트림을 위한 reader.
	public static SqlMapClient sqlMapper; // SqlMapClient API를 사용하기 위한 sqlMapper
											// 객체.

	private adminMemberVO paramClass; // 파라미터를 저장할 객체
	private adminMemberVO resultClass; // 쿼리 결과 값을 저장할 객체

	private int m_no; // 회원번호


public adminMemberDeleteAction() throws IOException {
	reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml 파일의 설정내용을 가져온다.
	sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);	// sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성.
	reader.close();
}

	public String execute() throws Exception {
		paramClass = new adminMemberVO();
		resultClass = new adminMemberVO();

		resultClass = (adminMemberVO) sqlMapper.queryForObject("admin.selectOne", getM_no());

		paramClass.setM_no(getM_no());

		sqlMapper.delete("admin.deleteBook", paramClass);

		return SUCCESS;
	}

	public adminMemberVO getParamClass() {
		return paramClass;
	}

	public adminMemberVO getResultClass() {
		return resultClass;
	}

	public int getM_no() {
		return m_no;
	}
	
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	
	public void setParamClass(adminMemberVO paramClass) {
		this.paramClass = paramClass;
	}

	public void setResultClass(adminMemberVO resultClass) {
		this.resultClass = resultClass;
	}


}
