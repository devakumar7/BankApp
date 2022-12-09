<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String acno=request.getParameter("acno");
Long amount=Long.parseLong(request.getParameter("amount"));
String name=request.getParameter("name");
String password=request.getParameter("password");
String tacno=request.getParameter("tacno");

try{ 
  Class.forName("oracle.jdbc.driver.OracleDriver"); 
  Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","mjdbc","mjdbc");
  
  PreparedStatement ps=con.prepareStatement("select * from bankcust where acno=? and name=? and password=?"); 
 
  ps.setString(1,acno); 
  ps.setString(2, name); 
  ps.setString(3, password);
	
	 
	ResultSet rs=ps.executeQuery(); 
	if(rs.next()) 
	{ 
		Long bal=rs.getLong("amount");
		if(bal>amount)
		{
			try
			{
			Class.forName("oracle.jdbc.driver.OracleDriver"); 	   
			PreparedStatement ps1=con.prepareStatement("update bankcust set amount=amount-? where acno=?"); 
		  	ps1.setLong(1,amount); 
		  	ps1.setString(2, acno);
		 	int i=ps1.executeUpdate();
		 			if(i==1)
		 			{
		 				  out.print(" "+i+" Amount Transferred Successfully");
		 				try
		 				{
		 				Class.forName("oracle.jdbc.driver.OracleDriver"); 
		 			  	PreparedStatement ps2=con.prepareStatement("update bankcust set amount=amount+? where acno=?"); 
		 			  	ps2.setLong(1,amount); 
		 			  	ps2.setString(2,tacno); 
		 				 
		 			  	int i1=ps2.executeUpdate(); 
		 			  		if(i1==1)
			 				  out.print(" "+i1+" Amount Added to Beneficiary Successfully");
		 			  		else
				 			 	  out.print(" "+i1+" Amount Addition Failed");
		 				}
		 				catch(Exception e){out.print(e);}
		 			}
		 			else
		 			 	  out.print(" "+i+" Transfer Failed");
			}
			catch(Exception e){out.print(e);}
		} 
		 else{
				out.print("Insufficient Funds");}  
	}
	con.close();
	}
	catch(Exception ex) {out.print(ex);}

%>


</body>
</html>