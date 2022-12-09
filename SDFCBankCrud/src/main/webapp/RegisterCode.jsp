<%@ page import="java.sql.*"%>     
<%

String acno=request.getParameter("acno");
String name=request.getParameter("name");
String password=request.getParameter("password");
Long amount=Long.parseLong(request.getParameter("amount"));
String address=request.getParameter("address");
String mobno=request.getParameter("mobno");

try 
  { 
  Class.forName("oracle.jdbc.driver.OracleDriver"); 
  Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","mjdbc","mjdbc"); 
  PreparedStatement ps=con.prepareStatement("insert into bankcust values(?,?,?,?,?,?)"); 
	
	ps.setString(1, acno); 
	ps.setString(2, name);
	ps.setString(3,password); 
	ps.setLong(4, amount); 
	ps.setString(5, address);
	ps.setString(6, mobno); 
	
	int i=ps.executeUpdate(); 
	if(i==1)
	out.print(" "+i+" New Account Created");
	else 
	out.print("Please input all fields"); 
	con.close(); 
	} 
	catch(Exception ex) 
	{ 
	out.print(ex);
	}

%>