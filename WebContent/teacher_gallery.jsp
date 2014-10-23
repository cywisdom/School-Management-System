<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="teacher_master.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Gallery</title>
<style type="text/css">

/* -------------------------------------------------- */
ul.album {
	width: 970px;
	margin: 0 0 18px -30px;
}

ul.album li {
	display: inline;
}

ul.album a {
	background: #fff;
	display: inline;
	float: left;
	margin: 0 0 40px 60px;
	width: auto;
	padding: 10px 10px 15px;
	text-align: center;
	font-family: "Marker Felt", sans-serif;
	text-decoration: none;
	color: #333;
	font-size: 18px;
	-webkit-box-shadow: 0 3px 6px rgba(0, 0, 0, 0);
	-moz-box-shadow: 0 3px 6px rgba(0, 0, 0, 0);
}

ul.album img {
	display: block;
	width: 210px;
	height: 220px;
	margin-bottom: 12px;
}

ul.album a:after {
	content: attr(title);
}
</style>
</head>
<body>
	<%@ page import="org.sms.util.util"%>
	<%@ page import="java.sql.*"%>
	<%@ page import="java.util.*"%>
	<% util utilobj = new util();
	List<String> albumname = new ArrayList<String>();
	List<String> imagepath = new ArrayList<String>();
	Connection conn = utilobj.connect();%>

	<%
	Statement stmt = conn.createStatement();
	String query = "select album_name, image_path from gallery_mst group by album_name";
	ResultSet rs = stmt.executeQuery(query);
	while (rs.next()) {
		albumname.add(rs.getString("album_name"));
		imagepath.add(rs.getString("image_path"));
	}
	%>

	<div style="left: 13%; top: 100px; position: absolute;">
		<font color="#006699" face="Californian FB" size="+4">Albums</font>
	</div>

	<div style="position: absolute; left: 15%; top: 180px;">
		<ul class="album">
			<% for(int i =0 ;i<albumname.size();i++){
			
				%>
					<li><a title="<%=albumname.get(i)%>" href="teacher_album.jsp?an=<%=albumname.get(i)%>"> <img src="gallery/<%=imagepath.get(i)%>" alt="<%=albumname.get(i)%>" />
					</a></li>
				<%
				
			} %>	
		

			
		</ul>

	</div>
	
	<%conn.close(); %> 	
</body>
</html>