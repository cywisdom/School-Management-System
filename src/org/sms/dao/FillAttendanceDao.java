package org.sms.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.sms.util.util;

public class FillAttendanceDao extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		util utilobj = new util();
		Connection conn = utilobj.connect();
		Statement stmt = null;
		
		String remarkstr = req.getParameter("remarks");
		String classroom_Id = req.getParameter("classroom_Id");
		String course_Id = req.getParameter("course_Id");
		String date = req.getParameter("date");
		String startTime = req.getParameter("startTime");
		String endTime = req.getParameter("endTime");
		String student_Idstr = req.getParameter("student_Id");
		
		List<Integer> students_Id = new ArrayList<Integer>();
		List<Integer> remarks = new ArrayList<Integer>();
		
		StringTokenizer st = new StringTokenizer(student_Idstr, ",");
		while (st.hasMoreTokens()) {
		     String temp = st.nextToken();
		     students_Id.add(Integer.parseInt(temp));
		}
		
		 st = new StringTokenizer(remarkstr, ",");
		 while (st.hasMoreTokens()) {
		     String temp = st.nextToken();
		     remarks.add(Integer.parseInt(temp));
		}
		// System.out.println(students_Id.toString());
	//	System.out.print(remarks.toString());
		try{	
			//fetching grade_Id (standard Id)				
			stmt = conn.createStatement();		
			for(int i=0; i<students_Id.size();i++){
			
			String query = "insert into attendace_mst values ('"+ students_Id.get(i) +"','"+course_Id+"','"+startTime+"','"+endTime+"','"+ classroom_Id+"','"+date+"','"+remarks.get(i)+"')";
			int rupdate = stmt.executeUpdate(query);}
			}
			catch(SQLException ex)
			{ex.printStackTrace();}	
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
