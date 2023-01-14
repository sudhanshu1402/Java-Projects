<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="default.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>welcome admin</title>
<script language="javascript">
function change(url)
{
	window.navigate(url);
}
</script>
</head>
<body>
<div id="wrapper">
  <div id="header">
    <div id="logo">
      <h1><a href="#">Computerization of Blue Book</a></h1>
      <h2><a href="http://www.freecsstemplates.org/">Online Quiz</a></h2>
    </div>
    <!-- end div#logo -->
    </div>
<center>
<h1>WELCOME ADMINISTRATOR</h1>
<hr><br/><br/>
<input type="button" value="START QUIZ" onclick="change('./startquiz.jsp')"><br/><br/>
<input type="button" value="DELETE ALL PREVIOUS RESULTS" onclick="change('./endquiz.jsp')"><br/><br/>
<input type="button" value="    QUIT    " onclick="window.close()"><br/><br/>
</center>
</body>
</html>