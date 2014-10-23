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

import org.sms.controllers.SendEmail;
import org.sms.util.util;

public class ForgotPass extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		String role = req.getParameter("role");
		String forgotuname = req.getParameter("forgotuname");

		util obj = new util();
		Statement st;
		ResultSet rs;
		String query;
		Connection conn = obj.connect();

		String password = null;
		String email = null;
		
		try {
			st = conn.createStatement();
			if (role.equals("teacher")) {
				query = "select um.password, tm.email from user_mst um, teacher_mst tm where um.user_Id=tm.user_Id and um.username='"+forgotuname+"' and um.role='teacher'";
				rs = st.executeQuery(query);
				while(rs.next())
				{
					password = rs.getString("password");
					email = rs.getString("email");
				}
				
			} else if (role.equals("student")) {
				query = "select um.password, sm.email from user_mst um, student_mst sm where um.user_Id=sm.user_Id and um.username='"+forgotuname+"' and um.role='student'";
				rs = st.executeQuery(query);
				while(rs.next())
				{
					password = rs.getString("password");
					email = rs.getString("email");
				}
			} else if (role.equals("parent")) {
				query = "select um.password, pm.email from user_mst um, parent_mst pm where um.user_Id=pm.user_Id and um.username='"+forgotuname+"' and um.role='parent'";
				rs = st.executeQuery(query);
				while(rs.next())
				{
					password = rs.getString("password");
					email = rs.getString("email");
				}
			}

		} catch (SQLException ex) {

			ex.printStackTrace();
		}

		String host = "smtp.gmail.com";
		String msg = "";
		
		if( password != null ||  email != null)
		{
		try {
			SendEmail.sendEmail(host, "kishankotadiya94@gmail.com", "Megatron", email, "Password Recovery", msg);
			req.setAttribute("msg", "Your Password has been sent to "+email);
			RequestDispatcher rd = req.getRequestDispatcher("/Success.jsp");
			rd.forward(req, resp);
		} catch (Exception e) {
			req.setAttribute("msg", "You may not be connected to internet or diagnose for network problems...");
			RequestDispatcher rd = req.getRequestDispatcher("/Error.jsp");
			rd.forward(req, resp);
		}
		}
		else {
			req.setAttribute("msg", "User you enterd is not registerd in the system...");
			RequestDispatcher rd = req.getRequestDispatcher("/Error.jsp");
			rd.forward(req, resp);
		}
		
	}
}
