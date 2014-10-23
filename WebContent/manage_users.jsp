<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="admin_master.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Users</title>
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
		
		
		<form action="dao/ManageUsers" method="post">
		<table style="position: absolute;">
		<tr> <td colspan="2"><h3><font color="#006699">Create User:</font></h3></td></tr>
		<tr><td>Select user role:</td> <td> 
		<select id="role" name="role">
		<%
								Statement stmt = conn.createStatement();
								String query = "select role from user_mst group by role";
								ResultSet rs = stmt.executeQuery(query);
								while (rs.next()) {
									String str = rs.getString("role");
							%>
							<option value="<%=str%>"><%=str%></option>
							<%
								}
							%>
		</select>
		
		
		 </td></tr>
		<tr><td>Username:</td> <td> <input type="text" name="uname"> </td></tr>
		<tr><td>Password:</td> <td> <input type="password" name="pass"> </td></tr>
		<tr><td>Confirm Password:</td> <td> <input type="password" name="cpass"> </td></tr>
		<tr><td colspan="2" align="center"> <input type="submit" value="Create user"></td></tr>
		</table>		
				
		</form>
		
		<table style="position: absolute; right:10%;">
		<tr> <td colspan="2"><h3><font color="#006699">Deactivate User:</font></h3></td></tr>
		<tr><td>Select user role:</td> <td> 
		<select id="rmvrole" name="rmvrole">
		<%
								 stmt = conn.createStatement();
								 query = "select role from user_mst group by role";
								 rs = stmt.executeQuery(query);
								while (rs.next()) {
									String str = rs.getString("role");
							%>
							<option value="<%=str%>"><%=str%></option>
							<%
								}
							%>
		</select>
		
		 </td></tr>
		<tr><td>Username:</td> <td> <input type="text" name="uname"> </td></tr>
		<tr><td colspan="2" align="center"> <input type="submit" value="Deactivate user"></td></tr>		
		</table>
				
		
		</div>
</body>

</html>