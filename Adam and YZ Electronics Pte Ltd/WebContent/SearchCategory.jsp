<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
String catergory=request.getParameter("CatSearch");
if (catergory==""){
out.println("You have not key in any value to query,please key in a value.");
}
else{
try{
//Step1:Load JDBC Driver;
Class.forName("com.mysql.jdbc.Driver");
//Step2:Define Connection URL
String connUrl="jdbc:mysql://localhost/assignment?user=root&password=root";
//Step3
Connection conn = DriverManager.getConnection(connUrl);
String sql="Select * from inventory where Brand like ?";	


}catch(Exception e){
out.println(e);	
}	
}
%>
</body>
</html>