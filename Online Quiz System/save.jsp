<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,vdb.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="default.css" rel="stylesheet" type="text/css" />
<title></title>
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
<%
System.out.println("Saving the quiz info.");
int quiznum=Integer.parseInt(session.getAttribute("quiznum").toString());
System.out.println("quiznum from session="+quiznum);
int noteams=Integer.parseInt(request.getParameter("noteams"));
System.out.println("noteams="+noteams);
int noques=Integer.parseInt(request.getParameter("noques"));
System.out.println("noques="+noques);
int prevnoques=Integer.parseInt(session.getAttribute("prevnoques").toString());
System.out.println("prevnoques="+prevnoques);
noques=noques+prevnoques;
System.out.println("newnoques="+noques);
 int marksperq=Integer.parseInt(request.getParameter("marksperq"));
int negscore=Integer.parseInt(request.getParameter("negscore"));
int total=Integer.parseInt(request.getParameter("total"));
int passmarks=Integer.parseInt(request.getParameter("passmarks"));
int startques=Integer.parseInt(session.getAttribute("startques").toString());
System.out.println("Saving the quiz info. in session..");
session.setAttribute("total",String.valueOf(total));
session.setAttribute("noques",String.valueOf(noques));
session.setAttribute("noteams",String.valueOf(noteams));
session.setAttribute("startques",String.valueOf(startques));
session.setAttribute("marksperq",String.valueOf(marksperq));
session.setAttribute("negscore",String.valueOf(negscore));
session.setAttribute("passmarks",String.valueOf(passmarks));
System.out.println("session set successfully..");

Connection con = null;
String q1="",q2="";
%>
<%
try{
	System.out.println("Entering quiz info. in database");
    con=Db.connect();
    q1="insert into admin values("+quiznum+","+noteams+","+marksperq+","+negscore+","+noques+","+passmarks+",0,'yes')";
    Db.insert(con,q1);
    System.out.println("Generating teams and their scores");
    for(int n=1;n<=noteams;n++)
    {
    	q2="insert into teams values("+n+",0,'no')";
    	Db.insert(con,q2);
    }
    System.out.println("end of code");
}
catch(Exception e)
{
	System.out.println(e);
}
%>
<br/>
<center>
<h1>RULES OF QUIZ</h1>
<br/>
<hr/>
<form action="./nonpasson.jsp">
<table width="60%" align="center" cellpadding="10">
<tr>
<th>1.</th>
<th align="left">THE TIME IS 30 SECONDS FOR EACH QUESTION.</th>
</tr>
<tr>
<th>2.</th>
<th align="left">UNATTEMPTED QUESTIONS ALSO CARRIES NEGATIVE MARKS.</th>
</tr>
</table><br/><br/><br/>
<input type="submit" value="START QUIZ">
</form>
</center>
</body>
</html>