<%@page import="bean.teacherVO"%><%@page import="bean.teacherDAO"%><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%
	String id = (String)session.getAttribute("teacherId");
	teacherDAO dao = new teacherDAO();
	teacherVO teacherVO = dao.getTeacherInfo(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		accNum = $("#accNum").val()
		bankName = $("#bankName").val()
		accName = $("#accName").val()
			$.ajax({
				url: "teacherInfoChange.jsp",
				data:{
					id : id,
					pw : pw,
					name : name,
					birth : birth,
					gender : gender,
					tel : tel,
					accNum : accNum,
					bankName : bankName,
					accName : accName
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
<h3><%=teacherVO.gettID()%>님의 정보</h3>
<div class="info2-title">아이디</div><input type="text" id="id" value="<%=teacherVO.gettID()%>" class="form-control" readonly><br>
<div class="info2-title">비밀번호</div><input type="password" id="pw" class="form-control"><br>
<div class="info2-title">비밀번호확인</div><input type="password" id="pwcheck" class="form-control"><br>
<div class="info2-title">이름</div><input type="text" id="name" value="<%=teacherVO.gettName()%>" class="form-control"><br>
<div class="info2-title">생년월일</div><input type="text" id="birth" value="<%=teacherVO.gettBirth()%>" class="form-control"><br>
<div class="info2-title">성별</div><input type="text" id="gender" value="<%=teacherVO.gettGender()%>" class="form-control"><br>
<div class="info2-title">전화번호</div><input type="text" id="tel" value="<%=teacherVO.gettTel()%>" class="form-control"><br>
<div class="info2-title">계좌번호</div><input type="text" id="accNum" value="<%=teacherVO.gettAccNum()%>" class="form-control"><br>
<div class="info2-title">은행명</div><input type="text" id="bankName" value="<%=teacherVO.gettBankName()%>" class="form-control"><br>
<div class="info2-title">예금주</div><input type="text" id="accName" value="<%=teacherVO.gettAccName()%>" class="form-control"><br><br>
<a href="teacherPage.jsp?id=<%=teacherVO.gettID()%>"><button type="submit" class="btn btn-secondary">뒤로가기</button></a>
<button type="submit" id="update" class="btn btn-primary">수정하기</button>
</body>
</html>