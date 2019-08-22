<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center><a href="welcome.jsp" title="welcome"> Home page </a></center>
<table border="1">
<tr>
<td>Author1</td>
<td>Author2</td>
</tr>


<%


try
{
Class.forName("com.mysql.cj.jdbc.Driver");
String url="jdbc:mysql://localhost/sampledb";
String username="john";
String password="pass1234";
Connection conn=DriverManager.getConnection(url,username,password);
Statement statement = null;
statement= conn.createStatement();


String user= request.getParameter("user");

String views= "DROP VIEW IF EXISTS authors;";
statement.executeUpdate(views);
views="DROP VIEW IF EXISTS Escores;";
statement.executeUpdate(views);

views="CREATE VIEW authors AS SELECT U.username FROM user U ,jokes J WHERE U.username = J.authorid group by U.username;";
statement.executeUpdate(views);
views="CREATE VIEW Escores AS SELECT R.username, J.authorid FROM reviews R, jokes J WHERE J.jokeid = R.jokeid AND Score ='Excellent';";
statement.executeUpdate(views);

String query= "SELECT A.authorid, B.authorid FROM jokes A, jokes B, authors C, authors D"+
" WHERE (A.authorid IN (SELECT S.username FROM Escores S"+
" WHERE S.authorid = C.username AND  S.username = D.username "+
" GROUP BY S.username HAVING COUNT(*) = (SELECT COUNT(J.jokeid) FROM jokes J WHERE J.authorid = C.username)) "+
" AND B.authorid IN"+
" (SELECT S.username FROM Escores S WHERE S.authorid = D.username AND S.username = C.username GROUP BY S.username"+
" HAVING COUNT(*) = (SELECT COUNT(J.jokeid) FROM jokes J WHERE J.authorid = D.username)))GROUP BY A.authorid, B.authorid;";

Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery(query);

String a1="";
String a2="";
while(rs.next())
{
	String Author1=rs.getString("A.authorid");
	String Author2=rs.getString("B.authorid");
		
	if(a1.equals(Author2) && a2.equals(Author1)){ 
		continue;
	}
	
	a1=Author1;
	a2=Author2;
	
%>
    <tr>
    <td><%=Author1 %></td>
     <td><%=Author2 %></td>
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