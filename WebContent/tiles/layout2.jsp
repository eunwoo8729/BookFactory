<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style type="text/css">

    </style>
<title><tiles:getAsString name="title" /></title>
</head>
<body>
	<table width=100%  cellpadding="0" cellspacing="0" border="1">
		<tr>
			<td height="60">
				<tiles:insertAttribute name="header" />
			</td>
		</tr>
		<tr>
			<td>
				<tiles:insertAttribute name="body" />
			</td>	

		<tr>
			<td>
				<tiles:insertAttribute name="footer" />
			</td>
		</tr>
	</table>
</body>
</html>
