<%@page import="bean.userDAO"%><%@page import="bean.userVO"%><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%
	userVO vo = new userVO();
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String gender = request.getParameter("gender");
	String tel = request.getParameter("tel");
	
	vo.setuID(id);
	vo.setuPW(pw);
	vo.setuName(name);
	vo.setuBirth(birth);
	vo.setuGender(gender);
	vo.setuTel(tel);
	
	userDAO dao = new userDAO();
	boolean result = dao.create(vo);
%><%=result%>