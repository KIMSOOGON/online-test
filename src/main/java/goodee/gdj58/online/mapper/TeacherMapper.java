package goodee.gdj58.online.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Example;
import goodee.gdj58.online.vo.Question;
import goodee.gdj58.online.vo.Teacher;
import goodee.gdj58.online.vo.Test;

@Mapper	
public interface TeacherMapper {
	

	// Question 및 Example CRUD + LIST
	List<Map<String,Object>> selectAnswerList(int testNo);
	int modifyExample(Example example);
	int modifyQuestion(Question question);
	List<Map<String,Object>> oneQuestion(Map<String, Object> paramMap);
	int deleteExampleOne(int exampleNo);
	int deleteExample(int questionNo);
	int deleteQuestion(int questionNo);
	int selectLastQuestionNo();
	List<Map<String,Object>> selectExampleList(int testNo);
	int insertExample(Example example);
	int insertQuestion(Question question);
	
	// Test CRUD + list
	Test thisTest(int testNo);
	int insertTest(Test test);
	int updateTest(Test test);
	int deleteTest(int testNo);
	int ttlTestCnt(Map<String, Object> paramMap);
	List<Test> selectTestList(Map<String, Object> paramMap);
	
	
	// Teacher CRUD + list
	int updateTeacherPw(Map<String,Object> paramMap);
	Teacher login(Teacher teacher);
	int deleteTeacher(int teacherNo);
	int insertTeacher(Teacher teacher);
	int ttlTeaCnt(String searchWord);
	List<Teacher> selectTeacherList(Map<String, Object> paramMap);
}
