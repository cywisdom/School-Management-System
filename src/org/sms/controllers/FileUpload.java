package org.sms.controllers;


import java.awt.image.BufferedImage;
import java.io.*;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.imgscalr.Scalr;
import org.json.JSONArray;
import org.json.JSONObject;
import org.sms.util.util;

public class FileUpload extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		util utilobj = new util();
		Statement stmt;
		ResultSet rs;
		Connection conn = null;
		conn = utilobj.connect();

		HttpSession session = request.getSession();
		String user_Id = (String)session.getAttribute("user_Id");

		if (request.getParameter("deleteurl") != null) {
			
			
			String deletefilepath = request.getParameter("deleteurl");
			String filepath = deletefilepath.substring(22);		
			ServletContext getServletContext = getServletContext();
			String path = getServletContext.getInitParameter("docsuploadpath");
			File f1 = new File(path, filepath);
			f1.delete();
			
			try {
				stmt = conn.createStatement();
				String qurey = "delete from docs_mst where doc_name='"+ filepath +"' and user_Id='"+user_Id  +"' ";
				int r = stmt.executeUpdate(qurey);
			} catch (SQLException e) {

				e.printStackTrace();
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 * 
	 */
	@SuppressWarnings("unchecked")
	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		util utilobj = new util();
		Statement stmt;
		ResultSet rs;
		Connection conn = null;
		conn = utilobj.connect();
		if (!ServletFileUpload.isMultipartContent(request)) {
			throw new IllegalArgumentException(
					"Request is not multipart, please 'multipart/form-data' enctype for your form.");
		}

		ServletContext getServletContext = getServletContext();
		String path = getServletContext.getInitParameter("docsuploadpath");

		ServletFileUpload uploadHandler = new ServletFileUpload(
				new DiskFileItemFactory());
		PrintWriter writer = response.getWriter();
		response.setContentType("application/json");
		JSONArray json = new JSONArray();

		HttpSession session = request.getSession();
		String user_Id = (String)session.getAttribute("user_Id");
		
		String filepath = null;
		String title = null;
		String ext =null;
		Random rand = new Random(); 
		 
		try {

			List<FileItem> items = uploadHandler.parseRequest(request);
			for (FileItem item : items) {

				if (!item.isFormField()) {
										
					int value = rand.nextInt(1000000000)+1;
					
					String val =  String.valueOf(value);					
					 ext = getSuffix(item.getName());
					filepath = val + "." +ext;
					
					if(ext.equals("doc")||ext.equals("pdf")||ext.equals("ppt")||ext.equals("xls")||ext.equals("rar")||ext.equals("zip")||ext.equals("docx")||ext.equals("xlsx")||ext.equals("pptx"))
					{					
					}
					else{	throw new Exception();}
					File file = new File(path, filepath);					
					item.write(file);					
					
					JSONObject jsono = new JSONObject();
					jsono.put("name", item.getName());
					jsono.put("size", item.getSize());
					jsono.put("url", "UploadServlet?getfile=" + filepath);
					jsono.put("thumbnail_url",
							"UploadServlet?getthumb=" + filepath);
					jsono.put("delete_url",
							"UploadServlet?delfile=" + filepath);
					jsono.put("delete_type", "GET");
					json.put(jsono);
				}

				if (item.isFormField()) {
					String fieldName = item.getFieldName();
					if ("title".equals(fieldName)) {
						title = item.getString();

						// throw new Exception();
					}

				}

				if (filepath != null) {
					try {
						stmt = conn.createStatement();
						String qurey = "insert into docs_mst (user_Id,title,doc_name,upload_time) values ('"+user_Id+"','"+title+"','"+ filepath +"','"+getCurrentDateTime()+"')";
						int r = stmt.executeUpdate(qurey);
					} catch (SQLException e) {

						e.printStackTrace();
					}

				}
			}
		} catch (FileUploadException e) {
			throw new RuntimeException(e);
		} catch (Exception e) {
			try{
			JSONObject jsono = new JSONObject();
			jsono.put("error", "File format is not supported.");
			json.put(jsono);
			}
			catch(Exception ex){}
		}		
		finally {
			writer.write(json.toString());
			writer.close();
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
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

	public String getCurrentDateTime() {

		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		// get current date time with Date()
		Date date = new Date();
		String timestamp = dateFormat.format(date);
		return timestamp;

	}
}