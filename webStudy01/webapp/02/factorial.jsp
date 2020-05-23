<%@page import="java.util.Objects"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>02/factorial.jsp</title>
</head>
<body>
<% String str=request.getParameter("number"); %>
<!-- 사용자로 부터 10 이하의 숫자를 입력받아 factorial 연산 수행 -->
<!-- 1. jsp 하나로 모든 처리 -->
<!-- 2. recursive 호출구조 사용 -->
<form action="<%=request.getContextPath() %>/02/factorial.jsp" method="post">
<h4>팩토리얼 연산 수행</h4>
숫자 입력 : <input type="text" max="10" name="number" value="<%=Objects.toString(str,"") %>">
<input type="text" name="pName">
<input type="submit" value="전송">
</form>
<%!
private boolean validate(String str){
	boolean valid=true;
	if(StringUtils.isBlank(str)){
		valid=false;
	}else{
		try{
			Integer.parseInt(str);
		} catch(NumberFormatException e){
			valid=false;
		}
	}
	return valid;
}

private int factorial(int num,StringBuffer expression){
	if(num<0) throw new IllegalArgumentException(num+"은 연산 불가");
	else if(num<=1) {expression.append(num); return num;}
	else {expression.append(num+"*"); return num*factorial(num-1,expression);}
}
%>

<%

if(StringUtils.isBlank(str)){
	return;
}
if(!validate(str)){
	response.sendError(HttpServletResponse.SC_BAD_REQUEST);
	return;
}

int number=Integer.parseInt(str);
try{
	StringBuffer expression = new StringBuffer("(");
	int result = factorial(number,expression);
	expression.append(")");
	out.println(String.format("%d! = %d %s", number, result,expression));
}catch(IllegalArgumentException e){
	response.sendError(400,e.getMessage());
	return;
}
%>

</body>
</html>