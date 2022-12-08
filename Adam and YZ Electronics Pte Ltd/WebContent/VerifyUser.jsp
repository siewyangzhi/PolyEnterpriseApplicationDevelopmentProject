<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String ID =request.getParameter("Loginid");
String Passwd=request.getParameter("Password");

//Step1:Load JDBC Driver;
Class.forName("com.mysql.jdbc.Driver");
//Step2:Define Connection URL
String connUrl="jdbc:mysql://localhost/assignment?user=root&password=root";
//Step3
Connection conn = DriverManager.getConnection(connUrl);
String sql="Select * from admin";
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs =pstmt.executeQuery();
int counter=0;
while(rs.next()){
String Adminid=rs.getString("Adminid");
String Password=rs.getString("Password");
if(ID.equals(Adminid)&&Passwd.equals(Password)){
counter=counter+1;
}
}
if(counter==0){
response.sendRedirect("Login.html");	
}
else if(counter>0){
response.sendRedirect("Admin.jsp");
}
%>
</body>
</html>