<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,vdb.*, javax.servlet.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="default.css" rel="stylesheet" type="text/css" />
<title></title>
<script language="javascript">
var i=0,j=0;
function time()
{
i++;
if(i==30)
{
	document.f1.submit();
}
document.getElementById('t2').innerHTML="";
document.getElementById('t2').innerHTML=i;
t=setTimeout('time()',1000); 
}
</script>
</head>
<body onload="time()" >
<div id="wrapper">
  <div id="header">
    <div id="logo">
      <h1><a href="#">Computerization of Blue Book</a></h1>
      <h2><a href="http://www.freecsstemplates.org/">Online Quiz</a></h2>
    </div>
    <!-- end div#logo -->
    </div>
<center>
<form action="./checkanswer.jsp" name="f1">
<h1>QUESTION 1</h1> <br />
<h2>TEAM 1</h2> <br />
<input type="hidden" value="1" name="teamno" id="teamno">
<table border=0><tr><th>Time Elapsed</th></tr><tr><td align="center"><p id="t2"></p></td></tr></table>
<br/>
<HR><br/>
<table>
<tr>
<%!
Connection con = null;
ResultSet rs=null;
%>
<%
try{
	System.out.println("entered nonpasson.jsp");
	//int curq=Integer.parseInt(session.getAttribute("startques").toString());
    con=Db.connect();   
    int startques=Integer.parseInt(session.getAttribute("startques").toString());
    String q1="update teams set status='yes' where teamname=1";
	Db.update(con,q1);
    rs=Db.getSelected(con,"select * from questions where qno="+startques);
    if(rs.next())
	{
%>
<td><%=rs.getInt(1) %>.<input type="hidden" value="<%=rs.getInt(1) %>" name="ques" id="ques"></td>
<td><%=rs.getString(2) %></td>
</tr>
<tr><td><input type="radio" name="q" id="q1" value="A"></td>	
<td><%=rs.getString(4) %></td>
</tr>
<tr><td><input type="radio" name="q" id="q2" value="B"></td>	
<td><%=rs.getString(5) %></td>
</tr>
<tr><td><input type="radio" name="q" id="q3" value="C"></td>	
<td><%=rs.getString(6) %></td>
</tr>
<tr><td><input type="radio" name="q" id="q4" value="D"></td>
<td><%=rs.getString(7) %></td>			
<%
}
}
catch(Exception e){
	System.out.println(e);
}
 %>
 </tr>
 </table><BR/>
<input type="submit" value="Next">
</form>
</center>
</body>
</html>