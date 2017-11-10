<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title><tiles:getAsString name="title" /></title>
</head>
<body>
	<table width="100%" height="100%" cellpadding="0" cellspacing="0"
		border="0">
		
		<tr>			
			<td colspan="2" valign="top" width="70%"><tiles:insertAttribute
					name="body" /></td>
		</tr>
		
	</table>
</body>
</html>
