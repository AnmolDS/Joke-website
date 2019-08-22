<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Log In Page</title>
</head>
<body>
<form action="Login" method="post">
<center><h2 style="color:blue">Jokes</h2></center>
<table border="1" align="center">
<tr>
<td>Username :</td>
<td><input type="text" name="username"/></td>

</tr>
<tr>
<td>Password :</td>
<td><input type="password" name="password"/></td>

</tr>
</table>

<center><input type="submit" value="login"/></center>
<center><a href="Registerpage.jsp" title="User registration">User registration</a></center>
</form>
</body>
</html>