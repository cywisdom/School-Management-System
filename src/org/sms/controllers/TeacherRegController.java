package org.sms.controllers;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.sms.bean.TeacherRegBean;
import org.sms.util.util;

public class TeacherRegController extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = -7532603779804144979L;

	TeacherRegBean teacherRegBean=new TeacherRegBean();
	util utilobj = new util();

	FileInputStream fis;

	
	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
	
		
		resp.setContentType("text/html;charset=UTF-8");

		if (!ServletFileUpload.isMultipartContent(req)) {
			throw new IllegalArgumentException(
					"Request is not multipart, please 'multipart/form-data' enctype for your form.");
		}

		ServletFileUpload uploadHandler = new ServletFileUpload(
				new DiskFileItemFactory());
		ServletContext getServletContext = getServletContext();
    	String path = getServletContext.getInitParameter("filepath");
		
		try {
			@SuppressWarnings("unchecked")
			List<FileItem> items = uploadHandler.parseRequest(req);
			for (FileItem item : items) {
				if (!item.isFormField()) {
					try{
					File file = new File(path, item.getName());
					item.write(file);
					
					teacherRegBean.setImagepath(path+item.getName());
					}
					catch(FileNotFoundException ex)
					{
						teacherRegBean.setImagepath("Images/user.png");
						
					}
					
				}
				
				
				if (item.isFormField()) {
					String fieldName = item.getFieldName();

					if ("fname".equals(fieldName)) {
						teacherRegBean.setFname(item.getString());
					}
					if ("mname".equals(fieldName)) {
						teacherRegBean.setMname(item.getString());
					}
					if ("lname".equals(fieldName)) {
						teacherRegBean.setLname(item.getString());
					}

					if ("newpassword".equals(fieldName)) {
						teacherRegBean.setPassword(item.getString());
					}
					
					if ("dob".equals(fieldName)) {
						teacherRegBean.setDob(item.getString());
					}
					
					if ("gender".equals(fieldName)) {
						teacherRegBean.setGender(item.getString());
					}
					
					if ("addressLine1".equals(fieldName)) {
						teacherRegBean.setAddressLine1(item.getString());
					}
					
					if ("addressLine2".equals(fieldName)) {
						teacherRegBean.setAddressLine2(item.getString());
					}
					
					if ("pfax".equals(fieldName)) {
						teacherRegBean.setPfax(item.getString());
					}
					
					if ("username".equals(fieldName)) {
						teacherRegBean.setUsername(item.getString());
					}
					if ("phpn".equals(fieldName)) {
						teacherRegBean.setPhpn(item.getString());
					}
					if ("pmno".equals(fieldName)) {
						teacherRegBean.setPmno(item.getString());
					}
					if ("email".equals(fieldName)) {
						teacherRegBean.setEmail(item.getString());
					}
					
					if ("qualifaication".equals(fieldName)) {
						teacherRegBean.setQualification(item.getString());
					}
					if ("aboutme".equals(fieldName)) {
						teacherRegBean.setAboutMe(item.getString());
					}
					if ("interest".equals(fieldName)) {
						teacherRegBean.setInterest(item.getString());
					}
					
					if ("year".equals(fieldName)) {
						teacherRegBean.setJoiningYear(item.getString());
					}
					
					
				}
				
			}
			
			req.setAttribute("teacherRegBean", teacherRegBean);
			RequestDispatcher rd= req.getRequestDispatcher("/dao/TeacherRegDao");
		     rd.forward(req,resp);
		} catch (FileUploadException e) {
			throw new RuntimeException(e);
		} catch (Exception e) {
			throw new RuntimeException(e);
		} 
		
		

	}

	private String getMimeType(File file) {
		String mimetype = "";
		if (file.exists()) {
			if (getSuffix(file.getName()).equalsIgnoreCase("png")) {
				mimetype = "image/png";
			} else if (getSuffix(file.getName()).equalsIgnoreCase("jpg")) {
				mimetype = "image/jpg";
			} else if (getSuffix(file.getName()).equalsIgnoreCase("jpeg")) {
				mimetype = "image/jpeg";
			} else if (getSuffix(file.getName()).equalsIgnoreCase("gif")) {
				mimetype = "image/gif";
			} else {
				javax.activation.MimetypesFileTypeMap mtMap = new javax.activation.MimetypesFileTypeMap();
				mimetype = mtMap.getContentType(file);
			}
		}
		return mimetype;
	}

	private String getSuffix(String filename) {
		String suffix = "";
		int pos = filename.lastIndexOf('.');
		if (pos > 0 && pos < filename.length() - 1) {
			suffix = filename.substring(pos + 1);
		}
		return suffix;
	}

}	
		

	