package com.test.mvc;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
public class AddUserController
{

	@Autowired
	private SqlSession sqlSession;
	
	// 기본정보 입력
	@RequestMapping(value = "/registerform.action", method = RequestMethod.GET)
	public String registerForm(HttpServletRequest request, HttpSession session, Model model)
	{ 
		// 회원가입 기본정보입력 폼으로 보내기
		return "/UserSuInfoInput.jsp";
	}
	 
	// 추가정보① 입력
	// value = "/plusfirst.action" 액션 → userSuPlusInputFst.jsp 페이지로 보내기
	@RequestMapping(value = "/plusfirst.action", method = RequestMethod.POST)
	public String plusFirst(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session, AddUserDTO dto) //여기에 정보들 넘겨받아야하는건지 고민
	{
		 //String result = null;
		 
		 String user_id = request.getParameter("user_id");
		 String user_pw = request.getParameter("user_pw");
		 String user_name = request.getParameter("user_name");
		 String user_tel = request.getParameter("user_tel");
		 
		 model.addAttribute("user_id", user_id);
		 model.addAttribute("user_pw", user_pw);
		 model.addAttribute("user_name", user_name);
		 model.addAttribute("user_tel", user_tel);
		 
		 session.setAttribute("user_id", user_id);
		 session.setAttribute("user_pw", user_pw);
		 session.setAttribute("user_name", user_name);
		 session.setAttribute("user_tel", user_tel);
		 
		 String session_user_id = (String)session.getAttribute("user_id");
		 String session_user_pw = (String)session.getAttribute("user_pw");
		 String session_user_name = (String)session.getAttribute("user_name");
		 String session_user_tel = (String)session.getAttribute("user_tel");
		 
		 // 위에서 받은 각 컬럼들의 데이터를 비어있는 dto 에 넣어 값 설정 다시 해주기
		 dto.setUser_id(session_user_id);
		 dto.setUser_pw(session_user_pw);
		 dto.setUser_name(session_user_name);
		 dto.setUser_tel(session_user_tel);
		 
		 return "/UserSuPlusInputFst.jsp";
	 }
	 
	
	 // 추가정보② 입력
	 // value = "/plussecond.action" 액션 → userSuPlusInputSec.jsp 페이지로 보내기
	 @RequestMapping(value = "/plussecond.action", method = RequestMethod.POST)
	 public String plusSecond(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session, AddUserDTO dto)
	 {		 
		String ssn1 = request.getParameter("ssn1");
		String ssn2 = request.getParameter("ssn2");
		String ssn = ssn1 + ssn2;
		
		String mrg_strcd = request.getParameter("mrgSelect");
		String child_strcd = request.getParameter("childSelect");
		String fml_strcd = request.getParameter("fmlSelect");
		String house_strcd = request.getParameter("houseSelect");
		String pet_strcd = request.getParameter("petSelect");
		String car_strcd = request.getParameter("carSelect");
		
		int mrg_cd = Integer.parseInt(mrg_strcd);
		int child_cd = Integer.parseInt(child_strcd);
		int fml_cd = Integer.parseInt(fml_strcd);
		int house_cd = Integer.parseInt(house_strcd);
		int pet_cd = Integer.parseInt(pet_strcd);
		int car_cd = Integer.parseInt(car_strcd);
		
		model.addAttribute("ssn", ssn);
		model.addAttribute("mrg_cd", mrg_cd);
		model.addAttribute("child_cd", child_cd);
		model.addAttribute("fml_cd", fml_cd);
		model.addAttribute("house_cd", house_cd);
		model.addAttribute("pet_cdd", pet_cd);
		model.addAttribute("car_cd", car_cd);
		
		session.setAttribute("ssn", ssn);
		session.setAttribute("mrg_cd", mrg_cd);
		session.setAttribute("child_cd", child_cd);
		session.setAttribute("fml_cd", fml_cd);
		session.setAttribute("house_cd", house_cd);
		session.setAttribute("pet_cd", pet_cd);
		session.setAttribute("car_cd", car_cd);
		
		String session_ssn = (String)session.getAttribute("ssn");
		int session_mrg_cd = (Integer)session.getAttribute("mrg_cd");
		int session_child_cd = (Integer)session.getAttribute("child_cd");
		int session_fml_cd = (Integer)session.getAttribute("fml_cd");
		int session_house_cd = (Integer)session.getAttribute("house_cd");
		int session_pet_cd = (Integer)session.getAttribute("pet_cd");
		int session_car_cd = (Integer)session.getAttribute("car_cd");
		
		// 위에서 받은 각 컬럼들의 데이터를 비어있는 dto 에 넣어 값 설정 다시 해주기
		dto.setSsn(session_ssn);
		dto.setMrg_cd(session_mrg_cd);
		dto.setChild_cd(session_child_cd);
		dto.setFml_cd(session_fml_cd);
		dto.setHouse_cd(session_house_cd);
		dto.setPet_cd(session_pet_cd);
		dto.setCar_cd(session_car_cd);
		
		return "/selectform.action";	//-- 다음 페이지에서 selectbox 로 뿌려줄 지역 및 직업 1차/2차 데이터 준비
	 }
	 
	 
	 // 이전페이지 가기(plusInputFst.jsp → InfoInput.jsp 페이지로 이동~!!! )
	 @RequestMapping(value = "/preinfoinput.action", method = RequestMethod.POST)
	 public String preinfoinput(UserDTO user) throws SQLException
	 {
		return "/UserReInfoInput.jsp";
	 }
	 

