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
<% try{
String name=request.getParameter("Name");
String price=request.getParameter("Price");
String descrip=request.getParameter("Description");
String category=request.getParameter("category");
String path=request.getParameter("imgPath");
//Step1:Load JDBC Driver;
Class.forName("com.mysql.jdbc.Driver");
//Step2:Define Connection URL
String connUrl="jdbc:mysql://localhost/assignment?user=root&password=root";
//Step3
Connection conn = DriverManager.getConnection(connUrl);
String sql="insert into products values (?,?,?,?,?)";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1,name);
pstmt.setString(2,descrip);
pstmt.setString(3,price);
pstmt.setString(4,path);
pstmt.setString(5,category);
int rs =pstmt.executeUpdate();
						
		}catch(Exception e){
		out.println(e);	
		}
%>
</body>
</html>