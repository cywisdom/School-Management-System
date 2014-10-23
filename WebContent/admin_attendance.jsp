<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="admin_master.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Attendance</title>

</head>
<body>

	<%@ page import="org.sms.util.util"%>
	<%@ page import="java.sql.*"%>
	<%@ page import="java.util.*;" %>
	<%!util utilobj = new util();
		
	Connection conn = utilobj.connect();%>
	<%
		String admin_Id = (String) session.getAttribute("user_Id");
	 
	%>
	
	
	
	<div style="left: 13%; top: 100px; position: absolute;">
		<font color="#006699" face="Californian FB" size="+4">Attendance</font>
	</div>
	<form method="post" action="Controllers/AdminAttendance">
<input type="submit" value="Submit" id="fillattendance" name="fillattendance" style="visibility: hidden;" />
<input type="submit" value="Submit" id="viewattendance" name="viewattendance" style="visibility: hidden;" />
	<div style="width: 480px; top: 100px; position: absolute; left: 13%;"
		class="shadow-div">

		<table >

			<tr>
				<td align="right">Standard:</td>
				<td><select id="standard" onchange="test()"  name="standard">

						<%
							Statement stmt = conn.createStatement();
							String query = "select grade_mst.name from grade_mst INNER JOIN classroom_mst ON grade_mst.grade_Id=classroom_mst.grade_Id  group by grade_mst.grade_Id;";
							ResultSet rs = stmt.executeQuery(query);
							while (rs.next()) {
								String str = rs.getString("name");
						%>
						<option value="<%=str%>"><%=str%></option>
						<%
							}
						%>

				</select></td>
				
				
				<td align="right" width="100px">Select Section:</td>
					
				<td><select id="section" name="section">
					<option value="a">A</option>				
    				<option value="b">B</option>
				</select></td></tr>
				
				<tr>
				<td align="right">Course:</td><td>
				<select id="course" name="course">
					<option value="maths">Maths</option>				
    				<option value="english">English</option>
    				<option value="social studies">Social Studies</option>
				</select>
				</td>
				<td align="right">Date:</td><td><input type="text" name="date"></td>
				
				</tr>
				<tr>
				<td colspan="2" align="center">
				
				<a href="javascript:void(0)"
								onclick="document.getElementById('fillattendance').click()"
								class="button cyan">Fill Attendance</a> 
				</td>
				<td  colspan="2"  align="center">
				
				<a href="javascript:void(0)"
								onclick="document.getElementById('viewattendance').click()"
								class="button cyan">View Attendance</a> 
				</td>
			</tr>
		</table>

</form>
	</div>

</body>
</html>