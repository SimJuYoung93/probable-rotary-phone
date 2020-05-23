<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%! 
	public String text= "텍스트"; //전역변수의 목적은 데이터 공유. JSP에서는 대안을 scope라는 개념을 활용함.
	public void test(){
		System.out.println("테스트");
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>01/standard.jsp</title>
</head>

<body>
	<h4>JSP(Java Server Page)</h4>
	<pre>
		표준 구성 요소
		1. 정적 텍스트 : 문자열, HTML, CSS, JavaScript...
		2. 스크립트 요소
			1) Scriptlet(스크립틀릿)	: <% //자바코드
 										Object 변수=null; test(); %>
 									: 실행코드, 차후에 컨데이너에 의해 서블릿 코드가 파싱 될때, 지역코드화가 됨(_JSPService)
			2) Expression(표현식)		: <%=변수 %>, <%=test() %>
									: 출력 데이터
			3) Directive(지시자)		: <%--@ --%>
									: 현재 JSP페이지에 대한 환경 정보(부가 정보) 설정.
									page (required)		: 현재 페이지에 대한 전처리.
									tablib(optional)	: 커스텀 태그 라이브러리 로딩.
									include(optional)	: 정적 내포
			4) Declaration(선언부)	: <%! %>
									: 전역변수나 메소드에 대한 선언
			5) Comment(주석)			: <!--  -->
									: client side comment : HTML,CSS, JAVASCRIPT <!--  -->
									  server side comment : JAVA, JSP /**/
		3. 기본 객체
		4. 액션 태그
		5. 표현 언어(EL)
		6. JSTL(Java Standard Tag L??)
	</pre>
</body>
</html>