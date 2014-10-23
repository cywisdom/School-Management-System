<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="admin_master.jsp"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="Style/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>

</head>
<body>
	<%@ page import="org.sms.util.util"%>
	<%@ page import="java.sql.*"%>
	<%!util utilobj = new util();
	Connection conn = utilobj.connect();%>

	<%!String firstName;
	String middleName;
	String lastName;
	String email;
	String dob;
	String gender;
	String grade;
	String regno;
	String addressLine1;
	String addressLine2;
	String permenantMobile;
	String permenantPhone;
	String userImage;
	String status;
	String aboutMe;
	String Interest;
	String joiningYear;
	String fax;
	%>

	<%

		String userId = request.getParameter("userId");
		Statement stmt = conn.createStatement();

		
		String query = "select * from student_mst where student_Id='"
				+ userId + "'";
		ResultSet rs = stmt.executeQuery(query);
		while (rs.next()) {
			firstName = rs.getString("fname");
			middleName = rs.getString("mname");
			lastName = rs.getString("lname");
			email = rs.getString("email");
			dob = rs.getString("dob");
			gender = rs.getString("gender");
			grade = rs.getString("grade");
			regno = rs.getString("regno");
			addressLine1 = rs.getString("address1");
			addressLine2 = rs.getString("address2");
			permenantMobile = rs.getString("pmno");
			permenantPhone = rs.getString("phno");
			fax = rs.getString("pfax");
			status = rs.getString("status");
			userImage = rs.getString("user_Image");
			joiningYear = rs.getString("joining_Year");
			aboutMe = rs.getString("about");
			Interest = rs.getString("interest");
			

		}
		
	%>


	<div class="shadow-div"
		style="width: 200px; top: 20px; height: 215px; position: absolute; left: 9%;">
		<table>
			<tr>
				<td height="200px" width="200px"><img src="<%=userImage%>"
					id="blah" name="userImage" height="200px" width="194px"></td>
			</tr>
			
		</table>

	</div>

	<div class="shadow-div"
		style="right: 10%; height: 450px; width: 550px; top: 20px; position: absolute;">
		<table style="top: 20px; width:547px; position: absolute;" >
			<tr>
				<td style="width: 118px;" align="right" >Name:</td><td style="width:3px; "></td>
				<td style="width: 170px;"><%=firstName%>&nbsp;<%=middleName%>&nbsp;<%=lastName%></td>
			</tr>
			<tr>
				<td align="right">Standard:</td><td></td>
				<td></td>
			</tr>
			<tr>
				<td align="right">Date of Birth:</td><td></td>
				<td><%=dob%></td>
			</tr>
			<tr>
				<td align="right">email:</td><td ></td>
				<td><%=email%></td>
			</tr>
			<tr>
				<td align="right">gender:</td><td></td>
				<td><%=gender%></td>
			</tr>
			<tr>
				<td align="right">Joining Year:</td><td ></td>
				<td><%=joiningYear%></td>
				
			</tr>
			<tr>
				<td align="right">Status:</td><td ></td>
				<td><%=status%></td>
			</tr>
			<tr>
				<td align="right" valign="top" rowspan="2">Address Line 1:</td><td rowspan="2"></td>
				<td valign="top" rowspan="2"><%=addressLine1%></td>
				<td align="right">Phone.:</td>
				<td><%=permenantPhone%></td>
			</tr>
			<tr>
				<td align="right">Mobile no.:</td>
				<td><%=permenantMobile%></td>
			</tr>
			
			<tr>
			<td align="right" rowspan="2" valign="top">Address Line 2:</td><td rowspan="3"></td>
				<td valign="top" rowspan="2"><%=addressLine2%></td>
				<td align="right">Fax:</td><td><%=fax %></td>
			</tr>
			<tr></tr>
			<tr>
				<td align="right">Interests:</td>
				<td><%=aboutMe%></td>
			</tr>
			<tr>
				<td align="right">About:</td><td ></td>
				<td><%=Interest%></td>
			</tr>
		</table>
	</div>


</body>
</html>