	 // 회원가입 완료 → add() → 가입 완료 페이지
	 @RequestMapping(value = "/plusinfosec.action", method = RequestMethod.POST)
	 public String add(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session, AddUserDTO dto) throws SQLException
	 {
		 
		 try
		 {
		 
			 String area_fst_strcd = request.getParameter("area_fst_cd");
			 String area_sec_strcd = request.getParameter("area_sec_cd");
			 String job_fst_strcd = request.getParameter("job_fst_cd");
			 String job_sec_strcd = request.getParameter("job_sec_cd");
			 
			 int area_fst_cd = Integer.parseInt(area_fst_strcd);
			 int area_sec_cd = Integer.parseInt(area_sec_strcd);
			 int job_fst_cd = Integer.parseInt(job_fst_strcd);
			 int job_sec_cd = Integer.parseInt(job_sec_strcd);
			 
			 model.addAttribute("area_fst_cd", area_fst_cd);
			 model.addAttribute("area_sec_cd", area_sec_cd);
			 model.addAttribute("job_fst_cd", job_fst_cd);
			 model.addAttribute("job_sec_cd", job_sec_cd);
			 
			 session.setAttribute("area_fst_cd", area_fst_cd);
			 session.setAttribute("area_sec_cd", area_sec_cd);
			 session.setAttribute("job_fst_cd", job_fst_cd);
			 session.setAttribute("job_sec_cd", job_sec_cd);
			 
			 /* --> 앞에서 세션 set 해줬던 내용인데, 또 넣어줘야하는지, 아니면 냅둬도 되는지 모르겠음.
			  
			 String session_user_id = (String)session.getAttribute("user_id");
			 String session_user_dstn_cd = (String)session.getAttribute("user_dstn_cd"); //session 객체에서 세션으로 set된 값 get으로 가져오기
			 String session_user_name = (String)session.getAttribute("user_name");
			 String session_user_pw	= (String)session.getAttribute("user_pw");
			 String session_user_tel = (String)session.getAttribute("user_tel");
			 
			 
			 String session_ssn = (String)session.getAttribute("ssn");
			 int session_mrg_cd = (Integer)session.getAttribute("mrg_cd");
			 int session_child_cd = (Integer)session.getAttribute("child_cd");
			 int session_fml_cd = (Integer)session.getAttribute("fml_cd");
			 int session_house_cd = (Integer)session.getAttribute("house_cd");
			 int session_pet_cd = (Integer)session.getAttribute("pet_cd");
			 int session_car_cd = (Integer)session.getAttribute("car_cd");
			 */
			 
			 int session_area_fst_cd = (Integer)session.getAttribute("area_fst_cd");
			 int session_area_sec_cd = (Integer)session.getAttribute("area_sec_cd");
			 int session_job_fst_cd = (Integer)session.getAttribute("job_fst_cd");
			 int session_job_sec_cd = (Integer)session.getAttribute("job_sec_cd");
		
			 /* --> 앞에서 dto.set 해줬던 내용인데, 또 넣어줘야하는지, 아니면 냅둬도 되는지 모르겠음.
			 dto.setUser_id(session_user_id);
			 dto.setUser_dstn_cd(session_user_dstn_cd);
			 dto.setUser_name(session_user_name);
			 dto.setUser_pw(session_user_pw);
			 dto.setUser_tel(session_user_tel);
			 dto.setSsn(session_ssn);
			 dto.setMrg_cd(session_mrg_cd);
			 dto.setChild_cd(session_child_cd);
			 dto.setFml_cd(session_fml_cd);
			 dto.setPet_cd(session_pet_cd);
			 dto.setCar_cd(session_car_cd);
			 dto.setHouse_cd(session_house_cd);
			 */
			 
			 dto.setArea_sec_cd(session_area_sec_cd);
			 dto.setJob_sec_cd(session_job_sec_cd);
			 dto.setArea_fst_cd(session_area_fst_cd);
			 dto.setJob_fst_cd(session_job_fst_cd);
		
		 }
		 catch(Exception e)
		 {
			 System.out.println("Integer 변환 과정에서 문제 발생");
		 }
		 
			 
		 IAddUserDAO dao = sqlSession.getMapper(IAddUserDAO.class);
		 
		 dao.add(dto);
		 
		// 회원 가입 후에 보내는 뷰
		 return "UserSuOk.jsp";
	 }
	
}
