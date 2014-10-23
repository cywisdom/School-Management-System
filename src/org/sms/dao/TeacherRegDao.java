package org.sms.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.sms.bean.TeacherRegBean;
import org.sms.controllers.TeacherRegController;
import org.sms.util.util;

public class TeacherRegDao extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		TeacherRegBean teacherRegBean = (TeacherRegBean) request.getAttribute("teacherRegBean");

		util utilobj = new util();

		Connection conn = utilobj.connect();
		HttpSession session = request.getSession(); 
		PreparedStatement ps = null;
		String user_Id = (String) session.getAttribute("user_Id");
		try {
			

				try {

					
					 conn.setAutoCommit(false);
					ps=conn.prepareStatement("update user_mst set username=?,password=? where user_Id='"+user_Id+"'");
					ps.setString(1, teacherRegBean.getUsername());
					ps.setString(2, teacherRegBean.getPassword());
					
					ps.executeUpdate();
					
					ps = conn.prepareStatement("insert into teacher_mst(fname,mname,lname,email,dob,gender,address1,address2,pfax,phno,pmno,user_Image,joining_Year,about,interest,qualification,user_Id)"
									+ "		values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

					ps.setString(1, teacherRegBean.getFname());
					ps.setString(2, teacherRegBean.getMname());
					ps.setString(3, teacherRegBean.getLname());
					ps.setString(4, teacherRegBean.getEmail());
					ps.setString(5, teacherRegBean.getDob());
					ps.setString(6, teacherRegBean.getGender());
					
					ps.setString(7, teacherRegBean.getAddressLine1());
					ps.setString(8, teacherRegBean.getAddressLine2());
					
					if (teacherRegBean.getPfax() == "") {
						ps.setInt(9, 0);
					} else {
						ps.setString(9, teacherRegBean.getPfax());
					}

					if (teacherRegBean.getPhpn() == "") {
						ps.setInt(10, 0);
					} else {
						ps.setString(10, teacherRegBean.getPhpn());
					}

					if (teacherRegBean.getPmno() == "") {
						ps.setInt(11, 0);
					} else {
						ps.setString(11, teacherRegBean.getPmno());
					}

					
					
			

					ps.setString(12, teacherRegBean.getImagepath());

					ps.setString(13, teacherRegBean.getJoiningYear());
				
					ps.setString(14, teacherRegBean.getAboutMe());
					ps.setString(15, teacherRegBean.getInterest());
					ps.setString(16, teacherRegBean.getQualification());
					ps.setString(17, user_Id);
					ps.executeUpdate();
					conn.commit();
					
					response.sendRedirect(request.getContextPath() +"/teacher_home.jsp");

				} catch (Exception e) {
					e.printStackTrace();
				} finally {

					try {

						ps.close();
						conn.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
				}

			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
