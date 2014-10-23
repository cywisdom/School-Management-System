package org.sms.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.sms.util.util;

public class ChangePassword  extends HttpServlet{
	

	util utilobj = new util();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
		HttpSession session = request.getSession();
		
		String username = (String) session.getAttribute("username");
		String role = (String) session.getAttribute("role");
		
		String oldpasswprd = request.getParameter("oldpassword");
		String newpassword=request.getParameter("newpassword");
		String confirmpassword=request.getParameter("confirmpassword");
		
		String password = null;
		Connection conn =  utilobj.connect();
		
		
		
		
		
		if(newpassword.equals(confirmpassword))
		{
			
			try{
				
				 Statement st = conn.createStatement();
	             String query = "SELECT password FROM user_mst where username='"+username+"' and role='"+role+"'";
	             
	             ResultSet resultSet = st.executeQuery(query);
	                          
	             if(resultSet.next())
	             {
	                  password = resultSet.getString(1);
	             }
	             
	             	             
			}
			catch(SQLException e)
			{ e.printStackTrace(); }	
			finally{
				
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(password.equals(oldpasswprd))
			{
				
				 try {
					Statement st = conn.createStatement();
					
					String query = "update user_mst set password='"+newpassword+"' where username='"+username+"' ";
					int rs = st.executeUpdate(query); 
					 
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	            	             
				if(role.equals("admin"))
				{
				 response.sendRedirect(request.getContextPath() +"/a_success.jsp");
				}
				else if(role.equals("student"))
				{
					response.sendRedirect(request.getContextPath() +"/Success.jsp");					
				}
				else
				{
					response.sendRedirect(request.getContextPath() +"/t_success.jsp");
				}
			}
			else {
				// error old and new password does not match
							
				if(role.equals("admin"))
				{
				 response.sendRedirect(request.getContextPath() +"/a_failure.jsp");
				}
				else if(role.equals("student"))
				{
					response.sendRedirect(request.getContextPath() +"/Error.jsp");					
				}
				else
				{
					response.sendRedirect(request.getContextPath() +"/t_failure.jsp");
				}
				
			}
		}
		else {
			// error new and confirm password does not match
			if(role.equals("admin"))
			{
			 response.sendRedirect(request.getContextPath() +"/a_failure.jsp");
			}
			else if(role.equals("student"))
			{
				response.sendRedirect(request.getContextPath() +"/Error.jsp");					
			}
			else
			{
				response.sendRedirect(request.getContextPath() +"/t_failure.jsp");
			}
			
		}
		
	}


}
