<%@page import="bean.teacherVO"%><%@page import="bean.teacherDAO"%><%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%
	teacherVO vo = new teacherVO();
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	vo.settID(id);
	vo.settPW(pw);
	teacherDAO dao = new teacherDAO();
	boolean result = dao.read(vo);
	String check = "입력정보를 다시한번 확인해주세요";
	if (result) {
		check = "로그인 성공!!";
	}
	session.setAttribute("teacherId", id);
	session.setAttribute("group", "teacher");
%><%=check%>