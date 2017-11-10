package adminBook;

import java.io.Reader;
import java.io.IOException;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class adminBookDeleteAction extends ActionSupport {

	public static Reader reader; // 파일 스트림을 위한 reader.
	public static SqlMapClient sqlMapper; // SqlMapClient API를 사용하기 위한 sqlMapper
											// 객체.

	private adminBookVO paramClass; // 파라미터를 저장할 객체
	private adminBookVO resultClass; // 쿼리 결과 값을 저장할 객체

	private int b_no; // 글번호

public adminBookDeleteAction() throws IOException {
	reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml 파일의 설정내용을 가져온다.
	sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);	// sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성.
	reader.close();
}

	public String execute() throws Exception {
		paramClass = new adminBookVO();
		resultClass = new adminBookVO();

		resultClass = (adminBookVO) sqlMapper.queryForObject("admin.selectOne", getB_no());

		paramClass.setB_no(getB_no());

		sqlMapper.delete("admin.deleteBook", paramClass);

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

	public void setParamClass(adminBookVO paramClass) {
		this.paramClass = paramClass;
	}

	public void setResultClass(adminBookVO resultClass) {
		this.resultClass = resultClass;
	}

	public void setB_no(int b_no) {
		this.b_no = b_no;
	}

}
