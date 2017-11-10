 <%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>CharlieBookTITLE</title>
	
	<link href="style/custom/normalize.css" rel="stylesheet">
	<link href="style/custom/style.css" rel="stylesheet">

</head>
<body>
<table cellpadding="0" cellspacing="0">
		<tr>
			<td colspan="2" height="30"></td>
		</tr>
</table>
	<section class="loginform cf">
		<form name="login" action="index_submit" method="get" accept-charset="utf-8">
			<ul>
				<li>
					<label for="ID">ID</label><br>
					
					<input type="ID" name="ID" placeholder="아이디를 입력하세요">
				</li>
				<br>
				<li>
					<label for="password">Password</label>
					<br>
					<input type="password" name="password" placeholder="비밀번호"></li>
				<li>
					<input type="submit" value="Login">&nbsp;&nbsp;
					<input type="button" value="Sign" onclick="javascript:location.href='joinAgree.action'">
				</li>
			</ul>
		</form>
	</section>
      
    
 
 <%--  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="js/bootstrap.min.js"></script> --%>
</body>
</html>