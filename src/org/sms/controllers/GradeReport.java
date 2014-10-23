package org.sms.controllers;

import java.io.IOException;
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

import org.sms.util.util;

public class GradeReport extends HttpServlet{
	
	String exam_Id;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		util obj = new util();
		
		Connection conn = obj.connect();
		ResultSet rs = null;
		Statement stmt = null;
		String query = null;
		
		HttpSession session = req.getSession();
		String classroom_Id=req.getParameter("c_Id");
		String teacher_ID = (String)session.getAttribute("teacher_Id");
		
		exam_Id = req.getParameter("exam_Id");
		
		List<Integer> students_Id = new ArrayList<Integer>();
		List<String> regno = new ArrayList<String>();
		List<String> fname = new ArrayList<String>();
		List<String> lname = new ArrayList<String>();
		
		try{
			stmt = conn.createStatement();
			query = "select cs.student_Id SID, sm.regno REG, sm.fname FNAME, sm.lname LNAME from student_mst sm, classroom_student cs where cs.student_Id=sm.student_Id and cs.classroom_Id='"+ classroom_Id +"' order by sm.regno";
			rs = stmt.executeQuery(query);
			while(rs.next()){				
				students_Id.add(rs.getInt("SID"));
				regno.add(rs.getString("REG"));
				fname.add(rs.getString("FNAME"));
				lname.add(rs.getString("LNAME"));
			}
			
			req.setAttribute("students_Id", students_Id);
			req.setAttribute("regno", regno);
			req.setAttribute("fname", fname);
			req.setAttribute("lname", lname);
			
			RequestDispatcher rd = req.getRequestDispatcher("/gradestudents.jsp");
			rd.forward(req, resp);
		}
		catch(SQLException ex)
		{ex.printStackTrace();}
				
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		util obj = new util();
		HttpSession session = req.getSession();
		String role = (String)session.getAttribute("role");
		Connection conn = obj.connect();
		ResultSet rs = null;
		Statement stmt = null;
		String query = null;
		
		String temp = req.getParameter("call");
		String studentname=null;
		String student_Id=req.getParameter("sid");
		String classroom_Id=null;
		String grade_Id = null;
		List<String> course_Idlst = new ArrayList<String>();
		List<String> courses = new ArrayList<String>();
		
		List<String> examid = new ArrayList<String>();
		List<String> examname = new ArrayList<String>();
		List<String> examtype = new ArrayList<String>();
		List<String> examdate = new ArrayList<String>();
		
		if(temp.equals("view"))
		{	
			try{
				stmt = conn.createStatement();
				query = "select er.exam_id Id, em.name Name, em.date Date, et.name Type from exam_result er, exam_mst em, exam_type et where er.student_Id='"+student_Id+"' and em.exam_type_id=et.exam_type_id and er.exam_id=em.exam_id group by er.exam_Id";
				rs = stmt.executeQuery(query);
				while(rs.next()){				
					examid.add(rs.getString("Id"));
					examdate.add(rs.getString("Date"));
					examname.add(rs.getString("Name"));
					examtype.add(rs.getString("Type"));
				}
					
				
			}
			catch(SQLException ex)
			{ex.printStackTrace();}
			
			req.setAttribute("examid",examid);
			req.setAttribute("examdate",examdate);
			req.setAttribute("examname",examname);
			req.setAttribute("examtype",examtype);
			req.setAttribute("student_Id",student_Id);
			RequestDispatcher rd = req.getRequestDispatcher("/graderp_view.jsp");
			rd.forward(req, resp);
		}
		else if(temp.equals("fill"))
		{
			//System.out.print("fill");
			//System.out.print(req.getParameter("sid"));
			
			try{
				stmt = conn.createStatement();
				query = "select cs.classroom_Id,cm.grade_Id from classroom_student cs, classroom_mst cm where cs.classroom_Id=cm.classroom_Id and student_Id='"+student_Id+"'";
				rs = stmt.executeQuery(query);
				while(rs.next()){				
					classroom_Id = rs.getString("classroom_Id");
					grade_Id = rs.getString("grade_Id");
				}
				
				query="select course_Id,name from course_mst where grade_Id='"+grade_Id+"'";
				rs = stmt.executeQuery(query);
				while(rs.next()){				
					course_Idlst.add( rs.getString("course_Id"));
					courses.add(rs.getString("name"));
				}
				
				query="select fname,mname,lname from student_mst where student_Id='"+student_Id+"'";
				rs = stmt.executeQuery(query);
				while(rs.next()){				
				
					String temp1 = rs.getString("fname");
					String temp2 = rs.getString("mname");
					String temp3 = rs.getString("lname");
					
					studentname = temp1 +" " + temp2 + " " +temp3;
				}
				
			}
			catch(SQLException ex)
			{ex.printStackTrace();}
			
			//System.out.println(course_Idlst.toString());
			//System.out.println(courses.toString());
			req.setAttribute("sid", student_Id);
			req.setAttribute("course_Idlst", course_Idlst);
			req.setAttribute("courses", courses);
			req.setAttribute("classroom_Id", classroom_Id);
			req.setAttribute("grade_Id", grade_Id);
			req.setAttribute("studentname", studentname);
			req.setAttribute("examid", exam_Id);
			
			RequestDispatcher rd = req.getRequestDispatcher("/graderp_fill.jsp");
			rd.forward(req, resp);
			
		}
		
		
	}

}
