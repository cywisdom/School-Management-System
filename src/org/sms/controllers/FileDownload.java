package org.sms.controllers;

import java.io.*;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FileDownload extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String filename = request.getParameter("file");
		//System.out.print(filename);
		ServletContext getServletContext = getServletContext();
		String path = getServletContext.getInitParameter("docsuploadpath");
		File file = new File(path, filename);
		FileInputStream fileIn = new FileInputStream(file);
		ServletOutputStream outwrite = response.getOutputStream();

		int i;
		while ((i = fileIn.read()) != -1) {
			outwrite.write(i);
		}

		fileIn.close();
		outwrite.flush();
		outwrite.close();
		
	}

}
