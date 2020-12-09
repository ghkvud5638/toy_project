package show.interceptor;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;


public class AttractionInterceptor implements HandlerInterceptor{
	private static final Logger logger = LoggerFactory.getLogger(AttractionInterceptor.class);
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		String uri = request.getRequestURI();
		String path = uri.split("/attraction/")[1];
		logger.info("인터셉터 book : "+path);
		
		System.out.println("인터셉터 작동");
		logger.info("+ 인터셉터 +");
//		HttpSession session = request.getSession();
		if ("list".equals(path)) {
			response.setCharacterEncoding("UTF-8"); 
			response.setContentType("text/html; charset=UTF-8");
			int i = 0;
			Enumeration requestParam = request.getParameterNames();
			System.out.println(requestParam.hasMoreElements());
			while(requestParam.hasMoreElements()) {
				i++;
				System.out.println((String)requestParam.nextElement());
				
			}
			
			if(i < 2) {
				System.out.println("나 없어");
				response.sendRedirect("/attraction/list?boardType=image&curPage=1");
				
				return false;

			} else {
				System.out.println("나 있어");
				
			}
			
		}
		return true;
	}
	
}
