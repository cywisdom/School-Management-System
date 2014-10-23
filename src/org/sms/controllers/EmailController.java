package org.sms.controllers;

import org.sms.bean.EmailBean;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EmailController extends HttpServlet{
	
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		EmailBean emailBean = new EmailBean();
		PrintWriter out = resp.getWriter();
		resp.setContentType("text/html");
		
		emailBean.setQueryEmail( req.getParameter("queryEmail"));
		emailBean.setQuerySubject( req.getParameter("querySubject"));
		emailBean.setQyeryMsg( req.getParameter("queryMsg"));
		emailBean.setQueryContact(req.getParameter("queryContact"));
		
		String host = "smtp.gmail.com";
		
		String msg = "From: " + emailBean.getQueryEmail() + "\n\n" + emailBean.getQyeryMsg() + "\n\n" + "Contact no: " + emailBean.getQueryContact();
		
	try {
		SendEmail.sendEmail(host, "kishankotadiya94@gmail.com", "Megatron", "kishankotadiya94@gmail.com", emailBean.getQuerySubject(), msg);
		req.setAttribute("msg", "Your email has been send our team will reply you soon...");
		RequestDispatcher rd = req.getRequestDispatcher("/Success.jsp");
		rd.forward(req, resp);
	} catch (Exception e) {
		req.setAttribute("msg", "You may not be connected to internet or diagnose for network problems...");
		RequestDispatcher rd = req.getRequestDispatcher("/Error.jsp");
		rd.forward(req, resp);
	}
	
	}
	
}
