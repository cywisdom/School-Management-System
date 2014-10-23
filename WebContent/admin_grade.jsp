<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="admin_master.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Grade Reports</title>
</head>
<body>
<%@ page import="org.sms.util.util"%>
	<%@ page import="java.sql.*"%>
	<%@ page import="java.util.*" %>
	<%!util utilobj = new util();
	Connection conn = utilobj.connect();%>
<div style="left: 13%; top: 100px; position: absolute;">
		<font color="#006699" face="Californian FB" size="+4">Manage Exam</font>
	</div>
	
	
	<div style=" top: 100px; position: absolute; height:350px; left: 13%; width: 750px;"		class="shadow-div">
	<form method="post" action="dao/ManageExam">
	<table style="position: absolute;">
	<tr><td colspan="4"><h3><font color="#006699">Create new exam:</font></h3></td></tr>
	<tr><td>Select exam type:</td><td>
	
				<select name="examtypeid">
				
							<%
								Statement stmt = conn.createStatement();
								String query = "select exam_type_id,name from exam_type";
								ResultSet rs = stmt.executeQuery(query);
								while (rs.next()) {
									String str = rs.getString("name");
									String exam_tyep_id = rs.getString("exam_type_id");
							%>
							<option value="<%=exam_tyep_id%>"><%=str%></option>
							<%
								}
							%>				
				</select>
	</td></tr>
	<tr><td>Select Standard:</td><td>
	<select id="standards" name="grade_Id">

							<%
								 stmt = conn.createStatement();
								 query = "select * from grade_mst";
								 rs = stmt.executeQuery(query);
								while (rs.next()) {
									String str = rs.getString("name");
									String gradeid = rs.getString("grade_Id");
							%>
							<option value="<%=gradeid%>"><%=str%></option>
							<%
								}
							%>

					</select>
	</td></tr>
	<tr><td>Exam Name:</td><td><input type="text" name="examname"></td></tr>
	<tr><td>Date:</td><td><input type="text" name="examdate"></td></tr>
	<tr><td>Description:</td><td><textarea cols="20" rows="5" name="examdesc"></textarea></td></tr>
	<tr><td colspan="4" align="center"> <input type="submit" name="exam" value="submit"> </td> </tr>
	</table>
	</form>
	<form action="dao/ManageExam" method="post">
	<table style="position: absolute; right: 10%; ">
	<tr><td colspan="2"><h3><font color="#006699">Create exam type:</font></h3></td></tr>
	<tr><td>Exam type name:</td><td><input type="text" name="examtypenME"></td></tr>
	<tr><td>Description:</td><td><textarea rows="5" name="examtypedesc" cols="20"></textarea></td></tr>
	<tr><td colspan="2" align="center"><input type="submit" name="examtype" value="Submit"></td></tr>
	</table>	
		</form>
</div>
</body>
</html>