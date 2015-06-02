package study.jsp.mysite.dao;

import study.jsp.mysite.model.Teacher;

public interface TeacherDao {

	/**
	 *  회원가입을 처리한다. --> INSERT 수행
	 *  @param	member	저장할 값을 담고 있는 Member 클래스의 객체
	 *  @return	int		저장된 행의 Primary key값
	 */
	public int doJoin(Teacher teacher);
	
}
