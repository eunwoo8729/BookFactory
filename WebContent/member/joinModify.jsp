<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<title>회원 정보 수정</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript">
   
    function checkIt() {
        var userinput = eval("document.userinput");
        if(!userinput.m_id.value) {
            alert("ID를 입력하세요");
            return false;
        }
       
        if(!userinput.m_pw.value ) {
            alert("비밀번호를 입력하세요");
            return false;
        }
        if(userinput.m_pw.value != userinput.m_pwr.value)
        {
            alert("비밀번호를 동일하게 입력하세요");
            return false;
        }
      
        if(!userinput.m_name.value) {
            alert("사용자 이름을 입력하세요");
            return false;
        }
        if(!userinput.m_jumin1.value  || !userinput.m_jumin2.value )
        {
            alert("주민등록번호를 입력하세요");
            return false;
        }
    }
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function zipCheck() {
        new daum.Postcode({
            oncomplete: function(data) {
                var fullAddr = '';
                var extraAddr = '';


                if (data.userSelectedType === 'R') {
                    fullAddr = data.roadAddress;

                } else {
                    fullAddr = data.jibunAddress;
                }

                
                if(data.userSelectedType === 'R'){
                   
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                   
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

        
                document.getElementById('m_zipcode').value = data.zonecode; 
                document.getElementById('m_addr1').value = fullAddr;


                document.getElementById('m_addr2').focus();
            }
        }).open();
    }
</script>

<body>

<form method="post" action="joinSuccess.action" name="userinput" onSubmit="return checkIt()">
  <table width="650" border="1" cellspacing="0" cellpadding="3" align="center" >
    <tr>
    <td colspan="2" height="39" align="center">
       <font size="+1" ><b>회원가입</b></font></td>
    </tr>
    <tr>
      <td width="250" ><b>아이디 입력</b></td>
      <td width="400" > </td>
    </tr> 

    <tr>
      <td width="250"> 사용자 ID</td>
      <td width="400">
        <input type="text" name="m_id" size="10" maxlength="12"> 
        &nbsp;&nbsp;<s:property value="resultClass.m_id" />
      </td>
    </tr>
    <tr>
      <td width="250"> 비밀번호</td>
      <td width="400" >
        <input type="password" name="m_pw" size="15" maxlength="12">
        &nbsp;&nbsp;<s:property value="resultClass.m_pw" />
      </td>
    <tr> 
      <td width="250">비밀번호 확인</td>
      <td width="400">
        <input type="password" name="m_pwr" size="15" maxlength="12">
        &nbsp;&nbsp;<s:property value="resultClass.m_pwr" />
      </td>
    </tr>
    <tr>
      <td width="250" ><b>개인정보 입력</b></td>
      <td width="400" > </td>
    </tr> 
    <tr>
      <td width="250">사용자 이름</td>
      <td width="400">
        <input type="text" name="m_name" size="15" maxlength="10">
        &nbsp;&nbsp;<s:property value="resultClass.m_name" />
      </td>
    </tr>
     <tr> 
      <td width="250">주민등록번호</td>
      <td width="400"> 
        <input type="text" name="m_jumin1" size="7" maxlength="6">
        -&nbsp;<input type="text" name="m_jumin2" size="7" maxlength="7">
      </td>
    </tr>
    <tr>
      <td width="250">E-Mail</td>
      <td width="400">
        <input type="text" name="m_email" size="40" maxlength="30">
        &nbsp;&nbsp;<s:property value="resultClass.m_email" />
      </td>
    </tr>
    
    <tr>
      <td width="250">휴대전화 번호</td>
      <td width="400">
        <input type="text" name="m_phone" size="15" maxlength="10">
        &nbsp;&nbsp;<s:property value="resultClass.m_phone" />
      </td>
    </tr>
    <tr>
<tr> 
       <td width="250">우편번호</td>
       <td> <input type="text" id="m_zipcode" name="m_zipcode" size="7">
               <input type="button" value="우편번호찾기" onClick="zipCheck()">
               &nbsp;&nbsp;<s:property value="resultClass.m_zipcode" /></td>
          </tr>
    <tr> 
       <td>주소</td>
       <td><input type="text" id="m_addr1" name="m_addr1" size="70">
       &nbsp;&nbsp;<s:property value="resultClass.m_addr1" /></td>
    </tr>
    <tr> 
       <td>상세주소</td>
       <td><input type="text" id="m_addr2" name="m_addr2" size="70">
       &nbsp;&nbsp;<s:property value="resultClass.m_addr2" /></td>
    </tr>
    <tr>
      <td colspan="2" align="center" >
          <input type="submit" name="confirm" value="수정 완료" >
          <input type="reset" name="reset" value="다시 입력">
          <input type="button" value="취소" onclick="javascript:location.href='main.action'">
      </td>
    </tr>
  </table>
</form>
</body>
</html>