package com.test.mvc;

public class MoneyDTO
{
	// 머니리뷰 DTO 구성 (태형)
	String user_dstn_cd;
	String acnt_ym, acnt_count;
	String aleady_ym;
	String post_title, opinion;
	int dtl_select_cd;
	int post_cd;
	int post_count;
	String year, month;
	String sysdate;
	
	// 머니리뷰 소비/지출 내역
	String inout_cont, acnt_date, cate_fst_name, cate_sec_name, acnt_dtl_cont;
	int amnt;
	
	// 머니리뷰 통계용 데이터
	int  totalin, totalout
	, cate_fst_1, cate_fst_2, cate_fst_3
	, cate_fst_4, cate_fst_5, cate_fst_6
	, cate_fst_7, cate_fst_8, cate_fst_9
	, cate_fst_10, cate_fst_11, cate_fst_12
	, cate_fst_13, cate_fst_14, cate_fst_15
	, cate_fst_16, cate_fst_17, cate_fst_18, cate_fst_19;
	
	// 머니리뷰 이모티콘 카운트
	int emtc1, emtc2, emtc3, emtc4, emtc5;
	String emtc_cd;
	String emtc_writer;
	
	// 머니리뷰 댓글
	String cmnt_cd, cmnt_cont;
	
	// 페이징 처리용
	int pageNum;
	int rnum;
	String post_date, post_view;
	int start, end;
	int count_cmnt;
	
	// 머니리뷰 게시글, 댓글 신고
	String rept_cate_cd, post_rept_dtl_cont, post_rept_cd, cmnt_rept_dtl_cont, cmnt_rept_cd;
	
	// 신고 날짜
	String post_rept_date;
	String cmnt_rept_date;
	
	// 게시글, 댓글 공개여부 체크
	String post_check;
	String cmnt_check;
	
	
	// 이용자 아이디
	String user_id;
	
	// 머니리뷰 신고자 id
	String rept_user_id;
	
	// 관리자 id
	String ad_id;
	
	// 승인여부
	String post_cnfm;
	String cmnt_cnfm;
	
	// 관리자 신고처리일자
	String post_cnfm_date;
	String cmnt_cnfm_date;
	
	// 신고 세부사유
	String post_rept_detail;
	String cmnt_rept_detail;
	
