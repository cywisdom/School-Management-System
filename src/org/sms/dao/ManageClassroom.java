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

public class ManageClassroom extends HttpServlet {

	util utilobj = new util();
	Statement stmt;
	ResultSet rs;
	Connection conn;

	String grade_Id = null;
	String section = null;
	String year = null;
	String teacher_Id = null;
	
	String rmvStandard = null;
	String rmvSection = null;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		conn = utilobj.connect();

		if (req.getParameter("addclassroom") != null) {
			
			grade_Id = req.getParameter("standards");
			section = req.getParameter("section");
			year = req.getParameter("year");
			teacher_Id = req.getParameter("teacher_Id");
			
			if (grade_Id.equals(null) || grade_Id == "" || section.equals(null) || section == "" || year.equals(null) || year == "" || teacher_Id.equals(null) || teacher_Id == "") {
				resp.sendRedirect(req.getContextPath() + "/manage_classroom.jsp");
			}

			else {
				addClass(req, resp);
			}

		} else if (req.getParameter("rmvclass") != null) {
			rmvStandard = req.getParameter("standard");
			rmvSection = req.getParameter("sections");
			if (rmvStandard.equals(null) || rmvStandard == "" || rmvSection.equals(null) || rmvSection == "") {
				resp.sendRedirect(req.getContextPath() + "/manage_classroom.jsp");
			} else {
				removeClass(req, resp);
			}
		}

	}

	public void addClass(HttpServletRequest req, HttpServletResponse resp)
	{
		try{stmt = conn.createStatement();	
			String query = "insert into classroom_mst (grade_Id,section,year,teacher_Id,status) values ('"+grade_Id+"','"+ section +"','"+ year +"','"+ teacher_Id +"',1);";
			int rowaffected = stmt.executeUpdate(query);
						
			}
			catch(SQLException ex){ex.printStackTrace();}
			try {
				resp.sendRedirect(req.getContextPath() +"/manage_classroom.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}
	public void removeClass(HttpServletRequest req, HttpServletResponse resp)
	{

		try{stmt = conn.createStatement();	
			stmt = conn.createStatement();			
		String query = "delete from classroom_mst where grade_Id='"+rmvStandard+"' and section='"+rmvSection+"'";	
		int rowaffected = stmt.executeUpdate(query);
		}
		catch(SQLException ex){ex.printStackTrace();}
		finally{
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		try {
			resp.sendRedirect(req.getContextPath() +"/manage_classroom.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
}
