package goodee.gdj58.online.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.service.IdService;
import goodee.gdj58.online.service.StudentService;
import goodee.gdj58.online.vo.Employee;
import goodee.gdj58.online.vo.Student;

@Controller
public class StudentController {
	@Autowired StudentService studentService;
	@Autowired IdService idService;
	
	// 로그인 폼
	@GetMapping("/loginStudent")
	public String loginEmp() { // 세션이 필요한 로직은 매개변수로 세션을 받아온다
		return "student/loginStudent";
	}
	// 로그인 액션
	@PostMapping("/loginStudent")
	public String loginEmp(HttpSession session, Student student) { // 세션이 필요한 로직은 매개변수로 세션을 받아온다
		Student resultStudent = studentService.login(student);
		if(resultStudent == null) { // 로그인 실패
			return "redirect:/loginStudent";
		}
		session.setAttribute("loginStudent", resultStudent);
		return "redirect:/Home";
	}
		
	// ====================== 학생 관련 CRUD ========================
	// 삭제 (학생삭제)
		@GetMapping("/employee/removeStudent")
		public String removeStudent(HttpSession session, @RequestParam("studentNo") int studentNo) {
			Employee loginEmp = (Employee)session.getAttribute("loginEmp");
			if(loginEmp == null) {
				return "redirect:/employee/loginEmp";
			}
			
			studentService.removeStudent(studentNo);
			return "redirect:/employee/studentList"; // 리스트로 리다이렉트
		}
		
		// 입력 (학생등록)
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
			
			int row = studentService.addStudent(student);
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
			
			List<Student> list = studentService.getStudentList(currentPage, rowPerPage);
			model.addAttribute("list", list);
			model.addAttribute("currentPage", currentPage);
			return "employee/studentList";
		}	
	// ====================== 학생 관련 CRUD ========================
}
