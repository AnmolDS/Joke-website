<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Query5</title>
</head>
<body>
<center><a href="welcome.jsp" title="welcome"> Home page </a></center>
<table border="1">
<tr>
<td>Friend</td>
</tr>
<%


try
{
Class.forName("com.mysql.cj.jdbc.Driver");
String url="jdbc:mysql://localhost/sampledb";
String username="john";
String password="pass1234";
Connection conn=DriverManager.getConnection(url,username,password);

String user1= request.getParameter("UserX");
String user2= request.getParameter("UserY");
 
String query="SELECT X.friendid FROM myfriends X, myfriends Y WHERE "+
"X.username = '"+user1+"' AND Y.username = '"+user2+"' AND X.friendid = Y.friendid";


Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery(query);


while(rs.next())
{
	String friendid=rs.getString("friendid");
	
	
%>
    <tr>
    <td><%=friendid %></td>
    </tr>
        <%

}

%>
    </table>
    <%
    rs.close();
    stmt.close();
    conn.close();
    }
catch(Exception e)
{
    e.printStackTrace();
    }




%>
</body>
</html>