package goodee.gdj58.online.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.EmployeeMapper;
import goodee.gdj58.online.mapper.IdMapper;
import goodee.gdj58.online.vo.Employee;
import goodee.gdj58.online.vo.Student;
import goodee.gdj58.online.vo.Teacher;

@Service
@Transactional
public class EmployeeService {
	// DI new EmployeeMapper()
	@Autowired // bin스캔 -> 강제주입 (dependency injection)
	private EmployeeMapper employeeMapper;
	
	// ====================== 사원 관련 =========================
	// 비밀번호수정
	public int updateEmployeePw(int empNo, String oldPw, String newPw) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("empNo", empNo);
		paramMap.put("oldPw", oldPw);
		paramMap.put("newPw", newPw);
		System.out.println(paramMap.get("newPw"));
		return employeeMapper.updateEmployeePw(paramMap);
	}
	
	// 사원로그인
	public Employee login(Employee emp) {
		return employeeMapper.login(emp);
	}
	
	// 사원삭제
	public int removeEmployee(int empNo) {
		return employeeMapper.deleteEmployee(empNo);
	}
	
	// 사원등록
	public int addEmployee(Employee employee) {
		return employeeMapper.insertEmployee(employee);
	}
	
	// 총 사원 수
	public int ttlEmpCnt() {
		return employeeMapper.ttlEmpCnt();
	}
	
	// 사원목록
	public List<Employee> getEmployeeList(int currentPage, int rowPerPage) {
		int beginRow = (currentPage-1)*rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		return employeeMapper.selectEmployeeList(paramMap);
	}
}
