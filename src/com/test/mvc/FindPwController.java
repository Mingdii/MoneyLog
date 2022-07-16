package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class FindPwController implements Controller
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
		
		String user_name = request.getParameter("user_name");
		String user_id = request.getParameter("user_id");
		String user_tel = request.getParameter("user_tel");
		
		ArrayList<UserDTO> checkPw = new ArrayList<UserDTO>();
		
		checkPw = dao.findPw(user_name, user_id, user_tel);
		
		mav.addObject("checkPw", checkPw);
		
		mav.setViewName("UserPwCertifiedOk.jsp");
		
		return mav;
	}
	  	
	
	

}
