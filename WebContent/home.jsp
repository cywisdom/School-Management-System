<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="student_master.jsp" %>
<html>
<head><title>School Management System</title>


<style type="text/css">

th.style{
border-bottom: solid;
text-align: left;
}

table.style {
border-spacing:7px 10px;
color:black;
font:  12px Arial,Helvetica,Sans-serif;
}


div.transbox {
	border: thin;
	border-style: solid;
	border-color: black;
	border-top-right-radius: 1em;
	
	
	border-top-left-radius: 1em;
	background-color: rgba(237, 237, 232, 0.6);
}

div.head {
	position: absolute;
	height: 30px;
	border-top-right-radius: 1em;
	border-top-left-radius: 1em;
	
	background-color: #EDEDE8;
	
	border-bottom: thin;
	border-bottom-style: solid;
}
</style>

</head>
<body>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page import="org.sms.util.*" %>
<%!
String query = null;
util utilobj = new util();
ResultSet rs;
Statement stmt; %>
<%  Connection conn= utilobj.connect();
		stmt = conn.createStatement();
		%>
	<div class="transbox" style="position: absolute; top: 20%; left: 15%; height: 250px; width: 300px;">
		
		<div class="head" style="width: 300px;">
			<font style="position: absolute; top: 5px;">&nbsp;&nbsp;News
				and Update</font>
		</div>
		<div style="position: absolute;  top:30px; width: 298px; height: 220px;">
		
		<marquee behavior="scroll" direction="up" scrollamount="2" onmouseover="this.stop();" onmouseout="this.start();">
		<% query = "select title from news_mst"; 
	   rs = stmt.executeQuery(query);
	   while(rs.next())
	   {
		   String temp = rs.getString("title"); 		   
	   %>       <%=temp %> <br><br>     <%
	   }
	   
	%>
				
		</marquee>
		</div>
	</div>
	
	<%
	List<String> uploaddates =  new ArrayList<String>(); 
	
	%>
	<% query = "select upload_time from docs_mst group by upload_time DESC limit 15"; 
	   rs = stmt.executeQuery(query);
	   while(rs.next())
	   {
		   uploaddates.add(rs.getString("upload_time")); 		   
	   }
	   
	%>
	
	<div class="transbox" style="position: absolute; top: 20%; height:500px; right: 15%; width: 600px;">
		
		<div class="head" style="width:600px;">
			<font style="position: absolute; top: 5px;">&nbsp;&nbsp;List of latest uploaded documents:</font>
		</div>
		
		<table  width="600px" style="position: absolute;top: 25px;"  class="style">
		<th class="style" width="300px">Title</th>
		<th class="style">Uploaded by</th>
		<th width="100px" class="style">Date and Time</th>
		
		<%
		int count=0;
		for(int i = 0; i<uploaddates.size();i++)
		{
			
		query = "select dm.title, tm.fname,tm.lname, dm.doc_name ,dm.upload_time from docs_mst dm, teacher_mst tm where dm.user_Id = tm.user_Id and dm.upload_Time='"+uploaddates.get(i)+"'";
		 rs = stmt.executeQuery(query);
		   while(rs.next() && count<15)
		   {	String uploadtime = rs.getString("upload_time");
		   		String ut = uploadtime.substring(0, 10);
		   		String newDate = utilobj.dateconvert(ut);
			   %><tr><td><a target="_blank" href="admin_download.jsp?file=<%=rs.getString("doc_name")%>"><%=rs.getString("title") %></a></td><td><%=rs.getString("fname") %> <%=rs.getString("lname") %></td><td><%=newDate%></td>      </tr><%
					   count++;
		   }	
		}
		%> 
		</table>		
		<%
		
		conn.close();
		
		%>
	</div>
	
</body></html>