<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="admin_master.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Classroom</title>
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


	<%@ page import="org.sms.util.util"%>
	<%@ page import="java.sql.*"%>
	<%!util utilobj = new util();
	Connection conn = utilobj.connect();%>

	<div style="left: 13%; top: 100px; position: absolute;">
		<font color="#006699" face="Californian FB" size="+4">Manage
			Classrooms </font>
	</div>
	<div
		style="width: 750px; top: 100px; height: 270px; position: absolute; left: 13%;"
		class="shadow-div">
<form action="dao/ManageClassroom" method="post">
		<div style="position: absolute;">
			<table>
				<tr>
					<td colspan="2"><h3>
							<font color="#006699">Add Classroom:</font>
						</h3></td>
				</tr>
				<tr>
					<td height="40">Select Standard:</td>
					<td><select id="standards" name="standards"
						style="width: 175px;">

							<%
								Statement stmt = conn.createStatement();
								String query = "select * from grade_mst";
								ResultSet rs = stmt.executeQuery(query);
								while (rs.next()) {
									String str = rs.getString("name");
									String id = rs.getString("grade_Id");
							%>
							<option value="<%=id%>"><%=str%></option>
							<%
								}
							%>

					</select></td>
				</tr>
				<tr>
					<td height="40">Section:</td>
					<td><input type="text" name="section""></td>
				</tr>
				<tr>
					<td height="40">Year:</td>
					<td><input type="text" name="year""></td>
				</tr>
				<tr>
					<td height="40">Select Teacher:</td>
					<td><select name="teacher_Id">
							<%
								stmt = conn.createStatement();
								query = "select * from teacher_mst";
								rs = stmt.executeQuery(query);
								while (rs.next()) {
									String fname = rs.getString("fname");
									String lname = rs.getString("lname");
									String teacher_Id = rs.getString("teacher_Id");
							%>
							<option value="<%=teacher_Id%>"><%=fname%>
								<%=lname%></option>
							<%
								}
							%>

					</select></td>
				</tr>
				<tr>
					<td colspan="2" height="40" align="center"><input
						style="width: 120px;" name="addclassroom" type="submit"></td>
				</tr>
			</table>
		</div>

		<div style="position: absolute; right: 6%;">
			<table>
				<tr>
					<td align="center"><h3>
							<font color="#006699">Remove Classroom:</font>
						</h3></td>
				</tr>

				<tr>
					<td  height="40">Select standard:</td>
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
				<tr>
					<td  height="40">Select Section:</td>
					<td>
						<div id='sections'>
							<select name='sections' style="width: 150px;">
								<option value='-1'></option>
							</select>
						</div>

					</td>
				</tr>
				<tr>
				<td height="40" colspan="2" align="center"><input style="width: 120px;" value="Remove Classroom" type="submit" name="rmvclass"></td>
				
				</tr>
			</table>
		</div>
</form>
	</div>

</body>
</html>