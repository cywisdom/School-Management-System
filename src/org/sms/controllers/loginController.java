package org.sms.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.sms.bean.loginBean;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.sms.util.util;

import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class loginController extends HttpServlet {

	loginBean loginBeanobj = new loginBean();
	util utilobj = new util();

	@SuppressWarnings("unused")
	public String getClientIPAddress(HttpServletRequest request) {
		String ipAddress = request.getHeader("X-FORWARDED-FOR"); 

		if (ipAddress == null || ipAddress.length() == 0
				|| "unknown".equalsIgnoreCase(ipAddress)) {
			ipAddress = request.getHeader("Proxy-Client-IP");
		}
		if (ipAddress == null || ipAddress.length() == 0
				|| "unknown".equalsIgnoreCase(ipAddress)) {
			ipAddress = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ipAddress == null || ipAddress.length() == 0
				|| "unknown".equalsIgnoreCase(ipAddress)) {
			ipAddress = request.getHeader("HTTP_CLIENT_IP");
		}
		if (ipAddress == null || ipAddress.length() == 0
				|| "unknown".equalsIgnoreCase(ipAddress)) {
			ipAddress = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (ipAddress == null || ipAddress.length() == 0
				|| "unknown".equalsIgnoreCase(ipAddress)) {
			ipAddress = request.getRemoteAddr();
		}
		if (ipAddress.contains(",")) {
			ipAddress = ipAddress.substring(0, ipAddress.indexOf(","));
		}

		return ipAddress;

	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		HttpSession session = req.getSession();
		session.invalidate();
		resp.sendRedirect(req.getContextPath() + "/index.jsp");

	};

	public String getCurrentDateTime() {

		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		// get current date time with Date()
		Date date = new Date();
		String timestamp = dateFormat.format(date);
		return timestamp;
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		getCurrentDateTime();
		loginBeanobj.setUsername(req.getParameter("userneme").trim());
		loginBeanobj.setPassword(req.getParameter("password").trim());
		loginBeanobj.setRememberMe(req.getParameter("rememberMe"));

		String client_Ip = getClientIPAddress(req);

		HttpSession session = req.getSession(true);

		Connection conn = utilobj.connect();

		String role;
		String user_Id;
		String active_flag;

		try {

			Statement st = conn.createStatement();
			String query = "SELECT user_Id,role,active_flag FROM user_mst where username='"
					+ loginBeanobj.getUsername()
					+ "' and password='"
					+ loginBeanobj.getPassword() + "'";

			ResultSet resultSet = st.executeQuery(query);

			if (resultSet.next()) {
				user_Id = resultSet.getString(1);
				role = resultSet.getString(2);
				active_flag = resultSet.getString(3);

				if (loginBeanobj.getRememberMe() != null) {
					session.setMaxInactiveInterval(-1);
				} else {
					session.setMaxInactiveInterval(3600);
				}

				session.setAttribute("role", role);
				session.setAttribute("active_flag", active_flag);
				session.setAttribute("user_Id", user_Id);
				session.setAttribute("username", loginBeanobj.getUsername());

				if (resultSet.getString(2).equals("admin")) {
					resp.sendRedirect(req.getContextPath() + "/admin_home.jsp");
					query = "update user_mst set last_login_ip='" + client_Ip
							+ "', last_login_date='" + getCurrentDateTime()
							+ "'  where username='"
							+ loginBeanobj.getUsername() + "'";
					int count = st.executeUpdate(query);
				} else if (resultSet.getString(2).equals("student")) {
					String student_Id = null;

					query = "update user_mst set last_login_ip='" + client_Ip
							+ "', last_login_date='" + getCurrentDateTime()
							+ "'  where username='"
							+ loginBeanobj.getUsername() + "'";
					int count = st.executeUpdate(query);

					String q = "select student_Id from student_mst where user_Id='"
							+ user_Id + "'";
					resultSet = st.executeQuery(q);

					if (resultSet.next()) {
						student_Id = resultSet.getString("student_Id");
						session.setAttribute("student_Id", student_Id);
						resp.sendRedirect(req.getContextPath() + "/home.jsp");
					} else {

						resp.sendRedirect(req.getContextPath()
								+ "/StudentRegistration.jsp");
					}

				} else if (resultSet.getString(2).equals("teacher")) {
					String teacher_Id = null;

					String q = "select teacher_Id from teacher_mst where user_Id='"
							+ user_Id + "'";
					resultSet = st.executeQuery(q);

					if (resultSet.next()) {

						teacher_Id = resultSet.getString("teacher_Id");
						session.setAttribute("teacher_Id", teacher_Id);
						query = "update user_mst set last_login_ip='"
								+ client_Ip + "', last_login_date='"
								+ getCurrentDateTime() + "'  where username='"
								+ loginBeanobj.getUsername() + "'";
						int count = st.executeUpdate(query);
						resp.sendRedirect(req.getContextPath()
								+ "/teacher_home.jsp");
					}
					else{

							resp.sendRedirect(req.getContextPath()
									+ "/TeacherRegistration.jsp");
						}


				}

				else if (resultSet.getString(2).equals("parent")){
					String parent_Id = null;
					String student_Id = null;
					String q = "select pm.parent_Id, sm.student_Id from parent_mst pm, student_mst sm where pm.parent_Id=sm.parent_Id and pm.user_Id='"+user_Id+"'";
					resultSet = st.executeQuery(q);

					if (resultSet.next()) {
						
						parent_Id = resultSet.getString("parent_Id");
						student_Id = resultSet.getString("student_Id");
						session.setAttribute("parent_Id", parent_Id);
						session.setAttribute("student_Id", student_Id);
						query = "update user_mst set last_login_ip='"
								+ client_Ip + "', last_login_date='"
								+ getCurrentDateTime() + "'  where username='"
								+ loginBeanobj.getUsername() + "'";
						
						int count = st.executeUpdate(query);
						
						
						resp.sendRedirect(req.getContextPath()
								+ "/home.jsp");
					}
					else{

							resp.sendRedirect(req.getContextPath()
									+ "/ParentRegistration.jsp");
						}
					
				}

			} else {
				out.write("Incorrect Login");
			}

		} catch (SQLException ex) {
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

}
