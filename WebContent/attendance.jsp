<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="student_master.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Attendance</title>
</head>
<body>

<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page import="org.sms.util.*"%>

<%!
util obj = new util();
Connection conn = obj.connect();
Statement stmt = null;
ResultSet rs=null;
int temp = 0;
int total=0,attended=0,average=0;
%>

<%

String student_Id = (String)  session.getAttribute("student_Id");
String grade_Id = null;
String classroom_Id = null; 

ArrayList<String> courses_Id = new ArrayList<String>();
ArrayList<String> courses_name = new ArrayList<String>();
//System.out.print(student_Id);

try{
	stmt = conn.createStatement();
	String query = "select classroom_Id from classroom_student where student_Id='"+ student_Id +"'";
	rs = stmt.executeQuery(query);
	while(rs.next())
	{
		classroom_Id = rs.getString("classroom_Id");
	}
	
	query="select grade_Id from classroom_mst where classroom_Id = '"+classroom_Id+"'";
	rs = stmt.executeQuery(query);
	while(rs.next())
	{
		grade_Id = rs.getString("grade_Id");
	}
	
	query="select name, course_Id from course_mst where grade_Id= '"+grade_Id+"'";
	rs = stmt.executeQuery(query);
	while(rs.next())
	{
		courses_Id.add(rs.getString("course_Id"));
		courses_name.add(rs.getString("name"));
	}
	
	
	
}
catch(SQLException ex){
	ex.printStackTrace();			
}

//System.out.println(student_Id);
//System.out.println(grade_Id);
//System.out.println(classroom_Id);
//System.out.println(courses_Id.toString());
%>

<div style="left: 13%; top: 100px; position: absolute;">
		<font color="#006699" face="Californian FB" size="+4">Attendance</font>
	</div>
	
	<div style=" top: 100px; width:900px; position: absolute; left: 8%;" class="shadow-div">
		
		<%
		for(int i =0; i<courses_Id.size();i++)
		{ %>
		
		Subject: <%=courses_name.get(i) %>	<br>
		
		
		<table border="1px">
		
		<% 
		ArrayList<String> datelst = new ArrayList<String>(); 
		stmt = conn.createStatement();
		String query="select date from attendace_mst where student_Id='"+student_Id+"' and course_Id='"+ courses_Id.get(i)+"' and classroom_Id='"+classroom_Id +"'";
		rs = stmt.executeQuery(query);
		while(rs.next())
		{
			datelst.add(rs.getString("date"));
			String temp = rs.getString("date");
			%> <th> <%=temp %> </th> <%
		}
		%>		
		<th>Average Attendance</th>
		<tr>
		<%
		for(int j=0;j<datelst.size();j++)
		{total = total+1;
		stmt = conn.createStatement();
		query="select status from attendace_mst where student_Id='"+student_Id +"' and course_Id='"+ courses_Id.get(i)+"' and classroom_Id='"+classroom_Id+"' and date='"+datelst.get(j)+"'";
		rs = stmt.executeQuery(query);
		while(rs.next()){
			if(rs.getInt("status")==0){
				%>
				
				<td>A</td>
				<%
				
				//System.out.print("A"+"         ");
			}	
			else{attended = attended + 1;
			%>  <td>P</td>  <%
				//System.out.print("P"+"         ");
				}
			}
		}
		if(total!=0)
		{
		average=(attended*100)/total;
		}
		%>	
		<td><%=average%></td></tr>
		</table>	<br><br><br>	
		<%	
		attended=0;
		total=0;			
		average=0;
		
		}
		
		%>	
		
		</div>
		
</body>
</html>