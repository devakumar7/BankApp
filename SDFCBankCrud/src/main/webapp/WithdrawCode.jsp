<%@ page import="java.sql.*"%>    
<%
String acno=request.getParameter("acno");
Long amount=Long.parseLong(request.getParameter("amount"));
String name=request.getParameter("name");
String password=request.getParameter("password");

try 
  { 
  Class.forName("oracle.jdbc.driver.OracleDriver"); 
  Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","mjdbc","mjdbc");
  PreparedStatement ps=con.prepareStatement("select * from bankcust where acno=? and name=? and password=?"); 
	ps.setString(1, acno);
	ps.setString(2, name); 
	ps.setString(3, password); 
	 
	ResultSet rs=ps.executeQuery(); 
	if(rs.next()) 
	{ 
		Long bal=rs.getLong("amount");
		if(bal>amount){
		PreparedStatement ps1=con.prepareStatement("update bankcust set amount=amount-? where acno=?"); 
		  ps1.setLong(1,amount); 
		  ps1.setString(2,acno); 
		  int i=ps1.executeUpdate(); 
		  		if(i==1)
			  		out.print(" "+i+"<h2>"+" Transaction Processed"+"</h2>"+"<br>"+"<h2>"+"Please Collect Amount"+"</h2>");
		  		else
			  		out.print(" "+i+" Transaction Failed"); 
		} 
		else 
		{ 
		out.print("Insufficient Funds"); 
		} 
	con.close(); 
	} 
}
catch(Exception ex) 
{ 
out.print(ex);
}

%>
