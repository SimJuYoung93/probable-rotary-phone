<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>02/calendar.jsp</title>
<style type="text/css">
/* 	table{border-collapse:collapse; border: 1px solid black;} */
/* 	tr,td,th{border:1px solid black;width:35px; height: 35px;} */
	tr,td,th{width:35px; height: 35px;}
	th{font-size:13pt; padding: 2px; vertical-align: middle;}
	td{text-align:center;}
	button,h4{display:inline-block;margin:5px;}
	button{width:30px; height: 30px; padding: 5px; border-radius: 50%;
		border:none; cursor: pointer;}
	#showDate{padding-left:10px; text-align:left;}
	#button{text-align:center;}
	a{text-decoration: none; color:black; font-size:12pt;}
</style>
</head>
<body>
<%!
	String[] days = {"일","월","화","수","목","금","토"};
	Calendar cal = Calendar.getInstance();
		
	int year = 2020;
	int month = 1;
	int week = 0;
	int startDay=1;
	int endDay=1;
	
%>
<%
	//초기 셋팅
	Calendar cal = Calendar.getInstance();

	year = cal.get(Calendar.YEAR);
	month = cal.get(Calendar.MONTH)+1;
	week = cal.get(Calendar.DAY_OF_WEEK);
	startDay = cal.getMinimum(Calendar.DAY_OF_MONTH);
	endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	
	cal.set(year,month,1);
	
	try{
		year = Integer.parseInt(request.getParameter("year"));
		month = Integer.parseInt(request.getParameter("month"));
	}catch(Exception e){
		year=cal.get(Calendar.YEAR);
		month=cal.get(Calendar.MONTH);
	}

	if(month==13){
		year++; month=1;
	}else if(month==0){
		year--; month=12;
	}
	
	cal.set(year,month-1,1);
%>
<%
	
%>

<table>
	<thead>
		<tr>
			<td id="showDate" colspan='5'>
				<a href="" id=""><%=year %>년 <%=month %>월</a>
			</td>
			<td id="button">
				<a href="?year=<%=year%>&month=<%=month-1%>">Λ</a>
			</td>
			<td id="button">
				<a href="?year=<%=year%>&month=<%=month+1%>">Ｖ</a>
			</td>
		</tr>
		
		<tr><!-- 요일 표시 -->
			<% for(int i=0;i<days.length;i++){%>
			<th><%=days[i]%><%}%></th>
		</tr>
	</thead>

	<tbody>
		<tr>
		<%
		week = cal.get(Calendar.DAY_OF_WEEK);
		endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		int count =0;
		
		for(int i=1;i<week;i++){
			out.println("<td>&nbsp;</td>"); count++;
		}
		
		for(int j=startDay;j<=endDay;j++){
			cal.set(Calendar.YEAR,(Calendar.MONTH)-1,j);
			if(count%7==0) {
				%><td style="color:red;"><%=j %></td><%
			}else if(count%7==6){
				%><td style="color:blue;"><%=j %></td><%
			}else{%><td><%=j %></td><%}
			
			if(count%7==6){
				%></tr><%
				if(j<endDay) {
					%><tr><%
				}
			}
			count++;
		}
		%>
		</tr>
	</tbody>
</table>
</body>
</html>