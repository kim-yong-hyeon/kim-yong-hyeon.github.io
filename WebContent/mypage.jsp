<%@page import="com.DTO.MemberDTO"%>
<%@page import="com.DTO.RentDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DAO.RentDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>TheEvent Bootstrap Template - Index</title>
<meta content="" name="descriptison">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Raleway:300,400,500,700,800"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/venobox/venobox.css" rel="stylesheet">
<link href="assets/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="assets/vendor/aos/aos.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">

<style>
h1 {
	font-size: 30px;
	color: #506982;
	text-transform: uppercase;
	font-weight: 300;
	text-align: center;
	margin-bottom: 15px;
}

table {
	width: 100%;
	table-layout: fixed;
}

.tbl-header {
	background-color: ivory;
}

.tbl-content {
	height: 450px;
	overflow-x: auto;
	margin-top: 0px;
	border: 1px solid rgba(255, 255, 255, 0.5);
}

th {
	padding: 20px 15px;
	text-align: left;
	font-weight: 500;
	font-size: 12px;
	color: #506982;
	text-transform: uppercase;
}

.tbl-content td {
	padding: 15px;
	text-align: left;
	vertical-align: middle;
	font-weight: 300;
	font-size: 12px;
	color: #506982;
	border-bottom: solid 1px rgba(0, 0, 0, 1);
}

input[type="submit"].login {
	float: right;
	width: 112px;
	height: 37px;
	-moz-border-radius: 19px;
	-webkit-border-radius: 19px;
	border-radius: 19px;
	-moz-background-clip: padding;
	-webkit-background-clip: padding-box;
	background-clip: padding-box;
	background-color: #55b1df;
	border: 1px solid #55b1df;
	border: none;
	color: #fff;
	font-weight: bold;
	margin-right: 300px;
}

input[type="submit"].login:hover {
	background-color: #fff;
	border: 1px solid #55b1df;
	color: #55b1df;
	cursor: pointer;
}

input[type="submit"].login:focus {
	outline: none;
}

