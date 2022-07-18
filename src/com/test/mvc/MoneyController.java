package com.test.mvc;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MoneyController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 머니리뷰 목록
	@RequestMapping(value = "/userpostlist.action", method = RequestMethod.GET)
	public ModelAndView moneyPostList(int pageNum)
	{
		
		IMoneyDAO dao = sqlSession.getMapper(IMoneyDAO.class);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/UserPostList.jsp");
		
		// 머니리뷰 전체 개수 구하기 (신고된 게시글 미포함)
		mv.addObject("allPostCount", dao.allPostCount());
		
		// 페이징
		Paging paging = new Paging();
		
		// 한 페이지당 게시글 개수
		int numPerPage = 5;
		
		// 페이지 개수
		int pageCount = paging.getPageCount(numPerPage, dao.allPostCount());
		
		// 페이지 기본 url
		String url = "./userpostlist.action";
		
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
		
		// 리스트 가져오기 (스타트 앤드) -- post cd들
		// 특정 게시물의 이전 게시물 번호 얻어내는 메소드 정의 post_cd
		
		return mv;
	}

	
	// 머니리뷰 등록폼
	@RequestMapping(value = "/moneypostreg.action", method = RequestMethod.GET)
	public ModelAndView moneypostreg(MoneyDTO money)
	{
		
		IMoneyDAO dao = sqlSession.getMapper(IMoneyDAO.class);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/MoneyPostReg.jsp");
		mv.addObject("countCheck", dao.countCheck(money));
		mv.addObject("aleadyCheck", dao.aleadyCheck(money));
		mv.addObject("myTag", dao.myTag(money));
		
		return mv;
	}
	
	
	// 머니리뷰 등록 취소
	@RequestMapping(value="/moneypostcancel.action", method=RequestMethod.GET)
	public String studentInsertForm()
	{
		// 다시 가계부로 가려고
		return "/calendar.action";
	}
	
	
	// 머니리뷰 등록 (INSERT)
	@RequestMapping(value="/moneypostinsert.action", method=RequestMethod.POST)
	public ModelAndView moneyPostInsert(MoneyDTO money)
	{
		IMoneyDAO dao = sqlSession.getMapper(IMoneyDAO.class);
		dao.postAdd(money);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/moneypostregok.action");
		return mv;
	}
	
	
	// 머니리뷰 수정폼
	@RequestMapping(value = "/moneypostmodifyform.action", method = RequestMethod.GET)
	public ModelAndView moneyPostModifyForm(MoneyDTO money)
	{
		
		IMoneyDAO dao = sqlSession.getMapper(IMoneyDAO.class);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/MoneyPostModify.jsp");
		mv.addObject("postFind", dao.postFind(money));
		
		return mv;
	}
	
	
	// 머니리뷰 수정 (UPDATE)
	@RequestMapping(value="/moneypostupdate.action", method=RequestMethod.POST)
	public ModelAndView moneyPostUpdate(MoneyDTO money)
	{
		IMoneyDAO dao = sqlSession.getMapper(IMoneyDAO.class);
		dao.postUpdate(money);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/moneypostregok.action");
		return mv;
	}
	
	
	
	
	// 머니리뷰 등록완료 안내
	@RequestMapping(value="/moneypostregok.action", method=RequestMethod.POST)
	public ModelAndView moneyPostInsertOk(MoneyDTO money)
	{
		IMoneyDAO dao = sqlSession.getMapper(IMoneyDAO.class);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/MoneyPostRegOk.jsp");
		mv.addObject("post_cd", dao.postCd(money));
		
		return mv;
	}
	
	
	// 머니리뷰 게시글 조회
	@RequestMapping(value = "/moneypost.action", method = RequestMethod.GET)
	public ModelAndView moneypost(HttpSession session, MoneyDTO money)
	{
		IMoneyDAO dao = sqlSession.getMapper(IMoneyDAO.class);
		
		session.removeAttribute("ad_cd");
    	session.removeAttribute("ad_id");
		
		String user_dstn_cd = (String)session.getAttribute("user_dstn_cd");
	 	dao.postViewPlus(money);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("user_dstn_cd", user_dstn_cd);
		mv.setViewName("/MoneyPost.jsp");
		mv.addObject("postFind", dao.postFind(money));
		mv.addObject("postCount", dao.postCount(user_dstn_cd));
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
	
	
	// 머니리뷰 이모티콘 달기
	@RequestMapping(value = "/emtcadd.action", method = RequestMethod.GET)
	public ModelAndView emtcAdd(MoneyDTO money)
	{
		
		IMoneyDAO dao = sqlSession.getMapper(IMoneyDAO.class);
		
		// 해당 게시글에 달았던 이모티콘 제거 후 달기
		dao.emtcDel(money);
		dao.emtcAdd(money);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("moneypost.action");

		return mv;
	}
	
	
	// 머니리뷰 이모티콘 취소
	@RequestMapping(value = "/emtcdel.action", method = RequestMethod.GET)
	public ModelAndView emtcDel(MoneyDTO money)
	{
		
		IMoneyDAO dao = sqlSession.getMapper(IMoneyDAO.class);
		dao.emtcDel(money);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("moneypost.action");

		return mv;
	}

	
	// 머니리뷰 댓글 달기
	@RequestMapping(value = "/cmntadd.action", method = RequestMethod.GET)
	public ModelAndView cmntAdd(MoneyDTO money)
	{
		IMoneyDAO dao = sqlSession.getMapper(IMoneyDAO.class);
		dao.cmntAdd(money);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("moneypost.action");
		
		return mv;
	}
	
	
	// 머니리뷰 댓글 수정
	@RequestMapping(value = "/cmntedit.action", method = RequestMethod.GET)
	public ModelAndView cmntEdit(MoneyDTO money, String post_cd)
	{
		
		IMoneyDAO dao = sqlSession.getMapper(IMoneyDAO.class);
		dao.cmntEdit(money);
		ModelAndView mv = new ModelAndView();
		mv.addObject("post_cd", post_cd);
		mv.setViewName("moneypost.action");
		
		return mv;
	}
	
	
	// 머니리뷰 댓글 삭제
	@RequestMapping(value = "/cmntdel.action", method = RequestMethod.GET)
	public ModelAndView cmntDel(MoneyDTO money, String post_cd)
	{
		
		IMoneyDAO dao = sqlSession.getMapper(IMoneyDAO.class);
		dao.cmntDel(money);
		ModelAndView mv = new ModelAndView();
		mv.addObject("post_cd", post_cd);
		mv.setViewName("moneypost.action");
		
		return mv;
	}
	
	// 머니리뷰 게시글 신고 등록 폼
	@RequestMapping(value = "/postreportform.action", method = RequestMethod.GET)
	public ModelAndView postReportForm(String post_cd)
	{
		
		IMoneyDAO dao = sqlSession.getMapper(IMoneyDAO.class);

		ModelAndView mv = new ModelAndView();
		mv.addObject("postRept", dao.postReptRnum(post_cd));
		mv.addObject("post_cd", post_cd);
		mv.setViewName("UserPostRept.jsp");
		
		return mv;
	}
	
	// 머니리뷰 게시글 신고 ( 카테 1 ~ 4 )
	@RequestMapping(value = "/userpostrept.action", method = RequestMethod.GET)
	public ModelAndView postReport(MoneyDTO money)
	{
		
		IMoneyDAO dao = sqlSession.getMapper(IMoneyDAO.class);

		ModelAndView mv = new ModelAndView();
		
		dao.postRept(money);
		
		mv.setViewName("/userpostlist.action?pageNum=1");
		
		return mv;
	}
	
	// 머니리뷰 게시글 신고 ( 카테 5 기타 )
	@RequestMapping(value = "/userpostrept5.action", method = RequestMethod.GET)
	public ModelAndView postReportDtl(MoneyDTO money)
	{
		
		IMoneyDAO dao = sqlSession.getMapper(IMoneyDAO.class);

		ModelAndView mv = new ModelAndView();
		
		dao.postRept(money);
		dao.postReptDtl(money);
		
		mv.setViewName("/userpostlist.action?pageNum=1");
		
		return mv;
	}
	
	// 머니리뷰 댓글 신고 등록 폼
	@RequestMapping(value = "/cmntreportform.action", method = RequestMethod.GET)
	public ModelAndView postCmntForm(String cmnt_cd)
	{
		
		IMoneyDAO dao = sqlSession.getMapper(IMoneyDAO.class);

		ModelAndView mv = new ModelAndView();
		mv.addObject("cmntRept", dao.cmntReptRnum(cmnt_cd));
		mv.addObject("cmnt_cd", cmnt_cd);
		mv.setViewName("UserCmntRept.jsp");
		
		return mv;
	}
	
	// 머니리뷰 댓글 신고 ( 카테 1 ~ 4 )
	@RequestMapping(value = "/usercmntrept.action", method = RequestMethod.GET)
	public ModelAndView cmntReport(MoneyDTO money)
	{
		
		IMoneyDAO dao = sqlSession.getMapper(IMoneyDAO.class);

		ModelAndView mv = new ModelAndView();
		
		dao.cmntRept(money);
		
		mv.setViewName("/userpostlist.action?pageNum=1");
		
		return mv;
	}
	
	// 머니리뷰 댓글 신고 ( 카테 5 기타 )
	@RequestMapping(value = "/usercmntrept5.action", method = RequestMethod.GET)
	public ModelAndView cmntReportDtl(MoneyDTO money)
	{
		
		IMoneyDAO dao = sqlSession.getMapper(IMoneyDAO.class);

		ModelAndView mv = new ModelAndView();
		
		dao.cmntRept(money);
		dao.cmntReptDtl(money);
		
		mv.setViewName("/userpostlist.action?pageNum=1");
		
		return mv;
	}


}
