<%@page import="bean.userDAO"%><%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%
	String id = request.getParameter("id");
 	userDAO dao = new userDAO();
	boolean result = dao.read(id);
	String check = "<font color=blue>사용가능한 아이디</font>";
	if (result) {
		check="<font color=red>이미 사용중인 아이디입니다.</font>";
	}
%><%= check%>