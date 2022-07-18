package com.test.mvc;

public class UserDTO
{
	private String user_dstn_cd, user_name, user_id, user_pw, year, month, day;
	private String acnt_cd, acnt_date, cate_fst_cd, cate_fst_name, cate_sec_cd, cate_sec_name, inout_cd, inout_cont, acnt_dtl_cont, amnt; 
	private String ban_date;
	
	private String user_tel, user_date, user_plus_cd, ssn, authNumber, find_id;
	private String mrg_cd, child_cd, fml_cd, pet_cd, car_cd, house_cd, house_type
	, child_num, fml_num, pet_num, car_num, mrg_yn, area_sec_cd, area_sec_name, area_fst_cd, area_fst_name
	, job_sec_cd, job_sec_name, job_fst_cd, job_fst_name;
	
	private String post_cd, post_title, count_cmnt, post_date, post_view
    , cmnt_cont, cmnt_date, qna_cd, qna_title, qna_date, qna_view, qna_cont
    , leave_id, leave_name, leave_pw, leave_tel, leave_date
    
    , noti_cd, noti_title, noti_cont, noti_view, noti_date, noti_pin
    , ad_ansr_cd, ad_cd, ad_ansr_cont, ad_ansr_date;
	
	private int prevNum, nextNum, start, end;
	
	// 태형 추가 (캘린더 총합)
	private int tot;
	
	// 통계용 데이터
	private int cate_fst_1, cate_fst_2, cate_fst_3
	, cate_fst_4, cate_fst_5, cate_fst_6
	, cate_fst_7, cate_fst_8, cate_fst_9
	, cate_fst_10, cate_fst_11, cate_fst_12
	, cate_fst_13, cate_fst_14, cate_fst_15
	, cate_fst_16, cate_fst_17, cate_fst_18, cate_fst_19;
	
	private String yearMonthDay;
	
	
	
	
	public String getYearMonthDay()
	{
		return yearMonthDay;
	}

