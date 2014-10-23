package org.sms.controllers;

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
import javax.servlet.http.HttpSession;

import org.sms.bean.AttendenceBean;
import org.sms.util.util;

public class FillAttendance extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		PrintWriter out = resp.getWriter();
		util utilobj = new util();
		Connection conn = utilobj.connect();
		HttpSession session = req.getSession();
		
		List<Integer> students_Id =  new ArrayList<Integer>();
		List<String> regno =  new ArrayList<String>();
		List<String> fname =  new ArrayList<String>();
		List<String> lname =  new ArrayList<String>();
						
		Statement stmt = null;
		
		AttendenceBean obj = (AttendenceBean) req.getAttribute("obj");		
		
		try{
			
			
			//fetching grade_Id (standard Id)				
			stmt = conn.createStatement();		
			String query = "select * from grade_mst where name='"+obj.getStandard()+"'";
			ResultSet rs = stmt.executeQuery(query);
			
			while (rs.next()) {
				obj.setGrade_Id(rs.getInt("grade_Id"));
			}
			//fetching classroom Id
					
			query="select classroom_Id from classroom_mst where grade_Id='"+obj.getGrade_Id()+"' and section='"+obj.getSection()+"' ";
			rs = stmt.executeQuery(query);
			while(rs.next()){
				obj.setClassroom_Id(rs.getInt("classroom_Id"));		
			}
			//fetching course_Id
					
			query="select course_Id from course_mst where name='"+obj.getCourse()+"' and grade_Id='"+obj.getGrade_Id()+"'";
			rs = stmt.executeQuery(query);
			while(rs.next()){
				obj.setCourse_Id(rs.getInt("course_Id"));		
			}
			
			//fetching student id in perticular classroom
					
			query="select student_Id from classroom_student where classroom_Id='"+obj.getClassroom_Id()+"' ";		
			rs = stmt.executeQuery(query);
			while(rs.next()){
				students_Id.add(rs.getInt("student_Id"));		
			}
			
			//fetching student regno from classroom
			
			for(int i=0;i < students_Id.size();i++)
			{	query="select fname,lname,regno from student_mst where student_Id='"+students_Id.get(i)+"' ORDER BY regno";		
				rs = stmt.executeQuery(query);
				while(rs.next()){
					fname.add(rs.getString("fname"));
					lname.add(rs.getString("lname"));
					regno.add(rs.getString("regno"));		
				}
			}
		}
		catch(SQLException ex)
		{
			
			
		}
		finally{
			
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		req.setAttribute("fname",fname);
		req.setAttribute("lname",lname);
		req.setAttribute("student_Id",students_Id);
		req.setAttribute("regno",regno);
		req.setAttribute("objBean", obj);
		//RequestDispatcher rd = req.getRequestDispatcher("/teacher_attendance_fill.jsp");
		RequestDispatcher rd = req.getRequestDispatcher("/admin_attendance_fill.jsp");
		rd.forward(req, resp);
	}

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		//System.out.println(req.getParameter("courseid"));
		//System.out.print(req.getParameter("classid"));
		
		PrintWriter out = resp.getWriter();
		util utilobj = new util();
		Connection conn = utilobj.connect();
		HttpSession session = req.getSession();
		
		List<Integer> students_Id =  new ArrayList<Integer>();
		List<String> regno =  new ArrayList<String>();
		List<String> fname =  new ArrayList<String>();
		List<String> lname =  new ArrayList<String>();
						
		Statement stmt = null;
		
		AttendenceBean obj = new AttendenceBean();
		obj.setClassroom_Id(Integer.parseInt( req.getParameter("classid")));
		obj.setCourse_Id(Integer.parseInt(req.getParameter("courseid")));
		
		try{		
			
			//fetching grade_Id (standard Id)				
			stmt = conn.createStatement();		
			String query = "select grade_Id from classroom_mst where classroom_Id='"+obj.getClassroom_Id()+"'";
			ResultSet rs = stmt.executeQuery(query);
			
			while (rs.next()) {
				obj.setGrade_Id(rs.getInt("grade_Id"));
			}
			//fetching section
					
			query="select section from classroom_mst where  classroom_Id='"+obj.getClassroom_Id()+"' ";
			rs = stmt.executeQuery(query);
			while(rs.next()){
				obj.setSection(rs.getString("section"));		
			}
			
			query="select name from grade_mst where grade_Id='"+obj.getGrade_Id()+"' ";
			rs = stmt.executeQuery(query);
			while(rs.next()){
				obj.setStandard(rs.getString("name"));		
			}
			
			//fetching course_Id
					
			query="select name from course_mst where course_Id='"+obj.getCourse_Id()+"'";
			rs = stmt.executeQuery(query);
			while(rs.next()){
				obj.setCourse(rs.getString("name"));		
			}
			//fetching student id in perticular classroom
			stmt = conn.createStatement();			
		    query="select student_Id from classroom_student where classroom_Id='"+obj.getClassroom_Id()+"' ";		
		    rs = stmt.executeQuery(query);
			while(rs.next()){
				students_Id.add(rs.getInt("student_Id"));		
			}
			
			
			//fetching student regno from classroom
			
			for(int i=0;i < students_Id.size();i++)
			{	query="select fname,lname,regno from student_mst where student_Id='"+students_Id.get(i)+"' ORDER BY regno";		
				rs = stmt.executeQuery(query);
				while(rs.next()){
					fname.add(rs.getString("fname"));
					lname.add(rs.getString("lname"));
					regno.add(rs.getString("regno"));		
				}
			}
		}
		catch(SQLException ex)
		{
			
			
		}
		finally{
			
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		req.setAttribute("fname",fname);
		req.setAttribute("lname",lname);
		req.setAttribute("student_Id",students_Id);
		req.setAttribute("regno",regno);
		req.setAttribute("objBean", obj);
		RequestDispatcher rd = req.getRequestDispatcher("/teacher_attendance_fill.jsp");
		//RequestDispatcher rd = req.getRequestDispatcher("/admin_attendance_fill.jsp");
		rd.forward(req, resp);
		
	}
	
}
