<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Query3</title>
</head>
<body>
<center><a href="welcome.jsp" title="welcome"> Home page </a></center>
<form method="post">

<table border="1">
<tr>
<td>JokeID</td>
<td>Title</td>
<td>Description</td>
<td>Author</td>
<td>Tag</td>
<td>PostTime</td>
<td><center>Action</center></td>
</tr>

<%


try
{
Class.forName("com.mysql.cj.jdbc.Driver");
String url="jdbc:mysql://localhost/sampledb";
String username="john";
String password="pass1234";
Connection conn=DriverManager.getConnection(url,username,password);

String user= request.getParameter("user");

String query="SELECT * from jokes J WHERE J.authorid = '"+user+"' AND J.jokeid IN"+
"(SELECT R.jokeid FROM reviews R "+
"WHERE Score = 'Excellent' OR Score = 'Good')";

Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery(query);

while(rs.next())
{
	int JokeID=rs.getInt("jokeid");
	String title=rs.getString("title");
	String description= rs.getString("description");
	String authorid=rs.getString("authorid");
	String tags=rs.getString("tag");
	String date=rs.getString("posttime");
	
%>
    <tr>
    <td><%=JokeID %></td>
    <td><%=title %></td>
    <td><%=description %></td>
    <td><a href=<%="friends.jsp?authorid="+authorid%>><%=authorid %></a></td>
     <td><%=tags %></td>
    <td><%=date %></td>
    <td><a href=<%="favorite.jsp?ID="+JokeID%>>Favorite</a>
    <a href=<%="jokereview.jsp?ID="+JokeID%>>Review</a>
     <a href=<%="comments.jsp?ID="+JokeID%>>Comments</a></td>
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