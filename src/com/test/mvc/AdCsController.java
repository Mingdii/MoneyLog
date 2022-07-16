package com.test.mvc;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdCsController
{
	@Autowired
	private SqlSession sqlSession;
	
	
	// 공지사항 리스트 출력
	@RequestMapping(value="/adnotilist.action", method = RequestMethod.GET)
	public String adNotiList(Model model, HttpSession session, int pageNum) throws SQLException
	{
		String result = null;
		
		// 고객지원 dao 
		IAdCsDAO dao = sqlSession.getMapper(IAdCsDAO.class);
		
		String ad_cd = (String)session.getAttribute("ad_cd");
		String ad_id = (String)session.getAttribute("ad_id");
		
		// ★ 페이징 처리 진행중 ★
	
		// 공지사항 전체 개수 구하기
		model.addAttribute("allPostCount", dao.adNotiCount());
		
		// 페이징 객체 생성
		Paging paging = new Paging();
		
		// 한 페이지당 게시글 개수
		int numPerPage = 6;
		
		// 페이지 개수
		int pageCount = paging.getPageCount(numPerPage, dao.adNotiCount());
		
		// 페이지 기본 url
		String url = "./adnotilist.action";
		
		// 페이지 index
		String strList = paging.pageIndexList(pageNum, pageCount, url);
		
		// start & end 구하기 (해당 페이지에 어떤 게시글들이 들어갈지)
		int count = 0;
		count = dao.adNotiCount();
		int start = count-((pageNum*numPerPage)-1);
		int end = count-((pageNum-1)*numPerPage);
		
		AdCsDTO dto = new AdCsDTO();
		dto.setStart(start);
		dto.setEnd(end);
		dto.setCount(count);
		dto.setPageNum(pageNum);
		
		// dao 쿼리 실행 후 얻은 리스트 결과를 addAttribute()로 key-value 에 담아 전송
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("strList", strList);
		model.addAttribute("adNotiList", dao.adNotiList(dto));
		//model.addAttribute("pageNum", pageNum);

		result = "/AdNotiList.jsp";
		return result;
	}
	
	// 공지사항 글 보기
	@RequestMapping(value="/adnoticont.action", method=RequestMethod.GET)
	public String adNotiCont(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session, AdCsDTO dto) throws SQLException
	{
		String result = null;
		
		// 고객지원 dao 
		IAdCsDAO dao = sqlSession.getMapper(IAdCsDAO.class);
		
		// 이전 페이지에서 noti_cd 수신
		String noti_cd = request.getParameter("noti_cd");
		
		// dto set 해주기
		dto.setNoti_cd(noti_cd);
		
		// 조회수 증가 메소드 실행
		dao.adNotiViewPlus(dto);
		
		// noti_cd 로 dao 쿼리 실행 후 얻은 문의글 조회 결과를 addAttribute()로 key adNotiView 에 담아 전송
		model.addAttribute("adNotiView", dao.adNotiView(noti_cd));
		
		result = "/AdNotiCont.jsp";
		
		return result;
	}
	
	// 공지사항 수정하기 클릭 > 기존 데이터 가지고 수정폼페이지 가기
	@RequestMapping(value="/adnotiupdateform.action", method=RequestMethod.GET)
	public String adNotiUpdateForm(Model model, HttpServletRequest request, HttpServletResponse response, AdCsDTO dto) throws SQLException
	{
		String result = null;
		
		// 고객지원 dao 
		IAdCsDAO dao = sqlSession.getMapper(IAdCsDAO.class);
		
		// 이전 페이지에서 noti_cd 수신
		String noti_cd = request.getParameter("noti_cd");
		
		// noti_cd 로 dao 쿼리 실행 후 얻은 문의글 조회 결과를 addAttribute()로 key UpdateForm 에 담아 전송
		model.addAttribute("update", dao.adNotiView(noti_cd));
		
		result = "/AdNotiUpdate.jsp";
		
		return result;
	}
	
	// 수정한 공지사항 정보를 공지사항 내용 페이지로 전송
	@RequestMapping(value="/adnotiupdate.action", method=RequestMethod.GET)
	public String adNotiUpdate(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session, AdCsDTO dto) throws SQLException
	{
		String result = null;
		
		// 고객지원 dao 
		IAdCsDAO dao = sqlSession.getMapper(IAdCsDAO.class);
		
		// 공지코드와 수정된 공지제목, 상단고정 여부, 내용 데이터 수신
		String noti_cd = request.getParameter("noti_cd");
		String noti_title = request.getParameter("noti_title");
		String noti_cont = request.getParameter("noti_cont");
		String noti_pin = request.getParameter("noti_pin");
		
		// dto 에 수정된 데이터 넣어주기
		dto.setNoti_cd(noti_cd);
		dto.setNoti_title(noti_title);
		dto.setNoti_pin(noti_pin);
		dto.setNoti_cont(noti_cont);
		
		// dao 의 수정 메소드 실행
		dao.adNotiModify(dto);
		
		// 수정된 데이터의 내용을 조회하는 메소드 실행 결과를 key-value에 담기
		model.addAttribute("update", dao.adNotiView(noti_cd));
		
		// 데이터 전송
		result = "/adnoticont.action";
		return result;
	}
	
	// 공지사항 삭제하기
	@RequestMapping(value="/notidelete.action", method=RequestMethod.GET)
	public String adNotiDelete(Model model, HttpServletRequest request, HttpServletResponse response, AdCsDTO dto) throws SQLException
	{
		String result = null;
		
		// 고객지원 dao 
		IAdCsDAO dao = sqlSession.getMapper(IAdCsDAO.class);
		
		// 이전 페이지에서 데이터 수신
		String noti_cd = request.getParameter("noti_cd");
		
		// 공지 삭제 메소드 실행
		dao.adNotiDelete(noti_cd);
		
		result = "redirect:adnotilist.action";
		
		return result;
	}
	
	// 공지사항 작성 폼으로 이동
	@RequestMapping(value="/adnotiregform.action", method=RequestMethod.GET)
	public String adNotiRegForm(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session, AdCsDTO dto) throws SQLException
	{
		String result = null;
		
		// 고객지원 dao 
		IAdCsDAO dao = sqlSession.getMapper(IAdCsDAO.class);
		
		// 세션에 있는 관리자코드, 아이디 받기
		String ad_cd = (String)session.getAttribute("ad_cd");
		String ad_id = (String)session.getAttribute("ad_id");
		
		// DTO SET 해주기
		dto.setAd_cd(ad_cd);
		dto.setAd_id(ad_id);
		
		// 다음 페이지로 전송
		model.addAttribute("ad_cd", ad_cd);
		model.addAttribute("ad_id", ad_id);
		
		result = "/AdNotiReg.jsp";
		
		return result;
	}
	
	// 공지사항 등록
	@RequestMapping(value="/adnotireg.action", method=RequestMethod.GET)
	public String adNotiReg(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session, AdCsDTO dto) throws SQLException
	{
		String result = null;
		
		// 고객지원 dao 
		IAdCsDAO dao = sqlSession.getMapper(IAdCsDAO.class);
		
		// 필요로한 것 : ad_cd(받아와야해) / noti_title / noti_cont / noti_view(0) / noti_pin
		
		// 관리자가 입력한 데이터 수신
		String noti_pin = request.getParameter("noti_pin");
		String noti_title = request.getParameter("noti_title");
		String noti_cont = request.getParameter("noti_cont");

		// dto set 해주기
		dto.setNoti_pin(noti_pin);
		dto.setNoti_title(noti_title);
		dto.setNoti_cont(noti_cont);
		
		// dao의 등록 메소드 실행
		dao.adNotiInsert(dto);
		
		result = "/adnotilist.action";
		
		return result;
	}
	
	// 문의글 리스트 출력
	@RequestMapping(value="/adqnalist.action", method = RequestMethod.GET)
	public String AdQnaList(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session, AdCsDTO dto, int pageNum) throws SQLException
	{
		String result = null;
		
		IAdCsDAO dao = sqlSession.getMapper(IAdCsDAO.class);
		
		// 문의글 전체 개수 구하기
		model.addAttribute("allPostCount", dao.adQnaCount());
				
		// 페이징 객체 생성
		Paging paging = new Paging();
				
		// 한 페이지당 게시글 개수
		int numPerPage = 8;
				
		// 페이지 개수
		int pageCount = paging.getPageCount(numPerPage, dao.adQnaCount());
				
		// 페이지 기본 url
		String url = "./adqnalist.action";
				
		// 페이지 index
		String strList = paging.pageIndexList(pageNum, pageCount, url);
				
		// start & end 구하기 (해당 페이지에 어떤 게시글들이 들어갈지)
		int count = 0;
		count = dao.adQnaCount();
		int start = count-((pageNum*numPerPage)-1);
		int end = count-((pageNum-1)*numPerPage);

		// dto 에 추출한 start / end set 해주기
		dto.setStart(start);
		dto.setEnd(end);
		dto.setCount(count);
		dto.setPageNum(pageNum);
				
		// dao 쿼리 실행 후 얻은 결과를 addAttribute()로 key-value 에 담아 전송
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("strList", strList);
		model.addAttribute("adQnaList", dao.adQnaList(dto));
		
		result = "/AdQnaList.jsp";
		
		return result;
	}
	
	// 문의글 리스트 > 답변이 없는 문의글폼 페이지로 안내 (문의글 답변 등록 수행 위함)
	@RequestMapping(value="/adqnacont.action", method=RequestMethod.GET)
	public String adQnaCont(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session, AdCsDTO dto) throws SQLException
	{
		String result = null;
		
		// 고객지원 dao 
		IAdCsDAO dao = sqlSession.getMapper(IAdCsDAO.class);
		
		// 이전 페이지에서 ad_id 와 qna_cd 수신
		String qna_cd = request.getParameter("qna_cd");
		
		dto.setQna_cd(qna_cd);
		
		dto = dao.adQnaView(qna_cd);
		
		// noti_cd 로 dao 쿼리 실행 후 얻은 문의글 조회 결과를 addAttribute()로 key adNotiView 에 담아 전송
		model.addAttribute("adQnaView", dto);
		
		result = "/AdQnaCont.jsp";
		
		return result;
	}

	// 문의글 리스트 > 답변이 있는 문의글폼 페이지로 안내
	@RequestMapping(value="/reganswerform.action", method=RequestMethod.GET)
	public String adQnaRegForm(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session, AdCsDTO dto) throws SQLException
	{
		String result = null;
			
		// 고객지원 dao 
		IAdCsDAO dao = sqlSession.getMapper(IAdCsDAO.class);
			
		// 세션으로부터 관리자코드 데이터 수신
		String ad_cd = (String)session.getAttribute("ad_cd");

		// 이전 페이지로부터 데이터 수신
		String qna_cd = request.getParameter("qna_cd");

		//System.out.println(qna_cd);
		//System.out.println(ad_cd);
		
		// dto set 해주기
		dto.setAd_cd(ad_cd);
		dto.setQna_cd(qna_cd);
			
		// 뷰페이지에 보낼 문의글 관련 데이터 key-value 에 담기
		model.addAttribute("adQnaView", dao.adQnaView(qna_cd));
			
		// 뷰페이지에 전송
		result = "/AdQnaReg.jsp";
		return result;
	}
	
	// 문의글 답변 등록 --> 보류(ajax 처리해야하나 고민) / 폼페이지를 만들어서 분기 / 지금 방식에서 수정
	@RequestMapping(value="/reganswer.action", method=RequestMethod.GET)
	public String adQnaReg(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session, AdCsDTO dto) throws SQLException
	{
		String result = null;
		
		// 고객지원 dao 
		IAdCsDAO dao = sqlSession.getMapper(IAdCsDAO.class);
		
		// 필요로한 것 : AD_CD, QNA_CD, AD_ANSR_CONT
		
		// 세션으로부터 관리자코드 데이터 수신
		String ad_cd = (String)session.getAttribute("ad_cd");

		// 이전 페이지로부터 데이터 수신
		String qna_cd = request.getParameter("qna_cd");
		String ad_ansr_cont = request.getParameter("ad_ansr_cont");

		//System.out.println(qna_cd);
		//System.out.println(ad_cd);
		//System.out.println(ad_ansr_cont);
	
		// dto set 해주기
		dto.setQna_cd(qna_cd);
		dto.setAd_cd(ad_cd);
		dto.setAd_ansr_cont(ad_ansr_cont);
		
		// dao 의 등록 메소드 실행
		dao.adQnaInsert(dto);
		
		// 뷰페이지에 보낼 문의글 관련 데이터 key-value 에 담기
		model.addAttribute("adQnaView", dao.adQnaView(qna_cd));
		
		// 뷰페이지에 전송
		result = "/reganswerform.action";
		return result;
	}
	
	// 문의글 수정하기 클릭 > 기존 데이터 가지고 수정폼페이지 가기
	@RequestMapping(value="/adqnaupdateform.action", method=RequestMethod.GET)
	public String adQnaUpdateForm(Model model, HttpServletRequest request, HttpServletResponse response, AdCsDTO dto) throws SQLException
	{
		String result = null;
		
		// 고객지원 dao 
		IAdCsDAO dao = sqlSession.getMapper(IAdCsDAO.class);
		
		// 이전 페이지에서 qna_cd, ad_ansr_cd 수신
		String qna_cd = request.getParameter("qna_cd");
		String ad_ansr_cd = request.getParameter("ad_ansr_cd");
		
		// 수신한 qna_cd, ad_ansr_cd 를 뷰페이지에 전달하기 위해 set
		request.setAttribute("qna_cd", qna_cd);
		request.setAttribute("ad_ansr_cd", ad_ansr_cd);
		
		// qna_cd 로 dao 쿼리 실행 후 얻은 문의글 조회 결과를 addAttribute()로 key UpdateForm 에 담아 전송
		model.addAttribute("update", dao.adQnaView(qna_cd));
		
		result = "/AdQnaUpdateForm.jsp";
		
		return result;
	}
	
	// 수정한 문의글 답변을 반영한 문의글 페이지로 전송
	@RequestMapping(value="/adqnaupdate.action", method=RequestMethod.GET)
	public String adQnaUpdate(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session, AdCsDTO dto) throws SQLException
	{
		String result = null;
		
		// 고객지원 dao 
		IAdCsDAO dao = sqlSession.getMapper(IAdCsDAO.class);
		
		// 필요한 것 : AD_ANSR_CD / AD_CD / AD_ANSR_CONT 

		// 관리자 코드와 수정된 관리자 답변코드, 관리자 답변내용 데이터 수신
		String qna_cd = request.getParameter("qna_cd");
		String ad_cd = (String)session.getAttribute("ad_cd");
		String ad_ansr_cd = request.getParameter("ad_ansr_cd");
		String ad_ansr_cont = request.getParameter("ad_ansr_cont");
		
		// dto 에 수정된 데이터 넣어주기
		dto.setQna_cd(qna_cd);
		dto.setAd_cd(ad_cd);
		dto.setAd_ansr_cd(ad_ansr_cd);
		dto.setAd_ansr_cont(ad_ansr_cont);
		
		// dao 의 수정 메소드 실행
		//dao.adQnaModify(dto);
		
		// 수정된 데이터의 내용을 조회하는 메소드 실행 결과를 key-value에 담기
		model.addAttribute("update", dao.adQnaModify(dto));
		model.addAttribute("update", dao.adQnaView(qna_cd));
		
		// 데이터 전송
		result = "/AdQnaUpdate.jsp";
		return result;
	}
	
	// 문의글 답변 삭제하기
	@RequestMapping(value="/qnadelete.action", method=RequestMethod.GET)
	public String adQnaDelete(Model model, HttpServletRequest request, HttpServletResponse response, AdCsDTO dto) throws SQLException
	{
		String result = null;
		
		// 고객지원 dao 
		IAdCsDAO dao = sqlSession.getMapper(IAdCsDAO.class);
		
		// 이전 페이지에서 데이터 수신
		String ad_ansr_cd = request.getParameter("ad_ansr_cd");
		String qna_cd = request.getParameter("qna_cd");
		
		System.out.println(ad_ansr_cd);
		
		// 답변 삭제 후 불리는 adQnaCont.jsp 의 필수요소 qna_cd를 전달
		request.setAttribute("qna_cd", qna_cd);
		
		// 공지 삭제 메소드 실행
		dao.adQnaDelete(ad_ansr_cd);
		
		result = "/adqnacont.action";
		
		return result;
	}
	

	
}
