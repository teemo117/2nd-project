<%@page import="bean.teacherDAO"%><%@page import="bean.teacherVO"%><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%
	teacherVO vo = new teacherVO();
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String gender = request.getParameter("gender");
	String tel = request.getParameter("tel");
	String accNum = request.getParameter("accNum");
	String bankName = request.getParameter("bankName");
	String accName = request.getParameter("accName");
	
	vo.settID(id);
	vo.settPW(pw);
	vo.settName(name);
	vo.settBirth(birth);
	vo.settGender(gender);
	vo.settTel(tel);
	vo.settAccNum(accNum);
	vo.settBankName(bankName);
	vo.settAccName(accName);
	
	teacherDAO dao = new teacherDAO();
	boolean result = dao.create(vo);
%><%=result%>