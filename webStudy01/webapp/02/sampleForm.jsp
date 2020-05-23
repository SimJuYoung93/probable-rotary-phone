<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>02/sampleForm.jsp</title>
</head>
<body>
<!-- 이름, 생년월일, 나이, 학력, 성별, 자격증, 경력사항 -->
<%
	Map<String,String> gradeMap = new LinkedHashMap<>();
	Map<String,String> licenseMap = new LinkedHashMap<>();
	
	gradeMap.put("G001","고졸");
	gradeMap.put("G002","대재");
	gradeMap.put("G003","초대졸");
	gradeMap.put("G004","대졸");
	gradeMap.put("G005","석사");
	gradeMap.put("G006","박사");
	
	licenseMap.put("L001","정보처리기사");
	licenseMap.put("L002","정보보안기사");
	licenseMap.put("L003","SQLD");
	licenseMap.put("L004","SQLP");
%>
<form action="<%=request.getContextPath() %>/02/sampleProcess.jsp" method="post">
	<pre>
		이름 : <input type="text" name="name"/><br>
		생일 : <input type="date" name="birthday"/><br>
		나이 : <input type="number" name="age"/><br>
		학력 : <select name="grade">
				<option value>학력</option>
				<%
					for(Entry<String,String> entry :gradeMap.entrySet()){
						%>
						<option value="<%=entry.getKey()%>"><%=entry.getValue() %></option>
						<%
					}
				%>
			</select><br>
		성별 : <label><input type="radio" name="gen" value="F"/>여자</label>
			 <label><input type="radio" name="gen" value="M"/>남자</label><br>
		자격증 :
			<select name="license" multiple>
				<%
					Iterator<String> keys = licenseMap.keySet().iterator();
					while(keys.hasNext()){
						String code = keys.next();
						String name = licenseMap.get(code);
						%>
						<option value="<%=code %>"><%=name %></option>
						<%
					}
				
				%>
			</select><br>
		경력사항 : 
			<textarea name="career" rows="5" cols="50"></textarea>
		<button type="submit">등록</button>
		<button type="reset">취소</button>
		<button type="button">걍버튼</button>
	</pre>
</form>
</body>
</html>