package org.sms.dao;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.sms.util.util;

public class ManageCourses extends HttpServlet{
	
	util utilobj = new util();
	String newCourse=null;	
	String courseDesc=null;
	String addCourseStandard=null;
	String rmvCourseStandard=null;
	String standard_Id;
	String removeCourse = null;
	String courseCode = null;
	
		@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
	
if (req.getParameter("addCourse") != null) {
			courseCode = req.getParameter("courseCode");
			newCourse = req.getParameter("courseName");
			addCourseStandard =  req.getParameter("standards");
			courseDesc = req.getParameter("courseDesc");
			if(newCourse.equals(null) || newCourse=="")
			{
				resp.sendRedirect(req.getContextPath()+"/manage_courses.jsp");
			}
				
				else{addCourse(req, resp);}
		
        } else if (req.getParameter("removeCourse") != null) {
        	removeCourse =  req.getParameter("courses");
        	rmvCourseStandard = req.getParameter("standard");        	
        	if(removeCourse.equals(null) || removeCourse=="")
			{
				resp.sendRedirect(req.getContextPath()+"/manage_courses.jsp");
			} 
        	else{
        	removeCourse(req,resp);}
        } 
	
				
	
	}
	
	public int getStandardId(String standardName)
	{	int id=0;
	Statement stmt;
	ResultSet rs;
	Connection conn;
	conn = utilobj.connect();
		try{
			
		stmt = conn.createStatement();		
		String query = "select * from grade_mst where name='"+standardName+"'";
		 rs = stmt.executeQuery(query);
		while(rs.next()){ id = rs.getInt("grade_Id");}
		
		
		}
		catch(Exception e){e.printStackTrace();}
		
		return id;
	}
	
	public void removeCourse(HttpServletRequest req, HttpServletResponse resp)
	{
		Statement stmt;
		ResultSet rs;
		Connection conn;
		conn = utilobj.connect();
		try{
			stmt = conn.createStatement();			
		String query = "delete from course_mst where name='"+removeCourse+"' and grade_Id='"+rmvCourseStandard+"'";	
		int rowaffected = stmt.executeUpdate(query);
		}
		catch(SQLException ex){ex.printStackTrace();}
		try {
			resp.sendRedirect(req.getContextPath() +"/manage_courses.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
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
	
	public void addCourse(HttpServletRequest req, HttpServletResponse resp)
	{Statement stmt;
	ResultSet rs;
	Connection conn;
	conn = utilobj.connect();
		
		int id =  getStandardId(addCourseStandard);
		try{
			stmt = conn.createStatement();
		String query = "insert into course_mst (course_Id,name,description,grade_Id) values ('"+courseCode+"','"+ newCourse +"','"+ courseDesc +"','"+ id +"');";
		int rowaffected = stmt.executeUpdate(query);
					
		}
		catch(SQLException ex){ex.printStackTrace();}
		try {
			resp.sendRedirect(req.getContextPath() +"/manage_courses.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
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
