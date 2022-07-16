package com.test.mvc;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface IAdminDAO
{
	// 게시글 신고 미처리건 카운트
	public int countPostRept();
	
	// 댓글 신고 미처리건 카운트
	public int countCmntRept();
	
	// 문의글 미처리건 카운트
	public int countQna();
	
	// 영구정지 회원 리스트
	public ArrayList<UserDTO> banList();
	
	// 게시글 신고처리 리스트
	public ArrayList<PostReptDTO> postReptList();
	
	

	// ==========================================현지 추가 
	
	// 관리자 로그인
	public AdminDTO adLogin(@Param("ad_id") String ad_id, @Param("ad_pw") String ad_pw);
	
	// 회원 목록 리스트
	public ArrayList<AdminDTO> adUserList();
	
	// 회원 정보 조회
	public AdminDTO adUserInfo(AdminDTO dto); 
	
	// 회원 신고내역리스트 조회
	public ArrayList<AdminDTO> userReptHistory(AdminDTO dto); 
	
	// 회원 게시글리스트 조회
	public ArrayList<AdminDTO> adUserPostList(AdminDTO dto);
	
	// 회원 댓글 리스트 조회
	public ArrayList<AdminDTO> adUserCmntList(AdminDTO dto);
	
	// 영구정지회원 리스트 조회
	public ArrayList<AdminDTO> adBanList();
	
	// 게시글신고접수 내역 리스트 조회
	public ArrayList<AdminDTO> adPostReptList();
	
	// 게시글 신고 내용 조회
	public AdminDTO adPostRept(AdminDTO dto);
	
	// 게시글 신고 승인 처리  -- insert
	public int adPostReptOk(AdminDTO dto);
	
	// 댓글신고접수 내역 리스트 조회
	public ArrayList<AdminDTO> adCmntReptList();
	
	// 댓글 신고 내용 조회
	public AdminDTO adCmntRept(AdminDTO dto);
	
	// 댓글 신고 승인 처리 -- insert
	public int adCmntReptOk(AdminDTO dto);
	
	// ==========================================윤태 추가 
	
	// 미처리된 신고 게시글 카운트
	public int mainCountPostRept();
			
	// 댓글 신고 미처리건 카운트
	public int mainCountCmntRept();
		
	// 문의글 미처리건 카운트
	public int mainCountQna();
		
	public ArrayList<AdminDTO> mainNotiList(AdminDTO dto);
	
	// 전체 이용자 수 조회
	public int mainUserCount();
	
	// 금일 신규 이용자 수 조회
	public int mainNewUserCount();
	
	// 금일 탈퇴 이용자 수 조회
	public int mainLeaveUserCount();
	
	// 전체 게시글 수 조회
	public int mainContentCount();
	
	// 금일 신규 게시글 수 조회
	public int mainNewContentCount();
	
	// 비공개 게시글 수 조회 
	public int mainReptContentCount();
	
	// 비공개 댓글 수 조회
	public int mainReptCmntCount();
	
	// 월별 신규 회원 수 조회
	public int mainMonthUserCount(String month);
	
	// 월별 탈퇴 회원 수 조회
	public int mainMonthLeaveUserCount(String month);
	
	//==================================================
}
