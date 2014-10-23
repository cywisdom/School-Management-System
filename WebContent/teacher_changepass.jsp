<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="teacher_master.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Password</title>
</head>
<body>
<div style="left: 13%; top: 100px; position: absolute;">
		<font color="#006699" face="Californian FB" size="+4">Change
			Password </font>
	</div>
	<div style="position: absolute; top: 120px; left: 19%;"
		class="shadow-div">

		<form method="post" action="controllers/ChangePassword">
			<table>
				<tr>
					<td height="12"></td>
				</tr>
				<tr>
					<td width="9"></td>
					<td>Old Password:</td>
					<td><input type="password" name="oldpassword"></td>
				</tr>
				<tr>
					<td></td>
					<td>New Password:</td>
					<td><input type="password" name="newpassword"></td>
				</tr>
				<tr>
					<td></td>
					<td>Confirm Password:</td>
					<td><input type="password" name="confirmpassword"></td>
				</tr>
				<tr>
					<td></td>
					<td colspan="2" align="center"><input id="regSubmit"
						class="hide" type="submit"></input><a href="javascript:void(0)"
						onclick="document.getElementById('regSubmit').click()"
						class="button black"> <span class="setting"></span>Change
							Password
					</a></td>
				</tr>


			</table>
		</form>
	</div>
</body>
</html>