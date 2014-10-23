package org.sms.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.sms.util.util;

public class ManageExam extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {


		util obj = new util();
		
		Connection conn = obj.connect();
		ResultSet rs = null;
		Statement stmt = null;
		String query = null;
		
		if(req.getParameter("exam") != null)
		{
			String examtypeid = req.getParameter("examtypeid");
			String grade_Id = req.getParameter("grade_Id");
			String examname = req.getParameter("examname");
			String examdate = req.getParameter("examdate");
			String examdesc = req.getParameter("examdesc");

			try{
				stmt = conn.createStatement();
				query = "insert into exam_mst (exam_type_id,name,description,date,grade_id) values ('"+examtypeid+"','"+examname+"','"+examdesc+"','"+examdate+"','"+grade_Id+"')";
				int temp = stmt.executeUpdate(query);	
				resp.sendRedirect(req.getContextPath() + "/admin_grade.jsp");
				
			}
			catch(SQLException ex)
			{ex.printStackTrace();}
					
			
		}
		else if(req.getParameter("examtype") != null)
		{
			String examtypenME = req.getParameter("examtypenME");
			String examtypedesc = req.getParameter("examtypedesc");
			
			try{
				stmt = conn.createStatement();
				query = "insert into exam_type (name,description) values ('"+examtypenME+"','"+examtypedesc+"')";
				int temp = stmt.executeUpdate(query);
				resp.sendRedirect(req.getContextPath() + "/admin_grade.jsp");
								
			}
			catch(SQLException ex)
			{ex.printStackTrace();}
			finally{
				
				try{conn.close();}
				catch(SQLException ex)
				{ex.printStackTrace();}
				
			}
			
		}
	}

}
