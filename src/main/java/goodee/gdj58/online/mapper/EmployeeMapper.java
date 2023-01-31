package goodee.gdj58.online.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Employee;

@Mapper
public interface EmployeeMapper {
	// 필요한 쿼리 적기 (select) 
	// --> 하나의 파일안에 추상메서드, 쿼리 모두 존재해야 mybatis가 구현체를 만들어 spring에 보관
	// --> 가독성이 떨어지므로 쿼리를 분리할 예정 (mybatis xml)
	// @Select("")
	Employee login(Employee employee);
	int deleteEmployee(int empNo);
	int insertEmployee(Employee employee);
	List<Employee> selectEmployeeList(Map<String, Object> paramMap);
}
