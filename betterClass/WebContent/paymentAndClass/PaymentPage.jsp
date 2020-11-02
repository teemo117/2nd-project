<%@page import="bean.ClassVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.ClassDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String userID = (String)session.getAttribute("userId");
    String cCode = request.getParameter("cCode"); //vo.getcCode 가져와야해
    int cCode2 = Integer.parseInt(cCode); // String >> int 로 변환
    ClassDAO dao = new ClassDAO();
    ArrayList<ClassVO> list = dao.all(cCode2); //cCode2를 인자로 데이터 가져오기
    int cNumOfRegist = dao.getCnumOfRegist(cCode2); // 현 수강인원 가져오기
    ClassVO vo = list.get(0);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Better Class - 더 나은 내일</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
</head>
<script type="text/javascript" src="js/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(function() {
		//신청인원 +- 버튼 클릭 시 ui 변환
		$('#numOfPeople').html($('#inp-totalCnt').val()) //신청인원 텍스트박스 오른쪽 박스에 값 담기
		total_price = parseInt($('#class_price').text()) * parseInt($('#numOfPeople').text()) //총 결제금액 계산
		$('#total-price').html(total_price) //결재금액 계산 총 결제금액
		$('#spn-total-price-confirm').text(total_price)  //"원" 결제하기 버튼 변경
		
		$('#btn-plus').click(function() {//text/val/value
			totalCnt = $('#inp-totalCnt').val(); // 신청인원 텍스트 박스 값 저장
			totalCnt++;//버튼클릭시 totalCnt 증가
			if (totalCnt > 1) {
				$('#btn-minus').prop('disabled', false); // totalCnt 1보다 크면 마이너스 버튼 활성화
			}
			$('#inp-totalCnt').val(totalCnt); //신청인원 텍스트 박스에 totalCnt 저장
			$('#numOfPeople').html($('#inp-totalCnt').val()) //신청인원 박스 오른쪽 테이블 신청인원에 값 전달
			total_price = parseInt($('#class_price').text()) * parseInt($('#numOfPeople').text()) //총 결제금액 계산
			$('#total-price').html(total_price) //total-price 에 계산한 값 저장
			$('#spn-total-price-confirm').text(total_price) // "원" 결제하기에 total_price 값 전달
		})//btn-plus click
		$('#btn-minus').click(function() {
			totalCnt = $('#inp-totalCnt').val();
			if (totalCnt > 2) {
				totalCnt--;
				$('#btn-minus').attr('disabled', false);
			} else if (totalCnt <= 2) {
				totalCnt--;
				$('#btn-minus').attr('disabled', true);
			}
			$('#inp-totalCnt').val(totalCnt);
			$('#numOfPeople').html($('#inp-totalCnt').val())
			total_price = parseInt($('#class_price').text()) * parseInt($('#numOfPeople').text())
			$('#total-price').html(total_price)
			$('#spn-total-price-confirm').text(total_price)
		})//btn-miuns click
		 
		$('#btn_finish').click(function() { // 결제하기 클릭 시 
			 if(parseInt($('#inp-totalCnt').val())+<%=cNumOfRegist%> > <%=vo.getcLimit()%>){ // 현 수강인원 + 신청인원 값이 인원제한보다 크면
				 alert("신청인원을 확인하세요")
			 }else{
				$.ajax({
				url : "Payment.jsp", // 전달할 주소
				data :{
					uID : "<%=userID%>",
					cCode : "<%=cCode%>",
					pBankName : $('#pBankName').val(),//은행사
					pAccNum : $('#pAccNum').val(),//카드번호
					pAccName : $('#pAccName').val(),//예금주
					totalPrice : $('#total-price').text(), //총금액
					numOfRegist : $('#numOfPeople').text() // class 테이블에 저장하기
				}, 
				 success : function(check) {
					if(check=="true"){
						alert("클래스 신청이 완료되었습니다.")
						location.href ="Main.jsp"
					}else{
						alert("오류 발생")
						location.href = "PaymentPage.jsp"
					}
				} 
				})
			 }
		})//btn_finish
	})//$function
