<%@page import="java.util.List"%>
<%@page import="bean.ClassVO"%>
<%@page import="bean.ClassDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
/* 리스트 변수 */
	List<ClassVO> list = null;
	List<ClassVO> listlength = null;
	int length = 0 ;
/* 가져오는 값 */
String cType = request.getParameter("cType");
String cDay = request.getParameter("cDay");
String cTime = request.getParameter("cTime");
String Search = request.getParameter("Search");
String stringPage = request.getParameter("ListPage");
/* 페이징용 저장 변수 */
int ListPage = Integer.parseInt(stringPage);
int PageLimit = 9;
int LastNum = ListPage * PageLimit;
int StartNum = LastNum - 8;
int OffsetNum = StartNum - 1;

ClassDAO classdao = new ClassDAO();
String all ="전체";

/* 조건별 판별 */
if (cType != null) {
	if (cType.matches(all)) {
		if (cTime != null){
			list = classdao.conditionread(cDay, cTime, OffsetNum);
			listlength = classdao.conditionread(cDay, cTime);
			length = listlength.size();
			System.out.println("위에 시간별 출력되었음");	
		} else {
			list = classdao.bestread(StartNum, LastNum);
			listlength = classdao.bestread();
			length = listlength.size();
			System.out.println("전체 출력되었음");
		}
	} else {
		if (cTime != null) {
			list = classdao.conditionread(cType, cDay, cTime, OffsetNum);
			listlength = classdao.conditionread(cType, cDay, cTime);
			length = listlength.size();
			System.out.println("아래 시간별 출력되었음");
		} else {
			list = classdao.typeread(cType, OffsetNum);			
			listlength = classdao.typeread(cType);
			length = listlength.size();
			System.out.println("카테별 출력되었음");
		}
	}
} else {
	list = classdao.searchread(Search, OffsetNum);
	listlength = classdao.searchread(Search);
	length = listlength.size();
	System.out.println(Search);
	System.out.println("검색 출력되었음");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
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
//시간, 날짜 항목당 하나씩만 선택할수 있게 지정할 변수
var daycount = 0;
var timecount = 0;
$(function() {
	$('li', '#days').click(function() {
		if ($(this).hasClass('on') == false && daycount == 0) {
			$(this).addClass('on');
			$(this).css('background-color', '#eb6864')
			$(this).css('color', '#ffffff')
			daycount++;
		} else if ($(this).hasClass('on') && daycount == 1) {
			$(this).removeClass('on');
			$(this).css('background-color', '#ffffff')
			$(this).css('color', '#000000')
			daycount--;
		} else {
			alert("날짜를 하루만 선택해주세요")
		}
	});//days

	$('li', '#times').click(function() {
		if ($(this).hasClass('on') == false && timecount == 0) {
			$(this).addClass('on');
			$(this).css('background-color', '#eb6864')
			$(this).css('color', '#ffffff')
			timecount++;
		} else if ($(this).hasClass('on') && timecount == 1) {
			$(this).removeClass('on');
			$(this).css('background-color', '#ffffff')
			$(this).css('color', '#000000')
			timecount--;
		} else {
			alert("시간을 하나만 선택해주세요")
		}
	});//times

	//검색을 눌렀을 때 원하는 날짜, 시간조건에 맞는 데이터 페이지 이동
	$('#search').click(
			function() {
				if (daycount == 1 && timecount == 1) {
					var day = "";
					var time = "";
					$("#days").children().each(function() {
						if ($(this).hasClass('on')) {
							if (day == '') {
								day = $(this).attr("day");
							} else {
								day = day + "," + $(this).attr("day");
							}
						}
					});

					$("#times").children().each(
							function() {
								if ($(this).hasClass('on')) {
									if (time == '') {
										time = $(this).attr("time");
									} else {
										time = time + ","
												+ $(this).attr("time");
									}
								}
							});
					//원하는 조건에 맞는 데이터 출력
					//cType을 받아온다.
    url = 'List.jsp'
	type = '<%=request.getParameter("cType")%>'
    console.log(type)
    resetPage = 1;
    location.href = url+"?cType="+type+"&cDay="+day+"&cTime="+time+"&ListPage="+resetPage;
    
} else {
					alert("시간과 요일을 선택해주세요")
				}
			});//search
	




});//function
$(function() {
	$('.content_list').click(function() {
		location.href = "DetailClass.jsp?cCode="+$(this).attr("id")
	})
})



</script>
</head>
<body>
<!-- header부분 삽입 -->
	<jsp:include page="Header.jsp"></jsp:include>
	
<!-- 리스트 요일, 시간 검색 목록 -->
	<div class="search">
		<div class="inbox">
			<div class="left">요일</div>
			<div class="right">
				<div class="days">
					<ul id="days">
						<li day="월" class="">월</li>
						<li day="화" class="">화</li>
						<li day="수" class="">수</li>
						<li day="목" class="">목</li>
						<li day="금" class="">금</li>
						<li day="토" class="">토</li>
						<li day="일" class="">일</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="inbox">
			<div class="left">시간</div>
			<div class="right">
				<div class="days">
					<ul id="times">
                       <li time="8" class="">8시</li>
                       <li time="10" class="">10시</li>
                       <li time="12" class="">12시</li>
                       <li time="14" class="">14시</li>
                       <li time="16" class="">16시</li>
                       <li time="18" class="">18시</li>
                       <li time="20" class="">20시</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="right" id="search">내게 맞는 수업 보기</div>
	</div>

<!-- 리스트 출력부분 -->
	<div class="content">
		<%
			if (length == 0) {//전체 길이 판별
		%>

		<div>
			<h3>요청하신 요일,시간에 강의가 없습니다.</h3>
		</div>

		<%
			} else {
				if ((length - (LastNum - PageLimit)) > PageLimit) {//한 화면에 9개 이상일때 출력할 부분
					for (int i = 0; i < 9; i++) {
						ClassVO vo = list.get(i);
		%>
		<!-- 상세페이지연결 -->
		<div class="content">
		<div class="content_list" id="<%=vo.getcCode()%>">
			<img alt="" src="images/<%=vo.getcImg()%>">
			<div><%=vo.getcTitle()%></div>
			<div><%=vo.getcPrice()%></div>
		</div>
		</div>

		<%
					}
			} else if((length - (LastNum - PageLimit)) == PageLimit){
				for (int i = 0; i < 9; i++) {
					ClassVO vo = list.get(i);
		%>
		<!-- 상세페이지연결 -->
		<div class="content">
		<div class="content_list" id="<%=vo.getcCode()%>">			
			<img alt="" src="images/<%=vo.getcImg()%>">
			<div><%=vo.getcTitle()%></div>
			<div><%=vo.getcPrice()%></div>
		</div>
		</div>
		
		<%
					}
				}
				else {
					for (int i = 0; i < (length % 9); i++) {//출력할게 9개 이하일때
					ClassVO vo = list.get(i);
			%>
			<!-- 상세페이지연결 -->
			<div class="content">
			<div class="content_list" id="<%=vo.getcCode()%>">			
				<img alt="" src="images/<%=vo.getcImg()%>">
				<div><%=vo.getcTitle()%></div>
				<div><%=vo.getcPrice()%></div>
			</div>
			</div>
			
			<%
						}
					}		
			}
		%>
	</div>

	<!-- 페이징 버튼 출력 -->
	<%
	if((length/PageLimit)>= 1){//출력할게 있는지
		
	%>
	
	<div>
		<ul class="pagination">
		
			<% 
			for(int i = 0; i <(length/PageLimit)+1; i++){//9개 이상일때 버튼 출력
			%>
			
			<li class="page-item" value="<%=(i+1)%>"><a class="page-link" href="List.jsp?cType=<%=request.getParameter("cType")%>
			&Search=<%=request.getParameter("Search")%>&ListPage=<%=(i+1)%>"><%=(i+1)%></a></li>
			
			<% 
			}
			%>

		</ul>
	</div>
	
	<%
		}
	
	%>
	<!-- footer부분 삽입 -->
	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>