<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <%@page import="java.sql.*"%>
 <%@page import="java.util.ArrayList"%>
 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Common Friend</title>
</head>
<body>

<%

Class.forName("com.mysql.cj.jdbc.Driver");
String url="jdbc:mysql://localhost/sampledb";
String username="john";
String password="pass1234";
Connection conn=DriverManager.getConnection(url,username,password);

 
String query="SELECT username from user";

Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery(query);

ArrayList<String> Userlist=new ArrayList<String>();

while(rs.next())
{
	Userlist.add(rs.getString("username"));
}

rs.close();
stmt.close();
conn.close();



%>
<form action="Q5Query.jsp" method="post">
<center><h2 style="color:blue">Common Friend</h2></center>
<Center>
User x: &nbsp;
<select name= "UserX">
  <% for(int i=0; i< Userlist.size(); i++) 
  {
  		String user=(String)Userlist.get(i);
  %>
<option value="<%=user%>"><%=user%></option>
<%
} 
%>
</select>

</br>
User y: &nbsp;
<select name= "UserY">
    <% for(int i=0; i< Userlist.size(); i++) 
  {
  		String user=(String)Userlist.get(i);
  %>
<option value="<%=user%>"><%=user%></option>
<%
} 
%>
</select>
</Center></br>
<center><input type="submit" value="search"/></center>
</form>
</body>
</html>
