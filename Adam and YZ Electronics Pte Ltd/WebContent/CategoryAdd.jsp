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
try{
String cat=request.getParameter("CatAdd");
String description=request.getParameter("Descrip");
String img=request.getParameter("imgPath");
String link="";
	//Step1:Load JDBC Driver;
	Class.forName("com.mysql.jdbc.Driver");
	//Step2:Define Connection URL
	String connUrl="jdbc:mysql://localhost/assignment?user=root&password=root";
	//Step3
	Connection conn = DriverManager.getConnection(connUrl);	
String sql="insert into catergory values (?,?,?,?)";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1,cat);
pstmt.setString(2,description);
pstmt.setString(3,img);
pstmt.setString(4,link);
int rs =pstmt.executeUpdate();
if( rs==1){
out.println("Sucessfully Updated");	
}
else{
out.println("Update fail");	
}
}catch(Exception e){
	out.println(e);	
	}
%>

</body>
</html>