</script>
<body>
<jsp:include page="../mainUI/Header.jsp"></jsp:include>
	<div id="p_content" class="p_container">
		<!-- title_box -->
		<div class="p_title_box">
			<h2 class="ptitle_service">수업신청</h2>
		</div>
		<!-- //title_box -->
		<div class="p_wrapper">
			<!-- section_check -->
			<section class="p_l_box section_check">
				<!-- class_information -->
				<div class="p_class_information">
					<div class="p_img">
						<img src="images/<%=vo.getcImg()%>" alt="">
					</div>
					<div class="p_text" style="width: 281px;">
						<p class="p_title">
							[원데이클래스]
							<%=vo.getcTitle() %></p>
						<span class="star_box"> <span class="star"
							style="width: 98%"></span>
						</span> <span class="star_score"></span>
					</div>
				</div>
				<!-- //class_information -->
				<h3 class="title_section">수업 일정을 먼저 선택해주세요.</h3>
				<div
					class="schedule_box mCustomScrollbar _mCS_1 mCS-autoHide mCS_no_scrollbar"
					style="position: relative; overflow: visible;">
					<div id="mCSB_1"
						class="mCustomScrollBox mCS-minimal-dark mCSB_vertical mCSB_outside"
						style="max-height: none;" tabindex="0">
						<div id="mCSB_1_container"
							class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y"
							style="position: relative; top: 0; left: 0;" dir="ltr">
							<ul class="schedule_list">
								<li class="list"><input type="radio" name="select_region_"
									id="select_region_1" class="inp_label blind" checked="checked">
									<label for="select_region_1" class="inp_radio"> <span
										class="start_date"><%=vo.getcDate() + " " +vo.getcDay()+" "+vo.getcTime()%></span>
										<div class="next_class"></div>
								</label></li>
							</ul>
						</div>
						<div class="r_box section_apply">
							<table class="tb_apply">
								<tbody>
									<tr>
										<th>신청 인원</th>
										<td class="box_num">
											<button type="button" class="btn_minus" id="btn-minus"
												disabled=""></button> <input type="text" maxlength="3"
											value="1" name="inp-totalCnt" id="inp-totalCnt"
											style="text-align: center">
											<button type="button" class="btn_plus" id="btn-plus"></button>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div id="mCSB_1_scrollbar_vertical"
						class="mCSB_scrollTools mCSB_1_scrollbar mCS-minimal-dark mCSB_scrollTools_vertical"
						style="display: none;">
						<div class="mCSB_draggerContainer">
							<div id="mCSB_1_dragger_vertical" class="mCSB_dragger"
								style="position: absolute; min-height: 50px; height: 0px; top: 0px;">
								<div class="mCSB_dragger_bar" style="line-height: 50px;"></div>
							</div>
							<div class="mCSB_draggerRail"></div>
						</div>
						<div class="r_box section_apply"></div>
					</div>
				</div>
			</section>
			<div class="r_box section_receipt">
				<h3 class="title_section">최종 결제 금액</h3>
				<table class="tb_pay">
					<tbody>
						<tr>
							<th>클래스이름</th>
							<td><%=vo.getcTitle()%></td>
						</tr>
						<tr>
							<th id=cTotalDate>일정</th>
							<td><%=vo.getcDate() + " " +vo.getcDay()+" "+vo.getcTime()%></td>
						</tr>
						<tr>
							<th>신청 인원</th>
							<td id="numOfPeople"></td>
						</tr>
						<tr>
							<th>수강료</th>
							<td id=class_price><%=vo.getcPrice()+""%></td>
						</tr>
						<tr class="total_price">
							<th>총 결제 금액</th>
							<td><span id="total-price"></span>원</td>
						</tr>
					</tbody>
				</table>

				<div class="btn_bottom_box">
					<button type="button" id="btn_finish" class="btn_next disabled">
						<span id="spn-total-price-confirm"></span>원 결제하기
					</button>
				</div>
			</div>
		</div>
		<div class="payInfo_box">
			<table class="tb_pay">
				<tbody>
					<tr>
						<th>이름</th>
						<td><input type="text" maxlength="5" id="pAccName"></td>
					</tr>
					<tr>
						<th>카드번호('-'제외)</th>
						<td><input type="text" id="pAccNum" maxlength="20"></td>
					</tr>
					<tr>
						<th>유효기간</th>
						<td><select>
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
								<option>6</option>
								<option>7</option>
								<option>8</option>
								<option>9</option>
								<option>10</option>
								<option>11</option>
								<option>12</option>
						</select>&nbsp;&nbsp;월 <select>
								<option>20</option>
								<option>21</option>
								<option>22</option>
								<option>23</option>
								<option>24</option>
								<option>25</option>
						</select>&nbsp;&nbsp;년</td>
					</tr>
					<tr>
						<th>할부기간</th>
						<td><select>
								<option>일시불</option>
								<option>2개월</option>
								<option>3개월</option>
								<option>4개월</option>
								<option>5개월</option>
						</select></td>
					</tr>
					<tr>
						<th>은행사</th>
						<td><select id="pBankName">
								<option>농협</option>
								<option>국민은행</option>
								<option>신한은행</option>
								<option>우리은행</option>
						</select></td>
						</td>
					</tr>
					<tr>
						<th>카드 비밀번호</th>
						<td><input type="text" maxlength="2"> **(앞2자리)</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<jsp:include page="../mainUI/Footer.jsp"></jsp:include>
</body>
</html>