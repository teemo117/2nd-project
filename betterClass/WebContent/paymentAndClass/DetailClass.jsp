<%@page import="bean.ClassVO"%>
<%@page import="bean.ClassDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%
    String cCode = request.getParameter("cCode"); //이건 vo.getcCode로 수정해야해
    int cCode2 = Integer.parseInt(cCode); // db데이터 맞게 타입 변환
    ClassDAO dao = new ClassDAO();
    ArrayList<ClassVO> list = dao.all(cCode2);//cCode를 인자로 db에 있는 내용 검색
    String[] arr; //자격증 slicing 을 위한 배열
    int cNumOfRegist = dao.getCnumOfRegist(cCode2); //현 수강인원 수 가져오기
    if(list.get(0).gettCrt().contains(",")){ //(DB에서 가져오면 String 이라)자격증이 2개 이상이면 , 를기준으로 나누기
    	arr = list.get(0).gettCrt().split(",");
    }else{
    	arr = new String[]{list.get(0).gettCrt()}; //1개면 데이터 그냥 저장
    }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Better Class - 더 나은 내일</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<script type="text/javascript" src="js/jquery-3.5.1.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"
	integrity="sha384-LtrjvnR4Twt/qOuYxE721u19sVFLVSA4hf/rRt6PrZTmiPltdZcI7q7PXQBYTKyf"
	crossorigin="anonymous"></script>
<script type="text/javascript">
	$(function() {
		$('#btn_finish').click(function() {
			location.href = "PaymentPage.jsp?cCode="+<%=cCode%>//신청하기 클릭 시
		})
	})
