<%@page import="java.util.List"%>
<%@page import="bean.ClassVO"%>
<%@page import="bean.ClassDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	ClassDAO classdao = new ClassDAO();
	List<ClassVO> bestlist = classdao.bestread();	
	ClassDAO classdao2 = new ClassDAO();
	List<ClassVO> recentlist = classdao2.recentread();
	%>
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<title>베터클래스 - 더 나은 내일</title>
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

//각 로고 클릭시 카테고리별 리스트로 이동
$(function(){
	$('#cook').click(function(){
		location.href = "List.jsp?cType="+$('#cate1').text()+"&ListPage=1"
		
	})
	$('#wine').click(function(){
		location.href = "List.jsp?cType="+$('#cate2').text()+"&ListPage=1"
	})
	$('#crafts').click(function(){
		location.href = "List.jsp?cType="+$('#cate3').text()+"&ListPage=1"
	})
	$('#activity').click(function(){
		location.href = "List.jsp?cType="+$('#cate4').text()+"&ListPage=1"
	})
   $('.horizontal-scroll-list').click(function(){
      console.log("눌럿음")
      location.href = "DetailClass.jsp?cCode="+$(this).attr("id")
   })
})

</script>
</head>
<body>
<!-- header부분 삽입 -->
<jsp:include page="Header.jsp"></jsp:include>
<!-- 카테고리별 로고 이미지 -->
	<div style="text-align:center;">
		<div class="category" id="cook" value="요리"style="display: inline-block;">
			<img alt="" src="images/cook.png">
			<div id="cate1">요리</div>
		</div>		
		<div class="category" id="wine" style="display: inline-block;">
			<img alt="" src="images/wine.png">
			<div id="cate2">와인</div>
		</div>
		<div class="category" id="crafts" style="display: inline-block;">
			<img alt="" src="images/crafts.png">
			<div id="cate3">공예</div>
		</div>		
		<div class="category" id="activity" style="display: inline-block;">
			<img alt="" src="images/activity.png">
			<div id="cate4">엑티비티</div>
		</div>		
	</div>

<!-- 인기강좌 리스트 10개 출력 -->
	<div class="list_title">
		<h2 class="list_title">인기강좌</h2>
		<a class="list_title" href="List.jsp?cType=전체&ListPage=1">전체보기</a>
	</div>
	<div class="horizontal-scroll">
	
		<%
			//인기 클래스 10개 반복 생성
		for (int i = 0; i < 10; i++) {
			ClassVO vo = bestlist.get(i);
		%>
		
		<!-- 클릭시 상세 화면으로 이동- 연결할것 -->
		<div class="horizontal-scroll-list" style="display: inline-block;"
			id="<%=vo.getcCode()%>">
			<img class="scroll-list-img" alt="" src="images/<%=vo.getcImg()%>">
			<div class="scroll-list-info">
				<%=vo.getcTitle()%>
			</div>
		</div>
		
		<%
			}
		%>
	</div>
	
	<!-- 최신강좌 리스트 10개 출력 -->
	<div class="list_title">
		<h2 class="list_title">최신강좌</h2>
	</div>
	<div class="horizontal-scroll">

		<%
			//최신 클래스 10개 반복 생성, 출력
		for (int i = 0; i < 10; i++) {
			ClassVO vo = recentlist.get(i);
		%>
		
		<!-- 클릭시 상세 화면으로 이동- 연결할것 -->
		<div class="horizontal-scroll-list" style="display: inline-block;"
		id="<%=vo.getcCode()%>">
			<img class="scroll-list-img" alt="" src="images/<%=vo.getcImg()%>">
			<div class="scroll-list-info">
				<%=vo.getcTitle()%>
			</div>
		</div>
		<%
			}
		%>
	</div>

	<!--  리뷰 할건지  -->
	
	<!-- footer부분 삽입 -->
	<jsp:include page="Footer.jsp"></jsp:include>
	
</body>
</html>