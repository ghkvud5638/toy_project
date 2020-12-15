package show.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;

public class MyPageInterceptor implements HandlerInterceptor {
	private static final Logger logger = LoggerFactory.getLogger(MyPageInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		if (null == session.getAttribute("member_id")) {
			
				response.setCharacterEncoding("UTF-8"); 
				response.setContentType("text/html; charset=UTF-8");

				PrintWriter out = response.getWriter();
				out.println("<script>alert('로그인이 필요합니다.');</script> ");
			
			
			logger.info(">> 접속 불가 : 비로그인 상태");
			
			response.sendRedirect("/myPage/error");
			return false;
		}
		return true;
	}
	
}
