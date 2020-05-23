package kr.or.ddit.servlet02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

import kr.or.ddit.enums.OperatorType;

@WebServlet("/01/calculate.do")
public class CalculateServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
	protected void service (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 피연산자, 연산자 파라미터 확보
		String leftStr = request.getParameter("left");
		String rightStr = request.getParameter("right");
		String oper = request.getParameter("operator");
		int statusCode = 0;
		
		if(StringUtils.isBlank(leftStr)||StringUtils.isNumeric(leftStr)||StringUtils.isBlank(rightStr)||
				StringUtils.isNumeric(rightStr)||StringUtils.isBlank(oper)) {
			statusCode = HttpServletResponse.SC_BAD_REQUEST;
		}
		OperatorType operator = null;
		try {
			operator = OperatorType.valueOf(oper);
		}catch (Exception e) {
			statusCode = HttpServletResponse.SC_BAD_REQUEST;
			e.printStackTrace();
		}
		
		if(statusCode!=0) {
			response.sendError(statusCode);
			return;
		}
		
		double left = Double.parseDouble(leftStr);
		double right = Double.parseDouble(rightStr);
		double result = operator.operate(left, right);
		char sign = operator.getSign();
		
		StringBuffer html = new StringBuffer("<html>");
		html.append("<body>");
		html.append(String.format("<h4>%.2f %s %.2f = %.2f", left,sign,right,result,"</h4>"));
		html.append("</body>");
		html.append("</html>");
		
		try(PrintWriter out = response.getWriter();){
			out.println(html);
		}
	}
}
