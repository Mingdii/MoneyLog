package com.test.mvc;

public class PostReptDTO
{
	private String post_cd, opinion, rept_cate, post_rept_date, cnfm_result;
	
	// getter / setter 구성
	public String getPost_cd()
	{
		return post_cd;
	}

	public void setPost_cd(String post_cd)
	{
		this.post_cd = post_cd;
	}

	public String getOpinion()
	{
		return opinion;
	}

	public void setOpinion(String opinion)
	{
		this.opinion = opinion;
	}

	public String getRept_cate()
	{
		return rept_cate;
	}

	public void setRept_cate(String rept_cate)
	{
		this.rept_cate = rept_cate;
	}

	public String getPost_rept_date()
	{
		return post_rept_date;
	}

	public void setPost_rept_date(String post_rept_date)
	{
		this.post_rept_date = post_rept_date;
	}

	public String getCnfm_result()
	{
		return cnfm_result;
	}

	public void setCnfm_result(String cnfm_result)
	{
		this.cnfm_result = cnfm_result;
	}
	
}
