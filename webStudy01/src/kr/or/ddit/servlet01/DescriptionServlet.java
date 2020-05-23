package kr.or.ddit.servlet01;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 서블릿 운영과정에서 컨테이너으 ㅣ역할
 * container : 컨테이너에 의해 관리되는 객체의 라이프 사이클 제어자.
 * web Container==Servlet Container==JSP Container==WAS(Web Application Server) --> tomcat
 * 1. 서블릿의 객체 생성 : 해당 서블릿을 대상으로 최초의 요청이 발생(load-on-startup 으로 생성시점 제어 가능)
 * 		생성된 서블릿은 기본 싱글턴으로 관리
 * 		- init
 * 2. 매핑된 요청이 발생하면, 관련된 콜백 메소드 호출
 * 		- service, doXXX
 * 3. 필요없어지면, GC의 대상으로 설정
 * 		- destroy
 *
 */

public class DescriptionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DescriptionServlet() {
        super();
        System.out.println(getClass().getSimpleName()+" 서블릿 객체 생성");
    }
    
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		String param = config.getInitParameter("test");
		Enumeration<String> names = config.getInitParameterNames();
		
		while(names.hasMoreElements()) {
			String name = (String) names.nextElement();
			String value = config.getInitParameter(name);
			System.out.printf("%s : %s",name,value);
		}
		System.out.println(getClass().getSimpleName() + " 서블릿 초기화, 전달 파라미터 : "+param);
	}
    
	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
		System.out.println("service 메서도 첫 라인");
		super.service(req, res);
		System.out.println("service 메서도 마지막 라인");
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(Thread.currentThread().getName());
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	@Override
	public void destroy() {
		super.destroy();
		System.out.println(getClass().getSimpleName() + " 서블릿 소멸");
	}


}
