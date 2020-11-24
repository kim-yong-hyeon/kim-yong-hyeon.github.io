<%@page import="com.DAO.MemberDAO"%>
<%@page import="com.DTO.RentDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DAO.RentDAO"%>
<%@page import="com.DTO.MemberDTO"%>
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
<style type="text/css">
/*rent form  */
html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p,
	blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn,
	em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var,
	b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend,
	table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas,
	details, embed, figure, figcaption, footer, header, hgroup, menu, nav,
	output, ruby, section, summary, time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font: inherit;
	font-size: 100%;
	vertical-align: baseline;
}

html {
	line-height: 1;
}

ol, ul {
	list-style: none;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
}

caption, th, td {
	text-align: left;
	font-weight: normal;
	vertical-align: middle;
}

q, blockquote {
	quotes: none;
}

q:before, q:after, blockquote:before, blockquote:after {
	content: "";
	content: none;
}

a img {
	border: none;
}

article, aside, details, figcaption, figure, footer, header, hgroup,
	main, menu, nav, section, summary {
	display: block;
}

/* Colors */
/* ---------------------------------------- */
* {
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}

body {
	text-align: center;
	font-family: "Lato", "sans-serif";
	font-weight: 400;
}

a {
	text-decoration: none;
}

.info-text {
	text-align: left;
	width: 100%;
}

header, form {
	padding: 4em 5%;
}

.form-group {
	margin-bottom: 20px;
}

h2.heading {
	font-size: 18px;
	text-transform: uppercase;
	font-weight: 300;
	text-align: left;
	color: #506982;
	border-bottom: 1px solid #506982;
	padding-bottom: 10px;
	margin-bottom: 20px;
}

.controls {
	text-align: left;
	position: relative;
}

.controls input[type="text"], .controls input[type="email"], .controls input[type="number"],
	.controls input[type="date"], .controls input[type="tel"], .controls textarea,
	.controls button, .controls select {
	padding: 12px;
	font-size: 14px;
	border: 1px solid #c6c6c6;
	width: 100%;
	margin-bottom: 18px;
	color: #888;
	font-family: "Lato", "sans-serif";
	font-size: 16px;
	font-weight: 300;
	-moz-border-radius: 2px;
	-webkit-border-radius: 2px;
	border-radius: 2px;
	-moz-transition: all 0.3s;
	-o-transition: all 0.3s;
	-webkit-transition: all 0.3s;
	transition: all 0.3s;
}

.controls input[type="text"]:focus, .controls input[type="text"]:hover,
	.controls input[type="email"]:focus, .controls input[type="email"]:hover,
	.controls input[type="number"]:focus, .controls input[type="number"]:hover,
	.controls input[type="date"]:focus, .controls input[type="date"]:hover,
	.controls input[type="tel"]:focus, .controls input[type="tel"]:hover,
	.controls textarea:focus, .controls textarea:hover, .controls button:focus,
	.controls button:hover, .controls select:focus, .controls select:hover
	{
	outline: none;
	border-color: #9fb1c1;
}

.controls input[type="text"]:focus+label, .controls input[type="text"]:hover+label,
	.controls input[type="email"]:focus+label, .controls input[type="email"]:hover+label,
	.controls input[type="number"]:focus+label, .controls input[type="number"]:hover+label,
	.controls input[type="date"]:focus+label, .controls input[type="date"]:hover+label,
	.controls input[type="tel"]:focus+label, .controls input[type="tel"]:hover+label,
	.controls textarea:focus+label, .controls textarea:hover+label,
	.controls button:focus+label, .controls button:hover+label, .controls select:focus+label,
	.controls select:hover+label {
	color: #bdcc00;
	cursor: text;
}

.controls .fa-sort {
	position: absolute;
	right: 10px;
	top: 17px;
	color: #999;
}

.controls select {
	-moz-appearance: none;
	-webkit-appearance: none;
	cursor: pointer;
}

.controls label {
	position: absolute;
	left: 8px;
	top: 12px;
	width: 60%;
	color: #999;
	font-size: 16px;
	display: inline-block;
	padding: 4px 10px;
	font-weight: 400;
	background-color: rgba(255, 255, 255, 0);
	-moz-transition: color 0.3s, top 0.3s, background-color 0.8s;
	-o-transition: color 0.3s, top 0.3s, background-color 0.8s;
	-webkit-transition: color 0.3s, top 0.3s, background-color 0.8s;
	transition: color 0.3s, top 0.3s, background-color 0.8s;
	background-color: white;
}

