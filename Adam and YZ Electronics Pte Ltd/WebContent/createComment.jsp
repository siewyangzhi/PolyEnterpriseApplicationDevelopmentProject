<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Processing Comment...</title>
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
											<li><a href="Index.html">Home</a></li>
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
					<section id="one" class="wrapper style2 special">
						<div class="inner">
							<header class="major">
								<%
								String prodID = request.getParameter("message");
								try{
									//Step1:Load JDBC Driver;
									Class.forName("com.mysql.jdbc.Driver");
									//Step2:Define Connection URL
									String connUrl="jdbc:mysql://localhost/assignment?user=root&password=root";
									//Step3
									Connection conn = DriverManager.getConnection(connUrl);
									Statement stmt = conn.createStatement();
									String sql = "Select * from products1 where productName = '" + prodID + "'";
									ResultSet rs = stmt.executeQuery(sql);
									while(rs.next()){
									String Name = rs.getString("productName");
									out.println("<section class='spotlight'>");
									out.println("<h2>"+ Name +"</h2>");
									out.println("</div>");
									out.println("</section>");
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
					<section id="two" class="wrapper style2">
					<%
					String name = request.getParameter("name");
					String Rating = request.getParameter("radio1");
					String comments = request.getParameter("comment");
	
					try {
						Class.forName("com.mysql.jdbc.Driver");
						String connURL = "jdbc:mysql://localhost/assignment?user=root&password=root";
						Connection conn = DriverManager.getConnection(connURL);
						String sqlStmt = "INSERT INTO `assignment`.`comments` (`commentName`, `productName`, `productRating`, `comments`) VALUES (?,?,?,?)";
						PreparedStatement stm = conn.prepareStatement(sqlStmt);
						stm.setString(1, name);
						stm.setString(2, prodID);
						stm.setString(3, Rating);
						stm.setString(4, comments);
						int rs = stm.executeUpdate();

						if (rs==1) {
							out.println("Your comment has been submitted!");
						} else {    
							out.println("Your comment has not been submitted, please submit again!");
						}
						%>
						</br>
						<a href="Index.jsp">Back To Main Page</a>
						<%/*if (prodID.matches("P.*")){
							out.println("</br><a href='Phones.jsp'><--Phones Catagory</a>");
						}
						else if (prodID.matches("L.*")){
							out.println("</br><a href='Laptops.jsp'><--Laptops Catagory</a>");
						}
						else if (prodID.matches("T.*")){
							out.println("</br><a href='Tablets.jsp'><--Tablets Catagory</a>");
						}*/						%>
					
					
					 <%} catch (Exception e) {
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