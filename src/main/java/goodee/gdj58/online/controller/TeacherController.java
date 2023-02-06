package goodee.gdj58.online.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.service.IdService;
import goodee.gdj58.online.service.TeacherService;
import goodee.gdj58.online.vo.Example;
import goodee.gdj58.online.vo.Question;
import goodee.gdj58.online.vo.Teacher;
import goodee.gdj58.online.vo.Test;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TeacherController {
	@Autowired TeacherService teacherService;
	@Autowired IdService idService;
	
	// ====================== testOne.jsp ==========================
	// 문제 수정
	@GetMapping("/teacher/modifyQuestion")
	public String modifyQuestionExample(Model model
											, @RequestParam(value="questionNo") int questionNo
											, @RequestParam(value="testNo") int testNo){
		List<Map<String,Object>> list = teacherService.getOneQuestion(testNo, questionNo);	
		model.addAttribute("list",list);
		
		return "teacher/modifyQuestion";
	}
	
	
	// 문제 삭제
	@GetMapping("/teacher/removeQuestion")
	public String removeQuestionExample(@RequestParam(value="questionNo") int questionNo
											,@RequestParam(value="testNo") int testNo){
		teacherService.deleteQuestionExample(questionNo);
		return "redirect:/teacher/testOne?testNo="+testNo;
	}
	
	// 문제 등록 (exmple도 동시에)
	@PostMapping("/teacher/addQuestionExample")
	public String addQuestionExample(Question question
										, @RequestParam(value="exampleTitle") String[] exampleTitle
										, @RequestParam(value="exampleIdx") int[] exampleIdx
										, @RequestParam(value="exampleOx") int exampleOx) {
		log.debug("\u001B[31m"+"questionTitle : "+question.getQuestionTitle());
		log.debug("\u001B[31m"+"questionIdx : "+question.getQuestionIdx());
		log.debug("\u001B[31m"+"testNo : "+question.getTestNo());
		
		int addQuestion = teacherService.addQuestion(question);
		if(addQuestion == 1) {
			log.debug("\u001B[31m"+"qustionAdd 성공");
		}
		int lastQuestionNo = teacherService.getLastQuestionNo();
		int testNo = question.getTestNo();

		Example[] example = new Example[4];
		log.debug("\u001B[31m"+"exampleLength : "+example.length);
		for(int i=0; i<example.length; i++) {
			example[i] = new Example();
			example[i].setQuestionNo(lastQuestionNo);
			// log.debug("\u001B[31m"+"test : "+i);
			log.debug("\u001B[31m"+"questionNo : "+example[i].getQuestionNo());
			example[i].setExampleTitle(exampleTitle[i]);
			log.debug("\u001B[31m"+"exampleTitle : "+example[i].getExampleTitle());
			example[i].setExampleIdx(exampleIdx[i]);
			example[i].setExampleOx("오답");
			if(exampleOx == (i+1)) {
				example[i].setExampleOx("정답");
			} 
			int addExample = teacherService.addExample(example[i]);
			if(addExample == 1) {
				log.debug("\u001B[31m"+"test : "+example[i]);
				log.debug("\u001B[31m"+exampleIdx[i]+"번 선택지 등록 성공");
			}
			
		}		
		return "redirect:/teacher/testOne?testNo="+testNo;
	}
	
	// 문제 목록 
	@GetMapping("/teacher/testOne")
	public String testOne(Model model
							, @RequestParam(value="testNo") int testNo) {
		List<Map<String,Object>> list = teacherService.getExampleList(testNo);
		Test thisTest = teacherService.thisTest(testNo);
		int ttlQstCnt = list.size() / 4;
		int lastQuestionNo = teacherService.getLastQuestionNo();
		// 문제갯수
		log.debug("\u001B[31m"+"총 문제 수 : "+ttlQstCnt);
		model.addAttribute("list", list);
		model.addAttribute("ttlQstCnt", ttlQstCnt);
		model.addAttribute("thisTest", thisTest);
		model.addAttribute("lastQuestionNo", lastQuestionNo);
		return "teacher/testOne";
	}
	
	// ================= testList.jsp =====================
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
	public String testList(Model model
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
	public String addTeacher() {
		
		return "employee/addTeacher"; // forward
	}
	@PostMapping("/employee/addTeacher")
	public String addTeacher(Teacher teacher) {
		String idCheck = idService.getIdCheck(teacher.getTeacherId());
		if(idCheck != null) {
			return "redirect:/employee/addTeacher";
		}
		
		int row = teacherService.addTeacher(teacher);
		// row == 1 이면 입력성공
		return "redirect:/employee/teacherList"; // sendRedirect, CM -> C (C로 다시 redirect)
	}
	
	@GetMapping("/employee/teacherList")
	public String teacherList(Model model
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
