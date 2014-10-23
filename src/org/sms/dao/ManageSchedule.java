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

public class ManageSchedule extends HttpServlet {

	util utilobj = new util();
	
	String teacher_Id=null;
	String addWeekDay = null;
	String addClassroomId = null;
	String addCourseId = null;
	String addStartTime = null;
	String addEndTime = null;
	
	String rmvWeekDay = null;
	String rmvinTime = null;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {


		HttpSession session = req.getSession();
		teacher_Id = (String)session.getAttribute("teacher_Id");
		
		if (req.getParameter("addschedule") != null) {

			addWeekDay =  req.getParameter("week_day");
			addClassroomId =  req.getParameter("classroom");
			addCourseId =  req.getParameter("courses");
			addStartTime =  req.getParameter("starttime");
			addEndTime =  req.getParameter("endtime");
			
			if (addWeekDay.equals(null) || addWeekDay == ""
					|| addClassroomId.equals(null) || addClassroomId == ""
					|| addCourseId.equals(null) || addCourseId == ""
					|| addStartTime.equals(null) || addStartTime == ""
					|| addEndTime.equals(null) || addEndTime == "") {
				resp.sendRedirect(req.getContextPath() + "/manage_schedule.jsp");
			}

			else {
				addSchedule(req, resp);
			}
		}
		else if(req.getParameter("rmvschedule") != null){
			rmvWeekDay = req.getParameter("rmvweek_day");
			rmvinTime = req.getParameter("timeslot");
				
			if (rmvWeekDay.equals(null) || rmvWeekDay == ""
					|| rmvinTime.equals(null) || rmvinTime == "") {
				resp.sendRedirect(req.getContextPath() + "/manage_schedule.jsp");
			}

			else {
				rmvSchedule(req, resp);
			}

			
		}
	}

	public void addSchedule(HttpServletRequest req, HttpServletResponse resp) throws IOException
	{
		Statement stmt;
		ResultSet rs;
		Connection conn;
		conn = utilobj.connect();
		try{
			
			stmt = conn.createStatement();
			String query = "insert into timetable_mst (week_day,course_Id,classroom_Id,teacher_Id,in_time,out_time) values ('"+ addWeekDay +"','"+ addCourseId +"','"+ addClassroomId +"','"+ teacher_Id +"','"+ addStartTime +"','"+ addEndTime +"')";
			int rowaffected = stmt.executeUpdate(query);			
			resp.sendRedirect(req.getContextPath() + "/manage_schedule.jsp");
		}
		catch(SQLException ex)
		{
			ex.printStackTrace();
			
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
	
	public void rmvSchedule(HttpServletRequest req, HttpServletResponse resp)
	{
		Statement stmt;
		ResultSet rs;
		Connection conn;
		conn = utilobj.connect();
			try{
				stmt = conn.createStatement();
				String qurey ="delete from timetable_mst where week_Day='"+ rmvWeekDay +"' and in_Time='"+ rmvinTime +"' and teacher_Id='"+teacher_Id+"'";
				int r = stmt.executeUpdate(qurey);
				resp.sendRedirect(req.getContextPath() + "/manage_schedule.jsp");
			}
			catch(SQLException ex)
			{ex.printStackTrace();}
			catch (Exception e) {
				// TODO: handle exception
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
