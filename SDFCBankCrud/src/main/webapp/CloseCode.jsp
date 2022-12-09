<%@ page import="java.sql.*"%>    
<%
String acno=request.getParameter("acno");
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
  		out.print("<h2>"+" Welcome "+name+"</h2>"+"<br>"+"<h2>"+"Your Account :"+acno+ ", has been closed"+"</h2>");
	else
		out.print("Transaction Failed"); 
	con.close(); 
	}
catch(Exception ex) 
{ 
out.print(ex);
}

%>
