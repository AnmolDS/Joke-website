<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Account</title>
</head>
<body>

<form method="post">
<center><h1>Account</h1></center>
<center><h4>Favorite Jokes</h4></center>
<center><table border="1">
<tr>
<td>JokeID</td>
<td>Title</td>
<td>Description</td>
<td>Author</td>
<td>Tag</td>
<td>PostTime</td>
<td>Action</td>
</tr>

<%

try
{
Class.forName("com.mysql.cj.jdbc.Driver");
String url="jdbc:mysql://localhost/sampledb";
String username="john";
String password="pass1234";

String query="SELECT * FROM jokes WHERE jokeid IN (SELECT jokeid FROM myfavoritejokes WHERE username= "+"'"+session.getAttribute("uid").toString()+"'"+") ";
Connection conn=DriverManager.getConnection(url,username,password);
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
    <td><%=authorid %></td>
     <td><%=tags %></td>
    <td><%=date %></td>
    <td><a href=<%="favoriteDelete.jsp?ID="+JokeID%>>Delete</a></td>
    </tr>
        <%

}

%>
    </table></center>
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
<center><h4>Friends</h4></center>
<center><table border="1">
<tr>
<center><td><center>Friend</center></td></center>
</tr>
<%

try
{
Class.forName("com.mysql.cj.jdbc.Driver");
String url="jdbc:mysql://localhost/sampledb";
String username="john";
String password="pass1234";

String query="SELECT friendid FROM myfriends WHERE username = '"+session.getAttribute("uid").toString()+"'";
Connection conn=DriverManager.getConnection(url,username,password);
Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery(query);




while(rs.next())
{
	String Friend=rs.getString("friendid");

	
%>
    <tr>
    <td><a href=<%="FriendAccount.jsp?fid="+Friend%>><%=Friend%></a>
    <a href=<%="friendDelete.jsp?fid="+Friend%>>Delete</a></td>
    </tr>
        <%

}

%>
    </table></center>
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