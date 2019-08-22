<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Favorite</title>
</head>
<body>
<% 
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	String url="jdbc:mysql://localhost/sampledb";
	String username="john";
	String password="pass1234";
	Connection conn=DriverManager.getConnection(url,username,password);
        
	String Jokeid=request.getParameter("ID").toString();
	int jokeid;
	jokeid=Integer.parseInt(Jokeid);
	System.out.println(jokeid);
	System.out.println("yeet");
	String UserID=session.getAttribute("uid").toString();
	System.out.println(UserID);
		
	final String INSERT_QUERY = "insert into myfavoritejokes (username,jokeid) values(?,?)";
	PreparedStatement ps=conn.prepareStatement(INSERT_QUERY); 
	
	ps.setString(1, session.getAttribute("uid").toString());
	ps.setInt(2, jokeid);
	int i=ps.executeUpdate();
	
	if(i>0)
	{
		out.println("You have added the joke to you favorites!");
	}
	
    	
}
    	catch(Exception se)
    	{
			se.printStackTrace();
		}
%>
</body>
</html>