	// 전체/공개/비공개
	int postListCheck;
	int cmntListCheck;

	
	// 댓글 작성일자
	String cmnt_date;
	
	
	
	
	
	
	
	
	public String getSysdate()
	{
		return sysdate;
	}
	public void setSysdate(String sysdate)
	{
		this.sysdate = sysdate;
	}
	public String getCmnt_rept_detail()
	{
		return cmnt_rept_detail;
	}
	public void setCmnt_rept_detail(String cmnt_rept_detail)
	{
		this.cmnt_rept_detail = cmnt_rept_detail;
	}
	public String getCmnt_rept_dtl_cont()
	{
		return cmnt_rept_dtl_cont;
	}
	public void setCmnt_rept_dtl_cont(String cmnt_rept_dtl_cont)
	{
		this.cmnt_rept_dtl_cont = cmnt_rept_dtl_cont;
	}
	public String getCmnt_rept_cd()
	{
		return cmnt_rept_cd;
	}
	public void setCmnt_rept_cd(String cmnt_rept_cd)
	{
		this.cmnt_rept_cd = cmnt_rept_cd;
	}
	public String getCmnt_rept_date()
	{
		return cmnt_rept_date;
	}
	public void setCmnt_rept_date(String cmnt_rept_date)
	{
		this.cmnt_rept_date = cmnt_rept_date;
	}
	public String getCmnt_cnfm()
	{
		return cmnt_cnfm;
	}
	public void setCmnt_cnfm(String cmnt_cnfm)
	{
		this.cmnt_cnfm = cmnt_cnfm;
	}
	public String getCmnt_cnfm_date()
	{
		return cmnt_cnfm_date;
	}
	public void setCmnt_cnfm_date(String cmnt_cnfm_date)
	{
		this.cmnt_cnfm_date = cmnt_cnfm_date;
	}
	public int getCmntListCheck()
	{
		return cmntListCheck;
	}
	public void setCmntListCheck(int cmntListCheck)
	{
		this.cmntListCheck = cmntListCheck;
	}
	public String getCmnt_check()
	{
		return cmnt_check;
	}
	public void setCmnt_check(String cmnt_check)
	{
		this.cmnt_check = cmnt_check;
	}
	public String getCmnt_date()
	{
		return cmnt_date;
	}
	public void setCmnt_date(String cmnt_date)
	{
		this.cmnt_date = cmnt_date;
	}
	public int getPostListCheck()
	{
		return postListCheck;
	}
	public void setPostListCheck(int postListCheck)
	{
		this.postListCheck = postListCheck;
	}
	public String getPost_cnfm()
	{
		return post_cnfm;
	}
	public void setPost_cnfm(String post_cnfm)
	{
		this.post_cnfm = post_cnfm;
	}
	public String getAd_id()
	{
		return ad_id;
	}
	public void setAd_id(String ad_id)
	{
		this.ad_id = ad_id;
	}
	public String getPost_cnfm_date()
	{
		return post_cnfm_date;
	}
	public void setPost_cnfm_date(String post_cnfm_date)
	{
		this.post_cnfm_date = post_cnfm_date;
	}
	public String getPost_rept_detail()
	{
		return post_rept_detail;
	}
	public void setPost_rept_detail(String post_rept_detail)
	{
		this.post_rept_detail = post_rept_detail;
	}
	public String getPost_rept_date()
	{
		return post_rept_date;
	}
	public void setPost_rept_date(String post_rept_date)
	{
		this.post_rept_date = post_rept_date;
	}
	public String getRept_user_id()
	{
		return rept_user_id;
	}
	public void setRept_user_id(String rept_user_id)
	{
		this.rept_user_id = rept_user_id;
	}
	public String getUser_id()
	{
		return user_id;
	}
	public void setUser_id(String user_id)
	{
		this.user_id = user_id;
	}
	public String getPost_check()
	{
		return post_check;
	}
	public void setPost_check(String post_check)
	{
		this.post_check = post_check;
	}
	public String getRept_cate_cd()
	{
		return rept_cate_cd;
	}
	public void setRept_cate_cd(String rept_cate_cd)
	{
		this.rept_cate_cd = rept_cate_cd;
	}
	public String getPost_rept_dtl_cont()
	{
		return post_rept_dtl_cont;
	}
	public void setPost_rept_dtl_cont(String post_rept_dtl_cont)
	{
		this.post_rept_dtl_cont = post_rept_dtl_cont;
	}
	public String getPost_rept_cd()
	{
		return post_rept_cd;
	}
	public void setPost_rept_cd(String post_rept_cd)
	{
		this.post_rept_cd = post_rept_cd;
	}
	public int getCount_cmnt()
	{
		return count_cmnt;
	}
	public void setCount_cmnt(int count_cmnt)
	{
		this.count_cmnt = count_cmnt;
	}
	public int getStart()
	{
		return start;
	}
	public void setStart(int start)
	{
		this.start = start;
	}
	public int getEnd()
	{
		return end;
	}
	public void setEnd(int end)
	{
		this.end = end;
	}
	public int getRnum()
	{
		return rnum;
	}
	public void setRnum(int rnum)
	{
		this.rnum = rnum;
	}
	public String getPost_date()
	{
		return post_date;
	}
	public void setPost_date(String post_date)
	{
		this.post_date = post_date;
	}
	public String getPost_view()
	{
		return post_view;
	}
	public void setPost_view(String post_view)
	{
		this.post_view = post_view;
	}
	public int getPageNum()
	{
		return pageNum;
	}
	public void setPageNum(int pageNum)
	{
		this.pageNum = pageNum;
	}
	public int getPost_count()
	{
		return post_count;
	}
	public void setPost_count(int post_count)
	{
		this.post_count = post_count;
	}
	public String getEmtc_writer()
	{
		return emtc_writer;
	}
	public void setEmtc_writer(String emtc_writer)
	{
		this.emtc_writer = emtc_writer;
	}
	public String getEmtc_cd()
	{
		return emtc_cd;
	}
	public void setEmtc_cd(String emtc_cd)
	{
		this.emtc_cd = emtc_cd;
	}
	public String getCmnt_cd()
	{
		return cmnt_cd;
	}
	public void setCmnt_cd(String cmnt_cd)
	{
		this.cmnt_cd = cmnt_cd;
	}
	public String getCmnt_cont()
	{
		return cmnt_cont;
	}
	public void setCmnt_cont(String cmnt_cont)
	{
		this.cmnt_cont = cmnt_cont;
	}
	public int getEmtc1()
	{
		return emtc1;
	}
	public void setEmtc1(int emtc1)
	{
		this.emtc1 = emtc1;
	}
	public int getEmtc2()
	{
		return emtc2;
	}
	public void setEmtc2(int emtc2)
	{
		this.emtc2 = emtc2;
	}
	public int getEmtc3()
	{
		return emtc3;
	}
	public void setEmtc3(int emtc3)
	{
		this.emtc3 = emtc3;
	}
	public int getEmtc4()
	{
		return emtc4;
	}
	public void setEmtc4(int emtc4)
	{
		this.emtc4 = emtc4;
	}
	public int getEmtc5()
	{
		return emtc5;
	}
	public void setEmtc5(int emtc5)
	{
		this.emtc5 = emtc5;
	}
	public int getTotalin()
	{
		return totalin;
	}
	public void setTotalin(int totalin)
	{
		this.totalin = totalin;
	}
	public int getTotalout()
	{
		return totalout;
	}
	public void setTotalout(int totalout)
	{
		this.totalout = totalout;
	}
	public int getCate_fst_1()
	{
		return cate_fst_1;
	}
	public void setCate_fst_1(int cate_fst_1)
	{
		this.cate_fst_1 = cate_fst_1;
	}
	public int getCate_fst_2()
	{
		return cate_fst_2;
	}
	public void setCate_fst_2(int cate_fst_2)
	{
		this.cate_fst_2 = cate_fst_2;
	}
	public int getCate_fst_3()
	{
		return cate_fst_3;
	}
	public void setCate_fst_3(int cate_fst_3)
	{
		this.cate_fst_3 = cate_fst_3;
	}
	public int getCate_fst_4()
	{
		return cate_fst_4;
	}
	public void setCate_fst_4(int cate_fst_4)
	{
		this.cate_fst_4 = cate_fst_4;
	}
	public int getCate_fst_5()
	{
		return cate_fst_5;
	}
	public void setCate_fst_5(int cate_fst_5)
	{
		this.cate_fst_5 = cate_fst_5;
	}
	public int getCate_fst_6()
	{
		return cate_fst_6;
	}
	public void setCate_fst_6(int cate_fst_6)
	{
		this.cate_fst_6 = cate_fst_6;
	}
	public int getCate_fst_7()
	{
		return cate_fst_7;
	}
	public void setCate_fst_7(int cate_fst_7)
	{
		this.cate_fst_7 = cate_fst_7;
	}
	public int getCate_fst_8()
	{
		return cate_fst_8;
	}
	public void setCate_fst_8(int cate_fst_8)
	{
		this.cate_fst_8 = cate_fst_8;
	}
	public int getCate_fst_9()
	{
		return cate_fst_9;
	}
	public void setCate_fst_9(int cate_fst_9)
	{
		this.cate_fst_9 = cate_fst_9;
	}
	public int getCate_fst_10()
	{
		return cate_fst_10;
	}
	public void setCate_fst_10(int cate_fst_10)
	{
		this.cate_fst_10 = cate_fst_10;
	}
	public int getCate_fst_11()
	{
		return cate_fst_11;
	}
	public void setCate_fst_11(int cate_fst_11)
	{
		this.cate_fst_11 = cate_fst_11;
	}
	public int getCate_fst_12()
	{
		return cate_fst_12;
	}
	public void setCate_fst_12(int cate_fst_12)
	{
		this.cate_fst_12 = cate_fst_12;
	}
	public int getCate_fst_13()
	{
		return cate_fst_13;
	}
	public void setCate_fst_13(int cate_fst_13)
	{
		this.cate_fst_13 = cate_fst_13;
	}
	public int getCate_fst_14()
	{
		return cate_fst_14;
	}
	public void setCate_fst_14(int cate_fst_14)
	{
		this.cate_fst_14 = cate_fst_14;
	}
	public int getCate_fst_15()
	{
		return cate_fst_15;
	}
	public void setCate_fst_15(int cate_fst_15)
	{
		this.cate_fst_15 = cate_fst_15;
	}
	public int getCate_fst_16()
	{
		return cate_fst_16;
	}
	public void setCate_fst_16(int cate_fst_16)
	{
		this.cate_fst_16 = cate_fst_16;
	}
	public int getCate_fst_17()
	{
		return cate_fst_17;
	}
	public void setCate_fst_17(int cate_fst_17)
	{
		this.cate_fst_17 = cate_fst_17;
	}
	public int getCate_fst_18()
	{
		return cate_fst_18;
	}
	public void setCate_fst_18(int cate_fst_18)
	{
		this.cate_fst_18 = cate_fst_18;
	}
	public int getCate_fst_19()
	{
		return cate_fst_19;
	}
	public void setCate_fst_19(int cate_fst_19)
	{
		this.cate_fst_19 = cate_fst_19;
	}
	
	
	
	
	
	
	public String getAleady_ym()
	{
		return aleady_ym;
	}
	public void setAleady_ym(String aleady_ym)
	{
		this.aleady_ym = aleady_ym;
	}
	public String getUser_dstn_cd()
	{
		return user_dstn_cd;
	}
	public void setUser_dstn_cd(String user_dstn_cd)
	{
		this.user_dstn_cd = user_dstn_cd;
	}
	public String getAcnt_ym()
	{
		return acnt_ym;
	}
	public void setAcnt_ym(String acnt_ym)
	{
		this.acnt_ym = acnt_ym;
	}
	public String getAcnt_count()
	{
		return acnt_count;
	}
	public void setAcnt_count(String acnt_count)
	{
		this.acnt_count = acnt_count;
	}
	public String getPost_title()
	{
		return post_title;
	}
	public void setPost_title(String post_title)
	{
		this.post_title = post_title;
	}
	public String getOpinion()
	{
		return opinion;
	}
	public void setOpinion(String opinion)
	{
		this.opinion = opinion;
	}
	public int getDtl_select_cd()
	{
		return dtl_select_cd;
	}
	public void setDtl_select_cd(int dtl_select_cd)
	{
		this.dtl_select_cd = dtl_select_cd;
	}
	public int getPost_cd()
	{
		return post_cd;
	}
	public void setPost_cd(int post_cd)
	{
		this.post_cd = post_cd;
	}
	public String getYear()
	{
		return year;
	}
	public void setYear(String year)
	{
		this.year = year;
	}
	public String getMonth()
	{
		return month;
	}
	public void setMonth(String month)
	{
		this.month = month;
	}
	public String getInout_cont()
	{
		return inout_cont;
	}
	public void setInout_cont(String inout_cont)
	{
		this.inout_cont = inout_cont;
	}
	public String getAcnt_date()
	{
		return acnt_date;
	}
	public void setAcnt_date(String acnt_date)
	{
		this.acnt_date = acnt_date;
	}
	public String getCate_fst_name()
	{
		return cate_fst_name;
	}
	public void setCate_fst_name(String cate_fst_name)
	{
		this.cate_fst_name = cate_fst_name;
	}
	public String getCate_sec_name()
	{
		return cate_sec_name;
	}
	public void setCate_sec_name(String cate_sec_name)
	{
		this.cate_sec_name = cate_sec_name;
	}
	public String getAcnt_dtl_cont()
	{
		return acnt_dtl_cont;
	}
	public void setAcnt_dtl_cont(String acnt_dtl_cont)
	{
		this.acnt_dtl_cont = acnt_dtl_cont;
	}
	public int getAmnt()
	{
		return amnt;
	}
	public void setAmnt(int amnt)
	{
		this.amnt = amnt;
	}
	
	

	
}
