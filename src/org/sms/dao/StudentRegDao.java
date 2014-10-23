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

import org.sms.bean.StudentRegistrationBean;
import org.sms.util.util;

/**
 * Servlet implementation class StudentRegDao
 */

public class StudentRegDao extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		StudentRegistrationBean studentRegistrationBean = (StudentRegistrationBean)	request.getAttribute("studentRegistrationBean");

		util utilobj = new util();

		Connection conn = utilobj.connect();
		HttpSession session = request.getSession();
		String user_Id = (String) session.getAttribute("user_Id");
		PreparedStatement ps = null;
		Statement st = null;
		
		try {
			
				try {
						
					
					st = conn.createStatement();					
					
					
					 conn.setAutoCommit(false);
					 
					ps=conn.prepareStatement("update user_mst set password=?, role=? where user_Id='"+user_Id+"'");
					
					ps.setString(1, studentRegistrationBean.getPassword());
					ps.setString(2, "student");
					ps.executeUpdate();
					conn.commit();
					
					
					ps = conn.prepareStatement("insert into student_mst(fname,mname,lname,email,dob,gender,grade,address1,address2,pfax,phno,pmno,regno,user_Image,joining_Year,about,interest,user_Id)"
									+ "		values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

					ps.setString(1, studentRegistrationBean.getFname());
					ps.setString(2, studentRegistrationBean.getMname());
					ps.setString(3, studentRegistrationBean.getLname());
					ps.setString(4, studentRegistrationBean.getEmail());
					ps.setString(5, studentRegistrationBean.getDob());
					ps.setString(6, studentRegistrationBean.getGender());
					ps.setString(7, studentRegistrationBean.getGrade());
					ps.setString(8, studentRegistrationBean.getAddressLine1());
					ps.setString(9, studentRegistrationBean.getAddressLine2());
					if (studentRegistrationBean.getPfax() == "") {
						ps.setInt(10, 0);
					} else {
						ps.setString(10, studentRegistrationBean.getPfax());
					}

					if (studentRegistrationBean.getPhpn() == "") {
						ps.setInt(11, 0);
					} else {
						ps.setString(11, studentRegistrationBean.getPhpn());
					}

					if (studentRegistrationBean.getPmno() == "") {
						ps.setInt(12, 0);
					} else {
						ps.setString(12, studentRegistrationBean.getPmno());
					}

					
					ps.setString(13, studentRegistrationBean.getRegno());

					ps.setString(14, studentRegistrationBean.getImagepath());

					ps.setString(15, studentRegistrationBean.getJoiningYear());
					
					ps.setString(16, studentRegistrationBean.getAboutMe());
					ps.setString(17, studentRegistrationBean.getInterest());
					ps.setString(18, user_Id);
					ps.executeUpdate();
					conn.commit();
					
					
					String classroom_Id=null;
					String student_Id = null;
					
					st = conn.createStatement();	
					String query = "select classroom_Id from classroom_mst where grade_Id='"+studentRegistrationBean.getGrade()+"' and section='"+studentRegistrationBean.getSection()+"'";
					ResultSet rs = st.executeQuery(query);
					while(rs.next())
					{
						classroom_Id=rs.getString("classroom_Id");
					}
					
					query="select student_Id from student_mst where user_Id='"+user_Id+"'";
					rs = st.executeQuery(query);
					while(rs.next())
					{
						student_Id=rs.getString("student_Id");						
					}
					
					query="insert into classroom_student (classroom_Id,student_Id) values ('"+classroom_Id+"','"+student_Id+"')";
					int a = st.executeUpdate(query);
					conn.commit();
					
					response.sendRedirect(request.getContextPath() +"/home.jsp");

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
