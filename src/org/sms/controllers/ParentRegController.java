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
import org.sms.bean.ParentRegBean;
import org.sms.util.util;

public class ParentRegController extends HttpServlet{
	
	ParentRegBean parentRegBean = new ParentRegBean();
	util utilobj = new util();

	FileInputStream fis;


	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		ServletContext getServletContext = getServletContext();
    	String path = getServletContext.getInitParameter("filepath");
		
		resp.setContentType("text/html;charset=UTF-8");

		if (!ServletFileUpload.isMultipartContent(req)) {
			throw new IllegalArgumentException(
					"Request is not multipart, please 'multipart/form-data' enctype for your form.");
		}

		ServletFileUpload uploadHandler = new ServletFileUpload(
				new DiskFileItemFactory());
		
		
		try {
			@SuppressWarnings("unchecked")
			List<FileItem> items = uploadHandler.parseRequest(req);
			for (FileItem item : items) {
				if (!item.isFormField()) {
					try{
					File file = new File(path, item.getName());
					item.write(file);
					 
					parentRegBean.setImagepath(path+item.getName());
					}
					catch(FileNotFoundException ex)
					{
						parentRegBean.setImagepath("Images/user.png");
						
					}
					
				}
				
				
				if (item.isFormField()) {
					String fieldName = item.getFieldName();

					if ("fname".equals(fieldName)) {
						parentRegBean.setFname(item.getString());
					}
					if ("mname".equals(fieldName)) {
						parentRegBean.setMname(item.getString());
					}
					if ("lname".equals(fieldName)) {
						parentRegBean.setLname(item.getString());
					}

					if ("newpassword".equals(fieldName)) {
						parentRegBean.setPassword(item.getString());
					}
					
					if ("dob".equals(fieldName)) {
						parentRegBean.setDob(item.getString());
					}
					
					if ("gender".equals(fieldName)) {
						parentRegBean.setGender(item.getString());
					}
					
					if ("address1".equals(fieldName)) {
						parentRegBean.setAddress1(item.getString());
					}
					
					if ("pfax".equals(fieldName)) {
						parentRegBean.setPfax(item.getString());
					}
					
					if ("phpn".equals(fieldName)) {
						parentRegBean.setPhpn(item.getString());
					}
					if ("pmno".equals(fieldName)) {
						parentRegBean.setPmno(item.getString());
					}
					if ("email".equals(fieldName)) {
						parentRegBean.setEmail(item.getString());
					}
					if ("studentno".equals(fieldName)) {
						parentRegBean.setStudentNo(item.getString());
					}
					
					if ("address2".equals(fieldName)) {
						parentRegBean.setAddress2(item.getString());
					}
					
				}
				
			}
			
			req.setAttribute("parentRegBean", parentRegBean);
			RequestDispatcher rd= req.getRequestDispatcher("/dao/ParentRegDao");
		     rd.forward(req,resp);
		} catch (FileUploadException e) {
			throw new RuntimeException(e);
		} catch (Exception e) {
			e.printStackTrace();
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
