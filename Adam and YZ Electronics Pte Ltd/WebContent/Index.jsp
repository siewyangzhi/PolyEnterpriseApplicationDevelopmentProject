<%@page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Adam and Yz's Electronics</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<!--[if lte IE 8]><script src="assets/css/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets/css/style.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie/v9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie/v8.css" /><![endif]-->
	</head>
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
											<li><a href="Login.html">Log In</a>
											
                                             </li>
										</ul>
									</div>
								</li>
							</ul>
						</nav>
					</header>

				<!-- Banner -->
					<section id="banner">
						<div class="inner">
							<h2>ADAM AND YZ ELECTRONICS PTE LTD</h2>
							<p>The one stop for all your favourite electronics.</p>
						</div>
						<a href="#one" class="more scrolly">Learn More</a>
					</section>

				<!-- One -->
					<section id="one" class="wrapper style1 special">
						<div class="inner">
							<header class="major">
								<h2>Products</h2>
								<p>Uniquely Design Products for people of all ages.</p>
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
						String sql = "Select * from catergory";
						ResultSet rs =stmt.executeQuery(sql);
						while(rs.next()){
						String categories=rs.getString("Catergory");				
						String desc=rs.getString("Description");
						String path=rs.getString("Path");
						String url = rs.getString("catLink");
						out.println("<section class='spotlight'>");
						out.println("<div class='image'><img src='"+path+"'height='500px' alt='' /></div><div class='content'>");
						out.println("<h2> <a href='Products.jsp"+"?user="+categories+"'>"+ categories + "</a></h2>");
						out.println("<p>"+desc+"</p>");
						out.println("</div>");
						out.println("</section>");
						}
						}catch(Exception e){
							
							out.println(e);	
						}
						%>
					</section>

				<!-- Three -->
					<section id="three" class="wrapper style3 special">
						<div class="inner">
							<header class="major">
								<h2>Other Services</h2>
							
							</header>
							<ul class="features">
								<li class="icon fa-paper-plane-o">
								<a href = "location.html">
									<h3>Locations</h3>
									<p>Store Locations In Singapore.</p>
								</a>
								</li>
								<li class="icon fa-laptop">
									<h3>Online Warranty</h3>
									<p>Activate your warranty online with ease.</p>
								</li>
								<li class="icon fa-code">
								<h3>Delivery Services</h3>
									<p>Day Or Night Hassle-Free Delivery</p>
								</li>
								<li class="icon fa-headphones">
									<h3>Shops Background</h3>
									<p>The colourful history of the electronic store that all Singaporeans love.</p>
								</li>
							</ul>
						</div>
					</section>

				<!-- CTA -->

				<!-- Footer -->
					<footer id="footer">
						<ul class="icons">
							<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
							<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
							<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
							<li><a href="#" class="icon fa-dribbble"><span class="label">Dribbble</span></a></li>
							<li><a href="#" class="icon fa-envelope-o"><span class="label">Email</span></a></li>
						</ul>
						<ul class="copyright">
							<li>&copy;ADAM AND YZ ELECTRONICS PTE LTD 2015</li>
						</ul>
					</footer>

			</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/init.js"></script>

	</body>

</html>