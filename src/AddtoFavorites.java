import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

import javax.servlet.annotation.WebServlet;
/**
 * Servlet implementation class JokeTable
 */
@WebServlet("/AddtoFavorites")
public class AddtoFavorites extends HttpServlet {
    	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	try {
    	Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://Localhost:3306/sampledb", "john", "pass1234");
		
        String jokeid = request.getParameter("jokeid");
        
		final String INSERT_QUERY = "insert into myfavoritejokes (username,jokeid) values(?,?)";
		PreparedStatement ps=con.prepareStatement(INSERT_QUERY); 
		
		HttpSession session=request.getSession();
		
		ps.setString(1, session.getAttribute("uid").toString());
		ps.setString(2, jokeid);
    	}
    	catch(Exception se)
    	{
			se.printStackTrace();
		}
 }
}