<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<link rel="stylesheet" type="text/css" href="Style/style.css">
<link href="Style/pictogram-button.css" rel="stylesheet" type="text/css" />


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Registration</title>

<script type="text/javascript">
	var xmlHttp
	var xmlHttp
	function showState(str) {
		if (typeof XMLHttpRequest != "undefined") {
			xmlHttp = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		if (xmlHttp == null) {
			alert("Browser does not support XMLHTTP Request")
			return;
		}
		var url = "sectionList.jsp";
		url += "?count=" + str;
		xmlHttp.onreadystatechange = stateChange;
		xmlHttp.open("GET", url, true);
		xmlHttp.send(null);
	}

	function stateChange() {
		if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {
			document.getElementById("sections").innerHTML = xmlHttp.responseText
		}
	}
	


/* -------------------- hiding some buttons --------------------------- */

$(document).ready(function() {
    $("imageUpload").hide();
});

/* -------------------- validator --------------------------- */

function testvalidations()
{
	
	
	var str=document.getElementById("course").value;
	var password = $("#newpassword").val();
    var confirmPassword = $("#confirmPassword").val();
    var x=document.forms["regForm"]["email"].value;
    var atpos=x.indexOf("@");
    var dotpos=x.lastIndexOf(".");
    
    var course="Please select course.";
    var passwordmatch="Passwords does not match.";
    var pmno="Invalid permanant home mobile number.";
    var cmno="Invalid current home mobile number.";
    var email="Invalid email address.";
    
    if(str=="---Select your standard---"){
 		alert(course);
 		return false;
 	}
 	else if(password != confirmPassword){
 	alert(passwordmatch);
 	return false;
 	}
 	else if(validatehomemobileno() == false){
 	alert(pmno);
 	return false;		
 	}
 	else if(validatecurrentmobileno() == false){
 	alert(cmno);
 	return false;
 	}
 	else if(atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length){
 	alert(email);
 	return false;		 		
 	}
 	else{return true;}
	
}
/* ----------------------- mobile number validators------------ */
function validatehomemobileno()
{

var mobile = document.getElementById("pmno").value;
var pattern = /^\d{10}$/;
if(mobile=="" || mobile==null)
	{
		return true;
	}
else{
	
	if (pattern.test(mobile)) {
        return true;
    } 
        return false;
}
}

/* ----------------------- mobile number validators------------ */
function validatecurrentmobileno()
{


var mobile = document.getElementById("cmno").value;
var pattern = /^\d{10}$/;
if(mobile=="" || mobile==null)
	{
	return true;
	}
else{if (pattern.test(mobile)) {
    return true;
} 
    return false;}
}

function isNumberKey(evt)
{
   var charCode = (evt.which) ? evt.which : event.keyCode
   if (charCode > 31 && (charCode < 48 || charCode > 57))
      return false;

   return true;
}
/* -------------------- image preview on registration page --------------------- */
function readURL(input)
{
      if (input.files && input.files[0])
              {
                    var reader = new FileReader();
                   reader.onload = function (e)
                                          {
                                                $('#blah')
                                                .attr('src',e.target.result)
                                                .width(194)
                                                .height(200);
                                          };
                   reader.readAsDataURL(input.files[0]);
                   }
}


</script>
<script src="JavaScript/jquery-1.7.2.min.js" type="text/javascript"></script>
<script type="text/javascript" src="JavaScript/ajax.js"></script>
</head>
<body background="Images/wood.jpg" style="background-repeat: repeat;">
<%@ page import="org.sms.util.util"%>
	<%@ page import="java.sql.*"%>
	<%!util utilobj = new util();	
	Connection conn = utilobj.connect();
	ResultSet rs;
	Statement stmt;
	%>
	<%
	stmt = conn.createStatement();
	String userrole=(String)session.getAttribute("role");
String user_Id=(String)session.getAttribute("user_Id");
String activeFlag=(String)session.getAttribute("active_flag");
String username = (String)session.getAttribute("username");
if(user_Id==null || !(userrole.equals("student")))
{	response.sendRedirect(request.getContextPath()+"/index.jsp");}

	%>
	
	<div style="position: absolute; right: 5%; ">
			<a href="controllers/loginController" >Sign out</a>
		</div>
	
	<div style="position: absolute; left: 14%; top:18%;">
	
	<font color="#4C0000" size="4">Hello <%=username%>, as you are not in system records you need to fill the registration form.</font>
	</div>
		<div id="studentregform">
		
		<div  style="left: 13%; top:5%; position: absolute;">
			<font color="#006699" face="Californian FB" size="+4">Student Registration
			</font>
		</div>
		
			<form method="post" id="login-form" name="regForm"
				onsubmit="return testvalidations()" enctype="multipart/form-data"
				action="controllers/StudentRegistrationController">

				<div class="shadow-div"
					style="width: 200px; top: 7%; height: 250px; position: absolute; left: 6%;">



					<table>
						<tr>
							<td height="200px" width="200px"><img src="Images/user.png"
								id="blah" name="userImage" height="200px" width="194px"></td>
						</tr>
						<tr>
							<td height="36px" align="left" valign="top"><input
								type='file' id="imageUpload" class="hide"
								onchange="readURL(this)" name="file"><a
								href="javascript:void(0)" class="button black"
								onclick="document.getElementById('imageUpload').click()"> <span
									class="upload"></span>Upload
							</a></input></td>
						</tr>
					</table>

				</div>
				<div class="shadow-div"
					style="right: 8%; width: 600px; top: 7%; position: absolute;">

					<table height="172">
						<tr>
							<td>*First Name:</td>
							<td><input type="text" name="fname" placeholder="First Name"
								required></td>

							<td>*Standard:</td>
							<td><select name='standard' style="width: 150px;" onchange="showState(this.value)">
							<option value="none">--Select Standard--</option>

							<%
								rs = stmt.executeQuery("Select grade_Id,name from grade_mst");
								while (rs.next()) {
							%>
							<option value="<%=rs.getString("grade_Id")%>"><%=rs.getString("name")%></option>
							<%
								}
							%></td>
						</tr>
						<tr>
							<td>*Middle Name:</td>
							<td><input type="text" name="mname"
								placeholder="Middle Name" required></td>

							<td>*Section:</td>
							<td>
							<div id='sections'>
							<select name='sections' style="width: 150px;">
								<option value='-1'></option>
							</select>					
							</td>

						</tr>
						<tr>
							<td>*Last Name:</td>
							<td><input type="text" name="lname" placeholder="Last Name"
								required></td>

								<td>Email:</td>
							<td><input type="email" name="email"
								placeholder="abc@xyz.com" required></td>
							
						</tr>
						<tr>
							<td>*Birth date:</td>
							<td><input type="text" name="dob" placeholder="Birth Date"
								required></td>
							<td>*Reg. no.</td>
							<td><input type="text" name="regno"
								placeholder="Registration number" required></td>

						</tr>
						<tr>
							<td>*Gender:</td>
							<td><input type="radio" name="gender" value="male"
								autocomplete="off" required>Male<br> <input
								type="radio" name="gender" value="female">Female</td>
							<td>*Password:</td>
							<td><input type="password" id="newpassword"
								name="newpassword" required></td>
							
						</tr>
						<tr>
							<td>Joining year:</td>
							<td><select name="year" required><option>2013</option>
									<option>2012</option>
									<option>2011</option>
									<option>2010</option>
									<option>2009</option>
									<option>2008</option>
									<option>2097</option></td>
							<td>*Confirm Password:</td>
							<td><input type="password" id="confirmPassword"
								name="confirmPassword" required></td>
						</tr>
						
						<tr>
							<td >*Address line 1:</td>
							<td ><textarea rows="2" id="addressLine1"
									name="addressLine1" cols="17" required></textarea></td>
							
						
							<td>Home ph.:</td>
							<td width="178"><input type="text" maxlength="11"
								name="phpn" id="phpn" placeholder="Home ph."
								onkeypress="return isNumberKey(event)" autocomplete="off"><br /></td>
								
						</tr>
						
						<tr>
						<td rowspan="2">*Address line 2:</td>
							<td rowspan="2"><textarea rows="2" id="addressLine2"
									name="addressLine2" cols="17" ></textarea></td>
							
									
							<td>Mobile no.:</td>
							<td><input type="text" name="pmno" id="pmno"
								placeholder="Mobile no." maxlength="10"
								onkeypress="return isNumberKey(event)" autocomplete="off"></td>
						</tr>
						
						<tr>
							
							
							
							<td>Fax:</td>
							<td><input type="text"
								onkeypress="return isNumberKey(event)" name="pfax" id="pfax"
								maxlength="11" placeholder="Fax" autocomplete="off"></td>
						</tr>
						
						<tr>
							<td>About me:</td>
							<td><textarea rows="4" id="aboutme" name="aboutme" cols="17"></textarea></td>
							<td>Interests:</td>
							<td><textarea rows="4" id="interests" name="interests"
									cols="17"></textarea></td>
						</tr>
						<tr>
							<td colspan="4">* fields are mendetory.</td>
						</tr>

						<tr>
							<td colspan="4" align="center"><input id="regSubmit"
								class="hide" type="submit"></input><a href="javascript:void(0)"
								onclick="document.getElementById('regSubmit').click()"
								class="button green"> <span class="adduser"></span> Register
									me!
							</a></td>
						</tr>

					</table>

				</div>
			</form>
		</div>
	</div>
	<!-- div registration ends -->

</body>
</html>