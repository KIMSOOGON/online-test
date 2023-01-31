package goodee.gdj58.online.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller()
public class HelloController {
	/*
	 * View를 리턴하는 세가지 방법
	 * 1) String return
	 * 2) void
	 * 3) ModelAndView 
	 */
	
	/*
	@GetMapping("/test")
	public String test() {
		System.out.println("test....");
		return "test"; // 뷰이름
	}
	@RequestMapping(value="/test2", method=RequestMethod.GET)
	public String test2() {
		System.out.println("test2...");
		return "test"; // 뷰이름
	}
	*/
	/*
	@GetMapping("/test")
	public void test() {
		// return타입이 void면 method가 view이름이 된다. (view=test)
		System.out.println("test....");
	}
	*/
	@GetMapping("/test")
	public ModelAndView test() {
		// return타입이 void면 method가 view이름이 된다. (view=test)
		System.out.println("ModelAndView test....");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("test");
		return mv;
	}
	
}
