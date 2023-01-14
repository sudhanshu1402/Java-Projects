<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,vdb.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
Connection con = null;
ResultSet rs=null,rs2=null;
int marks=0;
%>
<%
System.out.println("entered checkanswer.jsp");
String quesno=request.getParameter("ques");
System.out.println("prev ques no:"+quesno);
String ans=request.getParameter("q");
System.out.println("prev answer="+ans);
int teamno=Integer.parseInt(request.getParameter("teamno"));
System.out.println("Previous teamno="+teamno);
int marksperq=Integer.parseInt(session.getAttribute("marksperq").toString());
int negscore=Integer.parseInt(session.getAttribute("negscore").toString());
session.setAttribute("prevteam",String.valueOf(teamno));
%>
<html>
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="default.css" rel="stylesheet" type="text/css" />
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
<form name="f1">
<input type="text" name="ques" value="<%=quesno%>" id="ques">
<input type="text" name="team" value="<%=teamno%>" id="team">
</form>
</body>
</html>
<%
try
{
    con=Db.connect(); 
    System.out.println("set team status=no");
	String q1="update teams set status='no' where teamname="+teamno;
	Db.update(con,q1);
	//get prev marks of team
	System.out.println("get prev marks of team");
	String q2="select marks from teams where teamname="+teamno;
	rs=Db.getSelected(con,q2);
	if(rs.next())//if team exists
	{
		//get marks
		marks=rs.getInt(1);
		System.out.println("prev marks="+marks);
		//get correct answer from db
		System.out.println("get correct ans from db");
		String q3="select answer from questions where qno="+quesno;
		rs2=Db.getSelected(con,q3);
		if(rs2.next())//if question exists
		{
			//get answer
			String correctans=rs2.getString(1);
			System.out.println("correctanswer is="+correctans);
			//compare answers
			if(correctans.equals(ans))
			{
				//if answer is correct
				System.out.println("correct answer");
				//adding score
				marks=marks+marksperq;
				System.out.println("New marks="+marks);
			}
			else
			{
				//wrong answer
				System.out.println("wrong answer");
				if((marks>0)&&((marks-negscore)>=0))
				{
					//reducing score
					System.out.println("reducing score");
					marks=marks-negscore;
				}
				else
				{
					//do nothing bcoz marks are already 0
					System.out.println("do nothing");
				}
				System.out.println("New marks="+marks);
			}
			//now update database with new score
			System.out.println("update db with new score");
			String q4="update teams set marks="+marks+",status='no' where teamname="+teamno;
			Db.update(con,q4);
			System.out.println("end of updation");
			%>
			<jsp:forward page="./next.jsp"></jsp:forward>
			<%
		}
		else
		{
			System.out.println("question not found");
		}	
	}
	else
	{
		System.out.println("team not exists");
	}
	
}
catch(Exception e){
	System.out.println(e);
}
System.out.println("end of checkanswer.jsp");
 %>
