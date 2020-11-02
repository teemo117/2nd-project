<%@page import="bean.userVO"%><%@page import="bean.userDAO"%><%@page import="bean.teacherVO"%><%@page import="bean.teacherDAO"%><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%
	String teacherId = (String)session.getAttribute("teacherId");
    teacherDAO teacherDAO = new teacherDAO();
    teacherVO teacherVO = teacherDAO.getTeacherInfo(teacherId);
    
	String userId = (String)session.getAttribute("userId");
    userDAO userDAO = new userDAO();
    userVO userVO = userDAO.getUserInfo(userId);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css 링크 -->
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<!-- 제이쿼리 링크 -->
<script type="text/javascript" src="js/jquery-3.5.1.js"></script>
<!-- 부트스트랩 CDN -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"
	integrity="sha384-LtrjvnR4Twt/qOuYxE721u19sVFLVSA4hf/rRt6PrZTmiPltdZcI7q7PXQBYTKyf"
	crossorigin="anonymous"></script>
<!-- 콜백함수 구현부 -->
<script type="text/javascript">
//로그인버튼 클릭시 연결
$(function() {
	$('#btnlogin').click(function() {
		/* location.href = ""; */
	})
	$('#btnregis').click(function() {
		/* location.href = ""; */
	})
})

//검색 버튼 클릭시 연결
$(function() {
	$('#MainSearch').click(function() {
		search = $('#MainSearchText').val()
		console.log(search)
        location.href = "List.jsp?Search="+search+"&ListPage=1";
	})
}) 

$(function() {
	$('.dropdown-menu').click(function() {
		Console.log("클릭됨")
	})
})

</script>
<%
//ex)
//session.setAttribute("group", "teacher");

String checkuser = "teacher";
String all = "전체";

%>

</head>
<body>
<!-- 로고부분 -->
	<header style="margin: 10px">
		<div style="display: inline-block;">
		<a href="Main.jsp" style="text-decoration:none">
			<h2>Better Class</h2>
			<h5>- 더 나은 내일</h5>
			</a>
		</div>
		<div class="form-inline my-2 my-lg-0" style="display: inline-block; margin-left: 200px;" >
			<input class="form-control mr-sm-2" type="text" placeholder="Search" id="MainSearchText" >
			<button class="btn btn-secondary my-2 my-sm-0" type="submit" id="MainSearch">Search</button>
		</div>
		<div class="setbound"
			style="display: inline-block; margin-left: 300px;"></div>

		<!-- 네비게이션 -->
		<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
			<!-- 메인으로 이동 -->
			<a class="navbar-brand" href="Main.jsp">베터클래스</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarColor01" aria-controls="navbarColor01"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<!-- 전체강의 -->
			<div class="collapse navbar-collapse" id="navbarColor01">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link" href="List.jsp?cType=<%=all %>&ListPage=1" id="all">전체강의 
					<span class="sr-only">(current)</span>
					</a></li>
					<!-- 카테고리별 리스트 -->
					<li class="nav-item">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
						role="button" aria-haspopup="true" aria-expanded="false">주제별강의</a>
						<div class="dropdown-menu">
							<a class="dropdown-item"  href="List.jsp?cType=요리&ListPage=1">요리</a> <a
								class="dropdown-item" href="List.jsp?cType=와인&ListPage=1">와인</a> <a
								class="dropdown-item" href="List.jsp?cType=공예&ListPage=1">공예</a> <a
								class="dropdown-item" href="List.jsp?cType=액티비티&ListPage=1">엑티비티</a>
						</div></li>
					<!-- <li class="nav-item"><a class="nav-link" href="userPage.jsp">리뷰페이지</a></li> -->
					
					<!-- 유지되는 세션에 따라 화면 보이게 전환 -->
 					<%
					//세션값이 있는지 없는지 판단
						if (session.getAttribute("group") == "teacher") {
							%>
							<li class="nav-item"><a class="nav-link" href="RegistClass.html">강의등록</a></li>
							<li class="nav-item"><a class="nav-link" href="teacherPage.jsp">마이페이지</a></li>
							<%
							
					} else if(session.getAttribute("group") == "user"){
					%>
							<li class="nav-item"><a class="nav-link" href="userPage.jsp">마이페이지</a></li>
                    <%} %>
<%-- 					<%
					//세션값이 있는지 없는지 판단
						if (session.getAttribute("group") == null) {
					} else {
					%>
					<li class="nav-item"><a class="nav-link" href="userPage.jsp">마이페이지</a></li>
					<%
						//세션값이 뭐인지에 따라 분류
						if (checkuser.equals(session.getAttribute("group"))) {
					%>
					<li class="nav-item"><a class="nav-link" href="#">강의등록</a></li>
					<li class="nav-item"><a class="nav-link" href="teacherPage.jsp">마이페이지</a></li>
					<%
						}
					}
					%> --%>
				</ul>
				<% 
				if (session.getAttribute("userId") == null && session.getAttribute("teacherId") == null){
				%>
				<div class="btn-group-vertical" style="display: inline-block;">
					<a href="uOrTLogin.html"><button type="submit" class="btn btn-secondary">로그인</button></a>
				</div>
				<div class="btn-group-vertical" style="display: inline-block;">
					<a href="uOrTJoin.html"><button type="submit" class="btn btn-secondary">회원가입</button></a>
				</div>
				<%}else if (session.getAttribute("teacherId") != null){ %>
				<div class="btn-group-vertical" style="display: inline-block;">
					${teacherId}님 환영합니다.
				</div>
				
				<div class="btn-group-vertical" style="display: inline-block;">
					<a href="Logout.jsp"><button type="button" class="btn btn-primary" id="btnregis">로그아웃</button></a>
				</div>
				<%}else{ %>
				<div class="btn-group-vertical" style="display: inline-block;">
					${userId}님 환영합니다.
				</div>
				
				<div class="btn-group-vertical" style="display: inline-block;">
					<a href="Logout.jsp"><button type="button" class="btn btn-primary" id="btnregis">로그아웃</button></a>
				</div>
				<%} %>
			</div>
		</nav>
	</header>
</body>
</html>