<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="teacher_master.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Attendance</title>
</head>
<body>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@page import="org.sms.util.util"%>
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
		<%  Connection conn= utilobj.connect();
		stmt = conn.createStatement();
		%>
		<table class="css">
		
		<th>Reg no.</th>
		<%		
		students_Id = (List) request.getAttribute("student_Id");
		regno = (List)  request.getAttribute("regno");
		lectureDates= (List) request.getAttribute("lectureDates") ;
		AttendenceBean obj = (AttendenceBean) request.getAttribute("objBean");
		for(int i =0 ; i< lectureDates.size(); i++)
		{
			%>
			<th width="40px"> <%=lectureDates.get(i) %> </th>
			<%
		}		
		%>
		<th>Average attendance</th>
		
		<%
		
		for(int i=0;i<regno.size();i++)
		{
			%>
			<tr>
			<td><%=regno.get(i) %></td>
			<%
			//System.out.print("\n"+regno.get(i) + "            ");
			id = students_Id.get(i);
			for(int j=0; j < lectureDates.size() ; j++)
			{	total = total+1;
				date = lectureDates.get(j);
				query = "select status from attendace_mst where student_Id='"+id+"' and date='"+date+"' and classroom_Id='"+obj.getClassroom_Id() +"' and course_Id='"+ obj.getCourse_Id()+"'";
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
			<%
			//System.out.print(average);
			attended=0;
			total=0;			
			average=0;
		}
		
		conn.close();
		%>
		
		</table>	
		
	</div>
</body>
</html>