</script>
</head>
<body style="width: 100%; margin: auto; background-color: rgb(250, 250, 250);">
<jsp:include page="../mainUI/Header.jsp"></jsp:include>
	<div
		style="display: inline-block; width: 100%; padding: 16px 4% 0px 4%;">
		<div
			style="display: inline-block; width: 100%; float: left; text-align: left;">
			<!-- <span
				style="display: inline-block; text-overflow: ellipsis; white-space: nowrap; overflow: hidden; float: left; font-size: 15px; width: 100%; color: #97CC98; font-weight: 500;text-align: center;">[원데이]
			</span> -->
			<span
				style="display: inline-block; width: 100%; font-size: 18px; font-weight: 700; color: #383838; line-height: 25px; text-align: center;"><span style="color: #97CC98; font-weight: 500;">[원데이]&nbsp;&nbsp;</span><%=list.get(0).getcTitle()%></span>
		</div>
	</div>
	<div class="pop-tag-area" style="width: 834px; margin: auto;">
		<div class="pop-tag" id="main"
			style="width: 100%; margin: auto; display: none;">
			<div class="pop-tag-header"
				style="z-index: 9999; position: fixed; top: 0px; display: none;">
				<header class="header-main">
					<div
						style="width: 100%; height: 50px; background: #fff; border: 0; opacity: 1; filter: alpha(opacity = 100); border-bottom: 1px solid #e7e7e7">
						<div style="display: table; width: 100%; height: 50px">
							<div
								style="display: table-cell; text-align: center; vertical-align: middle">
								<table
									style="width: 100%; border: 0; table-layout: fixed; height: 50px;">
									<tbody>
										<tr style="width: 100%">
											<td style="width: 30%; text-align: left; padding: 12px 4%"></td>
											<td style="width: 40%; text-align: center;"><span
												style="vertical-align: middle; width: 100%; display: inline-block"><img
													src="https://s3.ap-northeast-2.amazonaws.com/umclassupload/app/new_logo_2009.png"
													style="height: 20px;"></span></td>
											<td style="width: 30%; text-align: right; padding: 0 4%"><img
												class="main-menu" src="static/img/landing_menu.png"
												style="margin-left: 5px; padding: 5px; height: 30px;"></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</header>
			</div>
			<div class="pop-tag-footer"></div>
		</div>
		<div class="pop-tag" id="event"
			style="width: 100%; margin: auto; display: none;">
			<div class="pop-tag-footer"></div>
		</div>
		<div class="pop-tag" id="class" style="width: 100%; margin: auto;">
			<div class="pop-tag-contents"
				style="display: inline-block; width: 100%; margin-top: 120px; background-color: rgb(255, 255, 255);">
				<div class="content-menu-pc"
					style="display: none; z-index: 999; width: 100%; background-color: #fff; position: fixed; top: 120px">
					<div class="first-btn-div-0"
						style="background-color: #fff; text-align: center; display: inline-block; width: 25%; height: 50px; border-bottom: 3px solid #97CC98; line-height: 50px;">
						<span class="first-btn-0"
							style="color: #383838; font-size: 15px; font-weight: 600;">클래스
							정보</span>
					</div>
					<div class="second-btn-div-0"
						style="background-color: #fff; text-align: center; display: inline-block; width: 25%; height: 50px; border-bottom: 3px solid #F0F0F0; line-height: 50px;">
						<span class="second-btn-0"
							style="color: #383838; font-size: 15px; font-weight: 600;">커리큘럼</span><br>
					</div>
					<div class="third-btn-div-0"
						style="background-color: #fff; text-align: center; display: inline-block; width: 25%; height: 50px; border-bottom: 3px solid #F0F0F0; line-height: 50px;">
						<span class="third-btn-0"
							style="color: #383838; font-size: 15px; font-weight: 600;">리뷰</span><br>
					</div>
					<div class="fourth-btn-div-0"
						style="background-color: #fff; text-align: center; display: inline-block; width: 25%; height: 50px; border-bottom: 3px solid #F0F0F0; line-height: 50px;">
						<span class="fourth-btn-0"
							style="color: #383838; font-size: 15px; font-weight: 600;">취소
							및 환불</span><br>
					</div>
				</div>

				<div class="voucher-contents" style="text-align: center;">
					<div class="voucher-main-img">
						<div
							class="class-topImg-slider swiper-container swiper-3 swiper-container-initialized swiper-container-horizontal">
							<div class="swiper-wrapper"
								style="transform: translate3d(0px, 0px, 0px); transition-duration: 0ms;">
								<div class="swiper-slide swiper-slide-active"
									style="color: rgb(255, 255, 255); background-image: url('images/<%=list.get(0).getcImg()%>');background-size: cover; background-position: center center; background-repeat: no-repeat; width: 834px; height: 417px;">
									<div class="first-item"
										data-src=""
										style="width: 100%; height: 417px; background-color: rgba(0, 0, 0, 0.1);">
										<!-- 메인이미지 -->
										<img
											src="../WEB-INF/img/1.jpg"
											style="display: none">
									</div>
								</div>

							</div>

						</div>
					</div>
					<div class="scrap-menu-orignal"
						style="text-align: right; margin-top: -15px;">
						<img class="scrap-write" value=""
							src="https://umclassupload.s3.ap-northeast-2.amazonaws.com/app/class_scrap_icon_200901.png"
							style="display: inline-block; position: relative; z-index: 1; margin-top: -50px; margin-right: 10px; width: 25px; height: 25px;"><img
							class="academyVoucherTelContact"
							src="https://umclassupload.s3.ap-northeast-2.amazonaws.com/app/class_call_icon_200901.png"
							style="display: inline-block; position: relative; z-index: 1; margin-top: -50px; margin-right: 10px; width: 25px; height: 25px;">
					</div>
					<div
						style="display: inline-block; width: 100%; padding: 16px 4% 0px 4%;">
						<div
							style="display: inline-block; width: 100%; float: left; text-align: left;">
							<span
								style="display: inline-block; text-overflow: ellipsis; white-space: nowrap; overflow: hidden; float: left; font-size: 15px; width: 100%; color: #97CC98; font-weight: 500;">[원데이]
							</span><span
								style="display: inline-block; width: 100%; font-size: 18px; font-weight: 700; color: #383838; line-height: 25px;"><%=list.get(0).getcTitle() %></span>
						</div>
					</div>
					<div
						style="display: inline-block; width: 100%; float: left; text-align: left; padding: 0px 4% 15px 4%; border-bottom: 1px solid #E6E6E6">

					</div>
					<div
						style="display: inline-block; width: 100%; float: left; text-align: left; padding: 11px 4% 11px 4%; border-bottom: 1px solid #E6E6E6">
						<div style="display: inline-block; width: 30%;">
							<span
								style="display: inline-block; font-size: 10px; font-weight: 600; color: #646464; margin-bottom: 5px;">분야</span><span
								style="display: inline-block; width: 100%; font-size: 15px; font-weight: 600; color: #2B2B2B"><%=list.get(0).getcType() %></span>
						</div>
						<div style="display: inline-block; width: 30%;">
							<span
								style="display: inline-block; font-size: 10px; font-weight: 600; color: #646464; margin-bottom: 5px;">일정</span><span
								style="display: inline-block; width: 100%; font-size: 15px; font-weight: 600; color: #2B2B2B"><%=list.get(0).getcDate() +"  "+ list.get(0).getcTime()+ " " + list.get(0).getcDay()%></span>
						</div>
						<div style="display: inline-block; width: 30%;">
							<span
								style="display: inline-block; font-size: 10px; font-weight: 600; color: #646464; margin-bottom: 5px;">인원제한</span><span
								style="display: inline-block; width: 100%; font-size: 15px; font-weight: 600; color: #2B2B2B"><%=cNumOfRegist %>/<%=list.get(0).getcLimit()+"명" %></span>
						</div>
					</div>
					<div
						style="display: inline-block; width: 100%; float: left; text-align: left; padding: 20px 4% 15px 4%;">
						<div
							style= "display: inline-block; width: 100%; padding: 0; text-align: center;">
							<!-- 이미지 원형으로 만드는 코드 -->
							<div
								style="display: inline-block; vertical-align: top; background-image: url('images/<%=list.get(0).getcImg()%>'); background-size: cover; background-position: center center; background-repeat: no-repeat; border-radius: 100px; width: 69px; height: 69px; border: 1px solid #F2F2F2;"></div>
							<div
								style="display: inline-block; float: left; vertical-align: middle; width: 100%; margin-top: 5px;">
								<span
									style="display: -webkit-box; -webkit-box-orient: vertical; width: 100%; -webkit-line-clamp: 1; white-space: normal; overflow: hidden; text-overflow: ellipsis; float: left; font-size: 15px; font-weight: 600; color: #4A4A4A; margin-bottom: 5px;"><%=list.get(0).getcTitle()%></span>
								<div class="starrr"
									style="display: inline-block; width: 100%; color: #B4B4B4; font-size: 12px; width: 100%; font-weight: 500;">
									<img src="/static/img/review_able_icon_200901.png"
										style="width: 15px; height: 15px; margin-bottom: 3px;">
									4.9 (39) - 별점?
								</div>
							</div>

						</div>
					</div>
					<span
						style="display: inline-block; float: left; width: 100%; height: 5px; background-color: #F5F5F5"></span>
					<div class="content-menu-orignal"
						style="display: inline-block; width: 100%;">
						<div class="first-btn-div-0"
							style="background-color: #fff; text-align: center; display: inline-block; width: 25%; height: 50px; border-bottom: 3px solid #97CC98; line-height: 50px;">
							<span class="first-btn-0"
								style="color: #383838; font-size: 15px; font-weight: 600;">클래스
								정보</span>
						</div>
						<div class="second-btn-div-0"
							style="background-color: #fff; text-align: center; display: inline-block; width: 25%; height: 50px; border-bottom: 3px solid #F0F0F0; line-height: 50px;">
							<span class="second-btn-0"
								style="color: #383838; font-size: 15px; font-weight: 600;">커리큘럼</span><br>
						</div>
						<div class="third-btn-div-0"
							style="background-color: #fff; text-align: center; display: inline-block; width: 25%; height: 50px; border-bottom: 3px solid #F0F0F0; line-height: 50px;">
							<span class="third-btn-0"
								style="color: #383838; font-size: 15px; font-weight: 600;">리뷰</span><br>
						</div>
						<div class="fourth-btn-div-0"
							style="background-color: #fff; text-align: center; display: inline-block; width: 25%; height: 50px; border-bottom: 3px solid #F0F0F0; line-height: 50px;">
							<span class="fourth-btn-0"
								style="color: #383838; font-size: 15px; font-weight: 600;">취소
								및 환불</span><br>
						</div>
					</div>
					<div style="text-align: left; width: 100%">
						<div class="contents-view"
							style="display: inline-block; width: 100%; margin-bottom: 65px;">
							<div class="class-info"
								style="display: inline-block; width: 100%; padding: 28px 4% 20px 4%; text-align: left">
								<span
									style="display: inline-block; background-color: #97CC98; width: 5px; height: 5px; border-radius: 100px; margin-right: 10px; margin-bottom: 2px;"></span><span
									style="font-size: 15px; color: #000; font-weight: 600;">강사 자격증
									</span>
							</div>
							<div
								style="display: inline-block; width: 100%; padding: 0px 4% 28px 4%; text-align: left; border-bottom: 1px solid #E6E6E6;">
								<%for(int i = 0; i < arr.length;i++){
							    	
								%>
								<span
									style="font-size: 12px; vertical-align: middle; display: block; width: 100%; word-break: break-all; color: #707070; font-weight: 300;"><br><%=arr[i].substring(0,arr[i].length()-4)%><br>
									<br></span><%} %>
							</div>
							<div class="class-info"
								style="display: inline-block; width: 100%; padding: 28px 4% 20px 4%; text-align: left">
								<span
									style="display: inline-block; background-color: #97CC98; width: 5px; height: 5px; border-radius: 100px; margin-right: 10px; margin-bottom: 2px;"></span><span
									style="font-size: 15px; color: #000; font-weight: 600;">클래스 소개
									</span>
									<span
									style="font-size: 12px; vertical-align: middle; display: block; width: 100%; word-break: break-all; color: #707070; font-weight: 300;"><br><%=list.get(0).getcInfo()%><br>
									<br></span>
							</div>
							<div class="curriculum-info"
								style="display: inline-block; width: 100%; padding: 28px 4% 20px 4%; text-align: left">
								<span
									style="display: inline-block; background-color: #97CC98; width: 5px; height: 5px; border-radius: 100px; margin-right: 10px; margin-bottom: 2px;"></span><span
									style="font-size: 15px; color: #000; font-weight: 600;">커리큘럼</span>
								<span
									style="font-size: 12px; vertical-align: middle; display: block; width: 100%; word-break: break-all; color: #707070; font-weight: 300;"><br><%=list.get(0).getcCurriculum()%><br>
									<br></span>
							</div>
							<div
								style="display: inline-block; width: 100%; padding: 28px 4% 20px 4%; text-align: left">
								<span
									style="display: inline-block; background-color: #97CC98; width: 5px; height: 5px; border-radius: 100px; margin-right: 10px; margin-bottom: 2px;"></span><span
									style="font-size: 15px; color: #000; font-weight: 600;">장소</span>
							</div>
							<div
								style="display: inline-block; width: 100%; text-align: left; padding: 0 4% 7px 4%;">
								<div
									style="display: inline-block; width: 747.28px; background-color: #ECF9ED; border-radius: 10px; padding: 10px; margin-left: 15px; float: left">
									<div
										style="display: inline-block; width: 25px; float: left; text-align: center;">
										<img
											src="https://umclassupload.s3.ap-northeast-2.amazonaws.com/app/gps_icon_200901.png"
											style="width: 16px; height: 16px;">
									</div>
									<div
										style="display: inline-block; width: 687.28px; float: left; text-align: left; margin-left: 10px; line-height: 20px;">
										<span
											style="display: inline-block; word-break: break-all; font-weight: 500px; font-size: 12px; color: #5F5F5F"><%=list.get(0).getcAddress() %></span>
									</div>
								</div>
							</div>
 							<div
								style="display: table; width: 100%; height: 100%; padding: 0 4% 23px 4%; border-bottom: 1px solid #E6E6E6;">
								<div class="academy-map-append"
									style="display: table-cell; vertical-align: middle; text-align: left; margin-left: 15px;">
									<!-- 구글지도 >> 난 다음지도를 가지고올거야 -->
									<div id="map1" style="width:100%;height:350px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8c232960af6d8962b6508e76ba4e9550&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map1'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('<%=list.get(0).getcAddress()%>', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">클래스 주소</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>
								</div>
							</div>
						</div>
						<div class="contents-view"
							style="display: inline-block; width: 100%; margin-bottom: 65px;">
							<div class="day-class-rule" style="display: block; width: 100%;">
								<div
									style="display: inline-block; width: 100%; padding: 28px 4% 20px 4%; text-align: left">
									<span
										style="display: inline-block; background-color: #97CC98; width: 5px; height: 5px; border-radius: 100px; margin-right: 10px; margin-bottom: 2px;"></span><span
										style="font-size: 15px; color: #000; font-weight: 600;">원데이
										- 일정 협의 전 환불 규정</span>
								</div>
								<div
									style="display: inline-block; width: 100%; padding: 0px 4%; text-align: left;">
									<span
										style="font-size: 12px; vertical-align: middle; display: block; width: 100%; word-break: break-all; color: #707070; font-weight: 300;">결제
										후 배터클래스 영업일을 기준으로 합니다.<br>원데이 상시반, 원데이 지정반에 공통으로 적용됩니다.<br>
										<br>1) 전체환불이 되는경우<br>
										<div
											style="display: inline-block; width: 100%; margin-left: 5px;">
											결제 후 영업일 기준 10일 이내에, 일정 협의 전 취소 시 전체 환불 가능<br>결제 후 영업일
											기준 10일 이내에, 회원이 일정 협의를 요청하였으나 교육서비스 제공자 불응 시 전체 환불 가능<br>교육서비스
											제공자의 사정으로 수업을 진행하지 못하는 경우 전체 환불 가능<br>
										</div> <br> <br>2) 부분환불이 되는 경우<br>
										<div
											style="display: inline-block; width: 100%; margin-left: 5px;">
											일정 협의 전에는 부분 환불 불가<br>
										</div> <br> <br>3) 환불이 불가능한 경우<br>
										<div
											style="display: inline-block; width: 100%; margin-left: 5px;">
											결제 후 영업일 기준 10일 이내에 회원의 개인 사유로 일정 협의하지 못하고 10일을 초과한 경우 환불 불가능<br>
										</div>
									</span>
								</div>
								<div
									style="display: inline-block; width: 100%; padding: 28px 4% 20px 4%; text-align: left">
									<span
										style="display: inline-block; background-color: #97CC98; width: 5px; height: 5px; border-radius: 100px; margin-right: 10px; margin-bottom: 2px;"></span><span
										style="font-size: 15px; color: #000; font-weight: 600;">원데이
										- 일정 협의 후 환불 규정</span>
								</div>
								<div
									style="display: inline-block; width: 100%; padding: 0px 4% 28px 4%; text-align: left; border-bottom: 1px solid #E6E6E6;">
									<span
										style="font-size: 12px; vertical-align: middle; display: block; width: 100%; word-break: break-all; color: #707070; font-weight: 300;">일정
										협의 후 수강일을 기준으로 합니다.<br>원데이 상시반, 원데이 지정반에 공통으로 적용됩니다.<br>
										<br>1) 전체 환불이 되는 경우<br>
										<div
											style="display: inline-block; width: 100%; margin-left: 5px;">
											클래스 6일전 취소시, 결제 금액 전체 환불 가능<br>결제 후 1시간 이내에 취소시 전체 환불 가능<br>교육서비스
											제공자의 사정으로 지정 날짜에 수업을 진행하지 못하는 경우전체 환불 가능<br>
										</div> <br> <br>2) 부분 환불이 되는 경우<br>
										<div
											style="display: inline-block; width: 100%; margin-left: 5px;">
											클래스 5일전 취소시, 결제금액의 5% 배상 후 환불<br>클래스 4일전 취소시, 결제금액의 10%
											배상 후 환불<br>클래스 3일전 취소시, 결제금액의 20% 배상 후 환불<br>클래스
											2일전 취소시, 결제금액의 30% 배상 후 환불<br>단, 결제 후 1시간 이내에 취소시 전체 환불
											가능<br>
										</div> <br> <br>3) 환불이 불가능한 경우<br>
										<div
											style="display: inline-block; width: 100%; margin-left: 5px;">
											클래스 1일전 또는 당일 취소/불참시 환불불가능<br>클래스 1일전 구매 후 클래스 당일(00시
											00분 이후) 환불 불가능<br>단, 결제 후 1시간 이내에 취소시 전체 환불 가능<br>
										</div>
									</span>
								</div>
							</div>
						</div>
						<div class="academy-footer-0"
							style="z-index: 700; position: fixed; bottom: 0; width: 834px; background: #fff; border: 0; background-color: #fff; padding: 10px 4%; border-top: 1px solid #e7e7e7;">
							<div
								style="display: inline-block; width: 115px; margin-right: 4%; float: left; margin-top: 4px;">
								<div style="display: inline-block; float: left; width: 100%;">
									<span class="final-money"
										style="display: inline-block; font-size: 20px; color: #4B4B4B; font-weight: 700; line-height: 19px;"><%=list.get(0).getcPrice()+"원"%></span>
								</div>
							</div>
							<%
							if(cNumOfRegist!= list.get(0).getcLimit()){
							%>
							<div class="bottom_money_info_area"
								style="display: inline-block; width: 532.046px; float: left;">
								<button class="card-menu append-menu-0" id="btn_finish"
									style="display: inline-block; width: 100%; background-color: #97CC98; border-radius: 10px; height: 50px; line-height: 50px; vertical-align: middle; border: 1px solid #97CC98; color: #fff; text-align: center; font-weight: 700; font-size: 18px;">신청하기</button>
							</div>
							<%} %>
						</div>
						<input type="hidden" id="select-menu" value="first"><input
							type="hidden" id="class-money" value="60000">
					</div>
				</div>
			</div>
			<div class="pop-tag-footer"></div>
		</div>
	</div>
<jsp:include page="../mainUI/Footer.jsp"></jsp:include>
</body>
</html>
</div>
