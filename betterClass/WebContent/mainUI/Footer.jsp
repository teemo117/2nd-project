<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<!-- 구글지도 API -->
	function initMap() {
		// 학원 위치(위도 경도)
		var betterclass = {
			lat : 37.554928,
			lng : 126.936032
		};
		// 맵에 표시할 학원 위치
		var map = new google.maps.Map(document.getElementById('map'), {
			zoom : 18,
			center : betterclass
		});
		// 학원표시할 마커
		var marker = new google.maps.Marker({
			position : betterclass,
			map : map
		});
	}
</script>
<!-- api키 값 입력 -->
<script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDnstVPTyoU3yQtmGgGb3np-2O1SVf1JgU&callback=initMap">
</script>

<style>
#map {
	height: 150px;
	width: 500px;
}
</style>

</head>
<body>

	<footer style="padding: 0.5rem 1rem;">
		<div class="card text-white bg-primary mb-3" style="margin: 10px auto">
			<div class="card-header" style="text-align: center;">
				<b> Copyright(c)2020 베터클래스 All rights reserved. </b>
			</div>
			<div class="card-body" style="display: inline-block; margin: 0px auto;">
				<div class="addressdiv" style="display: inline-block;margin: 0px auto;">
					<div class="addressdiv" style="display: inline-block; margin: 10px auto;">
						<p>상호명 : 배터클래스 | 대표이사 : 어정우 | 개인정보책임자 : 김창희</p>
						<p>사업자등록번호 : 111-22-33333 | 통신판매업신고번호 : 제 2020-서울용산-99999</p>
						<p>본사 : 서울특별시 마포구 노고산동 57-1</p>
						<p>고객지원 (운영시간 10:00 ~ 17:00 점심: 11:30-13:00, 주말/공휴일은 제외)
						<p>
						<p>이용약관 | 개인정보처리방침</p>
					</div>
					<div class="addressdiv" style="display: inline-block; margin: 10px auto;">
						<b>상세위치</b>
						<div class="maps" id="map"></div>
					</div>
				</div>
			</div>

		</div>
	</footer>

</body>
</html>