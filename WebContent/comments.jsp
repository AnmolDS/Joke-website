<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>JokesList</title>

<center><h2 style="color:blue">Jokes List</h2></center>
</head>

<body>
<form method="post">

<table border="1">
<tr>
<td>ReviewID</td>
<td>Score</td>
<td>Remark</td>
<td>Reviewer</td>
<td>PostTime</td>
</tr>
<%


try
{
Class.forName("com.mysql.cj.jdbc.Driver");
String url="jdbc:mysql://localhost/sampledb";
String username="john";
String password="pass1234";
Connection conn=DriverManager.getConnection(url,username,password);

String Jokeid=request.getParameter("ID").toString();
int jokeid;
jokeid=Integer.parseInt(Jokeid);

String query="SELECT * FROM reviews WHERE jokeid= '"+ jokeid +"'";

Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery(query);

while(rs.next())
{
    int reviewID=rs.getInt("reviewid");
	String score=rs.getString("score");
	String remark= rs.getString("remark");
	String time=rs.getString("submittime");
	String Uname=rs.getString("username");
	
	
%>
    <tr>
    <td><%=reviewID %></td>
    <td><%=score %></td>
    <td><%=remark %></td>
     <td><%=Uname %></td>
    <td><%=time %></td>
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
</form>
</body>
</html> 