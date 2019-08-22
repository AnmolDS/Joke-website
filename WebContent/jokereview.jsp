<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Review</title>
</head>
<body>
<form method="post">
<center><h2 style="color:blue">Review</h2></center>
<table border="1" align="center">
    <tr>
        <td>Score:</td>
     <td>    <select name="Rating">
         <option value=" "></option>
 <option value="Excellent">Excellent</option>
  <option value="Good">Good</option>
  <option value="Fair">Fair</option>
  <option value="Poor">Poor</option>
</select>
</td>
    </tr>
<tr>
<td>Remark:</td>
<td><input type="Text" name="remark"/></td>
</tr>
</table>
<center><input type="submit" value="submit"/></center>
<center><a href="welcome.jsp" title="Welcome"> Home </a></center>
<% 
try{ 
	if(request.getParameter("remark")!=null)
	{
	Class.forName("com.mysql.cj.jdbc.Driver");
	String url="jdbc:mysql://localhost/sampledb";
	String username="john";
	String password="pass1234";
	Connection conn=DriverManager.getConnection(url,username,password);
        
	String Jokeid=request.getParameter("ID").toString();
	int jokeid;
	jokeid=Integer.parseInt(Jokeid);
	String UserID=session.getAttribute("uid").toString();
	
	int reviewlimit=0;
	String Query1="SELECT COUNT(*) FROM reviews WHERE username='"+UserID+"' AND DATE(NOW()) = DATE(submittime)";
	Statement st1=conn.createStatement();
	ResultSet rs1= st1.executeQuery(Query1);
	rs1.next();
	reviewlimit=rs1.getInt(1);
	
	
	PreparedStatement ps1=conn.prepareStatement("select authorid from jokes where jokeid=?");
	ps1.setInt(1,jokeid);
	ResultSet rs2=ps1.executeQuery();
	rs2.next();
	String authorid=rs2.getString("authorid");
	
	if(reviewlimit<5 && !UserID.equals(authorid))
	{
		
	final String INSERT_QUERY = "insert into reviews (reviewid,score,remark,submittime,username,jokeid) values(?,?,?,NOW(),?,?)";
	PreparedStatement ps=conn.prepareStatement(INSERT_QUERY); 
	
	int reviewID;
	String Query="SELECT max(reviewid) FROM reviews";
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery(Query);
	rs.next();
	reviewID=rs.getInt(1);
	reviewID++;
	
	ps.setInt(1, reviewID);
	ps.setString(2, request.getParameter("Rating"));
	ps.setString(3, request.getParameter("remark"));
	ps.setString(4, UserID);
	ps.setInt(5, jokeid);
	int i=ps.executeUpdate();
	
	if(i>0)
	{
		out.println("You left a review!");
	}  	
	}
	else
	{
		out.println("You cannot post more than 5 reviews a day AND you cannot review your own jokes!!");
	
	}
	}
}
    	catch(Exception se)
    	{
			se.printStackTrace();
		}
%>
</form>

</body>
</html>