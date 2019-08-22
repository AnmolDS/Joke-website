<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	String url="jdbc:mysql://localhost/sampledb";
	String username="john";
	String password="pass1234";
	Connection conn=DriverManager.getConnection(url,username,password);
        
	String friendID=request.getParameter("fid").toString();
	
	String UserID=session.getAttribute("uid").toString();
	
		
	final String INSERT_QUERY = "DELETE FROM myfriends WHERE friendid='"+ friendID+"' AND username='"+ UserID +"'";
	
	Statement st=conn.createStatement();
	st.executeUpdate(INSERT_QUERY);
	
	RequestDispatcher rs = request.getRequestDispatcher("Account.jsp");
    rs.forward(request, response);
  	
}
    	catch(Exception se)
    	{
			se.printStackTrace();
		}
%>
</body>
</html>