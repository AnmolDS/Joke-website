<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
</head>
<body>
<form method="post" action="register">
<center><h2 style="color:blue">Register</h2></center>
<table border="1" align="center">
<tr>
<td>First Name:</td>
<td><input type="Text" name="firstname"/></td>
</tr>
<tr>
<td>Last Name:</td>
<td><input type="Text" name="lastname"/></td>
</tr>
<tr>
<td>Email:</td>
<td><input type="Text" name="Email"/></td>
</tr>
<tr>
<td>Gender:</td>
<td><select name="Gender"/>
<option value=" "></option>
 <option value="F">&#09;M</option>
  <option value="M">&#09;F</option>
  </select>
  </td>
</tr>
<tr>
<td>Age:</td>
<td><input type="number" name="Age" min="18" max="122"/></td>
</tr>
<tr>
<td>Username :</td>
<td><input type="text" name="username"/></td>
</tr>
<tr>
<td>Password :</td>
<td><input type="password" name="password"/></td>
</tr>
<tr>
<td>Confirm Password :</td>
<td><input type="password" name="Confirm_password"/></td>
</tr>
</table>
<center><input type="submit" value="register"/></center>
</form>
</body>
</html>