<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="teacher_master.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Grade Report</title>
</head>
<body>

<%@ page import="java.util.*"%>
	<%@ page import="org.sms.util.*"%>
<% 
List<String> examid = new ArrayList<String>();
List<String> examname = new ArrayList<String>();
List<String> examtype = new ArrayList<String>();
List<String> examdate = new ArrayList<String>();

String student_Id = (String) request.getAttribute("student_Id"); 
examid = (List) request.getAttribute("examid");
examname = (List) request.getAttribute("examname");
examtype = (List) request.getAttribute("examtype");
examdate = (List) request.getAttribute("examdate");
%>
<div style="left: 13%; top: 100px; position: absolute;">
		<font color="#006699" face="Californian FB" size="+4">View Grade Report </font>
	</div>
	<div
		style="width: 750px; top: 100px;  position: absolute; left: 13%;"
		class="shadow-div">
		
		<table class="css">
		
		
		<th>Date</th><th>Name</th><th>Exam Type</th><th>View Report</th>
		<%
		for(int i=0;i<examid.size();i++)
		{
			%>	<tr><td><%=examdate.get(i) %></td><td><%=examname.get(i) %></td> <td> <%=examtype.get(i) %> </td> <td> <a href="<%=request.getContextPath() %>/gradeview.jsp?sid=<%=student_Id%>&eid=<%=examid.get(i)%>" target="_blank">View Report</a></td> </tr>	<%			
		}		
		%>
		
				
		</table>
		
		</div>

</body>
</html>