<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Most$ofJokesByAuthor</title>
</head>
<body>
<center><a href="welcome.jsp" title="welcome"> Home page </a></center>
<form method="post">

<table border="1">
<tr>
<td>Author</td>
</tr>
<%


try
{
Class.forName("com.mysql.cj.jdbc.Driver");
String url="jdbc:mysql://localhost/sampledb";
String username="john";
String password="pass1234";
Connection conn=DriverManager.getConnection(url,username,password);
 
String query= "SELECT authorid, COUNT(authorid) FROM jokes WHERE posttime >= '2018-03-01'"+
"GROUP BY authorid HAVING COUNT(authorid)=(SELECT MAX(mycount) FROM "+
"(SELECT authorid, COUNT(authorid) mycount FROM jokes GROUP BY authorid)AS J)";


Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery(query);

while(rs.next())
{

	String Author=rs.getString("authorid");
	
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