.controls label.active {
	top: -11px;
	color: #555;
	background-color: white;
	width: auto;
}

.controls textarea {
	resize: none;
	height: 200px;
}

button {
	cursor: pointer;
	background-color: #1b3d4d;
	border: none;
	color: #fff;
	padding: 12px 0;
	float: right;
}

button:hover {
	background-color: #224c60;
}

.clear:after {
	content: "";
	display: table;
	clear: both;
}

.grid {
	background: white;
}

.grid:after {
	/* Or @extend clearfix */
	content: "";
	display: table;
	clear: both;
}

[class*="col-"] {
	float: left;
	padding-right: 10px;
}

.grid [class*="col-"]:last-of-type {
	padding-right: 0;
}

.col-2-3 {
	width: 66.66%;
}

.col-1-3 {
	width: 33.33%;
}

.col-1-2 {
	width: 50%;
}

.col-1-4 {
	width: 25%;
}

@media ( max-width : 760px) {
	.col-1-4-sm, .col-1-3, .col-2-3 {
		width: 100%;
	}
	[class*="col-"] {
		padding-right: 0px;
	}
}

.col-1-8 {
	width: 12.5%;
}

/* table form */
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
	background-color: rgba(255, 255, 255, 0.3);
}

.tbl-content {
	height: 300px;
	overflow-x: auto;
	margin-top: 0px;
	border: 1px solid rgba(255, 255, 255, 0.3);
}

th {
	padding: 20px 15px;
	text-align: left;
	font-weight: 500;
	font-size: 12px;
	color: #506982;
	text-transform: uppercase;
}

td {
	padding: 15px;
	text-align: left;
	vertical-align: middle;
	font-weight: 300;
	font-size: 12px;
	color: #506982;
	border-bottom: solid 1px rgba(255, 255, 255, 0.1);
}

/* demo styles */
@import
	url(https://fonts.googleapis.com/css?family=Roboto:400,500,300,700);

/* follow me template */
.made-with-love {
	margin-top: 40px;
	padding: 10px;
	clear: left;
	text-align: center;
	font-size: 10px;
	font-family: arial;
	color: #506982;
}

.made-with-love i {
	font-style: normal;
	color: #506982;
	font-size: 14px;
	position: relative;
	top: 2px;
}

.made-with-love a {
	color: #506982;
	text-decoration: none;
}

.made-with-love a:hover {
	text-decoration: underline;
}

/* for custom scrollbar for webkit browser*/
::-webkit-scrollbar {
	width: 6px;
}

::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
}

::-webkit-scrollbar-thumb {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
}
.btn_sc{
color: white;
background-color: #f8234a;
padding: 5px;
width: 200px;
font-size: 18px;
border-radius: 15px;
border: solid 1px gray;
}

