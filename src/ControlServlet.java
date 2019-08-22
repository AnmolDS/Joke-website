import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;
 
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.PreparedStatement;
 
/**
 * ControllerServlet.java
 * This servlet acts as a page controller for the application, handling all
 * requests from the user.
 * @author www.codejava.net
 */
public class ControlServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
 
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();
        System.out.println(action);
        try {
            switch (action) {
            case "/initialize":
            	initialize(request,response);
            	break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }
    
    private void initialize(HttpServletRequest request, HttpServletResponse response)
    		throws SQLException,IOException,ServletException{
    	Connection connect = null;
    	Statement statement = null;
    	
    	if (connect == null || connect.isClosed()) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                throw new SQLException(e);
            }
            
       
            connect = (Connection) DriverManager
  			      .getConnection("jdbc:mysql://localhost/?"
  			          + "user=john&password=pass1234");
            System.out.println(connect);
        
        statement= connect.createStatement();
        
        statement.executeUpdate("DROP SCHEMA IF EXISTS sampledb");
    	statement.executeUpdate("CREATE DATABASE IF NOT EXISTS sampledb");
    	
       }
    	
    	statement.executeUpdate("USE sampledb");
  
    	statement.executeUpdate("CREATE TABLE IF NOT EXISTS user" + 
    			"(username varchar(30) NOT NULL," + 
    			"firstname varchar(30)," + 
    			"lastname varchar(30)," + 
    			"email varchar(50)," + 
    			"gender char(1)," + 
    			"age INTEGER," + 
    			"password varchar(30)," + 
    			"primary key (username),"+
    			"Unique (email))"
    		);
    	
        statement.executeUpdate("CREATE TABLE IF NOT EXISTS myfriends" + 
    			"(username varchar(30) NOT NULL," + 
    			"friendid varchar(30)," + 
    			"primary key (username, friendid),"+
    			"foreign key (username) references user(username),"+
    			"foreign key (friendid) references user(username))"
    		);
    	
    	statement.executeUpdate("CREATE TABLE IF NOT EXISTS jokes" + 
    			"(jokeid INTEGER," + 
    			"title VARCHAR(100)," + 
    			"description VARCHAR(255)," + 
    			"authorid VARCHAR(30)," + 
    			"tag varchar(50),"+
    			"posttime DATETIME,"+
    			"PRIMARY KEY (jokeid),"+
    			"FOREIGN KEY(authorid) references user(username))"
    			);
    	
    	statement.executeUpdate("CREATE TABLE IF NOT EXISTS myfavoritejokes" + 
    			"(username varchar(30)," + 
    			"jokeid INTEGER," + 
    			"foreign key(username) references user(username),"+
    			"foreign key (jokeid) references jokes(jokeid))"
    		);
    	
    	statement.executeUpdate("CREATE TABLE IF NOT EXISTS reviews" + 
    			"(reviewid INTEGER," + 
    			"score varchar(50)," + 
    			"remark varchar(255)," + 
    			"submittime datetime," + 
    			"username varchar(30)," +
    			"jokeid INTEGER," + 
    			"primary key (reviewid),"+
    			"foreign key (username) references user(username),"+
    			"foreign key (jokeid) references jokes(jokeid))"
    		);
    	
    	
    	statement.executeUpdate("INSERT INTO `sampledb`.`user` (`username`, `password`) VALUES ('john', 'pass1234')");
    	
    	/*for(int i=1;i<=10;i++)
    	{
    		statement.executeUpdate("INSERT INTO `sampledb`.`jokes` (`jokeid`) VALUES ('"+i+"');");
    		statement.executeUpdate("INSERT INTO `sampledb`.`user` (`username`,password) VALUES ('user"+i+"','"+i+"');");
    		statement.executeUpdate("INSERT INTO `sampledb`.`joketags` (`tag`) VALUES ('"+i+"');");
    		statement.executeUpdate("INSERT INTO `sampledb`.`reviews` (`reviewid`) VALUES ('"+i+"');");
    	}
    	*/
    	
    }
    }
    
    