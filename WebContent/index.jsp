<%@page import="org.omg.CORBA.UserException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>School Management System</title>
<link rel="stylesheet" type="text/css" href="Style/menu.css">
<link href="Style/pictogram-button.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="Style/style.css">
<link href="Style/polaroides.css" rel="stylesheet" type="text/css">
<script src="JavaScript/nav.js" type="text/javascript"></script>
<script src="JavaScript/jquery-1.7.2.min.js" type="text/javascript"></script>
<script type="text/javascript" src="JavaScript/ajax.js"></script>

<script>
	/* -------------------- image preview on registration page --------------------- */

	function preview(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#parentimage').attr('src', e.target.result).width(194)
						.height(200);
			};
			reader.readAsDataURL(input.files[0]);
		}
	}
	function teacherimgpreview(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#teacherimage').attr('src', e.target.result).width(194)
						.height(200);
			};
			reader.readAsDataURL(input.files[0]);
		}
	}

	/* ----------------- below function use to scroll ---------------------- */
	function Scrollto(scroll) {

		$('body,html').animate({
			scrollTop : scroll
		}, 800);
	}

	/* -------------------  below function set fadein and fadeout while scrolling-------------------------------*/
	$(document).ready(function() {

		$(function() {
			$(window).scroll(function() {
				if ($(this).scrollTop() >= 0) {
					$('#back-top').fadeIn();

				} else {
					$('#back-top').fadeOut();
				}
			});

		});
	});
</script>

</head>

<body background="Images/wood.jpg" style="background-repeat: repeat;">

<!-- check if any user is already logged in  -->

<%
String userrole=(String)session.getAttribute("role");
String username=(String)session.getAttribute("username");

if(userrole!=null)
{

	if(userrole.equals("admin"))
	{
		response.sendRedirect(request.getContextPath()+"/admin_home.jsp");
	}
	else if(userrole.equals("student"))
	{
		response.sendRedirect(request.getContextPath()+"/home.jsp");
	}	
	else if(userrole.equals("teacher"))
	{
		response.sendRedirect(request.getContextPath()+"/teacher_home.jsp");
	}
	else if(userrole.equals("parent"))
	{
		
		response.sendRedirect(request.getContextPath()+"/home.jsp");
	}
}

