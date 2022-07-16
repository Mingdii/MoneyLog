package com.test.mvc;

public class AdCsDTO
{
	// 관리자계정
	public String ad_cd, ad_id, ad_pw, ad_date;
	
	// 공지사항 등록
	public String rownum, noti_cd, noti_title, noti_cont, noti_date, noti_view, noti_pin;
	
	// 이용자 문의글 등록
	public String qna_cd, user_dstn_cd, qna_title, qna_cont, qna_view, qna_date;
	
	// 관리자 문의글 답변
	public String ad_ansr_cd, ad_ansr, ad_ansr_cont, ad_ansr_date;

	// 쿼리에 필요한 이용자 정보
	public String user_name, user_id;
	
 	// 페이징에 필요한 정보
	public int pageNum, start, end, count;
	
	// getter / setter 구성
	public String getAd_cd()
	{
		return ad_cd;
	}

	public void setAd_cd(String ad_cd)
	{
		this.ad_cd = ad_cd;
	}
	
	public String getAd_id()
	{
		return ad_id;
	}

	public void setAd_id(String ad_id)
	{
		this.ad_id = ad_id;
	}

	public String getAd_pw()
	{
		return ad_pw;
	}

	public void setAd_pw(String ad_pw)
	{
		this.ad_pw = ad_pw;
	}

	public String getAd_date()
	{
		return ad_date;
	}

	public void setAd_date(String ad_date)
	{
		this.ad_date = ad_date;
	}

	public String getRownum()
	{
		return rownum;
	}

	public void setRownum(String rownum)
	{
		this.rownum = rownum;
	}

	public String getNoti_cd()
	{
		return noti_cd;
	}

	public void setNoti_cd(String noti_cd)
	{
		this.noti_cd = noti_cd;
	}

	public String getNoti_title()
	{
		return noti_title;
	}

	public void setNoti_title(String noti_title)
	{
		this.noti_title = noti_title;
	}

	public String getNoti_cont()
	{
		return noti_cont;
	}

	public void setNoti_cont(String noti_cont)
	{
		this.noti_cont = noti_cont;
	}

	public String getNoti_date()
	{
		return noti_date;
	}

	public void setNoti_date(String noti_date)
	{
		this.noti_date = noti_date;
	}

	public String getNoti_view()
	{
		return noti_view;
	}

	public void setNoti_view(String noti_view)
	{
		this.noti_view = noti_view;
	}

	public String getNoti_pin()
	{
		return noti_pin;
	}

	public void setNoti_pin(String noti_pin)
	{
		this.noti_pin = noti_pin;
	}

	public String getQna_cd()
	{
		return qna_cd;
	}

	public void setQna_cd(String qna_cd)
	{
		this.qna_cd = qna_cd;
	}

	public String getUser_dstn_cd()
	{
		return user_dstn_cd;
	}

	public void setUser_dstn_cd(String user_dstn_cd)
	{
		this.user_dstn_cd = user_dstn_cd;
	}

	public String getQna_title()
	{
		return qna_title;
	}

	public void setQna_title(String qna_title)
	{
		this.qna_title = qna_title;
	}

	public String getQna_cont()
	{
		return qna_cont;
	}

	public void setQna_cont(String qna_cont)
	{
		this.qna_cont = qna_cont;
	}

	public String getQna_view()
	{
		return qna_view;
	}

	public void setQna_view(String qna_view)
	{
		this.qna_view = qna_view;
	}

	public String getQna_date()
	{
		return qna_date;
	}

	public void setQna_date(String qna_date)
	{
		this.qna_date = qna_date;
	}

	public String getAd_ansr_cd()
	{
		return ad_ansr_cd;
	}

	public void setAd_ansr_cd(String ad_ansr_cd)
	{
		this.ad_ansr_cd = ad_ansr_cd;
	}
	
	public String getAd_ansr()
	{
		return ad_ansr;
	}

	public void setAd_ansr(String ad_ansr)
	{
		this.ad_ansr = ad_ansr;
	}

	public String getAd_ansr_cont()
	{
		return ad_ansr_cont;
	}

	public void setAd_ansr_cont(String ad_ansr_cont)
	{
		this.ad_ansr_cont = ad_ansr_cont;
	}

	public String getAd_ansr_date()
	{
		return ad_ansr_date;
	}

	public void setAd_ansr_date(String ad_ansr_date)
	{
		this.ad_ansr_date = ad_ansr_date;
	}

	public String getUser_name()
	{
		return user_name;
	}

	public void setUser_name(String user_name)
	{
		this.user_name = user_name;
	}

	public String getUser_id()
	{
		return user_id;
	}

	public void setUser_id(String user_id)
	{
		this.user_id = user_id;
	}

	public int getPageNum()
	{
		return pageNum;
	}

	public void setPageNum(int pageNum)
	{
		this.pageNum = pageNum;
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

	public int getCount()
	{
		return count;
	}

	public void setCount(int count)
	{
		this.count = count;
	}

	
}
