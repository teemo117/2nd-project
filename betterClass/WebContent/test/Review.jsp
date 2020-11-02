<%@page import="java.util.List"%>
<%@page import=bean.ReviewVO"%>
<%@page import="bean.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 ReviewDAO dao = new ReviewDAO();
 List<ReviewVO> list = dao.reviewread();

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

</script>
</head>
<body>
<!-- header부분 삽입 -->
<jsp:include page="../mainUI/Header.jsp"></jsp:include>

<table  border="1">





<tr>
    <th width="150px">글번호</th>
	<th width="400px">강의제목</th>
	<th width="400px">리뷰내용</th>
	<th width="100px">평점</th>
	<th width="150px">작성자</th>
	<th width="100px">작성시간</th>
</tr>
<%

for(int i=0; i < list.size();i++){
	ReviewVO vo = list.get(i);
%>	
	<tr><!-- 첫번째 줄 시작 -->
	    <td><%= vo.getrCode() %></td>
	    <td><%= vo.getcCode() %></td>
	    <td><%= vo.getrContent() %></td>
	    <td><%= vo.getrStar() %></td>
	    <td><%= vo.getuID() %></td>
	    <td><%= vo.getrDate() %></td>
	</tr><!-- 첫번째 줄 끝 -->
<%
}
%>

</table>
<!-- footer부분 삽입 -->
<jsp:include page="../mainUI/Footer.jsp"></jsp:include>
	
</body>
</html>