package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class SelectFormController implements Controller
{
	private IUserInfoDAO dao;
	
	public void setDao(IUserInfoDAO dao)
	{
		this.dao = dao;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		ArrayList<UserDTO> areaFstList = new ArrayList<UserDTO>();
		ArrayList<UserDTO> areaSecList = new ArrayList<UserDTO>();
		ArrayList<UserDTO> jobFstList = new ArrayList<UserDTO>();
		ArrayList<UserDTO> jobSecList = new ArrayList<UserDTO>();
		
		try
		{
			areaFstList = dao.areaFstList();
			areaSecList = dao.areaSecList();
			jobFstList = dao.jobFstList();
			jobSecList = dao.jobSecList();
			
			mav.addObject("areaFstList", areaFstList);
			mav.addObject("areaSecList", areaSecList);
			mav.addObject("jobFstList", jobFstList);
			mav.addObject("jobSecList", jobSecList);
			
			mav.setViewName("/UserSuPlusInputSec.jsp");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}
	 
}
