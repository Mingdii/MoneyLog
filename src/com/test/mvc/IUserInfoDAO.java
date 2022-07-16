package com.test.mvc;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IUserInfoDAO
{
	// 회원이 입력한 아이디로 아이디 중복 체크 메소드
	public int checkId(String user_id) throws SQLException;
	
	// 지역 1차 리스트 메소드
	public ArrayList<UserDTO> areaFstList() throws SQLException;

	// 지역 2차 리스트 메소드
	public ArrayList<UserDTO> areaSecList() throws SQLException;

	// 직업 1차 리스트 메소드
	public ArrayList<UserDTO> jobFstList() throws SQLException;
	
	// 직업 2차 리스트 메소드
	public ArrayList<UserDTO> jobSecList() throws SQLException;

	// 아이디 찾기 메소드
	public ArrayList<UserDTO> findId(String user_name, String user_tel) throws SQLException;
	
	// 비밀번호 찾기 메소드
	public ArrayList<UserDTO> findPw(String user_name, String user_id, String user_tel) throws SQLException;
	


}
