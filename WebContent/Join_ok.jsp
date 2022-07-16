<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	// Join_ok.jsp (아이디 중복검사)
	Object checkIdObj = request.getAttribute("checkId");
	
	// int로 형 변환
	int checkId = (Integer)checkIdObj;
   
	String result = "";
   
	StringBuffer sb = new StringBuffer();
   
    /* 따옴표 구성에 유의할 것~!!! */
    // json 형식으로 읽어오겠다고 했으니까!! 이렇게 보내야지만 보내짐!
	sb.append("{\"checkId\":\"" + checkId +"\"}" );
   
	result = sb.toString();
   
	out.println(result);
   
   
%>