<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="homeheader.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Forgot Password</title>
</head>
<body>

<div style="position:absolute;top:15%;left:15%; ">
<h1><font color="black">Forgot Password</font></h1><br>
<form action="dao/ForgotPass" method="post">
<table width="300px">
<tr> <td colspan="2"><b>You will receive your password in email.</b> </td> </tr>
<tr> <td>Select role:</td><td> 
<select id="role" name="role">
		<option value="student">Student</option>
		<option value="teacher">Teacher</option>
		<option value="parent">Parent</option>
		</select>
 </tr>
<tr> <td>Enter Username:</td><td> <input type="text" name="forgotuname"> </td> </tr>
<tr> <td colspan="2" align="center"><input type="submit" value="Send Password"></td> </tr>

</table>
</form>
</div>

</body>
</html>