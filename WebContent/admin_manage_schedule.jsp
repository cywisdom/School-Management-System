<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="admin_master.jsp" %>
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
	var url = "courseListforsechule.jsp";
	url += "?count=" + str;
	xmlHttp.onreadystatechange = stateChange;
	xmlHttp.open("GET", url, true);
	xmlHttp.send(null);
}

function stateChange() {
	if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {
		document.getElementById("courses").innerHTML = xmlHttp.responseText
	}
}

</script>
</head>
<body>
<%@ page import="org.sms.util.util"%>
	<%@ page import="java.sql.*"%>
	<%@ page import="java.util.*"%>
	<%!util utilobj = new util();
	String grade;
	List<String> courses = new ArrayList<String>();
	Connection conn = utilobj.connect();%>
	<div style="left: 13%; top: 100px; position: absolute;">
		<font color="#006699" face="Californian FB" size="+4">Manage
			Schedule</font>
	</div>

	<a href="admin_schedule.jsp"
		style="position: absolute; left: 24.5%; top: 175px;"><font
		color="#4C0000" size="4">View Schedule</font></a>

	<div
		style="width: 650px; height: 400px; top: 100px; position: absolute; left: 17%;"
		class="shadow-div">
		<form method="post" action="dao/AdminManageSchedule">
			<div style="width: 350px; position: absolute;">
				<table>
					<tr>
						<td colspan="2"><h3>
								<font color="#006699">Add to schedule:</font>
							</h3></td>
					</tr>
					<tr>
						<td>Select week day:</td>
						<td><select name="week_day">
								<%
									Statement stmt = conn.createStatement();
									String query = "select * from week_day";
									ResultSet rs = stmt.executeQuery(query);
									while (rs.next()) {
										String str = rs.getString("day");
										String id = rs.getString("idweek_day");
								%>
								<option value="<%=id%>"><%=str%></option>
								<%
									}
								%>
						</select></td>
					</tr>
					<tr>
					<td>Select teacher:</td><td>
					<select name="addteacher_Id">
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
					<tr>
						<td>Select Classroom:</td>
						<td><select name='classroom' onchange="showState(this.value)">
								<option value="none">Select</option>

								<%
									rs = stmt
											.executeQuery("Select * from classroom_mst,grade_mst where grade_mst.grade_Id=classroom_mst.grade_Id");
									while (rs.next()) {
								%>

								<option value="<%=rs.getString("classroom_Id")%>"><%=rs.getString("name")%>
									<%=rs.getString("section")%></option>
								<%
									}
								%>
						</select></td>
					</tr>

					<tr>
						<td>Select Course:</td>
						<td>
							<div id='courses'>
								<select name='courses' size="6" style="width: 150px;">
									<option value='-1'></option>
								</select>
							</div>
						</td>
					</tr>
					<tr>
						<td>Start time:</td>
						<td><input type="text" name="starttime"></td>
					</tr>
					<tr>

						<td>End time:</td>
						<td><input type="text" name="endtime"></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="submit"
							name="addschedule" value="Add to Schedule"></td>
					</tr>
				</table>
			</div>
			<div style="position: absolute; right: 5%;">

				<table>
					<tr>
						<td colspan="2"><h3>
								<font color="#006699">Remove from schedule:</font>
							</h3></td>
					</tr>
					<tr>
						<td>Select Day:</td>
						<td><select name="rmvweek_day">
								<%
									stmt = conn.createStatement();
									query = "select * from week_day";
									rs = stmt.executeQuery(query);
									while (rs.next()) {
										String str = rs.getString("day");
										String id = rs.getString("idweek_day");
								%>
								<option value="<%=id%>"><%=str%></option>
								<%
									}
								%>
						</select></td>
					</tr>
					<tr>
					<td>Select teacher:</td><td>
					<select name="rmvteacher_Id">
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
					<tr>
						<td height="10"></td>
						<td></td>
					</tr>
					<tr>
						<td>Select time:</td>
						<td><select name='timeslot' size="8" style="width: 200px;">
								<%
									query = "select in_Time,out_Time from timetable_mst GROUP BY in_Time,out_Time";
									rs = stmt.executeQuery(query);
									while (rs.next()) {
								%>
								<option value="<%=rs.getString("in_Time")%>"><%=rs.getString("in_Time")%>
									to
									<%=rs.getString("out_Time")%>
								</th>
								<%
									}
								%>
						</select></td>
					</tr>
					<tr>
						<td height="10"></td>
						<td></td>
					</tr>
					<tr>
						<td align="center" colspan="2"><input type="submit"
							value="Remove from schedule" name="rmvschedule"></td>
					</tr>
				</table>

			</div>
		</form>
	</div>

</body>
</html>