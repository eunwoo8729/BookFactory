<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>도서목록</title>
</head>
<body>

   <table border="0" cellspacing="0" cellpadding="2">
      <tr>
         <td align="center"><h2></h2></td>
      </tr>
      <tr>
         <td height="10"></td>
      </tr>
   </table>
   <s:iterator value="list" status="stat">
      <s:if test="${session_admin_tp == 1 }">
         <s:url id="viewURL" action="adminBookView">
            <s:param name="b_no">
               <s:property value="b_no" />
            </s:param>
         <s:param name="currentPage">
               <s:property value="currentPage" />
            </s:param>
         </s:url>
         </s:if>
         <s:else>
          <s:url id="viewURL" action="bookView">
            <s:param name="b_no">
               <s:property value="b_no" />
            </s:param>
         <s:param name="currentPage">
               <s:property value="currentPage" />
            </s:param>
         </s:url>
</s:else>
   <table border="0" cellspacing="0">
      <tr>
         <td rowspan="6" align="left" valign="top"><s:property value="b_no" />
         </td>
      </tr>
      <tr>
        <td rowspan="6" width="160" align="center"><img src="./style/image/book/${ file_savname }" alt="이미지가 없습니다" width="210" height="297" /></td>
      </tr>
      <tr>
         <td colspan="3" width="450"><b><s:a href="%{viewURL}"><s:property value="b_name" /></s:a></b></td>
      </tr>
      <tr>
         <td colspan="3">▶ 저자 : <s:property value="b_writer" /></td>
      </tr>
      <tr>
         <td width="400">▶ 출판사 : <s:property value="b_pub" /></td>
         <td colspan="2" width="350">발행년 : <s:property value="b_pubdate" /></td>
      </tr>
     <tr>
         <td width="500">▶ 자료상태 :
         <s:hidden name="rent_id" />
         <s:if test="${ rent_id == null }">
                대출가능
         </s:if>
         <s:else>
                대출중
         </s:else>
		</td>
         <td colspan="2" width="300">반납예정일 : <s:property value="l_indate" /></td>
      </tr>
   </table>
<table>
      <tr>
         <td height="10" colspan="6"></td>
      </tr>
</table>
      </s:iterator>

      <s:if test="list.size() <= 0">

         <tr align="center">
            <td colspan="5">등록된 게시물이 없습니다.</td>
         </tr>
         <tr>
            <td height="1" colspan="5"></td>
         </tr>

      </s:if>
   
      <tr align="center">
      <td colspan="5"><s:property value="pagingHtml"  escape="false"></s:property></td></tr>
</body>
</html>