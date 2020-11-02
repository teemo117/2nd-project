<%@page import="bean.userVO"%><%@page import="bean.userDAO"%><%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%
	userVO vo = new userVO();
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	vo.setuID(id);
	vo.setuPW(pw);
	userDAO dao = new userDAO();
	boolean result = dao.read(vo);
	String check = "입력값을 다시한번 확인해주세요";
	if (result) {
		check = "로그인 성공!!";
	}
	session.setAttribute("userId", id);
	session.setAttribute("group", "user");
	
%><%=check%>