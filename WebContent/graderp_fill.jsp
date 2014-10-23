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
	
	<%@ page import="org.sms.util.util"%>
	<%@ page import="java.sql.*"%>
	<%@ page import="java.util.*" %>
	<%!util utilobj = new util();
	Connection conn = utilobj.connect();%>
	<%
	
	String exam_Id = (String) request.getAttribute("examid");
	String student_Id= (String) request.getAttribute("sid");
	String classroom_Id=(String) request.getAttribute("classroom_Id");
	String grade_Id = (String) request.getAttribute("grade_Id");
	List<String> course_Idlst = new ArrayList<String>();
	List<String> courses = new ArrayList<String>();
	course_Idlst=(List) request.getAttribute("course_Idlst");
	courses=(List) request.getAttribute("courses");
	String studentname = (String)request.getAttribute("studentname");
	%>
	<div style="left: 13%; top: 100px; position: absolute;">
		<font color="#006699" face="Californian FB" size="+4">Fill Grade Report </font>
	</div>
	
	<div style="width: 750px; top: 100px;  position: absolute; left: 13%;" class="shadow-div">
		
		<table width="750px">
			<tr>
				<td align="left" width="110px">Student name:</td>
				<td align="left"><%=studentname %></td>
			</tr>
			<tr>
				<td align="left">Standard:</td>
				<td align="left">
				<%
								Statement stmt = conn.createStatement();
								String query = "select sm.grade,gm.name from student_mst sm, grade_mst gm where sm.grade=gm.grade_Id and student_id='"+student_Id+"'";
								ResultSet rs = stmt.executeQuery(query);
								while (rs.next()) {
									String str = rs.getString("name");
									
									%>  <%=str %> <%
								}
								
							%>	
							</td>
			</tr>			
			<tr>
				<td align="left">Exam:</td>
				<td align="left">
				
				
				
							<%
								stmt = conn.createStatement();
								 query = "select name,date from exam_mst where exam_Id='"+exam_Id+"'";
								 rs = stmt.executeQuery(query);
								while (rs.next()) {
									String str = rs.getString("name");
									String date = rs.getString("date");
									%>  <%=str %> <%=date %> <%
								}
								
							%>				
											
				</td>
				<td align="right">Total Marks:</td><td align="right" width="150"><input id="totalmarks" name="totalmarks" type="text"></td>
			</tr>
		</table>
		
		<table class="css" width="720">
		<th>Course Code</th><th width="150">Course Name</th><th> Obtained Marks </th>
		
		<%
		for(int i=0;i<courses.size();i++)
		{
			%>
			<tr><td><%=course_Idlst.get(i)%></td><td><%=courses.get(i) %></td><td><input type="text" width="10" name="<%=course_Idlst.get(i)%>" id="<%=course_Idlst.get(i)%>"></td></tr>
			<%
		}
		
			 %>
			 
		</table>
		<table width="750px">
			<tr>
				<td align="center"><input id="attendSubmit"
					style="visibility: hidden;" type="button" onclick="fill()"></input><a
					
					onclick="fill()"
					class="button green"> <span class="edit"></span>Submit
				</a></td>
			</tr>
		</table>
		
	</div>
	
	<script type="text/javascript">
	
function fill() {
	
	var marks = new Array();
	var totalmarks = document.getElementById("totalmarks").value;		
	var exam_Id=<%=exam_Id%>;
	var student_Id =<%=student_Id%>; 
	var length = <%=course_Idlst.size()%>;
	//alert(totalmarks +exam_Id +student_Id +length);
	
	var corse_Id = new Array(<%			
			for(int i = 0; i < course_Idlst.size(); i++) {
				  out.print("\""+course_Idlst.get(i)+"\"");
				  if(i+1 < course_Idlst.size()) {
				    out.print(",");
				  }
				}
				%>);
	
	//alert(corse_Id.toString());
	
			 for ( var i = 0; i < length; i++) {
				 var temp;
				 temp = document.getElementById(corse_Id[i]).value;
				 marks.push(temp);
				}
			 //alert(student_Id);
			 
			 $.ajax
             (
                     {
                         url:'<%=request.getContextPath() + "/dao/FillGradeRp"%>',
                         type:'POST',                         
                        data:{marks : marks.toString(), totalmarks : totalmarks, exam_Id : exam_Id, corse_Id:corse_Id.toString(), student_Id : student_Id},                   
                         cache:false,
                         success:function(data){alert('Report successfull updated.');},
                         error:function(){alert('error');}
                     }
                 );  

		}
	</script>
</body>
</html>