<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="admin_master.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Schedule</title>
<script type="text/javascript">
var xmlHttp
var xmlHttp
function showState(str) {
	if (typeof XMLHttpRequest != "undefined") {
		xmlHttp = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	if (xmlHttp == null) {
		alert("Browser does not support XMLHTTP Request")
		return;
	}
	var url = "sectionList.jsp";
	url += "?count=" + str;
	xmlHttp.onreadystatechange = stateChange;
	xmlHttp.open("GET", url, true);
	xmlHttp.send(null);
}

function stateChange() {
	if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {
		document.getElementById("sections").innerHTML = xmlHttp.responseText
	}
}
</script>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%@ page import="org.sms.util.*"%>
	<%@ page import="java.util.*"%>
	<%!util utilobj = new util();
	ResultSet rs;
	Statement stmt;%>
	<div style="left: 13%; top: 100px; position: absolute;">
		<font color="#006699" face="Californian FB" size="+4">Schedule</font>
	</div>
	<%
		Connection conn = utilobj.connect();
		stmt = conn.createStatement();
	%>

	<a href="admin_manage_schedule.jsp"
		style="position: absolute; left: 20.5%; top: 175px;"><font
		color="#4C0000" size="4">Manage Schedule</font></a>
	<div style="top: 100px; width:550px; height:250px; position: absolute; left: 13%;"
		class="shadow-div">
		
		<form method="post" action="controllers/adminSchedule">
		
		<div style="position: absolute;">
		<h3><font color="#006699">Classroom Schedule</font></h3>
			<table>
				<tr>
					<td>Select Standard:</td>
					<td><select name='standard' style="width: 150px;" onchange="showState(this.value)">
							<option value="none">Select</option>

							<%
								rs = stmt.executeQuery("Select grade_Id,name from grade_mst");
								while (rs.next()) {
							%>
							<option value="<%=rs.getString("grade_Id")%>"><%=rs.getString("name")%></option>
							<%
								}
							%>
					</select> </td>
				</tr>
				<tr><td height="10"></td></tr>
				<tr>
					<td>Select Section:</td>
					<td><div id='sections'>
							<select name='sections' style="width: 150px;">
								<option value='-1'></option>
							</select>
						</div>
					</td>
				</tr>
				<tr><td height="10"></td></tr>
				<tr>
				<td colspan="2" align="center"><input value="Classroom Schedule" name="classSchedule" type="submit"></td>
				</tr>
			</table>
		</div>
		<div style="position: absolute; right: 5%;">
		<h3><font color="#006699">Teacher Schedule</font></h3>
		<table>
				<tr>
					<td>Select Teacher:</td>
					<td><select name="teacher_Id">
							<%
								rs = stmt.executeQuery("Select fname,lname,teacher_Id from teacher_mst");
								while (rs.next()) {
							%>
							<option value="<%=rs.getString("teacher_Id")%>"><%=rs.getString("fname")%> <%=rs.getString("lname")%></option>
							<%
								}
							%>
					</select>
					</td>
				</tr>
				<tr><td height="10"></td></tr>
				<tr><td colspan="2" align="center"><input type="submit" value="Teacher Schedule" name="teacherSchedule"></td></tr>
			</table>
		</div>
		
		</form>
	</div>	
</body>
</html>