.logoc{
	width: 140px;
}
</style>
<style type="text/css">
@font-face {
    font-family: 'GmarketSansBold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'GmarketSansLight';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansLight.woff') format('woff');
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
				<a href="main.jsp" class="scrollto"><img
					src="assets/img/carlogo.png" class="logoc" alt="" title=""></a>
			</div>

			<nav id="nav-menu-container">
				<ul class="nav-menu">
					<%
						if (info == null) {
					%>
					<li><a href="login.jsp">로그인</a></li>
					<li><a href="join.jsp">회원가입</a></li>
					<%
						} else {
					%>
					<li><a href="#schedule">차량대여</a></li>
					<li><a href="board.jsp">문의하기</a></li>
					<li><a href="mypage.jsp">내정보</a></li>
					<li><a href="LogoutService.do">로그아웃</a></li>
					<%
						}
					%>
				</ul>
			</nav>
			<!-- #nav-menu-container -->
		</div>
	</header>
	<!-- End Header -->

	<!-- ======= Intro Section ======= -->
	<section id="intro">
		<div class="intro-container" data-aos="zoom-in" data-aos-delay="100">
			<h1 style="font-family: 'GmarketSansBold'; margin-bottom: 22px;">영업중 부족한 차량</h1>
			<h1 style="font-family: 'GmarketSansBold';">구입 해야되나 고민말고  <span>빌려쓰세요</span></h1>
			<p class="mb-4 pb-0"></p>
			<%
				if (info == null) {
			%>
			<a href="login.jsp" class="about-btn scrollto" style="font-family: 'GmarketSansMedium'; width: 150px;">로  그  인 </a>
			<%
				} else {
			%>
			<a href="#schedule" class="about-btn scrollto"style="font-family: 'GmarketSansMedium'; width: 200px;">차량 대여 신청</a>
			<%
				}
			%>

		</div>
	</section>
	<!-- End Intro Section -->

	<main id="main">
		<%
			if (info == null) {
		%>
		<%
			} else {
		%>
		<main id="main">
			<!-- ======= Schedule Section ======= -->
			<section id="schedule" class="section-with-bg" style="background-color: #fff;">
				<div class="container" data-aos="fade-up">
					<div class="section-header" style="margin-bottom: 0px;">
						<h2 style="font-family: 'GmarketSansBold';">차량 대여 신청</h2>
						<p style="font-family: 'GmarketSansMedium';">쉽고 빠르게 신청하세요</p>
					</div>
					<ul class="nav nav-tabs" role="tablist" data-aos="fade-up"
						data-aos-delay="100">

						<div class="tab-content row justify-content-center"
							data-aos="fade-up" data-aos-delay="200">

							<!-- Schdule Day 1 -->
							<div role="tabpanel" class="col-lg-9 tab-pane fade show active"
								id="day-1">
								<form action="RequestService.do" method="post">
									<!--  General -->
									<div class="form-group">
										<h2 class="heading" style="font-family: 'GmarketSansBold';">신상정보</h2>
										<div class="controls">
											<input type="text" id="name" class="floatLabel" name="request_company" value="<%=info.getCompanyName()%>">
											<label for="name"><%=info.getCompanyName()%></label>
										</div>
										<div class="controls">
											<input type="text" id="email" class="floatLabel" name="email">
											<label for="email"><%=info.getEmail()%></label>
										</div>
										<div class="controls">
											<input type="tel" id="phone" class="floatLabel" name="phone">
											<label for="phone"><%=info.getPhone()%></label>
										</div>
										<div class="controls" style="margin-bottom: 20px;">
											<input type="text" id="location" class="floatLabel" name="location" value="<%=info.getLocation()%>"> 
											<label for="location"><%=info.getLocation()%></label>
										</div>
										<!--  Details -->
										<div class="form-group">
											<h2 class="heading" style="font-family: 'GmarketSansBold';">차량정보</h2>
											<div class="grid">
												<div class="col-1-4 col-1-4-sm">
													<div class="controls">
														<input type="date" id="arrive" class="floatLabel"
															name="first_day" value="<?php echo date('Y-m-d'); ?>">
														<label for="arrive" class="label-date"><i
															class="fa fa-calendar"></i>&nbsp;&nbsp;대여</label>
													</div>
												</div>
												<div class="col-1-4 col-1-4-sm">
													<div class="controls">
														<input type="date" id="depart" class="floatLabel"
															name="last_day" value="<?php echo date('Y-m-d'); ?>" /> <label
															for="depart" class="label-date"><i
															class="fa fa-calendar"></i>&nbsp;&nbsp;반납</label>
													</div>
												</div>
											</div>
											<div class="grid">
												<div class="col-1-3 col-1-3-sm">
													<div class="controls">
														<i class="fa fa-sort"></i> <select class="floatLabel" name="carName">
															<option value="blank"></option>
															<option value="올뉴모닝">올뉴모닝</option>
															<option value="레이">레이</option>
															<option value="sm3">뉴sm3</option>
															<option value="k3">k3</option>
															<option value="아반떼">아반떼MD</option>
															<option value="쏘울">쏘울</option>
															<option value="K5">K5</option>
															<option value="YF소나타">YF소나타</option>
															<option value="LF소나타">LF소나타</option>
															<option value="K7">K7</option>
															<option value="그랜저HG">그랜저HG</option>
														</select> <label for="fruit">&nbsp;&nbsp;차량선택</label>
													</div>
												</div>
												<div class="col-1-3 col-1-3-sm">
													<div class="controls">
														<i class="fa fa-sort"></i> <select class="floatLabel" name="fuel">
															<option value="blank"></option>
															<option value="LPG">LPG</option>
															<option value="휘발유">휘발유</option>
															<option value="경유">경유</option>
														</select> <label for="fruit">연료종류</label>
													</div>
												</div>
												<div class="col-1-3 col-1-3-sm">
													<div class="controls">
														<i class="fa fa-sort"></i> <select class="floatLabel" name="rent_type">
															<option value="blank"></option>
															<option value="단기대차">단기대차</option>
															<option value="장기대차" >장기대차</option>
															<option value="보험대차" >보험대차</option>
														</select> <label for="fruit">대여종류</label>
													</div>
												</div><br><br><br>
												<div class="grid">
													<br>
													<div class="controls">
														<textarea name="comments" class="floatLabel" id="comment"></textarea>
														<label for="comments">추가사항</label>
													</div>
													<div class="button" style=" margin: auto; width: 50%;">
													<input type="submit" value="신청하기" class="btn_sc">
													</div>
												</div>
											</div>
								</form>
							</div>
							<%
							RentDAO dao = new RentDAO();
							ArrayList<RentDTO> list = dao.rentall();
							%>
							<div style="margin-bottom: 50px; color: white;">1</div>
							<h1 style="font-family: 'GmarketSansBold';">차량대여 요청목록</h1>
							<form action="ResponseService.do" method="post" style="width: 830px; padding-right: 0px;padding-left: 0px; padding-top: 20px;">
								<div class="tbl-header">
									<table cellpadding="0" cellspacing="0" border="0" style="font-family: 'GmarketSansBold';">
										<thead>
											<tr>
												<th>업체명</th>
												<th>업체주소</th>
												<th>렌트일시</th>
												<th>반납일시</th>
												<th>차량종류</th>
												<th>연료종류</th>
												<th>렌트종류</th>
												<th>요청수락</th>
												<input type="hidden" name="response_company" value="<%=info.getCompanyName()%>">
											</tr>
										</thead>
									</table>
								</div>
								<div class="tbl-content">
									<table cellpadding="0" cellspacing="0" border="0" style="font-family: 'GmarketSansLight';">
										<tbody>
											<%
												for (int i = 0; i < list.size(); i++) {
											%>
										 	<tr>
												<td><%=list.get(i).getRequest_company()%></td>
												<td><%=list.get(i).getLocation()%></td>
												<td><%=list.get(i).getFirst_day()%></td>
												<td><%=list.get(i).getLast_day()%></td>
												<td><%=list.get(i).getCarName()%></td>
												<td><%=list.get(i).getFuel()%></td>
												<td><%=list.get(i).getRent_type()%></td>
												<td><input type="submit" value="수락"></td>
												<input type="hidden" name="req_num" value="<%=list.get(i).getReq_num()%>" >
											</tr> 
											<%
												}
											%>
										</tbody>
									</table>
								</div>
							</form>
			</section>
			<!-- End Schedule Section -->
		</main>
		<!-- End #main -->


		<%
			}
		%>




		<!-- ======= Footer ======= -->
		<footer id="footer">
			<div class="footer-top">
				<div class="container">
					<div class="row">

						<div class="col-lg-3 col-md-6 footer-info">
							<img src="assets/img/carlogo.png" class="logoc" alt="니카내카">
							<p>In alias aperiam. Placeat tempore facere. Officiis
								voluptate ipsam vel eveniet est dolor et totam porro.
								Perspiciatis ad omnis fugit molestiae recusandae possimus. Aut
								consectetur id quis. In inventore consequatur ad voluptate
								cupiditate debitis accusamus repellat cumque.</p>
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
									href="#" class="instagram"><i class="fa fa-instagram"></i></a>
								<a href="#" class="google-plus"><i class="fa fa-google-plus"></i></a>
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
		<script type="text/javascript">
			/* rent form */
			(function($) {
				function floatLabel(inputType) {
					$(inputType).each(function() {
						var $this = $(this);
						// on focus add cladd active to label
						$this.focus(function() {
							$this.next().addClass("active");
						});
						//on blur check field and remove class if needed
						$this.blur(function() {
							if ($this.val() === '' || $this.val() === 'blank') {
								$this.next().removeClass();
							}
						});
					});
				}
				// just add a class of "floatLabel to the input field!"
				floatLabel(".floatLabel");
			})(jQuery);

			/* table form */
			$(window).on(
					"load resize ",
					function() {
						var scrollWidth = $('.tbl-content').width()
								- $('.tbl-content table').width();
						$('.tbl-header').css({
							'padding-right' : scrollWidth
						});
					}).resize();
		</script>
</body>
</html>