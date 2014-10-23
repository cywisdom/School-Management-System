package org.sms.controllers;

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

public class adminSchedule extends HttpServlet {

	String viewStandard = null;
	String viewStandardSection = null;
	String viewTeacherId = null;
	String classroom_Id = null;

	util obj = new util();
	Connection conn;
	Statement stmt;
	ResultSet rs;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		conn = obj.connect();
		try {
			stmt = conn.createStatement();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}

		if (req.getParameter("classSchedule") != null) {

			viewStandard = req.getParameter("standard");
			viewStandardSection = req.getParameter("sections");

			if (viewStandard.equals(null) || viewStandard == ""
					|| viewStandardSection.equals(null)
					|| viewStandardSection == "") {
				
				resp.sendRedirect(req.getContextPath() + "/admin_schedule.jsp");

			} else {
				try {
					String query = "select classroom_Id from classroom_mst where grade_Id='"
							+ viewStandard
							+ "' and section='"
							+ viewStandardSection + "'";
					rs = stmt.executeQuery(query);
					while (rs.next()) {
						classroom_Id = rs.getString("classroom_Id");
					}
				} catch (SQLException ex) {
					ex.printStackTrace();
				}

				viewClassroomSchedule(req, resp);
			}

		} else if (req.getParameter("teacherSchedule") != null) {

			viewTeacherId = req.getParameter("teacher_Id");

			if (viewTeacherId.equals(null) || viewTeacherId == "") {
				resp.sendRedirect(req.getContextPath() + "/admin_schedule.jsp");
			} else {
				viewTeacherSchedule(req, resp);
			}
		}

	}

	public void viewClassroomSchedule(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {

		req.setAttribute("classroom_Id", classroom_Id);
		RequestDispatcher rd = req.getRequestDispatcher("/admin_classroom_schedule.jsp");
		 rd.forward(req,resp);
	}

	public void viewTeacherSchedule(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {

		req.setAttribute("viewTeacherId", viewTeacherId);
		RequestDispatcher rd = req.getRequestDispatcher("/admin_teacher_schedule.jsp");
		 rd.forward(req,resp);
	}

}
