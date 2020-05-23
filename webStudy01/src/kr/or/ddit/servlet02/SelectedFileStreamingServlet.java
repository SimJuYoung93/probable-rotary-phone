package kr.or.ddit.servlet02;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * MIME (Multi-purposed Internet eMail Extension)
 * : 전송 데이터(content)의 종류 형태 타입에 대한 정의 문자열.
 * : mainType/subType;chartset=encoding		ex) text/html, text/plain
 *
 */
public class SelectedFileStreamingServlet extends HttpServlet {
	private File folder;
	private ServletContext application ;
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		application = getServletContext();
		System.out.println(this.getClass().getSimpleName()+"에서 확인 : "+application.hashCode());
		String contentPath = application.getInitParameter("contentsPath");
		if(contentPath==null || contentPath.isEmpty())	throw new ServletException("content path 위치 설정 오류");
		folder = new File(contentPath);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String filename = req.getParameter("filename");
		if(filename==null||filename.isEmpty()) {
			resp.sendError(400, "필수 파라미터 누락");
			return;
		}
		String mime = application.getMimeType(filename);
		
		resp.setContentType(mime);
		File imgFile = new File(folder,filename);
		byte[] buffer = new byte[1024];
		int cnt = -1;
		
		try(
			FileInputStream fis = new FileInputStream(imgFile);
			OutputStream os = resp.getOutputStream();
		){
			while((cnt=fis.read(buffer))!=-1) {
				os.write(buffer,0,cnt);
			}
		}
		
		
	}

	private String findMime(String filename) {
		int lastIndex = filename.lastIndexOf(".");
		String extension = filename.substring(lastIndex+1);
		String mime = null;
		switch(extension) {
			case "pdf": mime="application/pdf"; break;
			case "jpg": mime="image/jpeg"; break;
		}
		return mime;
	}
}
