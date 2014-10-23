package org.sms.controllers;

import java.io.File;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.json.JSONArray;
import org.json.JSONObject;
import org.sms.bean.StudentRegistrationBean;
import org.sms.util.util;

public class StudentRegistrationController extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	StudentRegistrationBean studentRegistrationBean = new StudentRegistrationBean();
	util utilobj = new util();

	
	public String imagePath=null;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String imagename = null;
		resp.setContentType("text/html;charset=UTF-8");
        if (!ServletFileUpload.isMultipartContent(req)) {
            throw new IllegalArgumentException("Request is not multipart, please 'multipart/form-data' enctype for your form.");
        }
        
        
		ServletFileUpload uploadHandler = new ServletFileUpload(
				new DiskFileItemFactory());
		ServletContext getServletContext = getServletContext();
    	String path = getServletContext.getInitParameter("filepath");

        
        resp.setContentType("application/json");
        JSONArray json = new JSONArray();
        
        try {
			@SuppressWarnings("unchecked")
			List<FileItem> items = uploadHandler.parseRequest(req);
			for (FileItem item : items) {
				if (!item.isFormField()) {
					try{
					File file = new File(path, item.getName());
					item.write(file);
					
					studentRegistrationBean.setImagepath(path+item.getName());
					}
					catch(FileNotFoundException ex)
					{
						studentRegistrationBean.setImagepath("Images/user.png");
						
					}
					
				}
				if (item.isFormField()) {
					String fieldName = item.getFieldName();

					if ("fname".equals(fieldName)) {
						studentRegistrationBean.setFname(item.getString());
					}					
					if ("mname".equals(fieldName)) {
						studentRegistrationBean.setMname(item.getString());
					}
					if ("lname".equals(fieldName)) {
						studentRegistrationBean.setLname(item.getString());
					}

					if ("newpassword".equals(fieldName)) {
						studentRegistrationBean.setPassword(item.getString());
					}
					
					if ("dob".equals(fieldName)) {
						studentRegistrationBean.setDob(item.getString());
					}
					
					if ("gender".equals(fieldName)) {
						studentRegistrationBean.setGender(item.getString());
					}
					
					if ("addressLine1".equals(fieldName)) {
						studentRegistrationBean.setAddressLine1(item.getString());
					}
					
					if ("addressLine2".equals(fieldName)) {
						studentRegistrationBean.setAddressLine2(item.getString());
					}
					
					if ("pfax".equals(fieldName)) {
						studentRegistrationBean.setPfax(item.getString());
					}
					
					if ("standard".equals(fieldName)) {
						studentRegistrationBean.setGrade(item.getString());
					}
					if ("sections".equals(fieldName)) {
						studentRegistrationBean.setSection(item.getString());
					}
					if ("phpn".equals(fieldName)) {
						studentRegistrationBean.setPhpn(item.getString());
					}
					if ("pmno".equals(fieldName)) {
						studentRegistrationBean.setPmno(item.getString());
					}
					if ("email".equals(fieldName)) {
						studentRegistrationBean.setEmail(item.getString());
					}
					
					if ("regno".equals(fieldName)) {
						studentRegistrationBean.setRegno(item.getString());
					}
					if ("aboutme".equals(fieldName)) {
						studentRegistrationBean.setAboutMe(item.getString());
					}
					if ("interest".equals(fieldName)) {
						studentRegistrationBean.setInterest(item.getString());
					}
					
					if ("year".equals(fieldName)) {
						studentRegistrationBean.setJoiningYear(item.getString());
					}
					
					
				}
				
			}
			
			req.setAttribute("studentRegistrationBean", studentRegistrationBean);
			RequestDispatcher rd= req.getRequestDispatcher("/dao/StudentRegDao");
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
