package member;

import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.File;
import java.io.Reader;
import java.io.IOException;

	public class joinDeleteAction extends ActionSupport {
		public static Reader reader;
		public static SqlMapClient sqlMapper;

		private memberVO paramClass; //파라미터를 저장할 객체
		private memberVO resultClass; //쿼리 결과 값을 저장할 객체

			
		private String m_id;
		
		
		// 생성자
		public joinDeleteAction() throws IOException {
			
			reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml 파일의 설정내용을 가져온다.
			sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성.
			reader.close();
		}

		// 게시글 글 삭제
		public String execute() throws Exception {
			
			//파라미터와 리절트 객체 생성.
			paramClass = new memberVO();
			resultClass = new memberVO();
			
			// 해당 번호의 글을 가져온다.
			resultClass = (memberVO) sqlMapper.queryForObject("selectMemberOne", getM_id());


			paramClass.setM_id(getM_id());
					
			// 삭제 쿼리 수행.
			sqlMapper.update("deleteJoin", paramClass);

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

		public String getM_id() {
			return m_id;
		}

		public void setM_id(String m_id) {
			this.m_id = m_id;
		}

	}
		