<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> </title>
</head>
<body>
	<%@ page import="org.sms.util.util"%>
	<%@ page import="java.sql.*"%>
	<%@ page import="java.util.*"%>
	<%!util utilobj = new util();
	Connection conn = utilobj.connect();%>
<%
String exam_Id = request.getParameter("eid");
String student_Id = request.getParameter("sid");
List<String> marks = new ArrayList<String>();
List<String> courses = new ArrayList<String>();
List<String> totalmarks = new ArrayList<String>();
String standard = null;
Statement stmt ;
String date=null, fname=null, mname=null, lname=null, examname=null;
ResultSet rs;
String query;

	stmt = conn.createStatement();
	query = "select cm.name, er.marks, er.totalmarks from exam_result er, course_mst cm where er.course_Id=cm.course_Id and student_Id='"+ student_Id +"' and exam_Id='"+exam_Id+"'";
	rs = stmt.executeQuery(query);
	while(rs.next()){				
		courses.add(rs.getString("name"));
		marks.add(rs.getString("marks"));
		totalmarks.add(rs.getString("totalmarks"));
	}
	query="select gm.name, sm.fname, sm.lname, sm.mname from grade_mst gm, student_mst sm where sm.student_id='"+student_Id+"' and sm.grade=gm.grade_Id";
	rs = stmt.executeQuery(query);
	while(rs.next()){				
		 standard = rs.getString("name");
		 fname= rs.getString("fname");
		 mname= rs.getString("mname");
		 lname= rs.getString("lname");
	}
	
	query="select name,date from exam_mst where exam_Id='"+exam_Id+"'";
	rs = stmt.executeQuery(query);
	while(rs.next()){				
		 examname = rs.getString("name");
		 date = rs.getString("date");
	}
%>
<div style="border: solid; width: 450px;">
<table width="450px" >
<tr><td align="center" colspan="4"><b>Grade Report</b></td></tr>
<tr><td width="90">Exam Name:</td> <td><%=examname %></td> <td align="right">Date:</td> <td align="right" width="80"><%=date %></td></tr>
<tr> <td>Student Name:</td> <td colspan="3"><%=fname %> <%=mname %> <%=lname %></td> </tr>
</table>

<table  width="450" border="1">
<tr><td >Subject Name</td><td>Obtained Marks</td><td>Total Marks</td></tr>
<%

for(int i=0; i<courses.size();i++)
{
	%>	<tr> <td><%=courses.get(i)%></td><td align="center"><%=marks.get(i) %></td><td align="center"><%=totalmarks.get(i) %></td> </tr>	<%
}
%>

</table>
<br><br>
<table width="450">
<tr><td>The above report is electronically generated.</td></tr>
</table>
</div>
</body>
</html>