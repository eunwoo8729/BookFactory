<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<title>회원가입</title>
<link href="style.css" rel="stylesheet" type="text/css">

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('m_zipcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('m_addr1').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('m_addr2').focus();
            }
        }).open();
    }
</script>

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

    // 아이디 중복 여부를 판단
     function openConfirmid(userinput) {
        // 아이디를 입력했는지 검사
        if (userinput.m_id.value == "") {
            alert("아이디를 입력하세요");
            return false;
        }
        // url과 사용자 입력 id를 조합합니다.
        url = "confirmId.action?m_id=" + userinput.m_id.value ;
       
        // 새로운 윈도우를 엽니다.
        open(url, "confirm",
        "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=700, height=500");
    }
	
     function openConfirmEmail(userinput) {
         // email을 입력했는지 검사
         if (userinput.m_email.value == "") {
             alert("이메일를 입력하세요");
             return false;
         }
         // url과 사용자 입력 email를 조합합니다.
         url = "confirmEmail.action?m_email=" + userinput.m_email.value ;
        
         // 새로운 윈도우를 엽니다.
         open(url, "confirm",
         "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=700, height=500");
     }
     
     function ic(name){
    	 document.getElementById('ic').value = name;
     }
     
     function ec(email){
    	 document.getElementById('ec').value = email;
     }
     
     function openC() {
         if (userinput.ic.value == "a") {
             alert("아이디 중복확인을 해주세요");
             return false;
         }
         if (userinput.ec.value == "a") {
             alert("이메일 중복확인을 하세요");
             return false;
         }
     }
     
     function checkid(name){
             document.getElementById('m_id').value = name;
         }
    	 
     
     
     function checkemail(email){
    	 document.getElementById('m_email').value = email;
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
        <input type="text" id="m_id" name="m_id" size="10" maxlength="12">
        <input type="hidden" id="ic" name="ic" value="a">
        <input type="button" name="confirm_id" value="중복확인" OnClick="openConfirmid(this.form)">
      </td>
    </tr>
    <tr>
      <td width="250"> 비밀번호</td>
      <td width="400" >
        <input type="password" id="m_pw" name="m_pw" size="15" maxlength="12">
      </td>
    <tr> 
      <td width="250">비밀번호 확인</td>
      <td width="400">
        <input type="password" name="m_pwr" size="15" maxlength="12">
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
      </td>
    </tr>
     <tr> 
      <td width="250">주민등록번호</td>
      <td width="400"> 
        <input type="text" id="m_jumin1" name="m_jumin1" size="6" maxlength="6">
        -&nbsp;<input type="text" id="m_jumin2" name="m_jumin2" size="7" maxlength="7">
      </td>
    </tr>
    <tr>
      <td width="250">E-Mail</td>
      <td width="400">
        <input type="text" name="m_email" id="m_email" size="40" maxlength="30">
        <input type="hidden" id="ec" name="ec" value="a">
        <input type="button" name="confirm_email" value="이메일 확인" OnClick="openConfirmEmail(this.form)">
      </td>
    </tr>
   
    <tr>
      <td width="250">휴대전화 번호</td>
      <td width="400">
        <input type="text" name="m_phone" size="15" maxlength="11">
      </td>
    </tr>
  
<tr> 
       <td width="250">우편번호</td>
       <td>
       <input type="text" id="m_zipcode" name="m_zipcode" placeholder="우편번호">
		<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">  
       </td>
</tr>
         
    <tr> 
       <td>주소</td>
       <td><input type="text" id="m_addr1" name="m_addr1" placeholder="주소" size="70"></td>
    </tr>
    <tr> 
       <td>상세주소</td>
       <td><input type="text" id="m_addr2" name="m_addr2" placeholder="상세주소" size="70"></td>
    </tr>
    <tr>
      <td colspan="2" align="center" >
          <input type="submit" name="confirm" value="등   록" OnClick="return openC()">
          <input type="reset" name="reset" value="다시입력">
          <input type="button" value="가입안함" onclick="javascript:location.href='mainAction.action'">
      </td>
    </tr>
  </table>
</form>
</body>
</html>