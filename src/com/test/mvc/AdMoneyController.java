package com.test.mvc;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdMoneyController
{
	@Autowired
	private SqlSession sqlSession;
	
	
	// 머니리뷰 목록 (전체)
	@RequestMapping(value = "/adpostlist.action", method = RequestMethod.GET)
	public ModelAndView adMoneyPostListAll(int pageNum)
	{
		
		IMoneyDAO dao = sqlSession.getMapper(IMoneyDAO.class);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/AdPostList.jsp");
		
		// 머니리뷰 전체 개수 구하기 (신고된 게시글 미포함)
		mv.addObject("allPostCount", dao.totalPostCount());
		
		// 페이징
		Paging paging = new Paging();
		
		// 한 페이지당 게시글 개수
		int numPerPage = 3;
		
		// 페이지 개수
		int pageCount = paging.getPageCount(numPerPage, dao.totalPostCount());
		
		// 페이지 기본 url
		String url = "./adpostlist.action";
		
		// ★ 페이지 index 
		String strList = paging.pageIndexList(pageNum, pageCount, url);
		
		// 스타트 앤드 구하기 (해당 페이지에 어떤 게시글들이 들어갈지)
		
		int count = 0;
		count = dao.totalPostCount();
		//int start = (pageNum-1)*numPerPage+1;
		//int end = pageNum*numPerPage;
		int start = count-((pageNum*numPerPage)-1);
		int end = count-((pageNum-1)*numPerPage);
		
		MoneyDTO money = new MoneyDTO();
		money.setStart(start);
		money.setEnd(end);
		
		mv.addObject("pageCount", pageCount);
		mv.addObject("strList", strList);
		mv.addObject("getPostList", dao.getPostListAll(money));
		mv.addObject("pageNum", pageNum);
		
		// 페이지 구분용 (전체, 공개, 비공개)
		mv.addObject("postListCheck", 1);
		
		return mv;
	}
	
	// 머니리뷰 목록 (공개)
	@RequestMapping(value = "/adpostlistOpen.action", method = RequestMethod.GET)
	public ModelAndView adMoneyPostListOpen(int pageNum)
	{
		
		IMoneyDAO dao = sqlSession.getMapper(IMoneyDAO.class);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/AdPostList.jsp");
		
		// 머니리뷰 전체 개수 구하기 (신고된 게시글 미포함)
		mv.addObject("allPostCount", dao.allPostCount());
		
		// 페이징
		Paging paging = new Paging();
		
		// 한 페이지당 게시글 개수
		int numPerPage = 3;
		
		// 페이지 개수
		int pageCount = paging.getPageCount(numPerPage, dao.allPostCount());
		
		// 페이지 기본 url
		String url = "./adpostlistOpen.action";
		
		// ★ 페이지 index 
		String strList = paging.pageIndexList(pageNum, pageCount, url);
		
		// 스타트 앤드 구하기 (해당 페이지에 어떤 게시글들이 들어갈지)
		
		int count = 0;
		count = dao.allPostCount();
		//int start = (pageNum-1)*numPerPage+1;
		//int end = pageNum*numPerPage;
		int start = count-((pageNum*numPerPage)-1);
		int end = count-((pageNum-1)*numPerPage);
		
		MoneyDTO money = new MoneyDTO();
		money.setStart(start);
		money.setEnd(end);
		
		mv.addObject("pageCount", pageCount);
		mv.addObject("strList", strList);
		mv.addObject("getPostList", dao.getPostList(money));
		mv.addObject("pageNum", pageNum);
		
		// 페이지 구분용 (전체, 공개, 비공개)
		mv.addObject("postListCheck", 2);
		
		return mv;
	}
	
	// 머니리뷰 목록 (비공개)
	@RequestMapping(value = "/adpostlistPrivate.action", method = RequestMethod.GET)
	public ModelAndView adMoneyPostListPrivate(int pageNum)
	{
		
		IMoneyDAO dao = sqlSession.getMapper(IMoneyDAO.class);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/AdPostList.jsp");
		
		// 머니리뷰 전체 개수 구하기 (신고된 게시글 미포함)
		mv.addObject("allPostCount", dao.privatePostCount());
		
		// 페이징
		Paging paging = new Paging();
		
		// 한 페이지당 게시글 개수
		int numPerPage = 3;
		
		// 페이지 개수
		int pageCount = paging.getPageCount(numPerPage, dao.privatePostCount());
		
		// 페이지 기본 url
		String url = "./adpostlistPrivate.action";
		
		// ★ 페이지 index 
		String strList = paging.pageIndexList(pageNum, pageCount, url);
		
		// 스타트 앤드 구하기 (해당 페이지에 어떤 게시글들이 들어갈지)
		
		int count = 0;
		count = dao.privatePostCount();
		//int start = (pageNum-1)*numPerPage+1;
		//int end = pageNum*numPerPage;
		int start = count-((pageNum*numPerPage)-1);
		int end = count-((pageNum-1)*numPerPage);
		
		MoneyDTO money = new MoneyDTO();
		money.setStart(start);
		money.setEnd(end);
		
		mv.addObject("pageCount", pageCount);
		mv.addObject("strList", strList);
		mv.addObject("getPostList", dao.getPostListPrivate(money));
		mv.addObject("pageNum", pageNum);
		
		// 페이지 구분용 (전체, 공개, 비공개)
		mv.addObject("postListCheck", 3);
		
		return mv;
	}
	
	// 머니리뷰 게시글 상세정보
	@RequestMapping(value = "/adpostinfo.action", method = RequestMethod.GET)
	public ModelAndView adPostInfo(MoneyDTO money)
	{
		IMoneyDAO dao = sqlSession.getMapper(IMoneyDAO.class);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/AdPostInfo.jsp");
		mv.addObject("getPostInfo", dao.getPostInfo(money));
		mv.addObject("postListCheck", money.getPostListCheck());
		mv.addObject("pageNum", money.getPageNum());
		return mv;
	}
	
	
	
	// 댓글 목록 (전체)
	@RequestMapping(value = "/adcmntlist.action", method = RequestMethod.GET)
	public ModelAndView adCmntListAll(int pageNum)
	{
		
		IMoneyDAO dao = sqlSession.getMapper(IMoneyDAO.class);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/AdCmntList.jsp");
		
		// 머니리뷰 전체 개수 구하기 (신고된 게시글 미포함)
		mv.addObject("allPostCount", dao.totalCmntCount());
		
		// 페이징
		Paging paging = new Paging();
		
		// 한 페이지당 게시글 개수
		int numPerPage = 3;
		
		// 페이지 개수
		int pageCount = paging.getPageCount(numPerPage, dao.totalCmntCount());
		
		// 페이지 기본 url
		String url = "./adcmntlist.action";
		
		// ★ 페이지 index 
		String strList = paging.pageIndexList(pageNum, pageCount, url);
		
		// 스타트 앤드 구하기 (해당 페이지에 어떤 게시글들이 들어갈지)
		
		int count = 0;
		count = dao.totalCmntCount();
		//int start = (pageNum-1)*numPerPage+1;
		//int end = pageNum*numPerPage;
		int start = count-((pageNum*numPerPage)-1);
		int end = count-((pageNum-1)*numPerPage);
		
		MoneyDTO money = new MoneyDTO();
		money.setStart(start);
		money.setEnd(end);
		
		mv.addObject("pageCount", pageCount);
		mv.addObject("strList", strList);
		mv.addObject("getCmntList", dao.getCmntListAll(money));
		mv.addObject("pageNum", pageNum);
		
		// 페이지 구분용 (전체, 공개, 비공개)
		mv.addObject("cmntListCheck", 1);
		
		return mv;
	}
	
	
	// 댓글 목록 (공개)
	@RequestMapping(value = "/adcmntlistOpen.action", method = RequestMethod.GET)
	public ModelAndView adMoneyCmntListOpen(int pageNum)
	{
		
		IMoneyDAO dao = sqlSession.getMapper(IMoneyDAO.class);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/AdCmntList.jsp");
		
		// 머니리뷰 전체 개수 구하기 (신고된 게시글 미포함)
		mv.addObject("allPostCount", dao.openCmntCount());
		
		// 페이징
		Paging paging = new Paging();
		
		// 한 페이지당 게시글 개수
		int numPerPage = 3;
		
		// 페이지 개수
		int pageCount = paging.getPageCount(numPerPage, dao.openCmntCount());
		
		// 페이지 기본 url
		String url = "./adcmntlistOpen.action";
		
		// ★ 페이지 index 
		String strList = paging.pageIndexList(pageNum, pageCount, url);
		
		// 스타트 앤드 구하기 (해당 페이지에 어떤 게시글들이 들어갈지)
		
		int count = 0;
		count = dao.openCmntCount();
		//int start = (pageNum-1)*numPerPage+1;
		//int end = pageNum*numPerPage;
		int start = count-((pageNum*numPerPage)-1);
		int end = count-((pageNum-1)*numPerPage);
		
		MoneyDTO money = new MoneyDTO();
		money.setStart(start);
		money.setEnd(end);
		
		mv.addObject("pageCount", pageCount);
		mv.addObject("strList", strList);
		mv.addObject("getCmntList", dao.getCmntListOpen(money));
		mv.addObject("pageNum", pageNum);
		
		// 페이지 구분용 (전체, 공개, 비공개)
		mv.addObject("cmntListCheck", 2);
		
		return mv;
	}
	
	// 댓글 목록 (비공개)
	@RequestMapping(value = "/adcmntlistPrivate.action", method = RequestMethod.GET)
	public ModelAndView adMoneyCmntListPrivate(int pageNum)
	{
		
		IMoneyDAO dao = sqlSession.getMapper(IMoneyDAO.class);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/AdCmntList.jsp");
		
		// 머니리뷰 전체 개수 구하기 (신고된 게시글 미포함)
		mv.addObject("allPostCount", dao.privateCmntCount());
		
		// 페이징
		Paging paging = new Paging();
		
		// 한 페이지당 게시글 개수
		int numPerPage = 3;
		
		// 페이지 개수
		int pageCount = paging.getPageCount(numPerPage, dao.privateCmntCount());
		
		// 페이지 기본 url
		String url = "./adcmntlistPrivate.action";
		
		// ★ 페이지 index 
		String strList = paging.pageIndexList(pageNum, pageCount, url);
		
		// 스타트 앤드 구하기 (해당 페이지에 어떤 게시글들이 들어갈지)
		
		int count = 0;
		count = dao.privateCmntCount();
		//int start = (pageNum-1)*numPerPage+1;
		//int end = pageNum*numPerPage;
		int start = count-((pageNum*numPerPage)-1);
		int end = count-((pageNum-1)*numPerPage);
		
		MoneyDTO money = new MoneyDTO();
		money.setStart(start);
		money.setEnd(end);
		
		mv.addObject("pageCount", pageCount);
		mv.addObject("strList", strList);
		mv.addObject("getCmntList", dao.getCmntListPrivate(money));
		mv.addObject("pageNum", pageNum);
		
		// 페이지 구분용 (전체, 공개, 비공개)
		mv.addObject("cmntListCheck", 3);
		
		return mv;
	}
	
	// 머니리뷰 댓글 상세정보
	@RequestMapping(value = "/adcmntinfo.action", method = RequestMethod.GET)
	public ModelAndView adCmntInfo(MoneyDTO money)
	{
		IMoneyDAO dao = sqlSession.getMapper(IMoneyDAO.class);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/AdCmntInfo.jsp");
		mv.addObject("getCmntInfo", dao.getCmntInfo(money));
		mv.addObject("cmntListCheck", money.getCmntListCheck());
		mv.addObject("pageNum", money.getPageNum());
		return mv;
	}
	
	// 머니리뷰 게시글 조회 (관리자)
	@RequestMapping(value = "/admoneypost.action", method = RequestMethod.GET)
	public ModelAndView moneypost(HttpSession session, MoneyDTO money)
	{
		IMoneyDAO dao = sqlSession.getMapper(IMoneyDAO.class);
		
		session.removeAttribute("user_dstn_cd");
		
		String ad_cd = (String)session.getAttribute("ad_cd");
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("user_dstn_cd", -1);
		mv.addObject("ad_cd", ad_cd);
		mv.setViewName("/MoneyPost.jsp");
		mv.addObject("postFind", dao.postFind(money));
		mv.addObject("postCount", -1);
		mv.addObject("inOutList", dao.inOutList(money));
		mv.addObject("inOutData", dao.inOutData(money));
		
		mv.addObject("totalIn", dao.postTotalIn(money));
		mv.addObject("totalOut", dao.postTotalOut(money));
		
		mv.addObject("emtcCount", dao.emtcCount(money));
		mv.addObject("emtc1", dao.emtc1(money));
		mv.addObject("emtc2", dao.emtc2(money));
		mv.addObject("emtc3", dao.emtc3(money));
		mv.addObject("emtc4", dao.emtc4(money));
		mv.addObject("emtc5", dao.emtc5(money));
		mv.addObject("cmntList", dao.cmntList(money));
		
		return mv;
	}



}
