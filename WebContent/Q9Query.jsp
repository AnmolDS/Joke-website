<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Query9</title>
</head>
<body>
<center><a href="welcome.jsp" title="welcome"> Home page </a></center>
<table border="1">
<tr>
<td>Authors</td>
</tr>


<%


try
{
Class.forName("com.mysql.cj.jdbc.Driver");
String url="jdbc:mysql://localhost/sampledb";
String username="john";
String password="pass1234";
Connection conn=DriverManager.getConnection(url,username,password);

 
String query="SELECT U.username FROM user U WHERE U.username NOT IN (SELECT J.authorid FROM jokes J WHERE J.jokeid IN(SELECT R.jokeid FROM reviews R WHERE R.Score = 'Poor') )ORDER BY username;";


Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery(query);

while(rs.next())
{
	String Author=rs.getString("username");
	
%>
    <tr>
    <td><%=Author %></td>
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