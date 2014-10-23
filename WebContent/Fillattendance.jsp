<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="admin_master.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Attendance</title>
</head>
<body>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page import="org.sms.util.util" %>
<%@ page import="org.sms.bean.AttendenceBean" %>
<%! List<String> lectureDates =  new ArrayList<String>(); 
List<Integer> students_Id =  new ArrayList<Integer>();
List<String> regno =  new ArrayList<String>();
util utilobj = new util();
ResultSet rs;
Statement stmt;
int id=0;
int total=0,attended=0,average=0;
String query=null;
String date; 
%>
<div style="left: 13%; top: 100px; position: absolute;">
		<font color="#006699" face="Californian FB" size="+4">Attendance</font>
	</div>

	<div style=" top: 100px; position: absolute; left: 13%;" class="shadow-div">
	</div>
</body>
</html>