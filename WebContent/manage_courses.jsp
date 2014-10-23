<%@page import="org.json.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="admin_master.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Courses</title>
<script language="javascript" type="text/javascript">  

function testvalidation()
{
	var courseName = document.getElementById("courseName").value;
	var courseCode = document.getElementById("courseCode").value;
	if(courseName=="" || courseName==null)
		{
		alert("Course name can't be empty.");
		return false;
		}
	else if(courseCode=="" || courseCode==null)
		{
		alert("Course code can't be empty.");
		return false;
		}
	else{return true;}
	
	}
	
      var xmlHttp  
      var xmlHttp
      function showState(str){
      if (typeof XMLHttpRequest != "undefined"){
      xmlHttp= new XMLHttpRequest();
      }
      else if (window.ActiveXObject){
      xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
      }
      if (xmlHttp==null){
      alert("Browser does not support XMLHTTP Request")
      return;
      } 
      var url="courseList.jsp";
      url +="?count=" +str;
      xmlHttp.onreadystatechange = stateChange;
      xmlHttp.open("GET", url, true);
      xmlHttp.send(null);
      }

      function stateChange(){   
      if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
      document.getElementById("courses").innerHTML=xmlHttp.responseText   
      }   
      }

      </script>  

</head>
<body >

<%@ page import="org.sms.util.util"%>
	<%@ page import="java.sql.*"%>
	<%@ page import="java.util.*"%>
	<%!util utilobj = new util();
	Connection conn = utilobj.connect();
	List<String> courses = new ArrayList<String>();
	%>
<div style="left: 13%; top: 100px; position: absolute;">
		<font color="#006699" face="Californian FB" size="+4">Manage Courses </font>
	</div>

<div style="width: 750px; top: 100px; height: 350px; position: absolute; left: 13%;"
		class="shadow-div">
	
	<form method="post" action="dao/ManageCourses">
		
<div style=" position:absolute; width: 350px;"  >
<h3><font color="#006699">Add Course:</font></h3>
	<table>
	<tr>
	<td>Select Standard:</td>
	
	<td><select id="standards" name="standards">

							<%
								Statement stmt = conn.createStatement();
								String query = "select * from grade_mst";
								ResultSet rs = stmt.executeQuery(query);
								while (rs.next()) {
									String str = rs.getString("name");
							%>
							<option value="<%=str%>"><%=str%></option>
							<%
								}
							%>

					</select></td>		
					
	</tr>
	<tr><td>Courses name:</td>
	<td>
	 <input type="text" id="courseName" name="courseName">
	</td>	
	</tr>
	<tr><td>Course code:</td><td><input type="text" id="courseCode" name="courseCode"></td></tr>
	<tr><td>
	Course Description:
	</td>
	<td>
	<textarea rows="8" cols="22"  name="courseDesc"></textarea>
	</td>
	</tr>
	<tr><td colspan="2" align="center"><input onclick="testvalidation()"  value="Add Course" name="addCourse" type="submit"></td></tr>
	</table>
</div>


<div style=" width: 350px; position: absolute; right: 3%;"  >
<h3><font color="#006699">Remove Course:</font></h3>
	<table>
	<tr>
	<td>Select Standard:</td>
	<td>
	
	     <select name='standard' onchange="showState(this.value)">  
       <option value="none">Select</option>
        
    <%  
  rs = stmt.executeQuery("Select grade_Id,name from grade_mst");
 while(rs.next()){
     %>
      <option value="<%=rs.getString("grade_Id")%>"><%=rs.getString("name")%></option>  
      <%
 }
     %>
      </select>  
 
	
	</td>
	</tr>
	<tr><td height="10px"></td></tr>
	<tr>
	<td>Avalible Courses:</td>
	<td>
	
<div id='courses'>  
      <select name='courses' size="8" style="width: 150px;">  
      <option value='-1'></option>  
      </select>  
      </div>
	
	</td>
	</tr>
	<tr><td height="10px"></td></tr>
	<tr>
	<td colspan="2" align="center"><input type="submit" value="Remove Course" name="removeCourse"></td>
	</tr>
</table></div>

</form>
</div>

</body>
</html>