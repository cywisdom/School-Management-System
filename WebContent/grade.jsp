<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="student_master.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Grade Report</title>
</head>
<body>

<%@ page import="java.util.*"%>
	<%@ page import="org.sms.util.*"%>
	<%@ page import="java.sql.*"%>
	<%
	util obj = new util();
	
	String role = (String)session.getAttribute("role");
	Connection conn = obj.connect();
	ResultSet rs = null;
	Statement stmt = null;
	String query = null;
	
	
	String studentname=null;
	String student_Id= (String)session.getAttribute("student_Id");
	String classroom_Id=null;
	String grade_Id = null;
	List<String> course_Idlst = new ArrayList<String>();
	List<String> courses = new ArrayList<String>();
	
	List<String> examid = new ArrayList<String>();
	List<String> examname = new ArrayList<String>();
	List<String> examtype = new ArrayList<String>();
	List<String> examdate = new ArrayList<String>();
	try{
		stmt = conn.createStatement();
		query = "select er.exam_id Id, em.name Name, em.date Date, et.name Type from exam_result er, exam_mst em, exam_type et where er.student_Id='"+student_Id+"' and em.exam_type_id=et.exam_type_id and er.exam_id=em.exam_id group by er.exam_Id";
		rs = stmt.executeQuery(query);
		while(rs.next()){				
			examid.add(rs.getString("Id"));
			examdate.add(rs.getString("Date"));
			examname.add(rs.getString("Name"));
			examtype.add(rs.getString("Type"));
		}
		}
		
	
	catch(SQLException ex)
	{ex.printStackTrace();}
	
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