package goodee.gdj58.online.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Paper;
import goodee.gdj58.online.vo.Student;

@Mapper	
public interface StudentMapper {
	// 시험응시
	int insertPaperAnswer(Paper paper);
	int selectQuestionOx(int questionNo);
	List<Map<String,Object>> selectExampleList(int testNo); // 해당회차 시험지 출력
	
	// 학생 CRUD + list
	int updateStudentPw(Map<String,Object> paramMap);
	Student login(Student student);
	int deleteStudent(int studentNo);
	int insertStudent(Student student);
	int ttlStuCnt(String searchWord);
	List<Student> selectStudentList(Map<String, Object> paramMap);
}
