<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>글작성</title>
</head>
<body>
   <table width="600" border="0" cellspacing="0" cellpadding="2">
      <tr>
      </tr>
   </table>


   <s:if test="resultClass == NULL">
      <form action="adminBookWriteAction.action" method="post" enctype="multipart/form-data">
   </s:if>

   <s:else>
      <form action="adminBookModifyAction.action" method="post" enctype="multipart/form-data">
         <s:hidden name="b_no" value="%{resultClass.b_no}" />
   </s:else>
   
      <table width="800" border="0" cellspacing="1" cellpadding="1">
         <tr>
            <td align="right" colspan="2"><font color="#FF0000">*</font>는 필수 입력사항입니다.</td>
         </tr>

         <tr bgcolor="#777777">
            <td height="1" colspan="2"></td>
         </tr>

         <tr>
            <td width="100" bgcolor="#F4F4F4"><font color="#FF0000">*</font> 도서  제목</td>
            <td width="500" bgcolor="#FFFFFF">
            <s:textfield name="b_name" id="b_name" theme="simple" value="%{resultClass.b_name}" cssStyle="width:370px" maxlength="30"/>
         </tr>

         <tr>
            <td bgcolor="#F4F4F4"><font color="#FF0000">*</font> 저자</td>
            <td width="500" bgcolor="#FFFFFF">
            <s:textfield name="b_writer" id="b_writer" theme="simple" value="%{resultClass.b_writer}" cssStyle="width:370px" maxlength="20"/>
<!--             <td bgcolor="#FFFFFF"><input type="text" name="book_writer" size="15" maxlength="10"/></td> -->
         </tr>
         
         <tr>
            <td bgcolor="#F4F4F4"><font color="#FF0000">*</font> 출판사</td>
            <td width="500" bgcolor="#FFFFFF">
            <s:textfield name="b_pub" id="b_pub" theme="simple" value="%{resultClass.b_pub}" cssStyle="width:370px" maxlength="50"/>
          <!-- <td><input type="text" name="book_publisher" size="15" maxlength="10"/></td> -->
         </tr>

         <tr>
            <td bgcolor="#F4F4F4"><font color="#FF0000">*</font> 출판연도</td>
            <td width="500" bgcolor="#FFFFFF">
            <s:textfield name="b_pubdate" theme="simple" value="%{resultClass.b_pubdate}" cssStyle="width:370px" maxlength="15"/>
            <!-- <td bgcolor="#FFFFFF"><input type="text" name="book_publish_dt" size="15" maxlength="10"/></td> -->
         </tr>

         <tr>
            <td bgcolor="#F4F4F4"><font color="#FF0000"></font> 카테고리</td>
            <td width="500" bgcolor="#FFFFFF">
            <s:textfield name="b_category" theme="simple" value="%{resultClass.b_category}" cssStyle="width:370px" maxlength="20"/>
            <!-- <td bgcolor="#FFFFFF"><input type="text" name="book_image" size="15" maxlength="10"/></td> -->
         </tr>
         
         <tr>
            <td bgcolor="#F4F4F4"><font color="#FF0000"></font> 재고수량</td>
            <td width="500" bgcolor="#FFFFFF">
            <s:textfield name="b_count" theme="simple" value="%{resultClass.b_count}" cssStyle="width:370px" maxlength="20"/>
            <!-- <td bgcolor="#FFFFFF"><input type="text" name="book_image" size="15" maxlength="10"/></td> -->
         </tr>
         
         <tr>
            <td bgcolor="#F4F4F4"><font color="#FF0000"></font> 도서 소개</td>
            <td width="500" bgcolor="#FFFFFF">
            <s:textarea name="b_intro" theme="simple" value="%{resultClass.b_intro}" cssStyle="width:370px" cols="15" rows="10"/>
            <!-- <td bgcolor="#FFFFFF"><input type="text" name="book_image" size="15" maxlength="10"/></td> -->
         </tr>

         <tr>
            <td bgcolor="#F4F4F4"><font color="#FF0000"></font> 저자 소개</td>
            <td width="500" bgcolor="#FFFFFF">
            <s:textarea name="b_writerintro" theme="simple" value="%{resultClass.b_writerintro}" cssStyle="width:370px" cols="15" rows="10"/>
            <!-- <td bgcolor="#FFFFFF"><input type="text" name="book_image" size="15" maxlength="10"/></td> -->
         </tr>
         
         <tr>
            <td bgcolor="#F4F4F4"><font color="#FF0000"></font> 목차</td>
            <td width="500" bgcolor="#FFFFFF">
            <s:textarea name="b_list" theme="simple" value="%{resultClass.b_list}" cssStyle="width:370px" cols="15" rows="10"/>
            <!-- <td bgcolor="#FFFFFF"><input type="text" name="book_image" size="15" maxlength="10"/></td> -->
         </tr>
                  
         <tr>
            <td bgcolor="#F4F4F4"><font color="#FF0000">*</font> 도서 이미지</td>
            <td width="500" bgcolor="#FFFFFF">
            <s:file name="upload" theme="simple"/>
       
            <s:if test="resultClass.b_img != NULL">
			&nbsp; * <s:property value="resultClass.b_img" /> 파일이 등록되어 있습니다. 다시 업로드하면 기존의 파일은 삭제됩니다.
			</s:if>
			
            <!-- <td bgcolor="#FFFFFF"><input type="text" name="book_image" size="15" maxlength="10"/></td> -->
         </tr>
      
         <tr>
         <td align="right" colspan="2"><input name="submit"
               type="submit" value="작성완료" class="inputb"/></td>
         </tr>
      </table>
   </form>

</body>
</html>