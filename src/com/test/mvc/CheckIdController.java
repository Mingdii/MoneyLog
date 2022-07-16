package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class CheckIdController implements Controller
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
		
		String user_id = request.getParameter("user_id");
		
		int checkId = dao.checkId(user_id);
		
		mav.addObject("checkId", checkId);
		
		mav.setViewName("Join_ok.jsp");
		
		return mav;
	}
	
	
}
