<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="teacher_master.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="Style/table.css">
<title>Schedule</title>
</head>
<body>
<%@ page import="java.sql.*"%>
<%@ page import="org.sms.util.*" %>
<%@ page import="java.util.*" %>
<%! util utilobj = new util();
ResultSet rs;
Statement stmt;
String teacher_Id;

 %>
<%teacher_Id=(String) session.getAttribute("teacher_Id"); 
List<String> intime = new ArrayList<String>();
List<String> outtime = new ArrayList<String>();

%>
<div style="left: 13%; top: 100px; position: absolute;">
		<font color="#006699" face="Californian FB" size="+4">Schedule</font>
	</div>
	<%  Connection conn= utilobj.connect();
		stmt = conn.createStatement();
		%>
		
		<a href="manage_schedule.jsp" style="position: absolute; left: 20.5%; top: 175px;"><font color="#4C0000" size="4">Manage Schedule</font></a>
	<div style=" top: 100px; position: absolute; left: 13%;"
		class="shadow-div">
		<table class="css">
		<th>Day</th>
		<%
		String query ="select in_Time,out_Time from timetable_mst GROUP BY in_Time,out_Time";
		rs = stmt.executeQuery(query);
		while(rs.next())
		{
			intime.add(rs.getString("in_Time"));
			outtime.add(rs.getString("out_Time"));
			%>
			<th align="center"><%=rs.getString("in_Time")%> to  <%=rs.getString("out_Time") %></th>
			<%
		}
		%>
		
		<tr><td>Monday</td>
		<%
		for(int i=0;i<intime.size();i++){
		query = "select cr.name Course,gm.name STD,cm.section Batch	from classroom_mst cm,course_mst cr,timetable_mst tm,grade_mst gm where tm.course_id = cr.course_id and tm.classroom_id = cm.classroom_id and gm.grade_id = cr.grade_id and tm.week_Day='1' and tm.in_Time='"+ intime.get(i) +"' and tm.out_Time='"+outtime.get(i)+"' and tm.teacher_Id='"+teacher_Id+"'";
		rs = stmt.executeQuery(query);
		if(rs.next())
		{
			%>
			<td align="center"><%=rs.getString("STD") %> - <%=rs.getString("Batch") %><br /><%=rs.getString("Course")%></td>
			<%
		}
		else{
			%>
			<td align="center">---</td>
			<%	
			
		}
		}
		%>
		</tr>
		<tr>
		<td>Tuesday</td>
		<%
		for(int i=0;i<intime.size();i++){
		query = "select cr.name Course,gm.name STD,cm.section Batch	from classroom_mst cm,course_mst cr,timetable_mst tm,grade_mst gm where tm.course_id = cr.course_id and tm.classroom_id = cm.classroom_id and gm.grade_id = cr.grade_id and tm.week_Day='2' and tm.in_Time='"+ intime.get(i) +"' and tm.out_Time='"+outtime.get(i)+"' and tm.teacher_Id='"+teacher_Id+"'";
		rs = stmt.executeQuery(query);
		if(rs.next())
		{
			%>
			<td align="center"><%=rs.getString("STD") %> - <%=rs.getString("Batch") %><br /><%=rs.getString("Course")%></td>
			<%
		}
		else{
			%>
			<td align="center">---</td>
			<%	
			
		}
		}
		%>
		</tr>
		<tr><td>Wednesday</td>
		<%
		for(int i=0;i<intime.size();i++){
		query = "select cr.name Course,gm.name STD,cm.section Batch	from classroom_mst cm,course_mst cr,timetable_mst tm,grade_mst gm where tm.course_id = cr.course_id and tm.classroom_id = cm.classroom_id and gm.grade_id = cr.grade_id and tm.week_Day='3' and tm.in_Time='"+ intime.get(i) +"' and tm.out_Time='"+outtime.get(i)+"' and tm.teacher_Id='"+teacher_Id+"'";
		rs = stmt.executeQuery(query);
		if(rs.next())
		{
			%>
			<td align="center"><%=rs.getString("STD") %> - <%=rs.getString("Batch") %><br /><%=rs.getString("Course")%></td>
			<%
		}
		else{
			%>
			<td align="center">---</td>
			<%	
			
		}
		}
		%>
		</tr>
		<tr><td>Thursday</td>
		<%
		for(int i=0;i<intime.size();i++){
		query = "select cr.name Course,gm.name STD,cm.section Batch	from classroom_mst cm,course_mst cr,timetable_mst tm,grade_mst gm where tm.course_id = cr.course_id and tm.classroom_id = cm.classroom_id and gm.grade_id = cr.grade_id and tm.week_Day='4' and tm.in_Time='"+ intime.get(i) +"' and tm.out_Time='"+outtime.get(i)+"' and tm.teacher_Id='"+teacher_Id+"'";
		rs = stmt.executeQuery(query);
		if(rs.next())
		{
			%>
			<td align="center"><%=rs.getString("STD") %> - <%=rs.getString("Batch") %><br /><%=rs.getString("Course")%></td>
			<%
		}
		else{
			%>
			<td align="center">---</td>
			<%	
			
		}
		}
		%>
		</tr>
		<tr><td>Friday</td>
		<%
		for(int i=0;i<intime.size();i++){
		query = "select cr.name Course,gm.name STD,cm.section Batch	from classroom_mst cm,course_mst cr,timetable_mst tm,grade_mst gm where tm.course_id = cr.course_id and tm.classroom_id = cm.classroom_id and gm.grade_id = cr.grade_id and tm.week_Day='5' and tm.in_Time='"+ intime.get(i) +"' and tm.out_Time='"+outtime.get(i)+"' and tm.teacher_Id='"+teacher_Id+"'";
		rs = stmt.executeQuery(query);
		if(rs.next())
		{
			%>
			<td align="center"><%=rs.getString("STD") %> - <%=rs.getString("Batch") %><br /><%=rs.getString("Course")%></td>
			<%
		}
		else{
			%>
			<td align="center">---</td>
			<%	
			
		}
		}
		%>
		</tr>
		<tr><td>Saturday</td>
		<%
		for(int i=0;i<intime.size();i++){
		query = "select cr.name Course,gm.name STD,cm.section Batch	from classroom_mst cm,course_mst cr,timetable_mst tm,grade_mst gm where tm.course_id = cr.course_id and tm.classroom_id = cm.classroom_id and gm.grade_id = cr.grade_id and tm.week_Day='6' and tm.in_Time='"+ intime.get(i) +"' and tm.out_Time='"+outtime.get(i)+"' and tm.teacher_Id='"+teacher_Id+"'";
		rs = stmt.executeQuery(query);
		if(rs.next())
		{
			%>
			<td align="center"><%=rs.getString("STD") %> - <%=rs.getString("Batch") %><br /><%=rs.getString("Course")%></td>
			<%
		}
		else{
			%>
			<td align="center">---</td>
			<%	
			
		}
		}
		%>
		</tr>
		</table>
		</div>
</body>
</html>