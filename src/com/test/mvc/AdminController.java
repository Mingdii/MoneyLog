package com.test.mvc;

import java.sql.SQLException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class AdminController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 관리자 로그인 폼
	@RequestMapping(value = "/adloginform.action", method = RequestMethod.GET)
	public String loginForm(HttpServletRequest request, HttpSession session, Model model) throws SQLException
	{ 
		String result = "/AdLogin.jsp"; 
		return result; 
	}

	// 관리자 로그인 
	@RequestMapping(value = "/adlogin.action", method = RequestMethod.POST)
	public String adLogin(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model, AdminDTO dto, boolean rememberId) throws SQLException 
	{ 
		String result = null;
	 
		// 관리자가 입력한 데이터 수신(→ AdLogin.jsp 페이지로부터 넘어온 데이터 수신)
		String ad_id = request.getParameter("ad_id");
		String ad_pw = request.getParameter("ad_pw");
	 
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);

		dto = dao.adLogin(ad_id, ad_pw);

		// 로그인 수행에 따른 성공 여부 확인 및 구분/분기
		if(dto != null) 	
		{ 
			// 로그인 성공
			model.addAttribute("ad_cd", dto.getAd_cd());
			model.addAttribute("ad_id", dto.getAd_id());
			 
			// 세션에 값 저장하기
			session.setAttribute("ad_cd", dto.getAd_cd());
			session.setAttribute("ad_id", ad_id);
			
			if (rememberId) {
	            //      1. 쿠키를 생성
	            Cookie cookie = new Cookie("id", ad_id);
	            //      2. 응답에 저장
	            response.addCookie(cookie);

	        } else {
	            // 쿠키를 삭제
	            Cookie cookie = new Cookie("id", ad_id);
	            cookie.setMaxAge(0);    // 쿠키를 삭제
	            //      2. 응답에 저장
	            response.addCookie(cookie);
	        }
			 
			result = "/admain.action";
		} 
		else 
		{ 
			// 로그인 실패
			request.setAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다.");
			result = "/AdLogin.jsp";
		}
		 	return result; 
	}
		
	
	// 관리자 메인페이지
	@RequestMapping(value = "/admain.action", method = {RequestMethod.GET, RequestMethod.POST}) 
	public String adMain(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model, AdminDTO dto) throws SQLException
	{
		String result = null;
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		// 세션에 있는 관리자 cd, id를 dto에 set 
	 	dto.setAd_cd((String)session.getAttribute("ad_cd"));
	 	dto.setAd_id((String)session.getAttribute("ad_id"));
	 	 
	 	// 오늘의 할일
		model.addAttribute("countPostRept", dao.mainCountPostRept());
		model.addAttribute("countCmntRept", dao.mainCountCmntRept());
		model.addAttribute("countQna", dao.mainCountQna());
		
		// 공지사항
		model.addAttribute("mainNotiList", dao.mainNotiList(dto));
		
		// 회원 현황   --> 함수 하나 추가해서 문자 반복문으로 돌리기
		model.addAttribute("data1", dao.mainMonthUserCount("01"));
		model.addAttribute("data2", dao.mainMonthUserCount("02"));
		model.addAttribute("data3", dao.mainMonthUserCount("03"));
		model.addAttribute("data4", dao.mainMonthUserCount("04"));
		model.addAttribute("data5", dao.mainMonthUserCount("05"));
		model.addAttribute("data6", dao.mainMonthUserCount("06"));
		model.addAttribute("data7", dao.mainMonthUserCount("07"));
		model.addAttribute("data8", dao.mainMonthUserCount("08"));
		model.addAttribute("data9", dao.mainMonthUserCount("09"));
		model.addAttribute("data10", dao.mainMonthUserCount("10"));
		model.addAttribute("data11", dao.mainMonthUserCount("11"));
		model.addAttribute("data12", dao.mainMonthUserCount("12"));
		
		model.addAttribute("ldata1", dao.mainMonthLeaveUserCount("01"));
		model.addAttribute("ldata2", dao.mainMonthLeaveUserCount("02"));
		model.addAttribute("ldata3", dao.mainMonthLeaveUserCount("03"));
		model.addAttribute("ldata4", dao.mainMonthLeaveUserCount("04"));
		model.addAttribute("ldata5", dao.mainMonthLeaveUserCount("05"));
		model.addAttribute("ldata6", dao.mainMonthLeaveUserCount("06"));
		model.addAttribute("ldata7", dao.mainMonthLeaveUserCount("07"));
		model.addAttribute("ldata8", dao.mainMonthLeaveUserCount("08"));
		model.addAttribute("ldata9", dao.mainMonthLeaveUserCount("09"));
		model.addAttribute("ldata10", dao.mainMonthLeaveUserCount("10"));
		model.addAttribute("ldata11", dao.mainMonthLeaveUserCount("11"));
		model.addAttribute("ldata12", dao.mainMonthLeaveUserCount("12"));
				
		// 신규회원 현황
		model.addAttribute("userCount", dao.mainUserCount());
		model.addAttribute("newUserCount", dao.mainNewUserCount());
		model.addAttribute("leaveUserCount", dao.mainLeaveUserCount());
		
		// 머니로그 현황
		model.addAttribute("contentCount", dao.mainContentCount());
		model.addAttribute("newContentCount", dao.mainNewContentCount());
		model.addAttribute("reptContentCount", dao.mainReptContentCount());
		model.addAttribute("reptCmntCount", dao.mainReptCmntCount());
		
		result = "/AdMain.jsp";
		return result;
	}
	
	
	// 관리자 로그아웃
	@RequestMapping(value="/adminlogout.action", method=RequestMethod.GET)
	public String adLogout(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model) throws SQLException 
	{
		String result = null;
    	
    	session.removeAttribute("ad_cd");
    	session.removeAttribute("ad_id");
    	
    	result = "/adloginform.action";
    	return result;
	}
	
	// 관리자 회원관리
	@RequestMapping(value = "/aduserlist.action", method = RequestMethod.GET)
	public ModelAndView adUserList(AdminDTO dto) throws SQLException 
	{
		ModelAndView mv = new ModelAndView();
		
		IAdminDAO dao =sqlSession.getMapper(IAdminDAO.class);
		 
		mv.addObject("adUserList", dao.adUserList());

		mv.setViewName("/AdUserList.jsp");
		
		return mv;
		
	}
	
	// 회원 정보 조회 (신고내역까지)
	@RequestMapping(value="/aduserinfo.action", method=RequestMethod.GET)
	public String adUserInfo(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model, AdminDTO dto) throws SQLException 
	{
		String result = null;
		
	    IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
	  	
	    // adUserList 에서 user_dstn_cd 받기
	 	String user_dstn_cd = request.getParameter("user_dstn_cd");
	   	
	    // set
	 	dto.setUser_dstn_cd(user_dstn_cd);

	    // dao 에 있는 select 쿼리 실행
	 	// → model.add 후 AdUserInfo.jsp에서 el 사용
	 	model.addAttribute("adUserInfo", dao.adUserInfo(dto));
	 

	 	model.addAttribute("userReptHistory", dao.userReptHistory(dto));
	 	
	
        result = "/AdUserInfo.jsp";
		
		return result;
	}
	
	// 관리자 회원 게시글 리스트 조회
	@RequestMapping(value="/aduserpostlist.action", method=RequestMethod.GET)
	public String adUserPostList(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model, AdminDTO dto) throws SQLException 
	{
		String result = null;
		
	    IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
	  	
	    // adUserList 에서 user_dstn_cd 받기
	 	String user_dstn_cd = request.getParameter("user_dstn_cd");
	   	
	    // set
	 	dto.setUser_dstn_cd(user_dstn_cd);

	    // dao 에 있는 select 쿼리 실행
	 	// → model.add 후 AdUserPostList.jsp에서 el 사용
	 	model.addAttribute("adUserPostList", dao.adUserPostList(dto));
	 	

        result = "/AdUserPostList.jsp";
        
		
		return result;
	}
	
	// 관리자 회원 댓글 리스트 조회
	@RequestMapping(value="/adusercmntlist.action", method=RequestMethod.GET)
	public String adUserCmntList(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model, AdminDTO dto) throws SQLException 
	{
		String result = null;
		
	    IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
	  	
	    // adUserList 에서 user_dstn_cd 받기
	 	String user_dstn_cd = request.getParameter("user_dstn_cd");
	   	
	    // set
	 	dto.setUser_dstn_cd(user_dstn_cd);

	    // dao 에 있는 select 쿼리 실행
	 	// → model.add 후 AdUserCmntList.jsp에서 el 사용
	 	model.addAttribute("adUserCmntList", dao.adUserCmntList(dto));

        result = "/AdUserCmntList.jsp";
		
		return result;
	}
	
	// 영구정지 회원 리스트 조회
	@RequestMapping(value = "/adbanlist.action", method = RequestMethod.GET) 
	public String adBanList( Model model, AdminDTO dto) throws SQLException 
	{	
		String result = null;
		
		IAdminDAO dao =sqlSession.getMapper(IAdminDAO.class);
		 
		model.addAttribute("adBanList", dao.adBanList());
		
		result = "/AdBan.jsp";
		
		return result;
		
	}
	
	// 영구정지 회원 정보 조회
	@RequestMapping(value="/adbaninfo.action", method=RequestMethod.GET)
	public String adBanInfo(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model, AdminDTO dto)
	{
		String result = null;
		
	    IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
	  	
	    // adBan 에서 user_dstn_cd 받기
	 	String user_dstn_cd = request.getParameter("user_dstn_cd");
	   	
	    // set
	 	dto.setUser_dstn_cd(user_dstn_cd);
	 	
	 	try
		{
	 		model.addAttribute("adUserInfo", dao.adUserInfo(dto));
		 	model.addAttribute("userReptHistory", dao.userReptHistory(dto));
		 		
	 		if (dto.getAd_post_rept_cd().equals("-"))
			{
				result = "/AdBan.jsp";
				return result;
			}
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}	
		
        result = "/AdBanInfo.jsp";
		
		return result;
	}
	
	
	// 게시글신고접수 내역 리스트 조회
	@RequestMapping(value = "/adpostreptlist.action", method = RequestMethod.GET)
	public String adPostReptList( Model model, AdminDTO dto)
	{	
		String result = null;
		
		IAdminDAO dao =sqlSession.getMapper(IAdminDAO.class);
		 
		model.addAttribute("adPostReptList", dao.adPostReptList());
		
		result = "/AdPostReptList.jsp";
		
		return result;
		
	}
	
	
	// 게시글 신고내용 조회
	@RequestMapping(value="/adpostrept.action", method=RequestMethod.GET)
	public String adPostRept(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model, AdminDTO dto) throws SQLException 
	{
		String result = null;
		
	    IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
	  	
	    // AdPostReptList 에서 post_rept_cd 받기
	 	String post_rept_cd = request.getParameter("post_rept_cd");
	 	
	    // set
	 	dto.setPost_rept_cd(post_rept_cd);

		model.addAttribute("adPostRept", dao.adPostRept(dto));
		
	 	result = "/AdPostRept.jsp";
	 	
		return result;
	}
	
	
	// 게시글 신고 미처리건 승인/반려 처리
	@RequestMapping(value="/adpostreptdone.action", method=RequestMethod.GET)
	public String adPostReptDone(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model, AdminDTO dto) throws SQLException 
	{
		String result = null;
		
	    IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
	    
	    // 세션에 저장된 ad_cd 
	    String ad_cd = (String)session.getAttribute("ad_cd");
	  	
	    // AdPostRept.jsp → post_rept_cd, cnfm_cd
	 	String post_rept_cd = request.getParameter("post_rept_cd");
	 	String cnfm_cd = request.getParameter("cnfm_cd");
	 	
	    // set
	 	dto.setAd_cd(ad_cd);
	 	dto.setPost_rept_cd(post_rept_cd);
	 	dto.setCnfm_cd(cnfm_cd);
	 	
	 	// insert 쿼리 실행
	 	dao.adPostReptOk(dto);
	 	
	 	request.setAttribute("msg", "해당 게시글에 대한 신고처리가 완료되었습니다.");
	 		
	 	result = "/adpostreptlist.action";
		return result;
	}
	
	
	// 댓글 신고접수 내역 리스트 조회
	@RequestMapping(value = "/adcmntreptlist.action", method = RequestMethod.GET)
	public String adCmntReptList( Model model, AdminDTO dto) throws SQLException 
	{	
		String result = null;
		
		IAdminDAO dao =sqlSession.getMapper(IAdminDAO.class);
		 
		model.addAttribute("adCmntReptList", dao.adCmntReptList());
		
		result = "/AdCmntReptList.jsp";
		
		return result;
		
	}
	
	
	// 댓글 신고내용 조회
	@RequestMapping(value="/adcmntrept.action", method=RequestMethod.GET)
	public String adCmntRept(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model, AdminDTO dto) throws SQLException 
	{
		String result = null;
		
	    IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
	  	
	    // AdCmntReptList 에서 cmnt_rept_cd 받기
	 	String cmnt_rept_cd = request.getParameter("cmnt_rept_cd");
	 	
	    // set
	 	dto.setCmnt_rept_cd(cmnt_rept_cd);

		model.addAttribute("adCmntRept", dao.adCmntRept(dto));
		
	 	result = "/AdCmntRept.jsp";
	 	
		return result;
	}
	
	
	// 댓글 신고 미처리건 승인/반려 처리
	@RequestMapping(value="/adcmntreptdone.action", method=RequestMethod.GET)
	public String adCmntReptDone(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model, AdminDTO dto) throws SQLException 
	{
		String result = null;
		
	    IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
	    
	    // 세션에 저장된 ad_cd 
	    String ad_cd = (String)session.getAttribute("ad_cd");
	  	
	    // AdCmntRept.jsp → cmnt_rept_cd, cnfm_cd
	 	String cmnt_rept_cd = request.getParameter("cmnt_rept_cd");
	 	String cnfm_cd = request.getParameter("cnfm_cd");
	 	
	    // set
	 	dto.setAd_cd(ad_cd);
	 	dto.setCmnt_rept_cd(cmnt_rept_cd);
	 	dto.setCnfm_cd(cnfm_cd);
	 	
	 	// insert 쿼리 실행
	 	dao.adCmntReptOk(dto);
	 	
	 	request.setAttribute("msg", "해당 댓글에 대한 신고처리가 완료되었습니다.");
	 		
	 	result = "/adcmntreptlist.action";
		return result;
	}
	
	// 승인된 게시글 신고 상세내역 조회 (회원정보 조회시 사용)
	@RequestMapping(value="/adpostreptok.action", method=RequestMethod.GET)
	public String adPostReptOk(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model, AdminDTO dto) throws SQLException 
	{
		String result = null;
		
	    IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
	  	
	 	// post_rept_cd 
	 	String post_rept_cd = request.getParameter("post_rept_cd");
	 	 	
	 	// set
	 	dto.setPost_rept_cd(post_rept_cd);

	 	model.addAttribute("adPostRept", dao.adPostRept(dto));
	 		
	 	result = "/AdPostReptOk.jsp";
	 	 	
	 	return result;
	 		
	}
	
	// 승인된 댓글 신고 상세내역 조회 (회원정보 조회시 사용)
	@RequestMapping(value="/adcmntreptok.action", method=RequestMethod.GET)
	public String adCmnttReptOk(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model, AdminDTO dto) throws SQLException 
	{
		String result = null;
		
	    IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
	  	
	 	// post_rept_cd (union all 사용해서 post_rept_cd 수신)
	 	String cmnt_rept_cd = request.getParameter("cmnt_rept_cd");
	 	 	
	 	// set
	 	dto.setCmnt_rept_cd(cmnt_rept_cd);

	 	model.addAttribute("adCmntRept", dao.adCmntRept(dto));
	 		
	 	result = "/AdCmntReptOk.jsp";
	 	 	
	 	return result;
	 		
	}
	

}
