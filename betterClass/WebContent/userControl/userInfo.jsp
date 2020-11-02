<%@page import="bean.userVO"%><%@page import="bean.userDAO"%><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%
	String id = (String)session.getAttribute("userId");
	userDAO dao = new userDAO();
	userVO userVO = dao.getUserInfo(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저정보Read</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#update').click(function(){
		id = $("#id").val()
		pw = $("#pw").val()
		pwcheck = $("#pwcheck").val()
		name = $("#name").val()
		birth = $("#birth").val()
		gender = $("#gender").val()
		tel = $("#tel").val()
			$.ajax({
				url: "userInfoChange.jsp",
				data:{
					id : id,
					pw : pw,
					name : name,
					birth : birth,
					gender : gender,
					tel : tel
				},
				success: function(result) {
					alert("회원정보 수정 성공!!")
					location.reload()
				}
			})
		})
	})
</script>
</head>
<body>
<h3><%=userVO.getuID()%>님의 정보</h3>
<div class="info-title">아이디</div>
<input type="text" id="id" value="<%=userVO.getuID()%>" class="form-control" readonly><br>
<div class="info-title">비밀번호</div><input type="password" id="pw" class="form-control"><br>
<div class="info-title">비밀번호확인</div><input type="password" id="pwcheck" class="form-control"><br>
<div class="info-title">이름</div><input type="text" id="name" value="<%=userVO.getuName()%>" class="form-control"><br>
<div class="info-title">생년월일</div><input type="text" id="birth" value="<%=userVO.getuBirth()%>" class="form-control"><br>
<div class="info-title">성별</div><input type="text" id="gender" value="<%=userVO.getuGender()%>" class="form-control"><br>
<div class="info-title">전화번호</div><input type="text" id="tel" value="<%=userVO.getuTel()%>" class="form-control"><br><br>
<a href="userPage.jsp?id=<%=userVO.getuID()%>"><button type="submit" class="btn btn-secondary">뒤로가기</button></a>
<button type="submit" id="update" class="btn btn-primary">수정하기</button>
</body>
</html>