	public void setYearMonthDay(String yearMonthDay)
	{
		this.yearMonthDay = yearMonthDay;
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

	public int getTot()
	{
		return tot;
	}

	public void setTot(int tot)
	{
		this.tot = tot;
	}

	// getter / setter 구성
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

	public String getNoti_view()
	{
		return noti_view;
	}

	public void setNoti_view(String noti_view)
	{
		this.noti_view = noti_view;
	}

	public String getNoti_date()
	{
		return noti_date;
	}

	public void setNoti_date(String noti_date)
	{
		this.noti_date = noti_date;
	}

	public String getNoti_pin()
	{
		return noti_pin;
	}

	public void setNoti_pin(String noti_pin)
	{
		this.noti_pin = noti_pin;
	}

	public String getAd_ansr_cd()
	{
		return ad_ansr_cd;
	}

	public void setAd_ansr_cd(String ad_ansr_cd)
	{
		this.ad_ansr_cd = ad_ansr_cd;
	}

	public String getAd_cd()
	{
		return ad_cd;
	}

	public void setAd_cd(String ad_cd)
	{
		this.ad_cd = ad_cd;
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

	public String getUser_dstn_cd()
	{
		return user_dstn_cd;
	}

	public String getDay()
	{
		return day;
	}

	public void setDay(String day)
	{
		this.day = day;
	}

	public String getQna_cont()
	{
		return qna_cont;
	}

	public void setQna_cont(String qna_cont)
	{
		this.qna_cont = qna_cont;
	}

	public void setUser_dstn_cd(String user_dstn_cd)
	{
		this.user_dstn_cd = user_dstn_cd;
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

	public String getUser_pw()
	{
		return user_pw;
	}

	public void setUser_pw(String user_pw)
	{
		this.user_pw = user_pw;
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

	public String getAcnt_cd()
	{
		return acnt_cd;
	}

	public void setAcnt_cd(String acnt_cd)
	{
		this.acnt_cd = acnt_cd;
	}

	public String getAcnt_date()
	{
		return acnt_date;
	}

	public void setAcnt_date(String acnt_date)
	{
		this.acnt_date = acnt_date;
	}

	public String getCate_fst_cd()
	{
		return cate_fst_cd;
	}

	public void setCate_fst_cd(String cate_fst_cd)
	{
		this.cate_fst_cd = cate_fst_cd;
	}

	public String getCate_fst_name()
	{
		return cate_fst_name;
	}

	public void setCate_fst_name(String cate_fst_name)
	{
		this.cate_fst_name = cate_fst_name;
	}

	public String getCate_sec_cd()
	{
		return cate_sec_cd;
	}

	public void setCate_sec_cd(String cate_sec_cd)
	{
		this.cate_sec_cd = cate_sec_cd;
	}

	public String getCate_sec_name()
	{
		return cate_sec_name;
	}

	public void setCate_sec_name(String cate_sec_name)
	{
		this.cate_sec_name = cate_sec_name;
	}

	public String getInout_cd()
	{
		return inout_cd;
	}

	public void setInout_cd(String inout_cd)
	{
		this.inout_cd = inout_cd;
	}

	public String getInout_cont()
	{
		return inout_cont;
	}

	public void setInout_cont(String inout_cont)
	{
		this.inout_cont = inout_cont;
	}

	public String getAcnt_dtl_cont()
	{
		return acnt_dtl_cont;
	}

	public void setAcnt_dtl_cont(String acnt_dtl_cont)
	{
		this.acnt_dtl_cont = acnt_dtl_cont;
	}

	public String getAmnt()
	{
		return amnt;
	}

	public void setAmnt(String amnt)
	{
		this.amnt = amnt;
	}

	public String getBan_date()
	{
		return ban_date;
	}

	public void setBan_date(String ban_date)
	{
		this.ban_date = ban_date;
	}

	public String getUser_tel()
	{
		return user_tel;
	}

	public void setUser_tel(String user_tel)
	{
		this.user_tel = user_tel;
	}

	public String getUser_date()
	{
		return user_date;
	}

	public void setUser_date(String user_date)
	{
		this.user_date = user_date;
	}

	public String getUser_plus_cd()
	{
		return user_plus_cd;
	}

	public void setUser_plus_cd(String user_plus_cd)
	{
		this.user_plus_cd = user_plus_cd;
	}

	public String getSsn()
	{
		return ssn;
	}

	public void setSsn(String ssn)
	{
		this.ssn = ssn;
	}

	public String getAuthNumber()
	{
		return authNumber;
	}

	public void setAuthNumber(String authNumber)
	{
		this.authNumber = authNumber;
	}

	public String getFind_id()
	{
		return find_id;
	}

	public void setFind_id(String find_id)
	{
		this.find_id = find_id;
	}

	public String getMrg_cd()
	{
		return mrg_cd;
	}

	public void setMrg_cd(String mrg_cd)
	{
		this.mrg_cd = mrg_cd;
	}

	public String getChild_cd()
	{
		return child_cd;
	}

	public void setChild_cd(String child_cd)
	{
		this.child_cd = child_cd;
	}

	public String getFml_cd()
	{
		return fml_cd;
	}

	public void setFml_cd(String fml_cd)
	{
		this.fml_cd = fml_cd;
	}

	public String getPet_cd()
	{
		return pet_cd;
	}

	public void setPet_cd(String pet_cd)
	{
		this.pet_cd = pet_cd;
	}

	public String getCar_cd()
	{
		return car_cd;
	}

	public void setCar_cd(String car_cd)
	{
		this.car_cd = car_cd;
	}

	public String getHouse_cd()
	{
		return house_cd;
	}

	public void setHouse_cd(String house_cd)
	{
		this.house_cd = house_cd;
	}

	public String getHouse_type()
	{
		return house_type;
	}

	public void setHouse_type(String house_type)
	{
		this.house_type = house_type;
	}

	public String getChild_num()
	{
		return child_num;
	}

	public void setChild_num(String child_num)
	{
		this.child_num = child_num;
	}

	public String getFml_num()
	{
		return fml_num;
	}

	public void setFml_num(String fml_num)
	{
		this.fml_num = fml_num;
	}

	public String getPet_num()
	{
		return pet_num;
	}

	public void setPet_num(String pet_num)
	{
		this.pet_num = pet_num;
	}

	public String getCar_num()
	{
		return car_num;
	}

	public void setCar_num(String car_num)
	{
		this.car_num = car_num;
	}

	public String getMrg_yn()
	{
		return mrg_yn;
	}

	public void setMrg_yn(String mrg_yn)
	{
		this.mrg_yn = mrg_yn;
	}

	public String getArea_sec_cd()
	{
		return area_sec_cd;
	}

	public void setArea_sec_cd(String area_sec_cd)
	{
		this.area_sec_cd = area_sec_cd;
	}

	public String getArea_sec_name()
	{
		return area_sec_name;
	}

	public void setArea_sec_name(String area_sec_name)
	{
		this.area_sec_name = area_sec_name;
	}

	public String getArea_fst_cd()
	{
		return area_fst_cd;
	}

	public void setArea_fst_cd(String area_fst_cd)
	{
		this.area_fst_cd = area_fst_cd;
	}

	public String getArea_fst_name()
	{
		return area_fst_name;
	}

	public void setArea_fst_name(String area_fst_name)
	{
		this.area_fst_name = area_fst_name;
	}

	public String getJob_sec_cd()
	{
		return job_sec_cd;
	}

	public void setJob_sec_cd(String job_sec_cd)
	{
		this.job_sec_cd = job_sec_cd;
	}

	public String getJob_sec_name()
	{
		return job_sec_name;
	}

	public void setJob_sec_name(String job_sec_name)
	{
		this.job_sec_name = job_sec_name;
	}

	public String getJob_fst_cd()
	{
		return job_fst_cd;
	}

	public void setJob_fst_cd(String job_fst_cd)
	{
		this.job_fst_cd = job_fst_cd;
	}

	public String getJob_fst_name()
	{
		return job_fst_name;
	}

	public void setJob_fst_name(String job_fst_name)
	{
		this.job_fst_name = job_fst_name;
	}

	public String getPost_cd()
	{
		return post_cd;
	}

	public void setPost_cd(String post_cd)
	{
		this.post_cd = post_cd;
	}

	public String getPost_title()
	{
		return post_title;
	}

	public void setPost_title(String post_title)
	{
		this.post_title = post_title;
	}

	public String getCount_cmnt()
	{
		return count_cmnt;
	}

	public void setCount_cmnt(String count_cmnt)
	{
		this.count_cmnt = count_cmnt;
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

	public String getCmnt_cont()
	{
		return cmnt_cont;
	}

	public void setCmnt_cont(String cmnt_cont)
	{
		this.cmnt_cont = cmnt_cont;
	}

	public String getCmnt_date()
	{
		return cmnt_date;
	}

	public void setCmnt_date(String cmnt_date)
	{
		this.cmnt_date = cmnt_date;
	}

	public String getQna_cd()
	{
		return qna_cd;
	}

	public void setQna_cd(String qna_cd)
	{
		this.qna_cd = qna_cd;
	}

	public String getQna_title()
	{
		return qna_title;
	}

	public void setQna_title(String qna_title)
	{
		this.qna_title = qna_title;
	}

	public String getQna_date()
	{
		return qna_date;
	}

	public void setQna_date(String qna_date)
	{
		this.qna_date = qna_date;
	}

	public String getQna_view()
	{
		return qna_view;
	}

	public void setQna_view(String qna_view)
	{
		this.qna_view = qna_view;
	}

	public String getLeave_id()
	{
		return leave_id;
	}

	public void setLeave_id(String leave_id)
	{
		this.leave_id = leave_id;
	}

	public String getLeave_name()
	{
		return leave_name;
	}

	public void setLeave_name(String leave_name)
	{
		this.leave_name = leave_name;
	}

	public String getLeave_pw()
	{
		return leave_pw;
	}

	public void setLeave_pw(String leave_pw)
	{
		this.leave_pw = leave_pw;
	}

	public String getLeave_tel()
	{
		return leave_tel;
	}

	public void setLeave_tel(String leave_tel)
	{
		this.leave_tel = leave_tel;
	}

	public String getLeave_date()
	{
		return leave_date;
	}

	public void setLeave_date(String leave_date)
	{
		this.leave_date = leave_date;
	}

	public int getPrevNum()
	{
		return prevNum;
	}

	public void setPrevNum(int prevNum)
	{
		this.prevNum = prevNum;
	}

	public int getNextNum()
	{
		return nextNum;
	}

	public void setNextNum(int nextNum)
	{
		this.nextNum = nextNum;
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
	
	
	
}