.logoc {
	width: 140px;
}
</style>
<style type="text/css">
@font-face {
	font-family: 'GmarketSansBold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'GmarketSansMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'GmarketSansLight';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansLight.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
</style>
</head>
<body>
	<%
		MemberDTO info = (MemberDTO) session.getAttribute("info");
	%>

	<!-- ======= Header ======= -->
	<header id="header">
		<div class="container">

			<div id="logo" class="pull-left">
				<a href="main.jsp" class="scrollto"> <img
					src="assets/img/carlogo.png" class="logoc" alt="" title=""></a>
			</div>

			<nav id="nav-menu-container">
				<ul class="nav-menu">

					<li><a href="main.jsp">메인으로</a></li>
					<li><a href="#schedule">대여현황</a></li>
					<li><a href="#predict">수요예측</a></li>
					<li><a href="#editInfo">정보수정</a></li>
					<li><a href="LogoutService.do">로그아웃</a></li>
				</ul>
			</nav>
			<!-- #nav-menu-container -->
		</div>
	</header>
	<!-- End Header -->

	<!-- ======= Intro Section ======= -->
	<section id="intro" style="height: 70vh;">
		<div class="intro-container" data-aos="zoom-in" data-aos-delay="100"
			style="height:">
			<h1
				style="margin-bottom: 100px; color: white; font-family: 'GmarketSansBold';">
				My Page
				</h2>
				<ul style="list-style: none; padding-left: 0px;">
					<li style="float: left;"><a href="#schedule"
						class="about-btn scrollto" style="margin-right: 50px;">차량 대여현황</a></li>
					<li style="float: left;"><a href="#predict"
						class="about-btn scrollto" style="margin-right: 50px;">차량 수요예측</a></li>
					<li style="float: left;"><a href="#editInfo"
						class="about-btn scrollto">나의 정보수정 </a></li>
				</ul>
		</div>
	</section>
	<!-- End Intro Section -->
	<main id="main">
		<!-- ======= Schedule Section ======= -->
		<section id="schedule" class="section-with-bg">
			<div class="container" data-aos="fade-up">
				<div class="section-header">
					<h2 style="font-family: 'GmarketSansBold';">차량 대여현황</h2>
					<p style="font-family: 'GmarketSansMedium';">우리회사 렌터카 대여 현황을
						확인해봅시다.</p>
				</div>

				<ul class="nav nav-tabs" role="tablist" data-aos="fade-up"
					data-aos-delay="100">
					<li class="nav-item"><a class="nav-link active" href="#day-1"
						role="tab" data-toggle="tab">내가 대여받은 차량</a></li>
					<li class="nav-item"><a class="nav-link" href="#day-2"
						role="tab" data-toggle="tab">내가 대여해준 차량</a></li>

				</ul>
				<%
				RentDAO dao = new RentDAO();
				ArrayList<RentDTO> list1 = dao.rent_me(info);
				ArrayList<RentDTO> list2 = dao.rent_you(info);
				%>

				<div class="tab-content row justify-content-center"
					data-aos="fade-up" data-aos-delay="200">

					<!-- Schdule Day 1 -->
					<div role="tabpanel" class="col-lg-9 tab-pane fade show active"
						id="day-1">
						<div class="tbl-header">
							<table cellpadding="0" cellspacing="0" border="0">
								<thead>
									<tr>
										<th>업체명</th>
										<th>업체주소</th>
										<th>렌트일시</th>
										<th>반납일시</th>
										<th>차량종류</th>
										<th>연료종류</th>
										<th>렌트종류</th>
									</tr>
								</thead>
							</table>
						</div>
						<div class="tbl-content">
							<table cellpadding="0" cellspacing="0" border="0">
								<tbody>
									<%
										for (int i = 0; i < list1.size(); i++) {
									%>
									<tr>
									<tr>
										<td><%=list1.get(i).getResponse_company()%></td>
										<td><%=list1.get(i).getLocation()%></td>
										<td><%=list1.get(i).getFirst_day()%></td>
										<td><%=list1.get(i).getLast_day()%></td>
										<td><%=list1.get(i).getCarName()%></td>
										<td><%=list1.get(i).getFuel()%></td>
										<td><%=list1.get(i).getRent_type()%></td>
									</tr>
									<%
										}
									%>
								</tbody>
							</table>
						</div>
					</div>
					<!-- End Schdule Day 1 -->

					<!-- Schdule Day 2 -->
				<div role="tabpanel" class="col-lg-9  tab-pane fade" id="day-2">
					<form action="DeleteRentService.do" method="post">
						<div class="tbl-header">
							<table cellpadding="0" cellspacing="0" border="0">
								<thead>
									<tr>
										<th>업체명</th>
										<th>업체주소</th>
										<th>렌트일시</th>
										<th>반납일시</th>
										<th>차량종류</th>
										<th>연료종류</th>
										<th>렌트종류</th>
										<th>특이사항</th>
									</tr>
								</thead>
							</table>
						</div>
						<div class="tbl-content">
							<table cellpadding="0" cellspacing="0" border="0">
								<tbody>
									<%
										for (int i = 0; i < list2.size(); i++) {
									%>
									<tr>
										<td><%=list2.get(i).getRequest_company()%></td>
										<td><%=list2.get(i).getLocation()%></td>
										<td><%=list2.get(i).getFirst_day()%></td>
										<td><%=list2.get(i).getLast_day()%></td>
										<td><%=list2.get(i).getCarName()%></td>
										<td><%=list2.get(i).getFuel()%></td>
										<td><%=list2.get(i).getRent_type()%></td>
										<td><%=list2.get(i).getComments()%></td>
										<td><input type="submit" value="반납 확인"></td>
										<input type="hidden" name="req_num" value="<%=list2.get(i).getReq_num()%>" >
									</tr>
									<%
										}
									%>
								</tbody>
							</table>
						</div>
					</form>
				</div>
					<!-- End Schdule Day 2 -->
			</div>
		</div>

		</section>
		<!-- End Schedule Section -->
		<!-- ======= Speakers Section ======= -->
		<section id="predict" style="margin-bottom: 100px;">
			<div class="container" data-aos="fade-up" style="padding-top: 100px;">
				<div class="section-header">
					<h2 style="font-family: 'GmarketSansBold';">차량 수요예측</h2>
					<p style="font-family: 'GmarketSansMedium';">다음달에는 차가 얼마나 필요할까?</p>
				</div>

				<div class="row">
					<div class="col-lg-4 col-md-6">
						<div class="speaker" data-aos="fade-up" data-aos-delay="100">
							<img src="assets/img/speakers/1.jpg" alt="Speaker 1"
								class="img-fluid">
							<div class="details">
								<h3 style="text-align: center; margin-top: 20px;">
									<a href="speaker-details.html" align="center">월별 수요예측</a>
								</h3>
								<p>다음달에 우리회사에 차량소비가 어느정도 일지 예측 할 수 있습니다.</p>

							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6">
						<div class="speaker" data-aos="fade-up" data-aos-delay="200">
							<img src="assets/img/speakers/2.jpg" alt="Speaker 2"
								class="img-fluid">
							<div class="details">
								<h3 style="text-align: center; margin-top: 20px;">
									<a href="speaker-details.html">차종별 수요예측</a>
								</h3>
								<p>다음달 우리회사의 차량별 수요를 예측 할 수 있습니다.</p>

							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6">
						<div class="speaker" data-aos="fade-up" data-aos-delay="300">
							<img src="assets/img/speakers/3.jpg" alt="Speaker 3"
								class="img-fluid">
							<div class="details">
								<h3 style="text-align: center; margin-top: 20px;">
									<a href="speaker-details.html">이번달 BEST 3</a>
								</h3>
								<p>이번달 가장 많이 렌트된 차종 BEST3를 알 수 있습니다.</p>

							</div>
						</div>
					</div>



				</div>
			</div>

		</section>
		<!-- End Speakers Section -->
		<!-- =======  F.A.Q Section ======= -->
		<section id="editInfo" style="margin-bottom: 100px;">

			<div class="container" data-aos="fade-up" style="padding-top: 100px;">

				<div class="section-header">
					<h2 style="font-family: 'GmarketSansBold';">회원정보 수정</h2>
				</div>

				<div class="row justify-content-center" data-aos="fade-up"
					data-aos-delay="100">
					<div class="col-lg-9">
						<ul id="faq-list">

							<span style="color: red;">* 회원정보를 수정 할 수 있습니다.</span>
							</p>
							<form method="post" action="UpdateService.do">
								<table class="table table-striped">
									<tr>
										<th>E-mail</th>
										<td>회원 E-mail</td>
									</tr>
									<tr>
										<th>변경할 비밀번호</th>
										<td><input type="password" value="" class="form-control"
											name="pw" /></td>
									</tr>
									<tr>
										<th>연락처</th>
										<td><input type="phone" class="form-control" name="tel" /></td>
									</tr>
									<tr>
										<th>현주소</th>
										<td><input type="text" class="form-control"
											name="location" /></td>
									</tr>
									<tr>
										<th>업체명</th>
										<td><input type="text" class="form-control"
											name="companyName" /></td>
									</tr>
								</table>
								<input type="submit" class="login pull-right" value="정보 변경하기"
									style="background-color: #f8234a; width: 200px">
							</form>
					</div>
				</div>
				</ul>
			</div>
			</div>

			</div>

		</section>
		<!-- End  F.A.Q Section -->

	</main>
	<!-- End #main -->


	<!-- ======= Footer ======= -->
	<footer id="footer">
		<div class="footer-top">
			<div class="container">
				<div class="row">

					<div class="col-lg-3 col-md-6 footer-info">
						<img src="assets/img/carlogo.png" class="logoc" alt="니카내카">
						<p>ㄲ ㅓ 억</p>
					</div>

					<div class="col-lg-3 col-md-6 footer-links">
						<h4>Useful Links</h4>
						<ul>
							<li><i class="fa fa-angle-right"></i> <a href="#">로그인</a></li>
							<li><i class="fa fa-angle-right"></i> <a href="#">회원가입</a></li>
						</ul>
					</div>



					<div class="col-lg-3 col-md-6 footer-links">
						<h4>Useful Links</h4>
						<ul>
							<li><i class="fa fa-angle-right"></i> <a href="#">Home</a></li>
							<li><i class="fa fa-angle-right"></i> <a href="#">About
									us</a></li>
							<li><i class="fa fa-angle-right"></i> <a href="#">Services</a></li>
							<li><i class="fa fa-angle-right"></i> <a href="#">Terms
									of service</a></li>
							<li><i class="fa fa-angle-right"></i> <a href="#">Privacy
									policy</a></li>
						</ul>
					</div>

					<div class="col-lg-3 col-md-6 footer-contact">
						<h4>Contact Us</h4>
						<p>
							A108 Adam Street <br> New York, NY 535022<br> United
							States <br> <strong>Phone:</strong> +1 5589 55488 55<br>
							<strong>Email:</strong> info@example.com<br>
						</p>

						<div class="social-links">
							<a href="#" class="twitter"><i class="fa fa-twitter"></i></a> <a
								href="#" class="facebook"><i class="fa fa-facebook"></i></a> <a
								href="#" class="instagram"><i class="fa fa-instagram"></i></a> <a
								href="#" class="google-plus"><i class="fa fa-google-plus"></i></a>
							<a href="#" class="linkedin"><i class="fa fa-linkedin"></i></a>
						</div>

					</div>

				</div>
			</div>
		</div>

		<div class="container">
			<div class="copyright">
				&copy; Copyright <strong>TheEvent</strong>. All Rights Reserved
			</div>
			<div class="credits">
				<!--
        All the links in the footer should remain intact.
        You can delete the links only if you purchased the pro version.
        Licensing information: https://bootstrapmade.com/license/
        Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=TheEvent
      -->
				Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
			</div>
		</div>
	</footer>
	<!-- End  Footer -->

	<a href="#" class="back-to-top"><i class="fa fa-angle-up"></i></a>

	<!-- Vendor JS Files -->
	<script src="assets/vendor/jquery/jquery.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
	<script src="assets/vendor/php-email-form/validate.js"></script>
	<script src="assets/vendor/venobox/venobox.min.js"></script>
	<script src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>
	<script src="assets/vendor/superfish/superfish.min.js"></script>
	<script src="assets/vendor/hoverIntent/hoverIntent.js"></script>
	<script src="assets/vendor/aos/aos.js"></script>

	<!-- Template Main JS File -->
	<script src="assets/js/main.js"></script>

</body>

</html>