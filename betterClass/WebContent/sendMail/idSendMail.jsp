<%@page import="Mail.RandomCode"%>
<%@page import="Mail.MailUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%
String email_user = request.getParameter("email_user");
String title = "Better Class에서 인증코드를 발송하였습니다.";
RandomCode ran = new RandomCode();
String code1 = ran.createKey();
String content = "";
content += "<div align='center' style='border:1px solid black; font-family:verdana'>";
content += "<h3 style='color: blue;'>인증번호는</h3>" + code1 + "<br>입니다.";
content += "<div style='font-size: 130%'>";
MailUtil.sendMail(email_user, title, content);
%><%=code1%>