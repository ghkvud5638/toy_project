package show.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;


public class ShowInterceptor implements HandlerInterceptor{
	private static final Logger logger = LoggerFactory.getLogger(ShowInterceptor.class);
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		String uri = request.getRequestURI();
		String path = uri.split("/show/")[1];
		logger.info("인터셉터 book : "+path);
		
		logger.info("+ 인터셉터 +");
		HttpSession session = request.getSession();
		if (null == session.getAttribute("member_id")) {
			
			if ("book".equals(path)) {
				response.setCharacterEncoding("UTF-8"); 
				response.setContentType("text/html; charset=UTF-8");

				PrintWriter out = response.getWriter();
				out.println("<script>alert('로그인 후 예약할 수 있습니다.'); self.close(); </script> ");
				return false;
			}
			
			
			logger.info(">> 접속 불가 : 비로그인 상태");
			
			response.sendRedirect("/show/error");
			return false; //컨트롤러로 가지 않도록, 리다이렉트든 포워딩이든 return false
		}
		
		return true;
	}
	
}
