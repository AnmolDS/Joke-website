import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class Validate {
	public static boolean checkUser(String Username, String Password)
	{
		boolean st=false;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://Localhost:3306/sampledb", "john", "pass1234");
			PreparedStatement ps=con.prepareStatement("select * from user where username=? and password=?");
			ps.setString(1,Username);
			ps.setString(2, Password);
			ResultSet rs=ps.executeQuery();
			st=rs.next();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return st;
	}
}
