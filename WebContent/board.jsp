<%@page import="com.DAO.MemberDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DAO.BoardDAO"%>
<%@page import="com.DTO.BoardDTO"%>
<%@page import="com.DTO.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>TheEvent Bootstrap Template - Speaker Details</title>
  <meta content="" name="descriptison">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Raleway:300,400,500,700,800" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/venobox/venobox.css" rel="stylesheet">
  <link href="assets/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: TheEvent - v2.2.0
  * Template URL: https://bootstrapmade.com/theevent-conference-event-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  
  <style type="text/css">
  div#board{
  width: 45%;
	margin-right: 10px;
  }
  table#list {
    width: 100%;
}
	div#write_board{
	width: 45%;
	margin-left: 120px;
	/* visibility: hidden; */
	display : none;
	}
	#writer_close{
		visibility: hidden;
	}
 	#select_one_board{
 		width: 45%;
		 display : none; 
		 margin-left: 120px;
	}
	#speakers-details .container{
		min-height: 720px;
		margin-left: 7%;
		margin-right: 3%;
	}
	div#center{
		width : 100%;
	}
	
	.fill:hover, .fill:focus {
  box-shadow: inset 0 0 0 2em var(--hover);
}

.fill {
  --color: #f82249;
  --hover: #f82249;
}

button, input[type = submit] {
  color: var(--color);
  -webkit-transition: 0.25s;
  transition: 0.25s;
}
button:hover, button:focus, input[type = submit]:hover, input[type = submit]:focus {
  border-color: var(--hover);
  color: white;
}

