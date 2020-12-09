package show.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class AdminInterceptor implements HandlerInterceptor {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		logger.info("+++인터셉터 시작+++");
		logger.info("	Request URI : " + request.getRequestURI());
		
		HttpSession session = request.getSession();
		
		if( session.getAttribute("login") == null ) {
			logger.info(" >> 접속 불가: 관리자 비 로그인 상태");
			
			response.sendRedirect("/admin/loginfail");
			
			return false; //컨트롤러 접근 금지
		} else {
			logger.info(">> 정상 접근 : 관리자 로그인");
			return true;
		}
		
	}


}
