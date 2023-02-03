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
import goodee.gdj58.online.service.TeacherService;
import goodee.gdj58.online.vo.Employee;
import goodee.gdj58.online.vo.Teacher;
import goodee.gdj58.online.vo.Test;

@Controller
public class TeacherController {
	@Autowired TeacherService teacherService;
	@Autowired IdService idService;
	
	// 시험 등록
	@GetMapping("/teacher/addTest")
	public String addTest(HttpSession session) {
		
		return "teacher/addTest"; // forward
	}
	@PostMapping("/teacher/addTest")
	public String addTest(HttpSession session, Test test) {		
		int row = teacherService.addTest(test);
		// row == 1 이면 입력성공
		return "redirect:/testList"; // sendRedirect, CM -> C (C로 다시 redirect)
	}
	
	// 시험 목록
	@GetMapping("/testList")
	public String testList(HttpSession session, Model model
								, @RequestParam(value="currentPage", defaultValue="1") int currentPage
								, @RequestParam(value="rowPerPage", defaultValue="10") int rowPerPage
								, @RequestParam(value="searchWord", defaultValue="") String searchWord) {
		// 페이징관련
		int ttlTestCnt = teacherService.ttlTeaCnt(searchWord);
		int lastPage = (int)Math.ceil((double)ttlTestCnt / (double)rowPerPage);
		int pageCnt =10;
		int startPage = ((currentPage-1)/pageCnt)*pageCnt + 1;
		int endPage = startPage + pageCnt - 1;
		if(endPage > lastPage) {
			endPage = lastPage;
		}
		List<Test> list = teacherService.getTestList(currentPage, rowPerPage, searchWord);
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("rowPerPage", rowPerPage);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("ttlTestCnt", ttlTestCnt);		
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		return "testList";
	}

	// ====================== 강사 관련 ========================
	// 강사 로그인
	@GetMapping("/loginTeacher")
	public String loginTeacher() {
		return "teacher/loginTeacher";
	}
	@PostMapping("/loginTeacher")
	public String loginTeacher(HttpSession session, Teacher teacher) {
		Teacher resultTeacher = teacherService.login(teacher);
		if(resultTeacher == null) {
			return "redirect:/loginTeacher";
		}
		session.setAttribute("loginTeacher", resultTeacher);
		return "redirect:/Home";
	}
		
	// 삭제 (강사삭제)
	@GetMapping("/employee/removeTeacher")
	public String removeTeacher(@RequestParam("teacherNo") int teacherNo) {
		teacherService.removeTeacher(teacherNo);
		return "redirect:/employee/teacherList"; // 리스트로 리다이렉트
	}
	
	// 입력 (강사등록)
	@GetMapping("/employee/addTeacher")
	public String addTeacher(HttpSession session) {
		
		return "employee/addTeacher"; // forward
	}
	@PostMapping("/employee/addTeacher")
	public String addTeacher(HttpSession session, Teacher teacher) {
		String idCheck = idService.getIdCheck(teacher.getTeacherId());
		if(idCheck != null) {
			return "redirect:/employee/addTeacher";
		}
		
		int row = teacherService.addTeacher(teacher);
		// row == 1 이면 입력성공
		return "redirect:/employee/teacherList"; // sendRedirect, CM -> C (C로 다시 redirect)
	}
	
	@GetMapping("/employee/teacherList")
	public String teacherList(HttpSession session, Model model
								, @RequestParam(value="currentPage", defaultValue="1") int currentPage
								, @RequestParam(value="rowPerPage", defaultValue="10") int rowPerPage
								, @RequestParam(value="searchWord", defaultValue="") String searchWord) {
		// 페이징관련
		int ttlTeaCnt = teacherService.ttlTeaCnt(searchWord);
		int lastPage = (int)Math.ceil((double)ttlTeaCnt / (double)rowPerPage);
		int pageCnt =10;
		int startPage = ((currentPage-1)/pageCnt)*pageCnt + 1;
		int endPage = startPage + pageCnt - 1;
		if(endPage > lastPage) {
			endPage = lastPage;
		}
		List<Teacher> list = teacherService.getTeacherList(currentPage, rowPerPage, searchWord);
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("rowPerPage", rowPerPage);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("ttlTeaCnt", ttlTeaCnt);		
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		return "employee/teacherList";
	}
	// ====================== 강사 관련 ========================
		
}
