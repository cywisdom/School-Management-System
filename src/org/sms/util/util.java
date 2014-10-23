package org.sms.util;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;


public class util {

	
	static Connection conn = null;
	static Statement st = null;
		
	public String dateconvert(String strDate)
	{
		
		 try
		    {
			 SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			 java.util.Date date =  (Date) dateFormat.parse(strDate);	      
		      
		      //create SimpleDateFormat object with desired date format
		      SimpleDateFormat sdfDestination = new SimpleDateFormat("dd-MMM-yyyy");
		     
		      //parse the date into another format
		      strDate = sdfDestination.format(date);
		     
		     
		      //System.out.println("Date is converted from dd/MM/yy format to MM-dd-yyyy hh:mm:ss");
		      //System.out.println("Converted date is : " + strDate);
		     
		    }
		    catch(Exception pe)
		    {
		      System.out.println("Parse Exception : " + pe);
		    }
		return strDate;
	}
	
	
	public String datemonthconvert(String strDate)
	{
		
		 try
		    {
			 SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
			 java.util.Date date =  (Date) dateFormat.parse(strDate);	      
		      
		      //create SimpleDateFormat object with desired date format
		      SimpleDateFormat sdfDestination = new SimpleDateFormat("dd-MMM-yyyy");
		     
		      //parse the date into another format
		      strDate = sdfDestination.format(date);
		     
		     
		      //System.out.println("Date is converted from dd/MM/yy format to MM-dd-yyyy hh:mm:ss");
		      //System.out.println("Converted date is : " + strDate);
		     
		    }
		    catch(Exception pe)
		    {
		      System.out.println("Parse Exception : " + pe);
		    }
		return strDate;
	}

	public Connection connect()
	{	
		  String url = "jdbc:mysql://localhost:3306/";
		  String dbName = "db";
		  String driver = "com.mysql.jdbc.Driver";
		  String userName = "root"; 
		  String password = "admin";
		  
		  try {
			  Class.forName(driver).newInstance();
			  conn = DriverManager.getConnection(url+dbName,userName,password);
			  
			  if(conn!=null)
				{
					
				}
				else
				{
					System.out.print("can't connect to database.. \n");
				}	 
			  
			 
		  }
		  catch(SQLException e)
		  {
			  System.out.print("can't connect to database.. \n");
			  System.out.print(e + "\n");
			  
		 }			  
		  catch(ClassNotFoundException e)
		  {
			  System.out.print("can't connect to database.. \n");
			  System.out.print(e + "\n");
		  } 
		  
		  catch (InstantiationException e) {
			  System.out.print("can't connect to database.. \n");
			  System.out.print(e + "\n");
		  	} 
		
		  catch (IllegalAccessException e) {
			System.out.print("can't connect to database.. \n");
			  System.out.print(e + "\n");
		  }	
		   
		  return(conn);
	}
	
	
}
