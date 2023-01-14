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
<center>
<br/>
<h1>SCORE BOARD</h1>
<HR/>
<br/>
<table border=1>
<tr>
<th>TEAM NAME</th>
<th>SCORE</th>
</tr>
<%!	int maxscore=0;
Connection con=null;
%>
<%
System.out.println("Entered score.jsp");
con=Db.connect();
ResultSet rs=Db.getTable(con,"teams");
while(rs.next())
{
	%>
	<tr>
	<td><%=rs.getString(1) %></td>
	<td><%=rs.getString(2) %></td>
	</tr>
	<%	
}
%>
</table>
<br/>
<hr/>
<br/>

<%
ResultSet rs2=Db.getSelected(con,"select max(marks) from teams");
if(rs2.next())
{
	maxscore=rs2.getInt(1);
}
%>
<h2>Max. score : <%=maxscore %></h2>
<hr/>
<%
session.setAttribute("maxscore",String.valueOf(maxscore));
int passmarks=Integer.parseInt(session.getAttribute("passmarks").toString());
if(maxscore>=passmarks)
{
	%>
	<h2>WINNERS FOR THIS ROUND</h2>
	<hr/>
	<table>
	<tr>
	<th><h3>TEAM NUMBER</h3></th>
	</tr>	
	<%
		ResultSet rs3=Db.getSelected(con,"select teamname from teams where marks>="+passmarks+" order by marks desc");
		int newteams=0;
		while(rs3.next())
		{ 	
			newteams++;
			%>
			<tr><th><%=rs3.getInt(1) %></th></tr>
			<%
		}
		session.setAttribute("newteams",String.valueOf(newteams));
		if(newteams!=1)
		{
	%>
	</table>
	<br/>
	<form action="./nextquiz.jsp" name="f1">
	<input type="submit" value="PLAY NEXT ROUND">
	</form>
	<%
		}
		else
		{

		}
}
else
{
	%>
	<h2>OOPS!! NO WINNERS FOR THIS ROUND</h2>
	<BR/>
	<form action="./endquiz.jsp" name="f2">
	<input type="submit" value="END QUIZ">
	</form>
	<%
}
%>
<br/>
<input type="button" value="           MAIN MENU          " onclick="window.navigate('./endquiz.jsp')">
</center>
</body>
</html>