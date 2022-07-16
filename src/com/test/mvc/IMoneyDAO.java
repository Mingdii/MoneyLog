package com.test.mvc;

import java.util.ArrayList;

public interface IMoneyDAO
{
	// ○ 머니리뷰 ===========================
	
	// 모든 머니리뷰 수 (페이징) (★ 공개된 머니리뷰)
	public int allPostCount();
	
	// 머니리뷰 리스트 가져오기
	public ArrayList<MoneyDTO> getPostList(MoneyDTO dto);
	
 	// 머니리뷰 조회수 증가
 	public Integer postViewPlus(MoneyDTO dto);
 	
	
	// 마이태그 가져오기
	public String myTag(MoneyDTO dto);
	
	// 지난 6개월간 60개 이상 작성한 날짜 가져오기
	public ArrayList<MoneyDTO> countCheck(MoneyDTO dto);

	
	// 이미 등록된 게시글 체크
	public ArrayList<MoneyDTO> aleadyCheck(MoneyDTO dto);
	
	
	// 머니리뷰 게시글 추가
	public int postAdd(MoneyDTO dto);
	
	// 머니리뷰 게시글 수정
	public int postUpdate(MoneyDTO dto);
	
	
	// 머니리뷰 "방금 게시한" 게시글 코드 구하기 (활용정보, 선택한날짜 활용)
	public int postCd(MoneyDTO dto);
	
	
	// 머니리뷰 게시글 코드로 게시글 불러오기
	public ArrayList<MoneyDTO> postFind(MoneyDTO dto);
	
	// 머니리뷰 등록한 개수 구하기
	public int postCount(String user_dstn_cd);
	
	
	// 머니리뷰 수입/지출 리스트
	public ArrayList<MoneyDTO> inOutList(MoneyDTO dto);
	
	
	// 머니리뷰 수입/지출 데이터
	public ArrayList<MoneyDTO> inOutData(MoneyDTO dto);
	
	// 머니리뷰 총 수입 금액
	public int postTotalIn(MoneyDTO dto);
	
	// 머니리뷰 총 지출 금액
	public int postTotalOut(MoneyDTO dto);
	
	
	// 머니리뷰 해당 게시글 이모티콘 COUNT
	public ArrayList<MoneyDTO> emtcCount(MoneyDTO dto);
	
	
	// 머니리뷰 해당 게시글 이모티콘 1 누른 회원들
	public ArrayList<MoneyDTO> emtc1(MoneyDTO dto);

	// 머니리뷰 해당 게시글 이모티콘 1 누른 회원들
	public ArrayList<MoneyDTO> emtc2(MoneyDTO dto);
	
	// 머니리뷰 해당 게시글 이모티콘 1 누른 회원들
	public ArrayList<MoneyDTO> emtc3(MoneyDTO dto);

	// 머니리뷰 해당 게시글 이모티콘 1 누른 회원들
	public ArrayList<MoneyDTO> emtc4(MoneyDTO dto);
		
	// 머니리뷰 해당 게시글 이모티콘 1 누른 회원들
	public ArrayList<MoneyDTO> emtc5(MoneyDTO dto);

	
	// 머니리뷰 해당 게시글 이모티콘 INSERT
	public int emtcAdd(MoneyDTO dto);
	
	// 머니리뷰 해당 게시글 이모티콘 DELETE
	public int emtcDel(MoneyDTO dto);
	
	
	// 머니리뷰 댓글 조회
	public ArrayList<MoneyDTO> cmntList(MoneyDTO dto);
	
	// 머니리뷰 해당 게시글 댓글 등록
	public int cmntAdd(MoneyDTO dto);
	
	// 머니리뷰 댓글 수정
	public int cmntEdit(MoneyDTO dto);
	
	// 머니리뷰 댓글 삭제
	public int cmntDel(MoneyDTO dto);
	
	// 게시글 신고 - rnum 으로 구하기
	public ArrayList<MoneyDTO> postReptRnum(String post_cd);
	
	// 게시글 신고
	public int postRept (MoneyDTO dto);
	
	// 게시글 신고 (기타)
	public int postReptDtl (MoneyDTO dto);
	
	// 댓글 신고 - rnum 으로 구하기
	public ArrayList<MoneyDTO> cmntReptRnum(String cmnt_cd);
	
	// 게시글 신고
	public int cmntRept (MoneyDTO dto);
	
	// 게시글 신고 (기타)
	public int cmntReptDtl (MoneyDTO dto);
	
	// =========================== 머니리뷰 끝
	
	// ▼ 관리자
	
	// 모든 머니리뷰 수 (페이징) (★ 전체 머니리뷰)
	public int totalPostCount();
		
	// 모든 머니리뷰 수 (페이징) (★ 비공개된 머니리뷰)
	public int privatePostCount();
	
	// 머니리뷰 전체 리스트 가져오기
	public ArrayList<MoneyDTO> getPostListAll(MoneyDTO dto);
	
	// 머니리뷰 비공개 리스트 가져오기
	public ArrayList<MoneyDTO> getPostListPrivate(MoneyDTO dto);
	
	// 머니리뷰 게시글 상세정보
	public ArrayList<MoneyDTO> getPostInfo(MoneyDTO dto);
	
	// 모든 댓글 수 (페이징) (★ 전체 댓글)
	public int totalCmntCount();
	
	// 모든 댓글 수 (페이징) (★ 공개 댓글)
	public int openCmntCount();
		
	// 모든 댓글 수 (페이징) (★ 비공개 댓글)
	public int privateCmntCount();
	
	// 댓글 전체 리스트 가져오기
	public ArrayList<MoneyDTO> getCmntListAll(MoneyDTO dto);
	
	// 댓글 공개 리스트 가져오기
	public ArrayList<MoneyDTO> getCmntListOpen(MoneyDTO dto);
	
	// 댓글 비공개 리스트 가져오기
	public ArrayList<MoneyDTO> getCmntListPrivate(MoneyDTO dto);
	
	// 머니리뷰 댓글 상세정보
	public ArrayList<MoneyDTO> getCmntInfo(MoneyDTO dto);
		
}
