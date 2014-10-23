package org.sms.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.sms.util.util;

public class ManageStandard extends HttpServlet{
	
	
	util utilobj = new util();
	String newStandard=null;
	String standardDesc=null;
	String removeStandard = null;
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
	
		if (req.getParameter("add") != null) {
            
			newStandard = req.getParameter("newStandard");
			standardDesc =  req.getParameter("standardDesc");
			if(newStandard.equals(null) || newStandard=="")
			{
				resp.sendRedirect(req.getContextPath()+"/manage_standard.jsp");
			}
			else{
				
			add(req,resp);
			}
        } else if (req.getParameter("remove") != null) {
           
        	removeStandard =  req.getParameter("standards");
        	
        	remove(req,resp);
        } 
		
	}
	
	public void add(HttpServletRequest request, HttpServletResponse response)
	{
		Connection conn = utilobj.connect();
		try{
		
		Statement st = conn.createStatement();
		String query = "insert into grade_mst (name,description) values ('"+ newStandard +"','"+ standardDesc +"')";
        int rs = st.executeUpdate(query);
       response.sendRedirect(request.getContextPath()+"/manage_standard.jsp");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally{
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
	}

	public void remove(HttpServletRequest request, HttpServletResponse response)
	{Connection conn = utilobj.connect();
		try{
			
			Statement st = conn.createStatement();	        
	        String query = "delete from grade_mst where name='"+removeStandard+"'";
	        int rs = st.executeUpdate(query);
	       response.sendRedirect(request.getContextPath()+"/manage_standard.jsp");
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		finally{
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	}
}
