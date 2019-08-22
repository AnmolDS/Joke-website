import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class register
 */
public class Register extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		String firstname= request.getParameter("firstname");
		String lastname=request.getParameter("lastname");
		String Email=request.getParameter("Email");
		String Gender=request.getParameter("Gender");
		int Age=Integer.parseInt(request.getParameter("Age"));
		String Username=request.getParameter("username");
		String Password=request.getParameter("password");
		String confirm_password=request.getParameter("Confirm_password");
		if(Password.equals(confirm_password)) {
		try {
			
		
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://Localhost:3306/sampledb", "john", "pass1234");
			
			boolean st=false;
			PreparedStatement ps1=con.prepareStatement("select * from user where username=? or email=?");
			ps1.setString(1,Username);
			ps1.setString(2,Email);
			ResultSet rs1=ps1.executeQuery();
			st=rs1.next();
			
			if(st==false) {
			
			final String INSERT_QUERY = "insert into user (username, firstname,lastname,email,gender,age,password) values(?,?,?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(INSERT_QUERY);
			ps.setString(1, Username);
			ps.setString(2, firstname);
			ps.setString(3, lastname);
			ps.setString(4, Email);
			ps.setString(5, Gender);
			ps.setInt(6, Age);
			ps.setString(7, Password);
			int i=ps.executeUpdate();
			if(i>0)
			{
				RequestDispatcher rs = request.getRequestDispatcher("loginpage.jsp");
	            rs.forward(request, response);
			}
		}
			else {
				out.println("Username or Email already exists.");
			}
		}
		
			
		catch(Exception se) {
		se.printStackTrace();
		}
		
		}
		else {
			out.println("Passwords don't match."); 
			
		}
			
	}

}
