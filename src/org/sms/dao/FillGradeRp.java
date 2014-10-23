package org.sms.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.sms.util.util;

public class FillGradeRp extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
	
		util obj = new util();
		
		String mark =req.getParameter("marks");
		String totalmarks = req.getParameter("totalmarks");
		String exam_Id = req.getParameter("exam_Id");
		String coure_Id = req.getParameter("corse_Id");
		String student_Id = req.getParameter("student_Id");
		List<Integer> course_Id = new ArrayList<Integer>();
		List<Integer> marks = new ArrayList<Integer>();
		
		StringTokenizer st = new StringTokenizer(coure_Id, ",");
		while (st.hasMoreTokens()) {
		     String temp = st.nextToken();
		     course_Id.add(Integer.parseInt(temp));
		}
		
		 st = new StringTokenizer(mark, ",");
		 while (st.hasMoreTokens()) {
		     String temp = st.nextToken();
		     marks.add(Integer.parseInt(temp));
		}
		
		 Connection conn =  obj.connect();
		 
		 try{	
				//fetching grade_Id (standard Id)
			 	
				Statement stmt = conn.createStatement();		
				for(int i=0; i< course_Id.size();i++){
				
				String query = "insert into exam_result values ('"+ exam_Id +"','"+student_Id +"','"+ course_Id.get(i) +"','"+ marks.get(i) +"','"+ totalmarks +"')";
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
