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
import goodee.gdj58.online.vo.Student;
import goodee.gdj58.online.vo.Teacher;

@Controller
public class EmployeeController {
	@Autowired EmployeeService employeeService;
	@Autowired IdService idService;
	
	// ====================== 학생 관련 CRUD ========================
	// 삭제 (강사삭제)
		@GetMapping("/employee/removeStudent")
		public String removeStudent(HttpSession session, @RequestParam("studentNo") int studentNo) {
			Employee loginEmp = (Employee)session.getAttribute("loginEmp");
			if(loginEmp == null) {
				return "redirect:/employee/loginEmp";
			}
			
			employeeService.removeStudent(studentNo);
			return "redirect:/employee/studentList"; // 리스트로 리다이렉트
		}
		
		// 입력 (강사등록)
		@GetMapping("/employee/addStudent")
		public String addStudent(HttpSession session) {
			Employee loginEmp = (Employee)session.getAttribute("loginEmp");
			if(loginEmp == null) {
				return "redirect:/employee/loginEmp";
			}
			
			return "employee/addStudent"; // forward
		}
		@PostMapping("/employee/addStudent")
		public String addStudent(HttpSession session, Student student) {
			String idCheck = idService.getIdCheck(student.getStudentId());
			if(idCheck != null) {
				return "redirect:/employee/addStudent";
			}
			
			int row = employeeService.addStudent(student);
			// row == 1 이면 입력성공
			return "redirect:/employee/studentList"; // sendRedirect, CM -> C (C로 다시 redirect)
		}
		
		@GetMapping("/employee/studentList")
		public String studentList(HttpSession session, Model model
									, @RequestParam(value="currentPage", defaultValue="1") int currentPage
									, @RequestParam(value="rowPerPage", defaultValue="10") int rowPerPage) {
			// 직원만 조회 가능
			Employee loginEmp = (Employee)session.getAttribute("loginEmp");
			if(loginEmp == null) {
				return "redirect:/employee/loginEmp";
			}
			
			List<Student> list = employeeService.getStudentList(currentPage, rowPerPage);
			model.addAttribute("list", list);
			model.addAttribute("currentPage", currentPage);
			return "employee/studentList";
		}	
	// ====================== 학생 관련 CRUD ========================
	
	// ====================== 강사 관련 CRUD ========================
	// 삭제 (강사삭제)
	@GetMapping("/employee/removeTeacher")
	public String removeTeacher(HttpSession session, @RequestParam("teacherNo") int teacherNo) {
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "redirect:/employee/loginEmp";
		}
		
		employeeService.removeTeacher(teacherNo);
		return "redirect:/employee/teacherList"; // 리스트로 리다이렉트
	}
	
	// 입력 (강사등록)
	@GetMapping("/employee/addTeacher")
	public String addTeacher(HttpSession session) {
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "redirect:/employee/loginEmp";
		}
		
		return "employee/addTeacher"; // forward
	}
	@PostMapping("/employee/addTeacher")
	public String addTeacher(HttpSession session, Teacher teacher) {
		String idCheck = idService.getIdCheck(teacher.getTeacherId());
		if(idCheck != null) {
			return "redirect:/employee/addTeacher";
		}
		
		int row = employeeService.addTeacher(teacher);
		// row == 1 이면 입력성공
		return "redirect:/employee/teacherList"; // sendRedirect, CM -> C (C로 다시 redirect)
	}
	
	@GetMapping("/employee/teacherList")
	public String teacherList(HttpSession session, Model model
								, @RequestParam(value="currentPage", defaultValue="1") int currentPage
								, @RequestParam(value="rowPerPage", defaultValue="10") int rowPerPage) {
		// 직원만 조회 가능
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "redirect:/employee/loginEmp";
		}
		
		List<Teacher> list = employeeService.getTeacherList(currentPage, rowPerPage);
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		return "employee/teacherList";
	}
	// ====================== 강사 관련 CRUD ========================
	
	
	// ================= 직원 로그인관련 ====================
	// pw수정
	@GetMapping("/employee/modifyEmpPw")
	public String modifyEmpPw(HttpSession session) {
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "redirect:/employee/loginEmp";
		}
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
	
	// 로그인
	@GetMapping("/employee/loginEmp")
	public String loginEmp(HttpSession session) { // 세션이 필요한 로직은 매개변수로 세션을 받아온다
		// 이미 로그인상태라면 redirect:/employee/empList
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp != null) {
			return "redirect:/employee/empList";
		}
		
		return "employee/loginEmp";
	}
	@PostMapping("/employee/loginEmp")
	public String loginEmp(HttpSession session, Employee emp) { // 세션이 필요한 로직은 매개변수로 세션을 받아온다
		Employee resultEmp = employeeService.login(emp);
		if(resultEmp == null) { // 로그인 실패
			return "redirect:/employee/loginEmp";
		}
		session.setAttribute("loginEmp", resultEmp);
		return "redirect:/employee/empList";
	}
	
	// 로그아웃
	@GetMapping("/employee/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/employee/loginEmp";
	}
	// ============================= 직원 로그인관련 ===============================
	
	// ---- 로그인 후에 사용가능한 기능 (삭제 등록) ----
	
	// 삭제 (사원삭제)
	@GetMapping("/employee/removeEmp")
	public String removeEmp(HttpSession session, @RequestParam("empNo") int empNo) {
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "redirect:/employee/loginEmp";
		}
		
		employeeService.removeEmployee(empNo);
		return "redirect:/employee/empList"; // 리스트로 리다이렉트
	}
	
	// 입력 (사원등록)
	@GetMapping("/employee/addEmp")
	public String addEmp(HttpSession session) {
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "redirect:/employee/loginEmp";
		}
		
		return "employee/addEmp"; // forward
	}
	@PostMapping("/employee/addEmp")
	public String addEmp(HttpSession session, Employee employee) {
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
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
	public String empList(HttpSession session, Model model
							, @RequestParam(value="currentPage", defaultValue="1") int currentPage
							, @RequestParam(value="rowPerPage", defaultValue="10") int rowPerPage) { 
							// int currentPage = request.getParameter("currentPage");
							// 장점 : 형변환(Integer) 및 if null 처리 할 필요가 없어짐
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "redirect:/employee/loginEmp";
		}
		
		List<Employee> list = employeeService.getEmployeeList(currentPage, rowPerPage);
		// request.setAttribute("list", list);
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		return "employee/empList";
	}
}
