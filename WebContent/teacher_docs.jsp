<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="teacher_master.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shared Documents</title>
<script type="text/javascript">
   	function filter (phrase, _id){
		var words = phrase.value.toLowerCase().split(" ");
		var table = document.getElementById(_id);
		var ele;
		for (var r = 1; r < table.rows.length; r++){
			ele = table.rows[r].innerHTML.replace(/<[^>]+>/g,"");
		        var displayStyle = 'none';
		        for (var i = 0; i < words.length; i++) {
			    if (ele.toLowerCase().indexOf(words[i])>=0)
				displayStyle = '';
			    else {
				displayStyle = 'none';
				break;
			    }
		        }
			table.rows[r].style.display = displayStyle;
		}
	}
  </script>
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
		<%
	List<String> uploaddates =  new ArrayList<String>(); 
	
	%>
	<% query = "select upload_time from docs_mst group by upload_time "; 
	   rs = stmt.executeQuery(query);
	   while(rs.next())
	   {
		   uploaddates.add(rs.getString("upload_time")); 		   
	   }
	   System.out.print(uploaddates.size());
	%>

  <div  style="left: 13%; top: 100px; position: absolute;">
			<font color="#006699" face="Californian FB" size="+4">Shared Documents</font>
		</div>
		<a href=<%=request.getContextPath()  + "/teacher_upload.jsp"%> style="position: absolute; left: 20.5%; top: 175px;"><font color="#4C0000" size="4">Upload Documents</font></a>	
		<div
		style="width: 850px; height: auto; top: 100px; position: absolute; left: 13%;"
		class="shadow-div">
		
		<form>
    	<b>Search:</b> <input name="filt" onkeyup="filter(this, 'sf', '1')" type="text">
    	</form> 
		
		<table id="sf" width="820px" class="css" >
		<th class="style" width="300px">Title</th>
		<th class="style">Uploaded by</th>
		<th width="100px" class="style">Date and Time</th>
		
		<%
	
			
		query = "select dm.title, tm.fname,tm.lname, dm.doc_name ,dm.upload_time from docs_mst dm, teacher_mst tm where dm.user_Id = tm.user_Id";
		rs = stmt.executeQuery(query);
		   while(rs.next())
		   {	String uploadtime = rs.getString("upload_time");
		   		String ut = uploadtime.substring(0, 10);
		   		String newDate = utilobj.dateconvert(ut);
			   %><tr><td><a target="_blank" href="teacher_download.jsp?file=<%=rs.getString("doc_name")%>"><%=rs.getString("title") %></a></td><td><%=rs.getString("fname") %> <%=rs.getString("lname") %></td><td><%=newDate%></td>      </tr><%
		   }	
		
		%> 
		
		</table>		
		<%
		
		conn.close();
		
		%>
		
		</div>
	
</body>
</html>