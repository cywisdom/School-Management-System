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

import org.sms.bean.ParentRegBean;
import org.sms.util.util;

public class ParentRegDao extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ParentRegBean  parentRegBean= (ParentRegBean) request.getAttribute("parentRegBean");
		util utilobj = new util();

		Connection conn = utilobj.connect();

		HttpSession session = request.getSession(); 
		PreparedStatement ps = null;
		String user_Id = (String) session.getAttribute("user_Id");
		
		
				try {
					 conn.setAutoCommit(false);
					ps=conn.prepareStatement("update user_mst set username=?,password=? where user_Id='"+user_Id+"'");
					ps.setString(1, parentRegBean.getEmail());
					ps.setString(2, parentRegBean.getPassword());					
					ps.executeUpdate();
										
					ps = conn.prepareStatement("insert into parent_mst(fname,mname,lname,email,dob,gender,student_reg_no,address1,pfax,phno,pmno,user_Image,address2,user_Id)"
									+ "		values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

					ps.setString(1, parentRegBean.getFname());
					ps.setString(2, parentRegBean.getMname());
					ps.setString(3, parentRegBean.getLname());
					ps.setString(4, parentRegBean.getEmail());
					ps.setString(5, parentRegBean.getDob());
					ps.setString(6, parentRegBean.getGender());
					ps.setString(7, parentRegBean.getStudentNo());
					ps.setString(8, parentRegBean.getAddress1());

					if (parentRegBean.getPfax() == "") {
						ps.setInt(9, 0);
					} else {
						ps.setString(9, parentRegBean.getPfax());
					}

					if (parentRegBean.getPhpn() == "") {
						ps.setInt(10, 0);
					} else {
						ps.setString(10, parentRegBean.getPhpn());
					}

					if (parentRegBean.getPmno() == "") {
						ps.setInt(11, 0);
					} else {
						ps.setString(11, parentRegBean.getPmno());
					}

					ps.setString(12,parentRegBean.getImagepath());

				    ps.setString(13, parentRegBean.getAddress2());
				    ps.setString(14, user_Id);
					ps.executeUpdate();
					conn.commit();
					
					String parent_Id = null;
					
					Statement st = conn.createStatement();
					String query = "select parent_Id from parent_mst where user_Id='"+user_Id+"'";
					ResultSet resultSet = st.executeQuery(query);
					while(resultSet.next()){parent_Id=resultSet.getString("parent_Id");}
					
					query = "update student_mst set parent_Id='"+parent_Id+"' where regno='"+parentRegBean.getStudentNo()+"'";
					int temp = st.executeUpdate(query);
					conn.commit();
					
					conn.setAutoCommit(true);
					response.sendRedirect(request.getContextPath() +"/index.jsp");

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

			
		

	}
}
