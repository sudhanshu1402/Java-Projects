<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,vdb.*"%>
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
<body onload="time()">
<div id="wrapper">
  <div id="header">
    <div id="logo">
      <h1><a href="#">Computerization of Blue Book</a></h1>
      <h2><a href="http://www.freecsstemplates.org/">Online Quiz</a></h2>
    </div>
    <!-- end div#logo -->
    </div>
<%!
	Connection con = null;
	ResultSet rs=null;
%>
<%
System.out.println("Entered next.jsp");
int ques=Integer.parseInt(request.getParameter("ques"));
System.out.println("prev ques no.="+ques);
ques++;
System.out.println("new q="+ques);
int team=Integer.parseInt(session.getAttribute("prevteam").toString());
//team=Integer.parseInt(request.getParameter("team"));
System.out.println("prev team no.="+team);
team++;
System.out.println("new team="+team);
int noques=Integer.parseInt(session.getAttribute("noques").toString());
System.out.println("noques="+noques);
int noteams=Integer.parseInt(session.getAttribute("noteams").toString());
System.out.println("noteams"+noteams);
if(ques<=noques)
{
	System.out.println("ques<=noques.. continue quiz with q="+ques);
	if(team<=noteams)
	{
		System.out.println("teams<=noteams.. continue with team="+team);
	}
	else
	{
		team=1;
		System.out.println("teams over. New team="+team);
	}
%>
	<center>
	<form action="./checkanswer.jsp" name="f1">
	<h1>QUESTION <%=ques %></h1> <br />
	<h2>TEAM <%=team %></h2> <br />
	<input type="hidden" value="<%=team %>" name="teamno" id="teamno">
	<table border=0>
	<tr><th>Time Elapsed</th></tr>
	<tr><td align="center"><p id="t2"></p></td></tr>
	</table>
	<br/>
	<HR><br/>
	<table>
	<tr>
	<%
	try{
		System.out.println("connecting db");
		con=Db.connect();
	    String q1="update teams set status='yes' where teamname="+team;
		Db.update(con,q1);
	    rs=Db.getSelected(con,"select * from questions where qno="+ques);
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
	catch(Exception e)
	{
		System.out.println(e);
	}
	 %>
	 </tr>
	 </table><BR/>
	<input type="submit" value="Next">
	</form>
	</center>
	
<%
}
else
{
	System.out.println("quiz over.");
%>
	<jsp:forward page="./over.jsp"></jsp:forward>
<%
}
%>
</body>
</html>
