package goodee.gdj58.online.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IdMapper {
	// 사용가능한 아이디면 null, 불가능하면 아이디
	public String selectIdCheck(String id);
}
