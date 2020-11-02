<%@page import="java.util.ArrayList"%><%@page import="bean.ClassVO"%><%@page import="bean.ClassDAO"%><%@page import="bean.userVO"%><%@page import="bean.userDAO"%><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%
	String userId = (String)session.getAttribute("userId");
	userDAO userDAO = new userDAO();
	userVO userVO = userDAO.getUserInfo(userId);
	
	ClassVO vo = new ClassVO(); //굳이 필요없고
	ClassDAO cdao = new ClassDAO();
	ArrayList<ClassVO> list = cdao.read1(userId);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저 페이지</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
</head>
<body>
<h3>유저 페이지</h3>
<a href="userInfo.jsp?id=<%=userVO.getuID()%>"><button type="submit" id="userInfoChange" class="btn btn-primary">개인정보 수정</button></a><br>
<%for(int i =0;i<list.size();i++) {
	vo = list.get(i); %><!-- list.get(i).getcCode();로 접근 가능 -->
<div class="info2-title">강좌명</div>
<input id="studyName" value="<%=vo.getcTitle()%>" class="form-control">
<br>
<div class="info2-title">일정</div>
<input id="studyDate" value="<%=vo.getcDate() +" "+ vo.getcTime() + " " + vo.getcDay() %>" class="form-control">
<br>
<hr>
<%} %>
<a href="Main.jsp?id=<%=userVO.getuID()%>"><button type="submit" class="btn btn-secondary">뒤로가기</button></a><br>

</body>
</html>