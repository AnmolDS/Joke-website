import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	public static String CurrentUser;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String user = request.getParameter("username");
        String pass = request.getParameter("password");
        
        if(Validate.checkUser(user, pass))
        {
        	String uid;
        	uid=user;
        	HttpSession session=request.getSession();
        	session.setAttribute("uid",uid);
            RequestDispatcher rs = request.getRequestDispatcher("welcome.jsp");
            rs.forward(request, response);
            CurrentUser=user;
            
        }
        else
        {
           out.println("Username or Password incorrect");
           RequestDispatcher rs = request.getRequestDispatcher("loginpage.jsp");
           rs.include(request, response);
        }
	}

}
