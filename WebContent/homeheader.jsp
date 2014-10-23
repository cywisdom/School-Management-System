<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<link rel="stylesheet" type="text/css" href=<%=request.getContextPath() +"/Style/style.css"%>>
<link rel="stylesheet" type="text/css" href=<%=request.getContextPath() +"/Style/table.css"%>>

<link href=<%=request.getContextPath() +"/Style/pictogram-button.css"%> rel="stylesheet" type="text/css" />
<script src="JavaScript/jquery-1.7.2.min.js" type="text/javascript"></script>
<script type="text/javascript" src="JavaScript/ajax.js"></script>
<link rel="stylesheet" type="text/css" href=<%=request.getContextPath() +"/Style/menu.css"%>>
</head>
<body background=<%=request.getContextPath() +"/Images/wood.jpg"%> style="background-repeat: repeat;">
<div
		style="position: fixed; background-color: #222; left: 0px; top: 0px; width: 100%; z-index: 1000; height: 41px;">


		<ul class="menuTemplate3 decor3_1" license="mylicense"
			style="position: fixed; z-index: 1111; left: 13%;">

			<li><a href=<%=request.getContextPath() +"/index.jsp"%> >Home</a></li>
			<li class="separator"></li>
			<li><a href=<%=request.getContextPath() +"/index.jsp#Registration"%> onclick="Scrollto(570)">Registration</a></li>
			<li class="separator"></li>
			<li><a href=<%=request.getContextPath() +"/index.jsp#Features"%> onclick="Scrollto(1370)">Features</a></li>
			<li class="separator"></li>
			<li><a href=<%=request.getContextPath() +"/index.jsp#Aboutus"%> onclick="Scrollto(2040)">About
					us</a></li>
			<li class="separator"></li>
			<li><a href="index.jsp#Contactus">Contact
					us</a></li>

		</ul>
		<div style="position: absolute; width: 100%; height: auto; top: 30px;">
			<hr style="z-index: 1112; width: 100%; top: 10%;" size="3px"
				color="#0099CC" />
		</div>
	</div>

</body>
</html>