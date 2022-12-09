<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="TransferCode.jsp" method="post">
<center>
<body bgcolor="pink"> 
<img src="teacher-hands-raised-min.jpg" alt="SDFC Logo"> 
<h1 style="color:green">SDFC Bank</h1>
<h2 style="color:green">EXTRAORDINARY SERVICES</h2> 
<a href="home.jsp">Home</a>&nbsp;&nbsp;&nbsp;&nbsp; 
<a href="register.jsp">New Account</a>&nbsp;&nbsp;&nbsp;&nbsp; 
<a href="balance.jsp">Balance</a>&nbsp;&nbsp;&nbsp;&nbsp; 
<a href="deposit.jsp">Deposit</a>&nbsp;&nbsp;&nbsp;&nbsp; 
<a href="withdraw.jsp">Withdraw</a>&nbsp;&nbsp;&nbsp;&nbsp; 
<a href="transfer.jsp">Transfer</a>&nbsp;&nbsp;&nbsp;&nbsp; 
<a href="close.jsp">Close A/C</a>&nbsp;&nbsp;&nbsp;&nbsp; 
<a href="about.jsp">About Us</a>&nbsp;&nbsp;&nbsp;&nbsp;  
<hr><p></p> 

<table border="1">
<tr><td colspan="2" align="center">Transfer Form</td></tr> 
<tr><td>Account Number</td><td><input type="text" name="acno"></td></tr>
<tr><td>Name </td><td><input type="text" name="name"></td></tr>
<tr><td>Password</td><td><input type="password" name="password"></td></tr>
<tr><td>Target Account Number</td><td><input type="text" name="tacno"></td></tr>
<tr><td>Amount </td><td><input type="text" name="amount"></td></tr>
<tr><td align="center"><input type="submit" value="Submit"></td><td align="center"><input type="reset" value="Clear"></td></tr>
</table>
</center>

</body>
</html>