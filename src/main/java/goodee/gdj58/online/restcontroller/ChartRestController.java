package goodee.gdj58.online.restcontroller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import goodee.gdj58.online.service.StudentService;
import goodee.gdj58.online.vo.Student;

@RestController
public class ChartRestController {
	@Autowired StudentService studentService;
	
	@GetMapping("/scoreChart")
	public List<Map<String,Object>> monthDate(HttpSession session
						, @RequestParam(value="currentPage", defaultValue="1") int currentPage
						, @RequestParam(value="rowPerPage", defaultValue="10") int rowPerPage
						, @RequestParam(value="searchWord", defaultValue="") String searchWord) {
		Student loginStudent = (Student)session.getAttribute("loginStudent");
		int studentNo = loginStudent.getStudentNo();
		List<Map<String,Object>> list = studentService.selectScoreList(studentNo, currentPage, rowPerPage, searchWord);
		
		return list;
	}
}
