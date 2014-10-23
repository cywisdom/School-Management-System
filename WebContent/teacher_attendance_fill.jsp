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
	<%@ page import="org.json.*"%>
	<%@ page import="java.util.*"%>
	<%@ page import="org.sms.util.*"%>
	<%@ page import="org.sms.bean.AttendenceBean"%>
	<%!List<Integer> students_Id = new ArrayList<Integer>();
	List<String> regno = new ArrayList<String>();
	List<String> fnamelst = new ArrayList<String>();
	List<String> lnamelst = new ArrayList<String>();
	util utilobj = new util();
	ResultSet rs;
	Statement stmt;
	int id = 0;
	int total = 0, attended = 0, average = 0;
	String query = null;
	String date;%>
	<div style="left: 13%; top: 100px; position: absolute;">
		<font color="#006699" face="Californian FB" size="+4">Attendance</font>
	</div>

	<div style="top: 100px; width: 750px; position: absolute; left: 13%;"
		class="shadow-div">
		<%
			Connection conn = utilobj.connect();
			stmt = conn.createStatement();
			students_Id = (List) request.getAttribute("student_Id");
			regno = (List) request.getAttribute("regno");
			fnamelst = (List) request.getAttribute("fname");
			lnamelst = (List) request.getAttribute("lname");
			AttendenceBean obj = (AttendenceBean) request.getAttribute("objBean");

			//String date = obj.getDate();
			//String newdate = utilobj.datemonthconvert(date);
				
		%>
		<table width="750px">
			<tr>
				<td align="left" width="60px">Subject:</td>
				<td align="left"><%=obj.getCourse()%></td>
				<td align="right">Date:</td>
				<td width="100px" align="left"><input type="text" id="date" name="date"></td>
			</tr>
			<tr>
				<td align="left">Standard:</td>
				<td align="left"><%=obj.getStandard()%></td>
				<td align="right">Start Time:</td>
				<td><input type="text" id="startTime" name="startTime"></td>

			</tr>
			<tr>
				<td align="left">Section:</td>
				<td align="left"><%=obj.getSection()%></td>
				<td align="right">End Time:</td>
				<td><input type="text" id="endTime" name="endTime"></td>
			</tr>
		</table>
		<table class="css">

			<th>Reg no.</th>
			<th width="500px">Student Name</th>
			<th>Remarks</th>
			<%
				for (int i = 0; i < regno.size(); i++) {
			%>
			<tr>
				<td align="left"><%=regno.get(i)%></td>
				<td align="left"><%=fnamelst.get(i)%> <%=lnamelst.get(i)%></td>
				<td align="center"><input type="checkbox"
					id="<%=students_Id.get(i)%>" name="<%=students_Id.get(i)%>"></td>
			</tr>
			<%
				}
			%>

		</table>
		<table width="750px">
			<tr>
				<td align="center"><input id="attendSubmit"
					style="visibility: hidden;" type="button" onclick="fill()"></input><a
					href="javascript:void(0)"
					onclick="document.getElementById('attendSubmit').click()"
					class="button green"> <span class="edit"></span>Submit
				</a></td>
			</tr>
		</table>

	</div>


	<script type="text/javascript">
	
function fill() {
	
	var remarks = new Array();
	
	var length="<%=regno.size()%>";
	
	var classroom_Id = "<%=obj.getClassroom_Id()%>";
	var course_Id = "<%=obj.getCourse_Id()%>";
	var date = document.getElementById("date").value;
	var startTime = document.getElementById("startTime").value;
	var endTime = document.getElementById("endTime").value;	
	
	var student_Id = new Array(<%			
	for(int i = 0; i < students_Id.size(); i++) {
		  out.print("\""+students_Id.get(i)+"\"");
		  if(i+1 < students_Id.size()) {
		    out.print(",");
		  }
		}
		%>);

	
			 for ( var i = 0; i < length; i++) {
				 var temp;
				 if (document.getElementById(student_Id[i]).checked) {
     				    temp = 1;
    				}			
				 else{temp=0;}
				 remarks.push(temp);
				}
			 
			 $.ajax
             (
                     {
                         url:'<%=request.getContextPath() + "/dao/FillAttendanceDao"%>',
                         type:'POST',                         
                        data:{remarks : remarks.toString(), classroom_Id : classroom_Id,course_Id :course_Id,date:date, startTime:startTime,endTime:endTime,student_Id:student_Id.toString()},                   
                         cache:false,
                         success:function(data){},
                         error:function(){alert('error');}
                     }
                 );  

		}
	</script>

</body>
</html>