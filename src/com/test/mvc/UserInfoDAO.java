package com.test.mvc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class UserInfoDAO implements IUserInfoDAO
{
	private DataSource dataSource;
	
	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}

	// 회원이 입력한 아이디로 아이디 중복 체크 메소드
	@Override
	public int checkId(String user_id) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT COUNT(*) AS COUNT FROM USER_INFO WHERE USER_ID = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, user_id);
		
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next())
		{
			return rs.getInt("COUNT");
		}

		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}

	// 지역 1차 리스트 메소드
	@Override
	public ArrayList<UserDTO> areaFstList() throws SQLException
	{
		ArrayList<UserDTO> result = new ArrayList<UserDTO>();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT AREA_FST_CD, AREA_FST_NAME"
				   + " FROM AREA_FST";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			UserDTO dto = new UserDTO();
			
			dto.setArea_fst_cd(rs.getString("AREA_FST_CD"));
			dto.setArea_fst_name(rs.getString("AREA_FST_NAME"));
			
			result.add(dto);
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}

	
	// 지역 2차 리스트 메소드
	@Override
	public ArrayList<UserDTO> areaSecList() throws SQLException
	{
		ArrayList<UserDTO> result = new ArrayList<UserDTO>();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT AREA_SEC_CD, AREA_SEC_NAME"
				  + " FROM AREA_SEC"
				  + " ORDER BY AREA_SEC_CD";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			UserDTO dto = new UserDTO();
			
			dto.setArea_sec_cd(rs.getString("AREA_SEC_CD"));
			dto.setArea_sec_name(rs.getString("AREA_SEC_NAME"));
			
			result.add(dto);
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}

	// 직업 1차 리스트 메소드
	@Override
	public ArrayList<UserDTO> jobFstList() throws SQLException
	{
		ArrayList<UserDTO> result = new ArrayList<UserDTO>();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT JOB_FST_CD, JOB_FST_NAME"
				   + " FROM JOB_FST"
				   + " ORDER BY JOB_FST_CD";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			UserDTO dto = new UserDTO();
			
			dto.setJob_fst_cd(rs.getString("JOB_FST_CD"));
			dto.setJob_fst_name(rs.getString("JOB_FST_NAME"));
			
			result.add(dto);
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	// 직업 2차 리스트 메소드
	@Override
	public ArrayList<UserDTO> jobSecList() throws SQLException
	{
		ArrayList<UserDTO> result = new ArrayList<UserDTO>();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT JOB_SEC_CD, JOB_SEC_NAME"
				   + " FROM JOB_SEC"
				   + " ORDER BY JOB_SEC_CD";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			UserDTO dto = new UserDTO();
			
			dto.setJob_sec_cd(rs.getString("JOB_SEC_CD"));
			dto.setJob_sec_name(rs.getString("JOB_SEC_NAME"));
			
			result.add(dto);
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}

	// 비밀번호 찾는 메소드
	@Override
	public ArrayList<UserDTO> findPw(String user_name, String user_id, String user_tel) throws SQLException
	{
		ArrayList<UserDTO> result = new ArrayList<UserDTO>();

		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT USER_PW"
				  + " FROM USER_INFO"
				  + " WHERE USER_NAME=?"
				  + " AND USER_ID=? AND USER_TEL=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, user_name);
		pstmt.setString(2, user_id);
		pstmt.setString(3, user_tel);
		
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			UserDTO user = new UserDTO();
			
			user.setUser_pw(rs.getString("USER_PW"));
			
			result.add(user);
		}
		
		rs.close();
		pstmt.close();
		conn.close();

		return result;
	}

	// 이름과 전화번호를 이용해서 아이디 찾기 메소드
	@Override
	public ArrayList<UserDTO> findId(String user_name, String user_tel) throws SQLException
	{
		ArrayList<UserDTO> result = new ArrayList<UserDTO>();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT USER_ID, USER_DATE FROM USER_INFO WHERE USER_NAME = ? AND USER_TEL = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, user_name);
		pstmt.setString(2, user_tel);
		
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			UserDTO user = new UserDTO();
			
			user.setUser_id(rs.getString("USER_ID"));
			user.setUser_date(rs.getString("USER_DATE"));
			
			result.add(user);
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	

	
}
