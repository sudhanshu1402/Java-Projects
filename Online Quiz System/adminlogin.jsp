<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="default.css" rel="stylesheet" type="text/css" />
<title>welcome admin</title>
<script language="javascript">
function fun()
{
	var us=document.getElementById("id").value;
	var psw=document.getElementById("psw").value;
	if((us=="admin")&&(psw="admin"))
	{
		document.getElementById("err").style.visibility="hidden";
		return true;
	}
	else
	{
		document.getElementById("err").style.visibility="visible";
		document.getElementById("id").value="";
		document.getElementById("psw").value="";
		document.getElementById("id").focus();
		return false;
	}
}
</script>
</head>
<body onload="document.getElementById('id').focus()">
<div id="wrapper">
  <div id="header">
    <div id="logo">
      <h1><a href="#">Computerization of Blue Book</a></h1>
      <h2><a href="http://www.freecsstemplates.org/">Online Quiz</a></h2>
    </div>
    <!-- end div#logo -->
    </div>
<center>
<h1>ADMINISTRATOR LOGIN</h1>
<hr>
</center>
<form action="./adminduties.jsp">
<table align="center" cellpadding="5">
<tr>
<th>User Name:</th><td><input type="text" name="id" id="id"></td>
</tr>
<tr>
<th>Password:</th><td><input type="password" name="psw" id="psw"></td>
</tr>
<tr>
<th colspan="2"><input type="submit" value="  Login  " onclick="return fun()">&nbsp;&nbsp;&nbsp;&nbsp;
<input type="reset" value=" Cancel "></th>
</tr>
<tr>
<th colspan="2" id="err" style="visibility:hidden">Sorry!! Invalid user name / password..</th>
</tr>
</table>
</form>
</body>
</html>