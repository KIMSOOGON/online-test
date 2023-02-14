package goodee.gdj58.online.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.service.EmployeeService;
import goodee.gdj58.online.service.IdService;
import goodee.gdj58.online.vo.Employee;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EmployeeController {
	@Autowired EmployeeService employeeService;
	@Autowired IdService idService;

	// ============================= 직원 로그인관련 ===============================
	// pw수정
	@GetMapping("/employee/modifyEmpPw")
	public String modifyEmpPw() {
		return "employee/modifyEmpPw";
	}
	@PostMapping("/employee/modifyEmpPw")
	public String modifyEmpPw(HttpSession session
							, @RequestParam(value="oldPw") String oldPw
							, @RequestParam(value="newPw") String newPw) {
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		System.out.println(loginEmp.getEmpNo()+oldPw+newPw);
		employeeService.updateEmployeePw(loginEmp.getEmpNo(), oldPw, newPw);
		return "redirect:/employee/empList";
	}
	// 로그인 폼
	@GetMapping("/loginEmp")
	public String loginEmp(Model model, HttpSession session
							, @RequestParam(value="failLogin",defaultValue="") String failLogin) { // 세션이 필요한 로직은 매개변수로 세션을 받아온다
		log.debug("loginEmp Form");
		log.debug("\u001B[31m failLogin : "+failLogin);
		if(!failLogin.equals("")) {
			log.debug("\u001B[31m 로그인실패 : "+failLogin);
			model.addAttribute("failLogin",failLogin);
		}
		if(session.getAttribute("loginTeacher") != null || session.getAttribute("loginStudent") != null) {
			session.invalidate(); // 로그인 중첩 방지, 기존 로그인정보 자동로그아웃
		}
		return "employee/loginEmp";
	}
	// 로그인 액션
	@PostMapping("/loginEmp")
	public String loginEmp(HttpSession session, Employee emp) { // 세션이 필요한 로직은 매개변수로 세션을 받아온다
		Employee resultEmp = employeeService.login(emp);
		if(resultEmp == null) { // 로그인 실패
			String failLogin = "failLogin";
			log.debug("\u001B[31m"+"로그인실패"+failLogin);
			return "redirect:/loginEmp?failLogin="+failLogin;
		}
		session.setAttribute("loginEmp", resultEmp);
		return "redirect:/Home";
	}
	
	// ---- 로그인 후에 사용가능한 기능 (삭제 등록) ----
	
	// 삭제 (사원삭제)
	@GetMapping("/employee/removeEmp")
	public String removeEmp(@RequestParam("empNo") int empNo) {
		employeeService.removeEmployee(empNo);
		return "redirect:/employee/empList"; // 리스트로 리다이렉트
	}
	
	// 입력 (사원등록)
	@GetMapping("/employee/addEmp")
	public String addEmp() {
		return "employee/addEmp"; // forward
	}
	@PostMapping("/employee/addEmp")
	public String addEmp(HttpSession session, Employee employee) {
		String idCheck = idService.getIdCheck(employee.getEmpId());
		if(idCheck != null) {
			return "redirect:/employee/addEmp";
		}
		int row = employeeService.addEmployee(employee);
		// row == 1 이면 입력성공
		return "redirect:/employee/empList"; // sendRedirect, CM -> C (C로 다시 redirect)
	}
	
	// 리스트
	@GetMapping("/employee/empList")
	public String empList(Model model
							, @RequestParam(value="currentPage", defaultValue="1") int currentPage
							, @RequestParam(value="rowPerPage", defaultValue="10") int rowPerPage
							, @RequestParam(value="searchWord", defaultValue="") String searchWord) { 
							// int currentPage = request.getParameter("currentPage");
							// 장점 : 형변환(Integer) 및 if null 처리 할 필요가 없어짐
		log.debug("\u001B[31m"+"currentPage : "+currentPage);
		log.debug("\u001B[31m"+"searchWord : "+searchWord);
		// 페이징관련
		int ttlEmpCnt = employeeService.ttlEmpCnt(searchWord);
		int lastPage = (int)Math.ceil((double)ttlEmpCnt / (double)rowPerPage);
		int pageCnt =10;
		int startPage = ((currentPage-1)/pageCnt)*pageCnt + 1;
		int endPage = startPage + pageCnt - 1;
		if(endPage > lastPage) {
			endPage = lastPage;
		}
		List<Employee> list = employeeService.getEmployeeList(currentPage, rowPerPage, searchWord);
		// request.setAttribute("list", list);
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("rowPerPage", rowPerPage);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("ttlEmpCnt", ttlEmpCnt);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		return "employee/empList";
	}
}