button, input[type = submit] {
  background: none;
  border: 2px solid;
  font: inherit;
  line-height: 1;
  margin: 0.5em;
  width: 120px;
  height: 40px;
}
.logoc{
	width: 140px;
}
  </style>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
		BoardDAO dao = new BoardDAO();
	/* viewAll 메소드는 시간을 기준으로 내림차순하여 게시글을 전부를
	BoardDTO에 담아 ArrayList에 추가하여 ArrayList을 돌려준다
	*/
		MemberDAO memDAO = new MemberDAO();
		ArrayList<BoardDTO> list = dao.viewAll();
		MemberDTO info = (MemberDTO) session.getAttribute("info");
	%>
  <!-- ======= Header ======= -->
  <header id="header" class="header-fixed">
    <div class="container">

      <div id="logo" class="pull-left">
 		<a href="main.jsp" class="scrollto">
 			<img src="assets/img/carlogo.png" alt="" title=""></a>
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
					<li><a href="main.jsp#schedule">차량대여</a></li>
					<li><a href="board.jsp">문의하기</a></li>
					<li><a href="mypage.jsp">내정보</a></li>
					<li><a href="LogoutService.do">로그아웃</a></li>
					<%
						}
					%>
		</ul>
      </nav><!-- #nav-menu-container -->
    </div>
  </header><!-- End Header -->

  <main id="main" class="main-page">

    <!-- ======= Speaker Details Sectionn ======= -->
    <section id="speakers-details">
      <div class="container" style="max-width: 1500px;">
        <div class="section-header" >
          <h2 style="font-family: 'GmarketSansBold';">문의 게시판</h2>
        </div>

        <div class="row" style="text-align: center;" id="center">
			<div id="board" class="table-responsive-vertical shadow-z-1" >
				<table id = "list" class="table table-hover table-mc-light-blue" style="font-family: 'GmarketSansMedium';">
				<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>날짜</th>
						<th>비고</th>
					</tr>
				<% for(int i=0; i<list.size();i++){ 
					String companyName = memDAO.companyName(list.get(i).getCompany_id());
					//System.out.print("회사이름"+companyName);
				%>
					<tr>
						<td><%=i+1 %></td>
						<td><a href="#" onclick="text_info('<%=list.get(i) %>', '<%=companyName %>')"> <%= list.get(i).getTitle() %></a></td>
						<td><%=companyName %></td>
						<td><%= list.get(i).getBoard_day() %></td>
						<td style="width: 10%;">
						<% if(info != null) {
							
							if(info.getCompany_id() == list.get(i).getCompany_id()){ %>
						
						<a style="width: 100%;" href="RemoveBoard.do?board_num=<%=list.get(i).getBoard_num() %>">삭제</a>

						
						<%} }%></td>
					</tr>
					<% } %>
				
				</table>
				<button class="fill" id="writer" onclick="board_write()"style="font-family: 'GmarketSansMedium';">글쓰기</button>
				<button class="fill" id="writer_close" onclick="board_hide()" style="font-family: 'GmarketSansMedium';">닫기</button>
			</div>
			<div id = "write_board">
			<!-- multipart/form-data : 많은 파일을 업로드할때 형식 -->
				<form action="UploadBoardService.do" method="post" enctype="multipart/form-data"> 
				<table id="list" class="table table-hover table-mc-light-blue" style="font-family: 'GmarketSansMedium';">
					<tr>
						<td>작성자</td>
						<td><%=memDAO.companyName(info.getCompany_id()) %> </td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" name="title" style="width: 95%;"> </td>
					</tr>
					<tr>
						<td colspan="2">내용</td>
					</tr>
					<tr>
						<td colspan="2">
							<textarea name="content" rows="10" style="resize: none; width: 100%;"></textarea>			
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input name = "file_name" type="file" style="float: right;">
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<button class="fill" type="reset" onclick="board_hide()" id="cancel" style="font-family: 'GmarketSansMedium';">취소</button>
							<input class="fill" type="submit" value="작성하기" style="font-family: 'GmarketSansMedium';">
						</td>
					</tr>
				</table>
				</form>
			</div>
			
			<div id = "select_one_board">
				<table id="list" class="table table-hover table-mc-light-blue" style="font-family: 'GmarketSansMedium';">
					<tr>
						<td style="font-family: 'GmarketSansLight';">작성자</td>
						<td id = "select_one_id" style="font-family: 'GmarketSansLight';"></td>
					</tr>
					<tr>
						<td style="font-family: 'GmarketSansLight';">작성시각</td>
						<td id = "select_one_day" style="font-family: 'GmarketSansLight';"></td>
					</tr>
					<tr>
						<td style="font-family: 'GmarketSansLight';">제목</td>
						<td id = "select_one_title" style="font-family: 'GmarketSansLight';"></td>
					</tr>
					<tr>
						<td colspan="2" style="font-family: 'GmarketSansLight';">내용</td>
					</tr>
					<tr>
						<td colspan="2" id="select_one_content" style="height: 150px;">			
						<!-- 이미지 처리  -->				
							<!-- <img src="#"> -->
							<br>
							
						</td>
					</tr>
					<tr>
						<td colspan="2"><button class="fill" onclick="board_hide()" id="one_board_close" >닫기</button></td>
					</tr>
				</table>
			</div>
			
		
			
        </div>
      </div>

    </section>

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer">
    <div class="footer-top">
      <div class="container">
        <div class="row">

          <div class="col-lg-3 col-md-6 footer-info">
            <img src="assets/img/carlogo.png" alt="니카내카">
            <p>In alias aperiam. Placeat tempore facere. Officiis voluptate ipsam vel eveniet est dolor et totam porro. Perspiciatis ad omnis fugit molestiae recusandae possimus. Aut consectetur id quis. In inventore consequatur ad voluptate cupiditate debitis accusamus repellat cumque.</p>
          </div>

          <div class="col-lg-3 col-md-6 footer-links">
            <h4>Useful Links</h4>
            <ul>
              <li><i class="fa fa-angle-right"></i> <a href="#">Home</a></li>
              <li><i class="fa fa-angle-right"></i> <a href="#">About us</a></li>
              <li><i class="fa fa-angle-right"></i> <a href="#">Services</a></li>
              <li><i class="fa fa-angle-right"></i> <a href="#">Terms of service</a></li>
              <li><i class="fa fa-angle-right"></i> <a href="#">Privacy policy</a></li>
            </ul>
          </div>

          <div class="col-lg-3 col-md-6 footer-links">
            <h4>Useful Links</h4>
            <ul>
              <li><i class="fa fa-angle-right"></i> <a href="#">Home</a></li>
              <li><i class="fa fa-angle-right"></i> <a href="#">About us</a></li>
              <li><i class="fa fa-angle-right"></i> <a href="#">Services</a></li>
              <li><i class="fa fa-angle-right"></i> <a href="#">Terms of service</a></li>
              <li><i class="fa fa-angle-right"></i> <a href="#">Privacy policy</a></li>
            </ul>
          </div>

          <div class="col-lg-3 col-md-6 footer-contact">
            <h4>Contact Us</h4>
            <p>
              A108 Adam Street <br>
              New York, NY 535022<br>
              United States <br>
              <strong>Phone:</strong> +1 5589 55488 55<br>
              <strong>Email:</strong> info@example.com<br>
            </p>

            <div class="social-links">
              <a href="#" class="twitter"><i class="fa fa-twitter"></i></a>
              <a href="#" class="facebook"><i class="fa fa-facebook"></i></a>
              <a href="#" class="instagram"><i class="fa fa-instagram"></i></a>
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

        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
      </div>
    </div>
  </footer><!-- End  Footer -->

  <a href="#" class="back-to-top"><i class="fa fa-angle-up"></i></a>


  <!-- Vendor JS Files -->

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
  function board_write() {
	  var write_board = document.getElementById("write_board");
	  var close = document.getElementById("writer_close");
	  var select_one_board = document.getElementById("select_one_board");
		if(select_one_board.style.display == 'inline'){
			$("#select_one_title").html('');
			$("#select_one_id").html('');
			$("#select_one_content").html('');
			$("#select_one_day").html('');
			select_one_board.style.display = 'none';
		}
	  //write_board.style.visibility = 'visible';
	  write_board.style.display = 'inline';
	  close.style.visibility = 'visible';
/* 	          // Hide
	  element.style.display = 'block';          // Show
	  element.style.display = 'inline';         // Show
	  element.style.display = 'inline-block';   // Show */
}
  //글쓰는 창, 클릭시 보여주는 테이블 닫기 함수
  function board_hide(){
	  var write_board = document.getElementById("write_board");
	  var close = document.getElementById("writer_close");
	  var select_one_board = document.getElementById("select_one_board");
	  var one_board_close = document.getElementById("one_board_close");	  
	  
		$("#select_one_title").html('');
		$("#select_one_id").html('');
		$("#select_one_content").html('');
		$("#select_one_day").html('');
	 // write_board.style.visibility = 'hidden';	
	  write_board.style.display = 'none';  
	  close.style.visibility = 'hidden';

	select_one_board.style.display = 'none';  
	one_board_close.style.display = 'none';
	  
  }
  
   function text_info(content, companyName){
	var close = document.getElementById("writer_close");
	var select_one_board = document.getElementById("select_one_board");
	//var getTag = $("#select_one_title").html();
	if(select_one_board.style.display == 'inline'){
		$("#select_one_title").html('');
		$("#select_one_id").html('');
		$("#select_one_content").html('');
		$("#select_one_day").html('');
	}
	var write_board = document.getElementById("write_board");
	if(write_board.style.display == 'inline'){
		write_board.style.display = 'none';
	}
	
	/* if문 써서 해당 태그 값이 inline이면 none으로 변경 */
	  /*   select_one_board.style.display = 'none';  
		one_board_close.style.display = 'none'; */
		 close.style.visibility = 'visible';
	   select_one_board.style.display = 'inline';
	   one_board_close.style.display = 'inline';
	var list = content.split(",");
	var company_id = list[1];
	var title = list[2];
	var file_name = list[3];
	if (file_name) {
		file_name = ' ';
	} 
	var content = list[4];
	var board_day = list[5];
	
	//console.log(companyName);
	
	// tag 를 삽입한다.
	$("#select_one_title").append(title);
	$("#select_one_id").append(companyName);
	$("#select_one_content").append(content);
	$("#select_one_day").append(board_day);
	//$("#center").html(getTag);
	 	
	
	/*   var selectOne = document.getElementById("board_select_one");
	  selectOne.style.display = 'inline';
	  */
  } 
   
   

   $(document).ready(function () {
     var table = $("#list");

     // Table bordered
     $("#table-bordered").change(function () {
       var value = $(this).val();
       table.removeClass("table-bordered").addClass(value);
     });

     // Table striped
     $("#table-striped").change(function () {
       var value = $(this).val();
       table.removeClass("table-striped").addClass(value);
     });

     // Table hover
     $("#table-hover").change(function () {
       var value = $(this).val();
       table.removeClass("table-hover").addClass(value);
     });

     // Table color
     $("#table-color").change(function () {
       var value = $(this).val();
       table.removeClass(/^table-mc-/).addClass(value);
     });
   });

   (function (removeClass) {
     jQuery.fn.removeClass = function (value) {
       if (value && typeof value.test === "function") {
         for (var i = 0, l = this.length; i < l; i++) {
           var elem = this[i];
           if (elem.nodeType === 1 && elem.className) {
             var classNames = elem.className.split(/\s+/);

             for (var n = classNames.length; n--; ) {
               if (value.test(classNames[n])) {
                 classNames.splice(n, 1);
               }
             }
             elem.className = jQuery.trim(classNames.join(" "));
           }
         }
       } else {
         removeClass.call(this, value);
       }
       return this;
     };
   })(jQuery.fn.removeClass);

  </script>
</body>

</html>