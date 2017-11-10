package main;

/*import java.io.IOException;   
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;*/
import com.opensymphony.xwork2.ActionSupport;

/*import board.BoardVO;
import board.PagingAction;
import book.BookVO;*/

public class MainAction extends ActionSupport {

	/*public static Reader reader;	//파일 스트림을 위한 reader.
	public static SqlMapClient sqlMapper;	//SqlMapClient API를 사용하기 위한 sqlMapper 객체.
	
	private List<BoardVO> list = new ArrayList<BoardVO>();
	private List<BookVO> list2 = new ArrayList<BookVO>();
	
	//페이징 액션	
	private int currentPage = 1;	//현재 페이지
	private int totalCount; 		// 총 게시물의 수
	private int blockCount = 5;	// 한 페이지의  게시물의 수
	private int blockCount2 = 3;
	private int blockPage = 5; 	// 한 화면에 보여줄 페이지 수
	private String pagingHtml; 	//페이징을 구현한 HTML
	private PagingAction page; 	// 페이징 클래스
	private int searchNum;	
	private String searchKeyword;
	private int num = 0; //???
	
	
	private Map session;
	public MainAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml 파일의 설정내용을 가져온다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);	// sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성.
		reader.close();
	}
	*/
	//통합게시판
	public String execute() throws Exception {

		/*list = sqlMapper.queryForList("board.selectboardTypeNotice"); //모든 글을 가져와 리스트에 넣는다.
		totalCount = list.size(); // 전체 글 갯수를 구한다.
		// pagingAction 객체 생성.
		page = new PagingAction(currentPage, totalCount, blockCount, blockPage, searchNum, searchKeyword, num); 
		pagingHtml = page.getPagingHtml().toString(); // 페이지 HTML 생성.

		// 현재 페이지에서 보여줄 마지막 글의 번호 설정.
		int lastCount = totalCount;

		// 현재 페이지의 마지막 글의 번호가 전체의 마지막 글 번호보다 작으면 
		//lastCount를 +1 번호로 설정.
		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		// 전체 리스트에서 현재 페이지만큼의 리스트만 가져온다.
		list = list.subList(page.getStartCount(), lastCount);
		
		list2 = sqlMapper.queryForList("book.bookRank"); //모든 글을 가져와 리스트에 넣는다.
		totalCount = list2.size(); // 전체 글 갯수를 구한다.
		// pagingAction 객체 생성.
		page = new PagingAction(currentPage, totalCount, blockCount2, blockPage, searchNum, searchKeyword, num); 
		pagingHtml = page.getPagingHtml().toString(); // 페이지 HTML 생성.

		// 현재 페이지에서 보여줄 마지막 글의 번호 설정.
		int lastCount2 = totalCount;

		// 현재 페이지의 마지막 글의 번호가 전체의 마지막 글 번호보다 작으면 
		//lastCount를 +1 번호로 설정.
		if (page.getEndCount() < totalCount)
			lastCount2 = page.getEndCount() + 1;

		// 전체 리스트에서 현재 페이지만큼의 리스트만 가져온다.
		list2 = list2.subList(page.getStartCount(), lastCount2);*/
		return SUCCESS;
	}

	/*public List<BoardVO> getList() {
		return list;
	}

	public void setList(List<BoardVO> list) {
		this.list = list;
	}

	public List<BookVO> getList2() {
		return list2;
	}

	public void setList2(List<BookVO> list2) {
		this.list2 = list2;
	}*/
	
}
