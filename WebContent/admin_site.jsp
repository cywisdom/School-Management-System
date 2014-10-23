<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="admin_master.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage site</title>
</head>
<body>


<%@ page import="org.sms.util.util"%>
	<%@ page import="java.sql.*"%>
	<%!util utilobj = new util();
	Connection conn = utilobj.connect();%>
	<div style="left: 13%; top: 100px; position: absolute;">
		<font color="#006699" face="Californian FB" size="+4">Manage Users</font>
	</div>

<div style="width: 750px; top: 100px; height: 250px; position: absolute; left: 13%;"
		class="shadow-div">
		<form action="dao/ManageSite" method="post">
		<table style="position: absolute;">
		<tr> <td colspan="2"><h3><font color="#006699">News and Updates:</font></h3></td></tr>
		<tr> <td>Enter news:</td><td>
		<textarea rows="10" name="news" cols="20"></textarea>
		</td> 
		<td><input type="submit" value="Add news"></td>
		</tr>
		
		</table>
		</form>
		</div>

</body>
</html>