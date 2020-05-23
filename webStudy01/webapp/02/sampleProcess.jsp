<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>02/sampleProcess.jsp</title>
<style type="text/css">
 table{border-collapse:collapse; border:1px solid black;}
 tr,td,th{border:1px solid black;}
</style>
</head>
<body>
<!-- 전송 파라미터의 처리자 -->
<%
	Map<String,String> nameMap = new LinkedHashMap<>();
	nameMap.put("name","이름");
	nameMap.put("birthday","생일");
	nameMap.put("age","나이");
	nameMap.put("grade","학력");
	nameMap.put("gen","성별");
	nameMap.put("license","자격증");
	nameMap.put("career","경력사항");
%>
<table>
	<thead>
		<tr>
			<th>파라미터 명</th>
			<th>파라미터 값</th>
		</tr>
	</thead>
	<tbody>
		<%
			request.setCharacterEncoding("UTF-8"); //한글 인코딩방식 정할때 파라미터 꺼내기 전에 먼저 셋팅해주기
			Map<String,String[]> detailMap = request.getParameterMap();
			
			for(Entry<String,String[]> entry:detailMap.entrySet()){
				String paramName = entry.getKey();
				String[] values=entry.getValue();
				%>
				<tr>
					<td><%=nameMap.get(paramName) %></td>
					<td><%=Arrays.toString(values) %></td>
				</tr>
				<%
			}
		%>
	</tbody>
</table>
</body>
</html>