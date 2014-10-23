<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="student_master.jsp" %>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  
        <!-- Bootstrap CSS Toolkit styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css">



<!-- Add jQuery library -->
	<script type="text/javascript" src="slideshow/jquery-1.9.0.min.js"></script>

	<!-- Add mousewheel plugin (this is optional) -->
	<script type="text/javascript" src="slideshow/jquery.mousewheel-3.0.6.pack.js"></script>

	<!-- Add fancyBox main JS and CSS files -->
	<script type="text/javascript" src="slideshow/jquery.fancybox.js?v=2.1.4"></script>
	<link rel="stylesheet" type="text/css" href="slideshow/jquery.fancybox.css?v=2.1.4" media="screen" />

	<!-- Add Button helper (this is optional) -->
	<link rel="stylesheet" type="text/css" href="slideshow/helpers/jquery.fancybox-buttons.css?v=1.0.5" />
	<script type="text/javascript" src="slideshow/helpers/jquery.fancybox-buttons.js?v=1.0.5"></script>

	<!-- Add Thumbnail helper (this is optional) -->
	<link rel="stylesheet" type="text/css" href="../slideshow/helpers/jquery.fancybox-thumbs.css?v=1.0.7" />
	<script type="text/javascript" src="slideshow/helpers/jquery.fancybox-thumbs.js?v=1.0.7"></script>

	<!-- Add Media helper (this is optional) -->
	<script type="text/javascript" src="slideshow/helpers/jquery.fancybox-media.js?v=1.0.5"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			/*
			 *  Simple image gallery. Uses default settings
			 */

			$('.fancybox').fancybox();

			/*
			 *  Different effects
			 */

			// Change title type, overlay closing speed
			$(".fancybox-effects-a").fancybox({
				helpers: {
					title : {
						type : 'outside'
					},
					overlay : {
						speedOut : 0
					}
				}
			});

			// Disable opening and closing animations, change title type
			$(".fancybox-effects-b").fancybox({
				openEffect  : 'none',
				closeEffect	: 'none',

				helpers : {
					title : {
						type : 'over'
					}
				}
			});

			// Set custom style, close if clicked, change title type and overlay color
			$(".fancybox-effects-c").fancybox({
				wrapCSS    : 'fancybox-custom',
				closeClick : true,

				openEffect : 'none',

				helpers : {
					title : {
						type : 'inside'
					},
					overlay : {
						css : {
							'background' : 'rgba(238,238,238,0.85)'
						}
					}
				}
			});

			// Remove padding, set opening and closing animations, close if clicked and disable overlay
			$(".fancybox-effects-d").fancybox({
				padding: 0,

				openEffect : 'elastic',
				openSpeed  : 150,

				closeEffect : 'elastic',
				closeSpeed  : 150,

				closeClick : true,

				helpers : {
					overlay : null
				}
			});

			/*
			 *  Button helper. Disable animations, hide close button, change title type and content
			 */

			$('.fancybox-buttons').fancybox({
				openEffect  : 'none',
				closeEffect : 'none',

				prevEffect : 'none',
				nextEffect : 'none',

				closeBtn  : false,

				helpers : {
					title : {
						type : 'inside'
					},
					buttons	: {}
				},

				afterLoad : function() {
					this.title = 'Image ' + (this.index + 1) + ' of ' + this.group.length + (this.title ? ' - ' + this.title : '');
				}
			});


			/*
			 *  Thumbnail helper. Disable animations, hide close button, arrows and slide to next gallery item if clicked
			 */

			$('.fancybox-thumbs').fancybox({
				prevEffect : 'none',
				nextEffect : 'none',

				closeBtn  : false,
				arrows    : false,
				nextClick : true,

				helpers : {
					thumbs : {
						width  : 50,
						height : 50
					}
				}
			});

			/*
			 *  Media helper. Group items, disable animations, hide arrows, enable media and button helpers.
			*/
			$('.fancybox-media')
				.attr('rel', 'media-gallery')
				.fancybox({
					openEffect : 'none',
					closeEffect : 'none',
					prevEffect : 'none',
					nextEffect : 'none',

					arrows : false,
					helpers : {
						media : {},
						buttons : {}
					}
				});

			/*
			 *  Open manually
			 */

			$("#fancybox-manual-a").click(function() {
				$.fancybox.open('1_b.jpg');
			});

			$("#fancybox-manual-b").click(function() {
				$.fancybox.open({
					href : 'iframe.html',
					type : 'iframe',
					padding : 5
				});
			});

			$("#fancybox-manual-c").click(function() {
				$.fancybox.open([
					{
						href : '1_b.jpg',
						title : 'My title'
					}, {
						href : '2_b.jpg',
						title : '2nd title'
					}, {
						href : '3_b.jpg'
					}
				], {
					helpers : {
						thumbs : {
							width: 75,
							height: 50
						}
					}
				});
			});


		});
	</script>
	<style type="text/css">
		.fancybox-custom .fancybox-skin {
			box-shadow: 0 0 50px #222;
		}
	</style>




<style type="text/css">

/* -------------------------------------------------- */
ul.images {
	width: 970px;
	margin: 0 0 18px -30px;
}

ul.images li {
	display: inline;
}

ul.images a {
	background: #fff;
	display: inline;
	float: left;
	margin: 0 0 4px 4px;
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

ul.images img {
	display: block;
	width: 210px;
	height: 220px;
	margin-bottom: 12px;
}

ul.images a:after {
	content: attr(title);
}
</style>
<title>Image Gallery</title>
</head>
<body>

	<%@ page import="org.sms.util.util"%>
	<%@ page import="java.sql.*"%>
	<%@ page import="java.util.*"%>
	
	<% util utilobj = new util();
	String albumname=request.getParameter("an"); 
	List<String> imagepath = new ArrayList<String>();
	Connection conn = utilobj.connect();%>

	<%
	Statement stmt = conn.createStatement();
	String query = "select image_path from gallery_mst where album_name='"+albumname+"'";
	ResultSet rs = stmt.executeQuery(query);
	while (rs.next()) {	
		imagepath.add(rs.getString("image_path"));
	}
	%>
	
	<div style="left: 13%; top: 100px; position: absolute;">
		<font color="#006699" face="Californian FB" size="+4">Album: <%=albumname %></font>
	</div>
	
	<a class="btn btn-info modal-prev" href="gallery.jsp"; style="position: absolute; left: 17%; top: 175px;">
             
            <span>< Back</span>
        </a>
	<div style="position: absolute; left: 17%; top: 230px;" >
		<ul class="images">
			<% for(int i =0 ;i<imagepath.size();i++){
			
				%>
					<li><a class="fancybox-buttons" data-fancybox-group="button" href="gallery/<%=imagepath.get(i)%>" ><img src="gallery/<%=imagepath.get(i)%>" alt="<%=imagepath.get(i)%>" />
					</a></li>
				<%
				
			} %>	
			
		</ul>

	</div>


<%conn.close(); %>
</body>
</html>