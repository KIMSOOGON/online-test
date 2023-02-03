package goodee.gdj58.online.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.TeacherMapper;
import goodee.gdj58.online.vo.Teacher;
import goodee.gdj58.online.vo.Test;

@Service
@Transactional
public class TeacherService {
	@Autowired private TeacherMapper teacherMapper;
	
	// ===================== 시험 관련 =========================
	// 시험 등록
	public int addTest(Test test) {
		return teacherMapper.insertTest(test);
	}
	
	// 총 시험 갯수
	public int ttlTestCnt(String searchWord) {
		return teacherMapper.ttlTestCnt(searchWord);
	}
		
	// 시험 목록
	public List<Test> getTestList(int currentPage, int rowPerPage, String searchWord) {
		int beginRow = (currentPage-1)*rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		return teacherMapper.selectTestList(paramMap);
	}
	
	
	// ====================== 강사 관련 =========================
	// 강사 로그인
	public Teacher login(Teacher teacher) {
		return teacherMapper.login(teacher);
	}
	
	// 강사삭제
	public int removeTeacher(int teacherNo) {
		return teacherMapper.deleteTeacher(teacherNo);
	}
	
	// 강사등록
	public int addTeacher(Teacher teacher) {
		return teacherMapper.insertTeacher(teacher);
	}
	
	// 총 강사 수
	public int ttlTeaCnt(String searchWord) {
		return teacherMapper.ttlTeaCnt(searchWord);
	}
	
	// 강사목록
	public List<Teacher> getTeacherList(int currentPage, int rowPerPage, String searchWord) {
		int beginRow = (currentPage-1)*rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		return teacherMapper.selectTeacherList(paramMap);
	}
	
}
