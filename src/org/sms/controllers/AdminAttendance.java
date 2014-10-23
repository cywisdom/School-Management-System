package org.sms.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.sms.bean.AttendenceBean;

public class AdminAttendance  extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		AttendenceBean obj = new AttendenceBean();
		
		if(req.getParameter("viewattendance")!=null)
		{
		obj.setStandard(req.getParameter("standard"));
		obj.setCourse(req.getParameter("course"));
		obj.setSection(req.getParameter("section"));
		obj.setDate(req.getParameter("date"));
		
		req.setAttribute("obj", obj);
		RequestDispatcher rd = req.getRequestDispatcher("/controllers/ViewAttendance");
		rd.forward(req, resp);
		}
		else if(req.getParameter("fillattendance")!=null)
		{
			obj.setStandard(req.getParameter("standard"));
			obj.setCourse(req.getParameter("course"));
			obj.setSection(req.getParameter("section"));
			obj.setDate(req.getParameter("date"));
			
			req.setAttribute("obj", obj);
			RequestDispatcher rd = req.getRequestDispatcher("/controllers/FillAttendance");
			rd.forward(req, resp);				
		}
		
	}

}
