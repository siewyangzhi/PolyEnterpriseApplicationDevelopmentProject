<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Adam and YZ Electronics Pte Ltd | Phones</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<!--[if lte IE 8]><script src="assets/css/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets/css/style.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie/v9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie/v8.css" /><![endif]-->
</head>
<body>
<body class="landing">

		<!-- Page Wrapper -->
			<div id="page-wrapper">

				<!-- Header -->	
					<header id="header" class="alt">
						<h1><a href="index.html"></a></h1>
						<nav id="nav">
							<ul>
								<li class="special">
									<a href="#" class="menuToggle"><span>Menu</span></a>
									<div id="menu">
										<ul>
											<li><a href="Index.jsp">Home</a></li>
											<li><a href="#">Sign Up</a></li>
											<li><a href="LoginPage.jsp">Log In</a>
                                             </li>
										</ul>
									</div>
								</li>
							</ul>
						</nav>
					</header>

	

				<!-- One -->
					<section id="one" class="wrapper style1 special">
						<div class="inner">
							<header class="major">
								<%
								String message = request.getParameter("msg");
								try{
									//Step1:Load JDBC Driver;
									Class.forName("com.mysql.jdbc.Driver");
									//Step2:Define Connection URL
									String connUrl="jdbc:mysql://localhost/assignment?user=root&password=root";
									//Step3
									Connection conn = DriverManager.getConnection(connUrl);
									Statement stmt = conn.createStatement();
									String sql = "Select * from products where productName = '" + message + "'";
									ResultSet rs = stmt.executeQuery(sql);
									while(rs.next()){
									String Name = rs.getString("productName");
									out.println("<h2>"+ Name +"</h2>");
									}
									}catch(Exception e){
								
										out.println(e);	
									}
							%>
							</header>
							<!--ul class="icons major">
								<li><span class="icon fa-diamond major style1"><span class="label">Lorem</span></span></li>
								<li><span class="icon fa-heart-o major style2"><span class="label">Ipsum</span></span></li>
								<li><span class="icon fa-code major style3"><span class="label">Dolor</span></span></li>
							</ul-->
						</div>
					</section>
				
				<!-- Two -->
					<section id="two" class="wrapper alt style2">
						<% 
						try{
						//Step1:Load JDBC Driver;
						Class.forName("com.mysql.jdbc.Driver");
						//Step2:Define Connection URL
						String connUrl="jdbc:mysql://localhost/assignment?user=root&password=root";
						//Step3
						Connection conn = DriverManager.getConnection(connUrl);
						Statement stmt = conn.createStatement();
						String sql = "Select * from products where productName = '" + message + "'";
						ResultSet rs = stmt.executeQuery(sql);
						while(rs.next()){
						//String description = rs.getString("prodDescription");	
						String Specs = rs.getString("prodSpecs");
						String Price = rs.getString("price");
						String Path = rs.getString("imagePath");
						out.println("<section class='spotlight'>");
						out.println("<div class='image'><img src='"+ Path +"'height='500px' alt='' /></div><div class='content'>");
						//out.println("<p>"+ description +"</p>");
						out.println("<p>"+ Specs +"</p>");
						out.println("<p>"+ Price +"</p>");
						out.println("</div>");
						out.println("</section>");
						}
						}catch(Exception e){
					
							out.println(e);	
						}
						%>
					</section>
					
				<!-- Three -->
					<section id="three" class="wrapper style2 special">
						<%
						out.println("<h2>Add a Comment:</h2>");%>
						<form action='createComment.jsp' method='post'>
						Name: <input type="text" name="name"><br/>
						Rating: (1 being the worst, 5 being the best) 
						<select name="radio1" size"5">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						</select></br>
						Product: <input type="text" value="<%out.println(message);%>" name="message" readonly><br/>
						Comments: <input type="text" name="comment"><br/>
						<br/>
						<input type="submit" name="btnCreate" value="Submit Comment">
						</form>
					</section>	
					
				<!-- Four -->
					<section id="one" class="wrapper style2 special ">
						<%
						out.println("<h1>Reviews</h1>");
						try{
							//Step1:Load JDBC Driver;
							Class.forName("com.mysql.jdbc.Driver");
							//Step2:Define Connection URL
							String connUrl="jdbc:mysql://localhost/assignment?user=root&password=root";
							//Step3
							Connection conn = DriverManager.getConnection(connUrl);
							Statement stmt = conn.createStatement();
							String sql = "Select * from comments where productName = '" + message + "'";
							ResultSet rs = stmt.executeQuery(sql);
							out.println("<Table>");
							while(rs.next()){
							String details = rs.getString("comments");
							String name = rs.getString("commentName");
							String date = rs.getString("commentDate");
							String rating = rs.getString("productRating");
							out.println("<tr>");
							out.println("<th>");
							out.println("<p>"+ date +"</p>");
							out.println("</th>");
							out.println("<th>");
							out.println("<p>"+ name +"</p>");
							out.println("</th>");
							out.println("<th>");
							out.println("<p>"+ rating +"</p>");
							out.println("</th>");
							out.println("<th>");
							out.println("<p>"+ details +"</p>");
							out.println("</th>");
							out.println("</tr>");
							}
							out.println("</Table>");
							}catch(Exception e){
						
								out.println(e);	
							}
						%>
					</section>

				
				<!-- Footer -->
					<footer id="footer">
						<ul class="copyright">
							<li>&copy; Adam and YZ Electronics Pte Ltd 2015</li>
						</ul>
					</footer>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/init.js"></script>
</body>
</html>