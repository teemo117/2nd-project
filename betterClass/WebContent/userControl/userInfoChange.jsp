<%@page import="bean.userVO"%><%@page import="bean.userDAO"%><%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%
	//String id = (String)session.getAttribute("userId");
	
	userVO vo = new userVO();
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String gender = request.getParameter("gender");
	String tel = request.getParameter("tel");
	String id = request.getParameter("id");

	vo.setuPW(pw);
	vo.setuName(name);
	vo.setuBirth(birth);
	vo.setuGender(gender);
	vo.setuTel(tel);
	vo.setuID(id);
	
	userDAO dao = new userDAO();
	boolean result = dao.update(vo);
%><%=result%>