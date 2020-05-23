<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>02/requestDesc.jsp</title>
</head>
<body>
<h4>HttpServletRequest(요청)</h4>
<pre>
	HttpServletRequest req : 클라이언트의 요청 정보를 캡슐화한 객체;
	Http에 의해 요청이 패키징 되는 구조
	1. request.LINE		: URL, Protocol(version), Http Method
		-> Http Method : 요청의 목적/방법(수단)
			1) GET (R)		: 조회, Body 없음
			2) POST (C)		: 등록, Body 있음
			3) PUT (U)		: 수정, Body 있음 form이 put을 지원하지 않을 때 , method="post"로 설정,
								"_method" name의 hidden 태그 생성. hidden의 value로 put 설정
			4) DELETE (D)	: 삭제, Body 있음
			5) Headers		: 차후 응답이 전송될 때, Body가 없음
			6) Options		: preflight 요청에 주로 사용
			7) Trace		: server debugging
	2. request.HEADER	: 클라이언트와 요청에 대한 부가정보 (meta data)
	3. request.BODY(content body, message body) : 클라이언트의 명시적인 전송 컨텐츠(메시지)
	
	요청 파라미터 전송 구조
	1. POST : Body를 통해 전송
			request.setCharacterEncoding(encoding);
			- 요청의 body 영역내에 있는 특수문자에 대한 디코딩 방식 결정
	2. GET : Line을 통해 queryString의 형태로 전송
		URL에 queryString의 사용되는 형식
		주소?queryString
			sector1&sector2..
			sector=> param_name=param_value
			ex) server.xml -> http connector -> URIEncoding 설정으로 서버의 주소 해석방법을 변경
							-> useBodyEncodingForURI 설정은 setCharacterEncoding 메소드를 get방식에서도 사용가능
	
	<a href="<%=request.getContextPath() %>/02/factorial.jsp?number=5">5!연산수행</a>
	<a href="?number=5">5!연산수행</a>
	
	서버에서 파라미터 확보
	1. String getParameter(name)
	2. String[] getParameterValues(name) : 하나의 파라미터명으로 여러 값이 전달될 때
	3. Map&lt;String,String[]&gt; getParameterMap()
	4. Enumeration&lt;String&gt; getParameterNames() : 모든 파라미터명을 확보
	
</pre>
</body>
</html>