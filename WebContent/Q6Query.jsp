<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Query6</title>
</head>
<body>
<center><a href="welcome.jsp" title="welcome"> Home page </a></center>
<table border="1">
<tr>
<td>Username</td>
</tr>
<%


try
{
Class.forName("com.mysql.cj.jdbc.Driver");
String url="jdbc:mysql://localhost/sampledb";
String username="john";
String password="pass1234";
Connection conn=DriverManager.getConnection(url,username,password);


 
String query="SELECT U.username from user U where U.username not in (SELECT J.authorid FROM jokes J "+
"where J.jokeid in (SELECT R.jokeid from reviews R GROUP BY R.jokeid having sum(score ='Excellent' ) >= 3) GROUP BY J.authorid)";


Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery(query);

while(rs.next())
{
	String Userid=rs.getString("username");

	
%>
    <tr>
    <td><%=Userid %></td>    
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