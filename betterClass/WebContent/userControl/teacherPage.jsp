<%@page import="java.util.ArrayList"%><%@page import="bean.ClassVO"%><%@page import="bean.ClassDAO"%><%@page import="bean.teacherVO"%><%@page import="bean.teacherDAO"%><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%
	String id = (String)session.getAttribute("teacherId");
    teacherDAO dao = new teacherDAO();
    teacherVO teacherVO = dao.getTeacherInfo(id);
    
	ClassDAO cdao = new ClassDAO();
	ArrayList<ClassVO> list = cdao.all2(id);
	ClassVO vo = new ClassVO();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강사 페이지</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
</head>
<body>
<h3>강사 페이지</h3>
<a href="teacherInfo.jsp?id=<%=teacherVO.gettID()%>"><button type="submit" class="btn btn-primary">개인정보 수정</button></a><br>
<% for(int i = 0; i<list.size();i++){
	vo = list.get(i);%>
<div class="info2-title">강좌명</div>
<input value="<%=vo.getcTitle()%>" class="form-control">
<br>
<div class="info2-title">일정</div>
<input value="<%=vo.getcDate() +" "+ vo.getcTime() + " " + vo.getcDay() %>" class="form-control">
<br>
<hr>
<% }%>
<br>
<a href="Main.jsp?id=<%=teacherVO.gettID()%>"><button type="submit" class="btn btn-secondary">뒤로가기</button></a>
</body>
</html>