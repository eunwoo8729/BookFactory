<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<SCRIPT type="text/javascript">
	function idCheck() {
		var form = document.comWrite;
		if (!form.member_id.value) {
			alert("로그인 해.");
			return false;
		}
	}

	function reserveCheck() {
		if (document.bookReserve.reserve_id.value != "") {
			alert("예약불가.");
			return false;
		}
			alert("123");
			return true;
	}
	function myBookPage() {
		if (document.getElementById("ID").value == "") {
			alert("아이디를 입력하세요");
			loginForm.member_id.focus();
			return true;
		}
	}
	function btnClick() {
		alert("성공");
	}
</script>

<link rel="stylesheet" type="text/css" href="style.css" media="all" />

<%-- <style type="text/css">
   .list_table thead th {  text-align: center; border-top: 1px solid #e5e5e5; border-bottom: 1px solid #e5e5e5; padding: 8px 0; }
   .list_table tbody td {  text-align: center; border-left: 1px solid #e5e5e5; border-right: 1px solid #e5e5e5; border-bottom: 1px solid #e5e5e5; padding: 5px 0; }
</style> --%>

</head>



<body>


	<table border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td align="left"><h2>도서 상세보기</h2></td>
			<td align="right" />
			<td align="right"></td>
			<td align="right"><s:if test="${ session_admin_tp == 1 }">
					<input name="list" type="button" value="수정" class="inputb"
						onClick="javascript:location.href='adminBookModifyForm.action?b_no='+
         '<s:property value="resultClass.b_no" />'" />

					<input name="list" type="button" value="삭제" class="inputb"
						onClick="javascript:location.href='adminBookDelete.action?b_no='+
         '<s:property value="resultClass.b_no" />'" />
				</s:if> 
				<input name="list" type="button" value="도서목록" class="inputb"
				onClick="javascript:location.href='bookSearch.action?currentPage='+
         '<s:property value="currentPage" />'" />
			</td>
		</tr>
	</table>

	<table border="0" cellspacing="1">
		<tr>
			<td rowspan="5" align="center"><img
				src="./style/image/book/${ resultClass.file_savname }" width="297"
				height="420" alt="이미지가 없습니다" /></td>
		</tr>
		<tr>
			<td>▶ 도서제목 : <s:property value="resultClass.b_name" /></td>
		</tr>
		<tr>
			<td>▶ 저자 : <s:property value="resultClass.b_writer" /></td>
		</tr>
		<tr>
			<td>▶ 출판사 : <s:property value="resultClass.b_pub" /></td>
		</tr>
		<tr>
			<td>▶ 발행년 : <s:property value="resultClass.b_pubdate" /></td>
		</tr>
	</table>

	<table border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td align="left"><h3>대출/예약정보</h3></td>
		</tr>
	</table>



	<table border="0" cellspacing="1">
		<tr>
			<td align="center">자료상태</td>
			<td align="center">반납예정일</td>
			<td align="center">예약</td>
			<tr>
				<form action="bookRentAction.action">
					<s:hidden name="b_no" value="${b_no}" />
					<s:if test="${resultClass.rent_id == null}">
						<td align="center"><input type="submit" value="대출 가능"></input></td>
					</s:if>
					<s:else>
						<td align="center"><input type="submit" value="대출 불가"
							disabled></input></td>
					</s:else>
				</form>
				<td align="center"><s:date name="resultClass.enddate"
						format="yyyy-MM-dd" /></td>

				<form id="bookReserve" name="bookReserve"
					action="bookReserveAction.action" onsubmit="return reserveCheck();">
					<s:hidden name="b_no" value="${b_no}" />
					<s:if
						test="${ resultClass.rent_id == null || resultClass.reserve_id != null}">

						<td align="center"><input type="submit" value="예약 불가"
							disabled></input></td>
					</s:if>

					<s:else>
						<td align="center"><input type="submit" value="예약 가능"></input></td>
					</s:else>
				</form>
			</tr>
	</table>

	<div class="content">
		<pre>
대출 기간은 대출시작일 기준 14일 입니다. 예약 신청은 대출자가 있을 시에만 가능하며 
예약자가 없을시 1주 단위로 대출기간 연장 가능합니다.
</pre>
	</div>

	<table border="0" cellspacing="0">
		<tr>
			<td align="center">
				<form action="myPageBookInclude.action" onsubmit="javascript:alert('확인');">
					<s:hidden name="b_no" value="${b_no}" />
					<s:hidden name="b_name" value="${resultClass.b_name}" />
					<input type="submit" value="내서재 담기"></input>
				</form>
			</td>
			<td align="center"><form action="myPageBookList.action"><input type="submit" value="내서재 목록"></input></form></td>
		</tr>
	</table>

	<div class="content">
		<table border="0" cellspacing="0" cellpadding="2">
			<tr>
				<td align="left"><h3>도서정보</h3></td>
			</tr>
		</table>

		<table border="0" cellspacing="1">
			<tr>
				<td width="100" height="50">▶ 도서 소개 :</td>
				<td><s:property value="resultClass.b_intro" /></td>
			</tr>
			<tr>
				<td width="100" height="50">▶ 도서 목차 :</td>
				<td><s:property value="resultClass.b_list" /></td>
			</tr>
		</table>
	</div>

	<table border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td align="left"><h3>후기</h3></td>
		</tr>
	</table>
	
	
<%-- 
댓글
	<div class="boardcss_list_table">
		<table class="list_table" style="table-layout: fixed;">
			<thead>
				<tr>
					<th>작성자 작성일</th>
					<th colspan="2">내용</th>
				</tr>
			</thead>
			<s:iterator value="commentlist" status="stat">
				<tbody>
					<tr>
						<td width="150" height="5" align="center"><b>${member_id}</b>&nbsp&nbsp&nbsp&nbsp
							<s:property value="regdate" /></td>
						<td width="630" rowspan="2" style="word-break: break-all;"><s:property
								value="content" /></td>
						<td width="20" rowspan="2"><input name="list" type="button"
							value="삭제" class="inputb"
							onClick="javascript:location.href='commentDelete.action?comment_no='+
         '<s:property value="comment_no" />&book_no=<s:property value="book_no" />'"></td>
					</tr>

					<tr>
						<td><s:if test=" ${star == '5' }">
               ★★★★★
            </s:if> <s:if test=" ${star == '4' }">
               ★★★★☆
            </s:if> <s:if test=" ${star == '3' }">
               ★★★☆☆
            </s:if> <s:if test=" ${star == '2' }">
               ★★☆☆☆
            </s:if> <s:if test=" ${star == '1' }">
               ★☆☆☆☆
            </s:if></td>
					</tr>


				</tbody>
			</s:iterator>
		</table>

		<form name="comWrite" action="commentWrite.action" method="post">
			<table class="list_table">
				<tr>
					<td rowspan="2"><s:hidden name="member_id"
							value="${session_id}" /> ${session_id}<br> <select
							name="star">
								<option id="star5" value="5">★★★★★</option>
								<option id="star4" value="4">★★★★☆</option>
								<option id="star3" value="3">★★★☆☆</option>
								<option id="star2" value="2">★★☆☆☆</option>
								<option id="star1" value="1">★☆☆☆☆</option>
						</select></td>
					<td><s:hidden name="comment_no" value="%{resultClass.book_no}" />
						<s:hidden name="book_no" value="%{resultClass.book_no}" /> <s:textarea
							name="content" cols="80" rows="3" /></td>
				</tr>
				<tr>
					<td colspan="3" align="right"><input name="submit"
						type="submit" value="작성완료" onclick="return idCheck(); " /></td>
				</tr>
			</table>
	</div>
	</form> --%>
</body>
</html>