<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
										<li>Welcome Administrator</li>
										<li><a href="Index.jsp">Sign out</a> </li> 
										</ul>
									</div>
								</li>
							</ul>
						</nav>
					</header>
					
				<!-- Two -->
				<section id="one" class="wrapper style1 special">
							<header class="major">
								<h2>Administrator</h2>
							</header>
				</section>
				
				<section id="one" class="wrapper style2 special">
				<form action="CategoryAdd.jsp" method="post">
				<h2>Adding Categories into Database </h2>
				Category:<input type="text"	name="CatAdd">
				Description:<input type="text" name="Descrip">
				ImagePath:
				</br><input type="file" name="imgPath" size="40"></br>
				<input type="submit" value="Add" name="submitbtn">
				</form>
				</section>
				
				<section id="one" class="wrapper style2 special">
				<form action="CategoryAdd.jsp" method="post">
				<h2>Searching Categories</h2>
				Category:<input type="text"	name="CatSearch">
				<input type="submit" value="Search" name="submitbtn">
				</form>
				</section>				
				
				
				<section id="one" class="wrapper style2 special">
				<form action="ProductsAdd.jsp" method="post">
				<h2>Adding Products into Database </h2>
				Category: 
				<select name="category">
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
						String category=rs.getString("Catergory");
						out.println("<option value='"+category+"'>"+category+"</option>");
						}
						}catch(Exception e){
							
							out.println(e);	
						}
					%>
					</select>
					Name:<input type="text" name="Name">
					Description:<input type="text" name="Description">
					Price:<input type="text" name="Price">
					ImagePath:
					</br><input type="file" name="imgPath" size="40"></br>
					<input type="submit" value="Add" name="submitbtn">
					</form>
					<br/>
					<br/>
					<form action="AdminProcessSearch.jsp" action="post">
					<h2>Searching products</h2>
					Search Phone by brand:<input type="Text" name="searchbybrand"> 
					<br/>OR<br/><br/>
					Search Phone by description:
					<input type="Text" name="searchbydesc"> <input type="submit" value="Search" name="submitbtn">
					</form>
					</section>
				
				<!-- Footer -->
					<footer id="footer">
						<ul class="copyright">
							<li>&copy; Adam and Yz Electronics 2016</li>
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