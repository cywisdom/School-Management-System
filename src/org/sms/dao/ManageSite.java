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
import javax.servlet.http.HttpSession;

import org.sms.util.util;

public class ManageSite extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
	
		String news = req.getParameter("news");
		
		util obj = new util();
		HttpSession session = req.getSession();		
		Connection conn = obj.connect();
		ResultSet rs = null;
		Statement stmt = null;
		String query = null;
		String user_Id = (String) session.getAttribute("user_Id");
		try{
			
			stmt = conn.createStatement();
			query = "insert into news_mst (user_Id,title) values ('"+user_Id+"','"+news+"')";
			int temp = stmt.executeUpdate(query);
			resp.sendRedirect(req.getContextPath() + "/admin_site.jsp");
		}
		catch(SQLException ex){
			
			ex.printStackTrace();
		}
		finally{
			
			try{conn.close();}
			catch(SQLException ex)
			{ex.printStackTrace();}
			
		}
	}
}
