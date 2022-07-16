/*package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

public class AjaxController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/ajaxSend.action")
	public ModelAndView inoutResult(HttpServletRequest request, HttpServletResponse response, UserDTO dto) 
	{
		ModelAndView mav = new ModelAndView();
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);

		String inoutCd = (String)request.getParameter("inoutCd");
		
		try
		{
			ArrayList<UserDTO> fstCateList = dao.fstCateList(inoutCd);
			
			mav.addObject("fstCateList", fstCateList);
			
			mav.setViewName("/WEB-INF/view/Ajax.jsp");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}
	
}	
	
	
	private SelectBoxServic
	
	@RequestMapping(value="/childSelectBox.do")
	public void childSelectBoxMain(@RequestBody String reqParam
				,HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception
	{
		String param="", paramKey="";
		
		System.out.println("contentType 작성 후 RequestBody : " + reqParam);
		
		Map<String, Object> resMap = JsonUtil.JsonToMap(paramkey);
		
		param = (String) resMap.get("param");
		
		List<EgovMap> childList = selectBoxService.selectChildBoxList(param);
	
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("result", "SUCCESS");
		resultMap.put("childList", childList);
		
	}
	
}
*/