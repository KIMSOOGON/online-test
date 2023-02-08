package goodee.gdj58.online.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import lombok.extern.slf4j.Slf4j;

@Slf4j // static Log log = new Log();
@WebFilter("/testList")
public class TestListFilter implements Filter {
    @Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
    	
    	log.debug("\u001B[31m"+"TestListFilter(권한 확인중)");
    	
    	if(request instanceof HttpServletRequest) {
    		HttpServletRequest req = (HttpServletRequest)request;
    		HttpSession session = req.getSession();
    		
    		// employee항목 사용전 로그인부터
    		if(session.getAttribute("loginEmp") == null
    				&& session.getAttribute("loginTeacher") == null
    				&& session.getAttribute("loginStudent") == null) {
    			String restrictedMsg = "restricted access"; // return 문구
    			((HttpServletResponse)response).sendRedirect(req.getContextPath()+"/Home?restrictedMsg="+restrictedMsg);
    			return;
    		}
    	} else {
    		log.debug("웹브라우저 요청만 허용");
    		return;
    	}
    	
    	// controller 전
    	chain.doFilter(request, response);
    	
    	// controller 후
	}


}
