<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TagOnSameDay</title>
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

String tag1= request.getParameter("tag1");
String tag2=request.getParameter("tag2");

String query="SELECT A.authorid FROM jokes A, jokes B WHERE Date(A.posttime)=Date(B.posttime) AND A.authorid=B.authorid And A.authorid "+
" IN(select A.authorid FROM jokes WHERE (A.tag like '%"+tag1+"%' AND B.tag like '%"+tag2+"%') OR (A.tag like '%"+tag2+"%' AND B.tag like '%"+tag1+"%')) group by A.authorid";


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