package goodee.gdj58.online.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Paper;
import goodee.gdj58.online.vo.Score;
import goodee.gdj58.online.vo.Student;

@Mapper	
public interface StudentMapper {
	// 시험응시 및 답안확인
	List<Map<String,Object>> selectScoreList(Map<String, Object> paramMap); // 내 점수 조회
	int ttlScoreCnt(Map<String,Object> paramMap); // 응시한 시험 갯수
	int insertScorePaper(Score score); // 점수 저장
	int ttlCorrectCnt(int testNo); // 맞춘 정답 갯수 (맞춘 문항의 갯수)
	int ttlQuestionCnt(int testNo); // 해당시험 전체 문항 갯수
	int insertPaperAnswer(Paper paper); // 답안지 제출
	int selectQuestionOx(int questionNo); // 정답 조회 (제출답안과 비교를 위함)
	List<Map<String,Object>> selectExampleList(int testNo); // 해당회차 시험지 출력
	
	// 학생 CRUD + list
	int updateStudentPw(Map<String,Object> paramMap);
	Student login(Student student);
	int deleteStudent(int studentNo);
	int insertStudent(Student student);
	int ttlStuCnt(String searchWord);
	List<Student> selectStudentList(Map<String, Object> paramMap);
}
