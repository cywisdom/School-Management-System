<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@page import="java.sql.*"%>
	<%@ page import="org.sms.util.*"%>
	<%!util obj = new util();%>
	<%
		String classroom_Id=request.getParameter("count");  
	 String buffer="<select name='courses' size='6' style='width: 150px;'>";  
	 try{
	   
	 Connection con =   obj.connect();
	 Statement stmt = con.createStatement();
	 String standard=null;
	 ResultSet rs = stmt.executeQuery("Select grade_Id from classroom_mst where classroom_Id='"+classroom_Id+"'  ");
	 while(rs.next()){
		 
		 standard = rs.getString("grade_Id");
	 }
	 rs = stmt.executeQuery("Select * from course_mst where grade_Id='"+standard+"'  ");  
	   while(rs.next()){
	   buffer=buffer+"<option value='"+rs.getString("course_Id")+"'>"+rs.getString("name")+"</option>";  
	   }  
	 buffer=buffer+"</select>";  
	 response.getWriter().println(buffer); 
	 }
	 catch(Exception e){
	     System.out.println(e);
	 }
	%>
</body>
</html>