package org.sms.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;
import java.util.ArrayList;

import org.sms.util.util;

public class StudentAttendance extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		util obj = new util();
		Connection conn = obj.connect();
		Statement stmt = null;
		ResultSet rs=null;
		int temp = 0;
		
		HttpSession session = req.getSession();
		
		String student_Id = (String)  session.getAttribute("student_Id");
		String grade_Id = null;
		String classroom_Id = null;
		
		ArrayList<String> courses = new ArrayList<String>();
		//System.out.print(student_Id);
		
		try{
			stmt = conn.createStatement();
			String query = "select classroom_Id from classroom_student where student_Id='"+ student_Id +"'";
			rs = stmt.executeQuery(query);
			while(rs.next())
			{
				classroom_Id = rs.getString("classroom_Id");
			}
			
			query="select grade from student_mst where student_Id = '"+student_Id+"'";
			rs = stmt.executeQuery(query);
			while(rs.next())
			{
				grade_Id = rs.getString("grade");
			}
			
			query="select course_Id from course_mst where grade_Id= '"+grade_Id+"'";
			rs = stmt.executeQuery(query);
			while(rs.next())
			{
				courses.add(rs.getString("course_Id"));
			}
			
			
			
		}
		catch(SQLException ex){
			ex.printStackTrace();			
		}
		finally{
			
			try{conn.close();}
			catch(SQLException ex){ex.printStackTrace();}
		}
		
		//System.out.print(courses.toString());
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}
	
}
