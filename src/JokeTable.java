
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * Servlet implementation class JokeTable
 */

@WebServlet("/JokeTable")
public class JokeTable extends HttpServlet {
	public static int jokeid=1;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String Title = request.getParameter("title");
        String Description = request.getParameter("description");
        String Tags = request.getParameter("tags");
      	String authorid= Login.CurrentUser;
      	
        try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://Localhost:3306/sampledb", "john", "pass1234");
			
			int Jokelimit=0;
			String Query1="SELECT COUNT(*) FROM jokes WHERE authorid='"+authorid+"' AND DATE(NOW()) = DATE(posttime)";
			Statement st1=con.createStatement();
			ResultSet rs1= st1.executeQuery(Query1);
			rs1.next();
			Jokelimit=rs1.getInt(1);
			
			if(Jokelimit<5)
			{
			final String INSERT_QUERY = "insert into jokes (jokeid,title,description,authorid,tag,posttime) values(?,?,?,?,?,NOW())";
			PreparedStatement ps=con.prepareStatement(INSERT_QUERY); 
			
			String Query="SELECT max(jokeid) FROM jokes";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(Query);
			rs.next();
			jokeid=rs.getInt(1);
			jokeid++;
			
			ps.setInt(1, jokeid);
			ps.setString(2, Title);
			ps.setString(3, Description);
			ps.setString(4, authorid);
			ps.setString(5,Tags);
			int i=ps.executeUpdate();
			
			if(i>0)
			{
				RequestDispatcher rs2 = request.getRequestDispatcher("alljokes.jsp");
	            rs2.forward(request, response);
	            out.println("Your joke is posted!");
				
			}
			
			}
			else
			{
				RequestDispatcher rs = request.getRequestDispatcher("welcome.jsp");
	            rs.forward(request, response);
	            out.println("Daily joke limit hit. You cannot post more than 5 jokes a day. ");
			}
			
		}
		catch(Exception se) 
        {
			se.printStackTrace();
		}
        
	

	}
}