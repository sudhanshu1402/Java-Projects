<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,vdb.Db"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="default.css" rel="stylesheet" type="text/css" />
<title></title>
<script language="javascript">
function calc()
{
	var mpq=document.getElementById('marksperq').value;
	var noq=document.getElementById('noques').value;
	var noteams=document.getElementById('noteams').value;
	if((mpq!="")&&(noq!=""))
	{
		var t=(noq/noteams)*mpq;
		document.getElementById('total').value=t;
	}
	else
	{
		alert("Check the information again");
	}
}
function check() // called onclick of submit button
{
	var total=document.getElementById('total').value;
	var pass=document.getElementById('passmarks').value;
	if(total<pass)
	{
		alert("pass marks must be less than total marks");
		document.getElementById('passmarks').value="";
		document.getElementById('passmarks').focus();
		return false;
	}
	else
	{
		return true;
	}
}
function qpt()
{
	var noq=document.getElementById('noques').value;
	var noteams=document.getElementById('noteams').value;
	if(!(noq % noteams==0))
	{
		alert("Questions are not enough for teams");
		document.getElementById('noques').value="";
		document.getElementById('noques').focus();
	}
}
</script>
</head>
<body onload="document.getElementById('noteams').focus()">
<div id="wrapper">
  <div id="header">
    <div id="logo">
      <h1><a href="#">Computerization of Blue Book</a></h1>
      <h2><a href="http://www.freecsstemplates.org/">Online Quiz</a></h2>
    </div>
    <!-- end div#logo -->
    </div>
<%
System.out.println("inside nextquiz.jsp");
System.out.println("updating session");
int newstartq=Integer.parseInt(session.getAttribute("noques").toString());
session.setAttribute("prevnoques",String.valueOf(newstartq));
newstartq++;
System.out.println("new start ques="+newstartq);
session.setAttribute("startques",String.valueOf(newstartq));
int newquizno=Integer.parseInt(session.getAttribute("quiznum").toString());
Connection con=Db.connect();
Db.deleteTable(con,"teams");
int oldmaxscore=Integer.parseInt(session.getAttribute("maxscore").toString());
Db.update(con,"update admin set status='no',maxscore="+oldmaxscore+" where quizno="+newquizno);
newquizno++;
System.out.println("new quiznum="+newquizno);
session.setAttribute("quiznum",String.valueOf(newquizno));

%>
<center><br/><br/><br/>
<fieldset>
<legend align="center"><b>Enter Quiz Details</b></legend>
<form action="./save.jsp">
<table cellpadding="5">
<tr>
<th align="right">Enter No. of teams in the quiz : </th>
<td><input type="text" name="noteams" id="noteams" value="<%=session.getAttribute("newteams").toString() %>" readonly></td>
</tr>
<tr>
<th align="right">Enter No. of questions in the quiz : </th>
<td><input type="text" name="noques" id="noques" onblur="qpt()"></td>
</tr>
<tr>
<th align="right">Enter marks for correct answer : </th>
<td><input type="text" name="marksperq" id="marksperq"></td>
</tr>
<tr>
<th align="right">Enter marks for wrong answer : </th>
<td><input type="text" name="negscore" id="negscore"></td>
</tr>
<tr>
<th align="right"><input type="button" value="Calculate Average Marks" onclick="calc()" name="cal" id="cal"></th>
<td><input type="text" name="total" id="total" readonly></td>
</tr>
<tr>
<th align="right">Enter pass marks : </th>
<td><input type="text" name="passmarks" id="passmarks"></td>
</tr>
<tr><th colspan="2">
<input type="submit" value="  SAVE  ">&nbsp;&nbsp;&nbsp;
<input type="reset" value="CANCEL">&nbsp;&nbsp;&nbsp;
<input type="button" value="MAIN MENU" onclick="window.navigate('./adminduties.jsp')">&nbsp;&nbsp;&nbsp;
<input type="button" value="  QUIT  " onclick="window.close()">
</th></tr>
</table>
</fieldset>
</center>
</body>
</html>