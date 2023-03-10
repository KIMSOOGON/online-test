package goodee.gdj58.online.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.TeacherMapper;
import goodee.gdj58.online.vo.Example;
import goodee.gdj58.online.vo.Question;
import goodee.gdj58.online.vo.Teacher;
import goodee.gdj58.online.vo.Test;

@Service
@Transactional
public class TeacherService {
	@Autowired private TeacherMapper teacherMapper;
	
	// ===================== 문제 관련 =========================
	// answer List 답안지 출력
	public List<Map<String,Object>> getAnswerList(int testNo) {
		return teacherMapper.selectAnswerList(testNo);
	}
	
	// modfiy Example 선택지 수정
	public int modifyExample(Example example) {
		return teacherMapper.modifyExample(example);
	}
	
	// modify Question 문제 수정
	public int modifyQuestion(Question question) {
		return teacherMapper.modifyQuestion(question);
	}
	
	// oneQuestion
	public List<Map<String,Object>> getOneQuestion(int testNo, int questionNo) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("testNo", testNo);
		paramMap.put("questionNo", questionNo);
		return teacherMapper.oneQuestion(paramMap);
	}
	
	// 문제삭제 (해당문제 example도 일괄삭제처리 트랜잭션)
	public int deleteQuestionExample(int questionNo) {
		int deleteExample = teacherMapper.deleteExample(questionNo);
		return teacherMapper.deleteQuestion(questionNo);
	}
	
	// 마지막문제의 questionNo
	public int getLastQuestionNo() {
		return teacherMapper.selectLastQuestionNo();
	}
	
	// 해당회차의 마지막문제의 questionNo
	public Integer getTestOneLastQuestionNo(int testNo) {
		return teacherMapper.selectTestOneLastQuestionNo(testNo);
	}
	
	// 해당회차시험 문제 목록 (해당회차 시험 문제 및 4지선다 확인)
	public List<Map<String,Object>> getExampleList(int testNo) {
		return teacherMapper.selectExampleList(testNo);
	}
	
	// Question 등록
	public int addQuestion(Question question) {
		return teacherMapper.insertQuestion(question);
	}
	
	// Example 등록
	public int addExample(Example example) {
		return teacherMapper.insertExample(example);
	}
	
	// ===================== 시험 관련 =========================	
	// 시험 등록
	public int addTest(Test test) {
		return teacherMapper.insertTest(test);
	}
	
	// 시험 수정
	public int modifyTest(Test test) {
		return teacherMapper.updateTest(test);
	}
	
	// 시험 삭제
	public int removeTest(int testNo) {
		return teacherMapper.deleteTest(testNo);
	}
	
	// 한개의 시험
	public Test thisTest(int testNo) {
		return teacherMapper.thisTest(testNo);
	}
	
	// 총 시험 갯수
	public Integer ttlTestCnt(int currentPage, int rowPerPage, String searchWord, String testLevel) {
		int beginRow = (currentPage-1)*rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		System.out.println("service searchWord : "+searchWord);
		System.out.println("service testLevel : "+testLevel);
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		paramMap.put("testLevel", testLevel);
		return teacherMapper.ttlTestCnt(paramMap);
	}
		
	// 최근 5개 시험목록
	public List<Test> getLatestTestList() {
		return teacherMapper.selectLatestTestList();
	}
	
	// 시험 목록
	public List<Map<String,Object>> getTestList(int currentPage, int rowPerPage, String searchWord, String testLevel) {
		int beginRow = (currentPage-1)*rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		paramMap.put("testLevel", testLevel);
		return teacherMapper.selectTestList(paramMap);
	}
	
	// 시험 목록 (studentSession)
	public List<Map<String, Object>> getTestListByStudentNo(int currentPage, int rowPerPage, String searchWord, String testLevel, int studentNo) {
		int beginRow = (currentPage-1)*rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		paramMap.put("testLevel", testLevel);
		paramMap.put("studentNo", studentNo);
		return teacherMapper.selectTestListByStudentNo(paramMap);
	}
	
	
	// ====================== 강사 관련 =========================
	// 비밀번호수정
	public int updateTeacherPw(int teacherNo, String oldPw, String newPw) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("teacherNo", teacherNo);
		paramMap.put("oldPw", oldPw);
		paramMap.put("newPw", newPw);
		System.out.println(paramMap.get("newPw"));
		return teacherMapper.updateTeacherPw(paramMap);
	}
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
