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
	 
	  ResultSetMetaData rss=rs.getMetaData(); 
	  out.print("<table border='1'>"); 
	 
	  int n=rss.getColumnCount();   
	  for(int i=1;i<=n;i++)     
	    
	  out.print("<td> <font color=blue size=3> "+"<br>" 
	  +rss.getColumnName(i)); 
	    
	   out.print("<tr>"); 
	    
	   if(rs.next()) 
	   { 
	   for(int i=1;i<=n;i++) 
	     
	   out.print("<td><br> "+rs.getString(i)); 
	   out.print("<tr>"); 
	   } 
	   out.print("</table> </body> </html>"); 
	   con.close();  } 
	catch(Exception ex) 
	{ 
	out.print(ex);
	}
%>