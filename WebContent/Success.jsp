<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="homeheader.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>

<% String msg = (String) request.getAttribute("msg"); %>
<div style="position:absolute;top:15%;left:15%; ">
<h1><font color="green">Email Sent...</font></h1><br>
<table><tr><td><h3><font color="green"><%=msg %></font></h3></td></tr></table>
</div>

</body>
</html>