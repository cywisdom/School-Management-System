<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="student_master.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shared Documents</title>
</head>
<body>
<%String filename = request.getParameter("file"); %>

<div  style=" top: 200px; position: absolute; left: 17%;" >


<form action="controllers/FileDownload" method="get">
<font size="6">
Click Download button to start downloading..</font>
<input type="hidden" name="file" value="<%=filename%>">
<input type="submit" style="visibility: hidden;" id="submit">
<a
					href="javascript:void(0)"
					onclick="document.getElementById('submit').click()"
					class="button green"> <span class="download"></span>Download
				</a>
</form>
</div>
</body>
</html>