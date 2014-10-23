<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href=<%=request.getContextPath() +"/Style/style.css"%>>
<link rel="stylesheet" type="text/css" href=<%=request.getContextPath() +"/Style/table.css"%>>
<link href=<%=request.getContextPath() +"/Style/pictogram-button.css"%> rel="stylesheet" type="text/css" />
<!-- <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" /> -->
  <script src=<%=request.getContextPath() +"/JavaScript/jquery-1.9.1.js"%>></script>
  <script src=<%=request.getContextPath() +"/JavaScript/jquery-ui.js"%>></script>
  

  

<style type="text/css">

.ui-menu {
        list-style:none;
        padding: 2px;
        margin: 0;
        display:block;
}
.ui-menu .ui-menu {
        margin-top: -3px;
}
.ui-menu .ui-menu-item {
        margin:0;
        padding: 0;
        width: 100%;
}
.ui-menu .ui-menu-item a {
        text-decoration:none;
        display:block;
        padding:.2em .4em;
        line-height:1.5;
        zoom:1;
}
.ui-menu .ui-menu-item a.ui-state-hover,
.ui-menu .ui-menu-item a.ui-state-active {
        margin: -1px;
}

#search input[type="text"] {
    background: url(Images/search-white.png) no-repeat 10px 6px #444;
    border: 0 none;
    font: bold 12px Arial,Helvetica,Sans-serif;
    color: #d7d7d7;
    width:150px;
    padding: 6px 15px 6px 35px;
    
    text-shadow: 0 2px 2px rgba(0, 0, 0, 0.3); 
    -webkit-box-shadow: 0 1px 0 rgba(255, 255, 255, 0.1), 0 1px 3px rgba(0, 0, 0, 0.2) inset;
    -moz-box-shadow: 0 1px 0 rgba(255, 255, 255, 0.1), 0 1px 3px rgba(0, 0, 0, 0.2) inset;
    box-shadow: 0 1px 0 rgba(255, 255, 255, 0.1), 0 1px 3px rgba(0, 0, 0, 0.2) inset;
    -webkit-transition: all 0.7s ease 0s;
    -moz-transition: all 0.7s ease 0s;
    -o-transition: all 0.7s ease 0s;
    transition: all 0.7s ease 0s;
    }

#search input[type="text"]:focus {
    background: url(Images/search-dark.png) no-repeat 10px 6px #fcfcfc;
    color: #6a6f75;
    width: 200px;
    -webkit-box-shadow: 0 1px 0 rgba(255, 255, 255, 0.1), 0 1px 0 rgba(0, 0, 0, 0.9) inset;
    -moz-box-shadow: 0 1px 0 rgba(255, 255, 255, 0.1), 0 1px 0 rgba(0, 0, 0, 0.9) inset;
    box-shadow: 0 1px 0 rgba(255, 255, 255, 0.1), 0 1px 0 rgba(0, 0, 0, 0.9) inset;
    text-shadow: 0 2px 3px rgba(0, 0, 0, 0.1);
    }





table.headerMenu {
	color: white;
	position: absolute;
	right: 15%;
}

a.menu {
	color: white;
	text-decoration: none;
}

a:HOVER.menu {
	cursor: hand;
	text-decoration: underline;
	color: #0099CC;
}
</style>
</head>
<body background=<%=request.getContextPath() +"/Images/wood.jpg"%> style="background-repeat: repeat;">

<%! String fname=null;
	String lname=null;
	String userrole;
		
%>
<%
userrole=(String)session.getAttribute("role");
String user_Id=(String)session.getAttribute("user_Id");
if(user_Id==null || !(userrole.equals("admin")))
{	response.sendRedirect(request.getContextPath()+"/index.jsp");}

	
	%>
	 
	<div
		style="position: fixed; background-color: #222; left: 0px; top: 0px; width: 100%; z-index: 1000; height: 75px;">

		<div style="position: absolute; top: 2px; left: 5%;">
			<img src=<%=request.getContextPath() +"/Images/logo.jpg"%>>
		</div>
		<div style="position: absolute; right: 1%; top:20px;">
			<a href=<%=request.getContextPath() +"/controllers/loginController"%>  class="button cyan">Sign out</a>
		</div>
		<div style="position:absolute; left:20%; top:20px;">
		<form method="get" id="search" action="/search" >
			  <input name="searchbox" style="z-index: 1222222;" id="searchbox" type="text"  size="40" placeholder="Search students and teachers..." />
		</form>
		</div>
		
		
		<div style="position: absolute; right: 0%; width:800px;">
			<table class="headerMenu">
				<tr>
					<td height="20px" width="150px"><a class="menu" href=<%=request.getContextPath() +"/admin_home.jsp"%>>Home</a></td>
					<td width="150px"><a class="menu" href=<%=request.getContextPath() +"/manage_standard.jsp"%>>Manage Standard</a></td>
					<td width="150px"><a class="menu" href=<%=request.getContextPath() +"/manage_courses.jsp"%>>Manage Courses</a></td>
					<td width="150px"><a class="menu" href=<%=request.getContextPath() +"/admin_attendance.jsp"%>>Attendance</a></td>
						
				</tr>
				<tr>
					<td height="20px"><a class="menu" href=<%=request.getContextPath() +"/admin_schedule.jsp"%>>Schedule</a></td>
					<td><a class="menu" href=<%=request.getContextPath() +"/admin_grade.jsp"%>>Manage Exams</a></td>
					<td><a class="menu" href=<%=request.getContextPath() +"/manage_users.jsp"%>>Manage Users</a></td>
					<td width="150px"><a class="menu" href=<%=request.getContextPath() +"/manage_classroom.jsp"%>>Manage Classrooms</a></td>
					
				</tr>
				<tr>
					<td height="20px"><a class="menu" href=<%=request.getContextPath() +"/admin_docs.jsp"%>>Shared Documents</a></td>
					<td><a class="menu" href=<%=request.getContextPath() +"/admin_gallery.jsp"%>>Image Gallery</a></td>
					<td><a class="menu" href=<%=request.getContextPath() +"/admin_site.jsp"%>>Manage Site</a></td>
					<td><a class="menu" href=<%=request.getContextPath() +"/admin_changepass.jsp"%>>Change Password</a></td>
				
				</tr>
				
			</table>

		</div>


		<div style="position: absolute; width: 100%; height: auto; top: 65px;">
			<hr style="z-index: 1112; width: 100%;" size="3px" color="#0099CC" />
		</div>

	</div>

</body>
</html>