%>


	<!--  -------------------------------------------------------  Setting fixed navigation menu --------------------------------------------------------------------------------- -->


	<div
		style="position: fixed; background-color: #222; left: 0px; top: 0px; width: 100%; z-index: 1000; height: 41px;">


		<ul class="menuTemplate3 decor3_1" license="mylicense"
			style="position: fixed; z-index: 1111; left: 13%;">

			<li><a onclick="Scrollto(0)">Home</a></li>
			<li class="separator"></li>			
			<li><a onclick="Scrollto(580)">Features</a></li>
			<li class="separator"></li>
			<li><a onclick="Scrollto(1250)">About us</a></li>
			<li class="separator"></li>
			<li><a onclick="Scrollto(1850)">Contact us</a></li>

		</ul>
		<div style="position: absolute; width: 100%; height: auto; top: 30px;">
			<hr style="z-index: 1112; width: 100%; top: 10%;" size="3px"
				color="#0099CC" />
		</div>
	</div>


	<!--  -------------------------------------------------------  First page coding --------------------------------------------------------------------------------- -->
	<div style="width: 99%; position: absolute; top: 100px;">

		<div style="position: absolute; left: 13%; width: 450px; top: 100px;">
			<font color="#006699" face="Californian FB" size="+4">Welcome
				to School Management System. </font><br /> <br /> <font face="Tahoma">It's
				a simple, lovely and effective school management system for smaller
				schools.Take attendance and share immediately with parents. <br />
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Enter
				grades and produce beautiful report cards at any time. It's all as
				easy as 1, 2, 3. School management, reinvented.
			</font><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
		</div>
		<div style="right: 13%; top: 50px; position: absolute;"
			class="shadow-div";>
			<form method="post" id="login-form"
				action="controllers/loginController">
				<table>
					<tr>
						<td>Username:</td>
						<td><input type="text" name="userneme" placeholder="Username"
							required></td>
					</tr>
					<tr>
						<td>Password:</td>
						<td><input type="password" name="password"
							placeholder="Password" required></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="checkbox" name="rememberMe" id="rememberMe">Remember
							Me</a> &nbsp; &nbsp; <a href="forgotpass.jsp">Forgot password</a></td>
					</tr>
					<tr></tr>
					<tr>
						<td>&nbsp;&nbsp;</td>
						<td><input id="loginSubmit" class="hide" type="submit"></input><a
							href="javascript:void(0)"
							onclick="document.getElementById('loginSubmit').click()"
							class="button black"> <span class="user"></span> Login
						</a></td>
					</tr>

				</table>
			</form>
		</div>

	</div>


	<!----------------------------------------------------------- Feature page coding ----------------------------------------------------------------------------------- -->
	<div style="position: absolute; width: 99%;  top: 635px;">

		<div id="Features" style="left: 13%; position: absolute;">
			<font color="#006699" face="Californian FB" size="+4">Features</font>
		</div>

		<div style="position: absolute; left: 13%; top: 100px;">
			<ul class="polaroids">
				<li><a title="Student Information"> <img
						src="Images/studinfo.jpg" alt="Roeland!" />
				</a></li>
				<li><a title="Teacher Information"> <img
						src="Images/techerinfo.jpg" alt="Teacher Information" />
				</a></li>
				<li><a title="Parent Access"> <img
						src="Images/parentaccess.jpg" alt="Parent Access" />
				</a></li>
				<li><a title="Attendance"> <img src="Images/attendance.jpg"
						alt="Attendance" />
				</a></li>

				<li><a title="Gradebook"> <img src="Images/gradebook.jpg"
						alt="Gradebook" />
				</a></li>
				<li><a title="Scheduling"> <img src="Images/scheduling.jpg"
						alt="Scheduling" />
				</a></li>
				<li><a title="Email and Message"> <img
						src="Images/email.jpg" alt="Email and Message" />
				</a></li>
				<li><a title="Addmissions"> <img
						src="Images/addmissions.jpg" alt="Addmissions" />
				</a></li>
			</ul>
		</div>

	</div>
	<!--  -------------------------------------------------------  About us page coding --------------------------------------------------------------------------------- -->

	<div style="position: absolute; width: 99%; top: 1300px;">

		<div id="Aboutus" style="left: 13%; position: absolute;">
			<font color="#006699" face="Californian FB" size="+4">About us
			</font>
		</div>



		<div
			style="position: absolute; left: 6%; width: 355px; height: 222px;"
			class="shadow-div">
			<table>
				<tr>
					<td valign="top"><b>Vision</b></td>
					<td>Shaping a better future for mankind by developing
						effective and socially responsible individuals and organizations.<br />
						<br />
					</td>
				</tr>
				<tr>
					<td valign="top"><b>Mission</b></td>
					<td>Nirma University emphasizes on all round development of
						its students. It aims at not only producing good professionals,
						but also good and worthy citizens of a great country aiding in its
						overall progress and development.<br /> It endeavors to treat
						every student as an individual, to recognize their potential and
						to ensure that they receive the best preparation and training for
						achieving their career ambitions and life goals.
					</td>
				</tr>
			</table>
		</div>


		<div class="shadow-div" style="position: absolute; right: 6%;">
			<table>
				<tr>
					
					<td width="250px"><b>
						From presidant desk,</b>
					<br />
					<p>
					"Higher education stands for humanism
							and for adventure of ideas through constant research. If these
							functions are performed well, then it is well with the nation and
							the people."</td>
					<td rowspan="2"><img src="Images/User-icon.png" /></td>
				</tr>
				<tr>
					
					<td></td>
				</tr>
			</table>
		</div>

		<div class="shadow-div"
			style="position: absolute; left: 6%; top: 280px;">
			<table>
				<tr>
					<td valign="top"><b>Goal</b></td>
					<td>To build and develop excellent quality institutions for
						creating and imparting knowledge and training in various fields at
						the undergraduate, post graduate and doctoral levels contributing
						to the development of the state and the nation at large <br />To
						facilitate academic interaction at national and international
						levels in various disciplines<br /> To establish and maintain
						close links with industry in order to make the teaching, research
						and training at the university relevant to the needs of the
						economy at national and global levels <br />To contribute towards
						the enhancement of quality education in the country
					</td>
				</tr>
			</table>
			<div></div>
		</div>


		<!--  -------------------------------------------------------  Contact us page coding --------------------------------------------------------------------------------- -->
		<div style="position: absolute; width: 99%; top: 600px;">

			<div id="Contactus" style="left: 13%; position: absolute;">
				<font color="#006699" face="Californian FB" size="+4">Contact
					us </font>
			</div>


			<div class="shadow-div" style="position: absolute; left: 36%;">
				<table>
					<tr>
						<td width="70px" valign="top">Location:</td>
						<td width="300px">Sarkhej-Gandhinagar Highway, Post :
							Chandlodia, Via : Gota, Ahmedabad - 382 481. Gujarat, India.</td>
					</tr>

					<tr>
						<td>Help Line:</td>
						<td>+91 - 2717 - 241900 to 04</td>
					</tr>
					<tr>
						<td></td>
						<td>+91 - 2717 - 241911 to 15</td>
					</tr>
					<tr>
						<td>Email:</td>
						<td>webmaster@xyz.ac.in</td>
					</tr>
				</table>
			</div>

			<div style="position: absolute; left: 36%; top: 160px;"
				class="shadow-div">
				<iframe width="425" height="350" frameborder="0" scrolling="no"
					marginheight="0" marginwidth="0"
					src="http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Nirma+University,+Gota,+Ahmedabad,+Gujarat,+India&amp;aq=0&amp;oq=nirma+univer&amp;sll=37.0625,-95.677068&amp;sspn=37.735377,86.572266&amp;ie=UTF8&amp;hq=Nirma+University,+Gota,+Ahmedabad,+Gujarat,+India&amp;ll=23.12829,72.544853&amp;spn=0.006295,0.008612&amp;t=m&amp;output=embed"></iframe>
				<br /> <small><a
					href="http://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=Nirma+University,+Gota,+Ahmedabad,+Gujarat,+India&amp;aq=0&amp;oq=nirma+univer&amp;sll=37.0625,-95.677068&amp;sspn=37.735377,86.572266&amp;ie=UTF8&amp;hq=Nirma+University,+Gota,+Ahmedabad,+Gujarat,+India&amp;ll=23.12829,72.544853&amp;spn=0.006295,0.008612&amp;t=m"
					style="color: #0000FF; text-align: left">View Larger Map</a></small>
			</div>

			<div class="shadow-div"
				style="left: 6%; width: auto; position: absolute;">
				<form action="controllers/EmailController" method="post">
				<table>
					<tr>
						<td colspan="2"><font color="#006699"><b>Query to
									Management</b></font></td>
					</tr>
					<tr></tr>
					<tr>
						<td>Subject:</td>
						<td><input type="text" name="querySubject"></td>
					</tr>
					<tr>
						<td>Message:</td>
						<td><textarea rows="6" cols="20" name="queryMsg"></textarea></td>
					</tr>
					<tr>
						<td colspan="2"><br />Enter your details:</td>
					</tr>
					<tr>
						<td>Email:</td>
						<td><input type="text" name="queryEmail"></td>
					</tr>
					<tr>
						<td>Contact no.:</td>
						<td><input type="text" name="queryContact"></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
						<input type="submit" id="emailsubmit" style="visibility: hidden;">
						<a href="javascript:void(0)" onclick="document.getElementById('emailsubmit').click()"
							class="button black"> <span class="email"></span>Send
								Query
						</a></td>
					</tr>
				</table>
				</form>
			</div>

		</div>
</body>
</html>
