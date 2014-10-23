package org.sms.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.sms.util.util;

public class ManageUsers extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
			

		util obj = new util();
		
		Connection conn = obj.connect();
		ResultSet rs = null;
		Statement stmt = null;
	
		
		String role= req.getParameter("role");
		String username = req.getParameter("uname");
		String password = req.getParameter("pass");
		String cpassword = req.getParameter("cpass");
		
		try{
			
			stmt = conn.createStatement();
			String query="insert into user_mst (username,password,role,active_flag) values ('"+username+"','"+password+"','"+role+"','1')";
			int temp=stmt.executeUpdate(query);
			resp.sendRedirect(req.getContextPath() + "/manage_user.jsp");
		}
		catch(SQLException es){
			es.printStackTrace();			
		}
		finally{
			
			try{conn.close();}
			catch(SQLException ex)
			{ex.printStackTrace();}
			
		}
	
	
	}

}
