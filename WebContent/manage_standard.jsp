<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="admin_master.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Standard</title>
<script type="text/javascript">

function testvalidation()
{
	var newcourse =document.getElementById("newStandard").value;
	
	if(newcourse=="" || newcourse==null)
		{
		alert("Course name can't be empty.");
		
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
			Standard </font>
	</div>
	<div
		style="width: 750px; top: 100px; height: 300px; position: absolute; left: 13%;"
		class="shadow-div">

		<div>
		<form action="dao/ManageStandard" method="post">
		
				
					<table style="position: absolute; left: 6%; ">
					<tr ><td colspan="2"><h3><font color="#006699">Add Standard:</font></h3></td></tr>
					<tr>
					<td>
					<label>Standard Name:</label></td><td><input type="text" id="newStandard" name="newStandard" /></td></tr>
					<tr><td><label>Description:</label></td><td><textarea rows="8" id="standardDesc" name="standardDesc" cols="25"></textarea>
					</td>
					</tr>
					<tr><td colspan="2" align="center"><input style="width: 100px;" type="submit" onclick="testvalidation()" name="add" value="Add" /></td></tr>
					</table>
					</td>
					
			<table style="right:6%; position: absolute;" >			
										
					<tr><td colspan="2"><h3><font color="#006699">Remove Standard:</font></h3></td></tr>
					<td width="80px" valign="top">Standards:</td>
					<td><select id="standards" name="standards"
						style=" width: 175px;" size="11">

							<%
								Statement stmt = conn.createStatement();
								String query = "select * from grade_mst";
								ResultSet rs = stmt.executeQuery(query);
								while (rs.next()) {
									String str = rs.getString("name");
							%>
							<option value="<%=str%>"><%=str%></option>
							<%
								}
							%>

					</select></td>
				</tr>
				<tr><td colspan="2" align="center"><input type="submit" style="width: 100px;" name="remove" value="Remove" /></td></tr>
			</table>
			</form>
		</div>

	</div>
	
</body>
</html>