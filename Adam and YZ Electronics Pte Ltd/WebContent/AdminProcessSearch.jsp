<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import = "java.sql.*" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
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
											<li>Welcome Administrator</li>
											<li><a href="Index.jsp">Sign Out</a></li>
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
							<header class="major1">
								<h2>Adminstrator</h2>
							</header>
							<!--ul class="icons major">
								<li><span class="icon fa-diamond major style1"><span class="label">Lorem</span></span></li>
								<li><span class="icon fa-heart-o major style2"><span class="label">Ipsum</span></span></li>
								<li><span class="icon fa-code major style3"><span class="label">Dolor</span></span></li>
							</ul-->
						</div>
					</section>

				<!-- Two -->
					<section id="two" class="wrapper style2 special">
					<%
					String searchbydesc=request.getParameter("searchbydesc");
					String searchbybrand=request.getParameter("searchbybrand");
					if (searchbydesc==""&&searchbybrand=="")
					out.println("You have not key in any value to query,please key in a value.");
					else if(searchbydesc==""){
					try{
						//Step1:Load JDBC Driver;
						Class.forName("com.mysql.jdbc.Driver");
						//Step2:Define Connection URL
						String connUrl="jdbc:mysql://localhost/assignment?user=root&password=root";
						//Step3
						Connection conn = DriverManager.getConnection(connUrl);
						String sql="Select * from products where productName like ?";
						PreparedStatement pstmt = conn.prepareStatement(sql);
						pstmt.setString(1,"%"+searchbybrand+"%");
						ResultSet rs =pstmt.executeQuery();
						out.println("<Table border='1'>");
					    if(!rs.next()){
					    out.println("No records found");	
					    }
					    else{
						do{
						String Brand=rs.getString("productName");
						String Specs=rs.getString("prodSpecs");	
						String price=rs.getString("price");	
						String Img=rs.getString("imagePath");	
						out.println("<tr>");
						out.println("<td>");
						out.println(Brand);
						out.println("</td>");
						out.println("<td>");
						out.println(Specs);
						out.println("</td>");
						out.println("<td>");
						out.println(price);
						out.println("</td>");
						out.println("<td>");
						out.println(Img);
						out.println("</td>");
						out.println("</tr>");
						
						}while(rs.next());
					    }
					out.println("</Table>");
					}catch(Exception e){
					out.println(e);	
					}
					}
					
					else if(searchbybrand==""){
					try{
						//Step1:Load JDBC Driver;
						Class.forName("com.mysql.jdbc.Driver");
						//Step2:Define Connection URL
						String connUrl="jdbc:mysql://localhost/assignment?user=root&password=root";
						//Step3
						Connection conn = DriverManager.getConnection(connUrl);
						String sql="Select * from products where prodSpecs like ?";
						PreparedStatement pstmt = conn.prepareStatement(sql);
						pstmt.setString(1,"%"+searchbydesc+"%");
						ResultSet rs =pstmt.executeQuery();
						out.println("<Table border='1'>");
					    if(!rs.next()){
					    out.println("No records found");	
					    }
					    else{
						do{
							String Brand=rs.getString("productName");
							String Specs=rs.getString("prodSpecs");	
							String price=rs.getString("price");	
							String Img=rs.getString("imagePath");	
							out.println("<tr>");
							out.println("<td>");
							out.println(Brand);
							out.println("</td>");
							out.println("<td>");
							out.println(Specs);
							out.println("</td>");
							out.println("<td>");
							out.println(price);
							out.println("</td>");
							out.println("<td>");
							out.println(Img);
							out.println("</td>");
							out.println("</tr>");
						}while(rs.next());
					    }
					out.println("</Table>");
					}catch(Exception e){
					out.println(e);	
					}
					}
					else{
					out.println("Sorry you cannot search by both brand and description.");	
						
					}
					%>
					</section>


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
							<li>&copy; Adam and Yz Electronics 2016</li>
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