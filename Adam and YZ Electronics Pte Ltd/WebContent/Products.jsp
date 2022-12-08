

<%@page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Adam and YZ Electronics Pte Ltd | Laptops</title>
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
											<li><a href="LoginPage.jsp">Log In</a>
                                             </li>
										</ul>
									</div>
								</li>
							</ul>
						</nav>
					</header>

	            <% String Catergory =request.getParameter("user");%>

				<!-- Two -->
					<section id="one" class="wrapper style1 special">
						<div class="inner">
							<header class="major">
								<h2><%out.println(Catergory);%></h2>
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
						String sql = "Select * from products where Catergory='"+Catergory+"'";
						ResultSet rs =stmt.executeQuery(sql);
						while(rs.next()){
						String comName = rs.getString("productName");				
						String comSpecs = rs.getString("prodSpecs");
						//String description = rs.getString("prodDescription");
						String comPrice = rs.getString("price");
						String comPath = rs.getString("imagePath");
						out.println("<section class='spotlight'>");
						out.println("<div class='image'><img src='"+ comPath +"'height='500px' alt='' /></div><div class='content'>");
						out.println("<h2> <a href='productDetails.jsp?msg="+comName +"'> "+ comName + "</a></h2>");
						//out.println("<p>"+ description +"</p>");
						out.println("<p>"+ comSpecs +"</p>");
						out.println("<p>"+ comPrice +"</p>");
						out.println("</div>");
						out.println("</section>");
						}
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
</body>
</html>