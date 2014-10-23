<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" href="Style/style.css">
<link rel="stylesheet" type="text/css" href="Style/table.css">
<link href="Style/pictogram-button.css" rel="stylesheet" type="text/css" />
<!-- <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" /> -->
  <script src="JavaScript/jquery-1.9.1.js"></script>
  <script src="JavaScript/ui/1.10.2/jquery-ui.js"></script>
<script type="text/javascript">

jQuery(function(){
	var availableTags = [
	                     "ActionScript",
	                     "AppleScript",
	                     "Asp",
	                     "BASIC",
	                     "C",
	                     "C++",
	                     "Clojure",
	                     "COBOL",
	                     "ColdFusion",
	                     "Erlang",
	                     "Fortran",
	                     "Groovy",
	                     "Haskell",
	                     "Java",
	                     "JavaScript",
	                     "Lisp",
	                     "Perl",
	                     "PHP",
	                     "Python",
	                     "Ruby",
	                     "Scala",
	                     "Scheme"
	                   ];
	
	$("#searchbox").autocomplete({source: availableTags});
	});
	

</script>
<style type="text/css">
#search {

}

ui-helper-hidden{display:none}
.ui-helper-hidden-accessible{border:0;clip:rect(0 0 0 0);
height:1px;margin:-1px;overflow:hidden;padding:0;
position:absolute;width:1px}

.ui-helper-reset{margin:0;padding:0;border:0;outline:0;
line-height:1.3;text-decoration:none;font-size:100%;list-style:none}


.ui-autocomplete{position:absolute;top:0;left:0;cursor:default;z-index: 11222222;}

.ui-menu{list-style:none;padding:2px;margin:0;display:block;outline:0}

.ui-menu .ui-menu{margin-top:-3px;position:absolute}

.ui-menu .ui-menu-item{margin:0;padding:0;width:100%}

.ui-menu .ui-menu-divider{margin:5px -2px 5px -2px;height:0;font-size:0;line-height:0;border-width:1px 0 0}

.ui-menu .ui-menu-item a{font-family:fantasy;display:block;padding:2px .4em;line-height:1.5;min-height:0;font-weight:400}

.ui-menu .ui-menu-item a.ui-state-focus,.ui-menu .ui-menu-item a.ui-state-active{font-weight:400;margin:-1px}

.ui-menu .ui-state-disabled{font-weight:400;margin:.4em 0 .2em;line-height:1.5}




.ui-widget .ui-widget{font-size:1em}

.ui-widget input,.ui-widget select,.ui-widget textarea,.ui-widget button{font-family:Trebuchet MS,Tahoma,Verdana,Arial,sans-serif;font-size:1em}
.ui-widget-content{border:1px solid #ddd;background:#222 url(images/ui-bg_highlight-soft_100_eeeeee_1x100.png) 50% top repeat-x;color:white}.ui-widget-content a{color:white}
.ui-widget-header{border:1px solid #e78f08;background:#f6a828 url(images/ui-bg_gloss-wave_35_f6a828_500x100.png) 50% 50% repeat-x;color:white;font-weight:bold}

.ui-widget-header a{color:#222}
.ui-state-default,.ui-widget-content .ui-state-default,.ui-widget-header .ui-state-default{border:1px solid #ccc;background:#f6f6f6 url(images/ui-bg_glass_100_f6f6f6_1x400.png) 50% 50% repeat-x;font-weight:bold;color:#1c94c4}
.ui-state-hover,.ui-widget-content .ui-state-hover,.ui-widget-header .ui-state-hover,.ui-state-focus,.ui-widget-content .ui-state-focus,.ui-widget-header .ui-state-focus{background:#0099CC url(images/ui-bg_glass_100_fdf5ce_1x400.png) 50% 50% repeat-x;font-weight:bold;color:white}





.ui-widget-overlay{background:#222 url(images/ui-bg_diagonals-thick_20_666666_40x40.png) 50% 50% repeat;opacity:.5;filter:Alpha(Opacity=50)}
.ui-widget-shadow{margin:-5px 0 0 -5px;padding:5px;background:#000 url(images/ui-bg_flat_10_000000_40x100.png) 50% 50% repeat-x;opacity:.2;filter:Alpha(Opacity=20);border-radius:5px}

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
	right: 20%;
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
<body background="Images/wood.jpg" style="background-repeat: repeat;">

<%! String fname=null;
	String lname=null;
	String userrole;
		String student_Id =null;
%>
<%
userrole=(String)session.getAttribute("role");
String user_Id=(String)session.getAttribute("user_Id");
String activeFlag=(String)session.getAttribute("active_flag");
student_Id = (String) session.getAttribute("student_Id");

if(user_Id==null || !(userrole.equals("student") || userrole.equals("parent")))
{	response.sendRedirect(request.getContextPath()+"/index.jsp");}

else if(student_Id==null)
{
	response.sendRedirect(request.getContextPath()+"/StudentRegistration.jsp");
}
	
	%>
	
	<div
		style="position: fixed; background-color: #222; left: 0px; top: 0px; width: 100%; z-index: 1000; height: 75px;">

		<div style="position: absolute; top: 2px; left: 5%;">
			<img src="Images/logo.jpg">
		</div>
		<div style="position: absolute; right: 8%; top:15px;">
			<a href="controllers/loginController" class="button cyan">Sign out</a>
		</div>
		<div style="position:absolute; left:24%; top:20px;">
		<form method="get" id="search" action="/search" >
			  <input name="searchbox" style="z-index: 1222222;" id="searchbox" type="text"  size="40" placeholder="Search students and teachers..." />
			
		</form>
		</div>
		
		<% 
		if(userrole.equals("student")){
		%>
		<div>
			<table class="headerMenu">
				<tr>
					<td height="20px" width="150px"><a class="menu" href="home.jsp">Home</a></td>
					<td width="150px"><a class="menu" href="profile.jsp">Profile</a></td>					
					<td width="150px"><a class="menu" href="attendance.jsp">Attendance</a></td>
				</tr>
				<tr>
					<td height="20px"><a class="menu" href="schedule.jsp">Schedule</a></td>
					<td><a class="menu" href="grade.jsp">Grade Report</a></td>					
					<td><a class="menu" href="change_password.jsp">Change Password</a></td>
				</tr>
				<tr>
					<td height="20px"><a class="menu" href="docs.jsp">Documents</a></td>
					<td><a class="menu" href="gallery.jsp">Gallery</a></td>					
					
				</tr>
			</table>

		</div>
		<% }
		else{ %>	
					<div>
			<table class="headerMenu" >
				<tr>
					<td height="20px" width="150px"><a class="menu" href="home.jsp">Home</a></td>
					<td  width="150px"><a class="menu" href="grade.jsp">Grade Report</a></td>					
					<td width="150px"><a class="menu" href="attendance.jsp">Attendance</a></td>
				</tr>
				<tr>
					<td height="20px"><a class="menu" href="schedule.jsp">Schedule</a></td>
					<td height="20px"><a class="menu" href="docs.jsp">Documents</a></td>					
					<td><a class="menu" href="change_password.jsp">Change Password</a></td>
				</tr>
				<tr>
					
					<td ><a class="menu" href="gallery.jsp">Gallery</a></td>					
					
				</tr>
			</table>

		</div>
		<%	
		}
		%>

		<div style="position: absolute; width: 100%; height: auto; top: 65px;">
			<hr style="z-index: 1112; width: 100%;" size="3px" color="#0099CC" />
		</div>

	</div>

</body>
</html>