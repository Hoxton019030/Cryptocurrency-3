<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
			<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
			<jsp:include page="../NavBar/CoinShellNavBar.jsp" />

			<head>
				<meta charset="UTF-8">
				<title>金星または真珠 ⚓ Coinshell</title>
				<link rel="stylesheet" href="${contextRoot}/css/gen2introStyle.css">
				<link rel="stylesheet" type="text/css" href="${contextRoot}/css/fullpage.css" />
			</head>

			<body>
				<div id="fullpage">
					<div class="section active" id="section0">

						<div class="jumbotron col-10" style=" top: 15%; bottom: -5%; margin: 0 auto;background: #9daedfe8; text-align: center">
							<h1 class="display-6">About Coin Shell </h1>
		<hr class="my-4">
							<p>Coinshell is a price-tracking website for cryptoassets in
								the rapidly growing cryptocurrency space. Its mission is to make
								crypto discoverable and efficient globally by empowering retail
								users with unbiased, high quality and accurate information for
								drawing their own informed conclusions.</p>
								<br>
								<br>
								<br>
								<br>

								<h4> 這裡放 MISSION |  VISION  |  ACHIEVEMENTS 三張 cards</h4>
								<h4> 參考 online tricks ke 的 how to create about us page using html css and bootstrap.</h4>
						</div>

					</div>
					<div class="section" id="section1">
						<div class="slide active">
							<div class="jumbotron col-10" style="top: 15%; bottom: -5%; margin: 0 auto;background: #7d8ec4; text-align: center">
								<h1 class="display-6">Who we are </h1>
								
								
								<span> Group one. Gruppo uno. Gruppe eins. Groupe un. Grupo um. Gruppe et.</span>
								<hr class="my-4">
								<br>
								<br>
								<br>
								<br>

								<h4> 這裡放 (照片)/(姓名)/(職稱)/(四行內敘述) * 5 ppl</h4>
								<h4> 參考忘記是誰教的 how to create about us page using html css and bootstrap.</h4>


							</div>



						</div>
						<div class="slide">
							<div class="jumbotron col-10" style=" top: 15%; bottom: -5%; margin: 0 auto;background: #6171a9">
								<div style="text-align: center;">
									<h1 class="display-6">Founder of the Coinshell Team</h1>
									<h6>下面這個 chart 的 font-size 有待調整 </h6>
									
									<canvas id="myChart" style="width:60%; "></canvas>
								</div>
							</div>
						</div>
					</div>
					<div class="section" id="section2">
						<section class="instagram" style="background: rgba(200, 200, 200, 0.9);">
							<div class="container-fluid">
								<div class="row m-0">
									<div class="col-lg-2 p-0">
										<div class="instagram_item">
											<img src="https://picsum.photos/300">
											<div class="instagram_text">
												<i class="fa fa-instagram"></i>
											</div>
										</div>
									</div>
									<div class="col-lg-2 p-0">
										<div class="instagram_item">
											<img src="https://picsum.photos/301">
											<div class="instagram_text">
												<i class="fa fa-instagram"></i>
											</div>
										</div>
									</div>
									<div class="col-lg-2 p-0">
										<div class="instagram_item">
											<img src="https://picsum.photos/302">
											<div class="instagram_text">
												<i class="fa fa-instagram"></i>
											</div>
										</div>
									</div>
									<div class="col-lg-2 p-0">
										<div class="instagram_item">
											<img src="https://picsum.photos/300">
											<div class="instagram_text">
												<i class="fa fa-instagram"></i>
											</div>
										</div>
									</div>
									<div class="col-lg-2 p-0">
										<div class="instagram_item">
											<img src="https://picsum.photos/301">
											<div class="instagram_text">
												<i class="fa fa-instagram"></i>
											</div>
										</div>
									</div>
									<div class="col-lg-2 p-0">
										<div class="instagram_item">
											<img src="https://picsum.photos/299">
											<div class="instagram_text">
												<i class="fa fa-instagram"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
						</section>
						<section class="footer spad" style="background: rgba(200, 200, 200, 0.9);">
							<div class="container">
								<div class="row">
									<div class="col-lg-4 col-md-6 col-sm-12 mt-20">
										<div class="footer_about">
											<div class="footer_logo">
												<a href="${contextPath}">Coin Shell<span>.</span></a>
											</div>
											<p> Egal ob Venus oder Barockperle, sie kommt aus einer Muschel. <br/>Non importa
												che sia una venere o una perla barocca.</p>
											<div class="footer-social" style="text-decoration: none; color:black;">
												<a href="#">
													<i class="fa fa-facebook"></i>
												</a>
												<a href="#">
													<i class="fa fa-twitter"></i>
												</a>
												<a href="#">
													<i class="fa fa-instagram"></i>
												</a>
												<a href="#">
													<i class="fa fa-linkedin"></i>
												</a>
											</div>
										</div>
									</div>
									<div display="hidden" class="col-lg-2 col-md-3">
										<div class="footer_widget">
										 

										</div>
									</div>
									<div class="col-lg-2 col-md-3">
										<div class="footer_widget">
											<h6>Accounts</h6>
											<ul>
												<li><a href="/coinshell/account/set">Accounts</a></li>
												<li><a href="${contextRoot}/logout">Log Out</a></li>
												<li><a href="${contextRoot}">Watchlist</a></li>
												<li><a href="${contextRoot}/shop/myshell">PunchList</a></li>
												<li><a href="${contextRoot}/viewAllArticle">BeachTown</a></li>
											</ul>
										</div>
									</div>
									<div class="col-lg-4 col-md-3">
										<div class="footer_widget">
											<h6>Support</h6>
											<ul>
												<li><a href="/coinshell/account/referral">Frequently Asked Questions</a></li>
												<li><a href="${contextRoot}/account/cookie">Cookie Policy</a></li>
												<li><a href="${contextRoot}/account/privacy">Privacy Policy</a></li>
												<li><a href="mailto:arriettybenjamin@gmail.com">Contact us</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>










					</div>
				</div>











				<script type="text/javascript" src="${contextRoot}/javascripts/fullpage.js"></script>
				<script type="text/javascript">
					// 捲動滾輪就可以拉到下一個 section
					var myFullpage = new fullpage('#fullpage', {
						sectionsColor: ['#C0CFFA', '#48578e', '#212c58']
					});
				</script>
				<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
				<script>
				var xValues = ["Pieterzite", "Huginn Hoxton", "Fenrir Feeder", "Bjarki Bear", "Sváfnir"];
				var yValues = [100, 100, 100, 100, 100];
				var barColors = [
				  "#ffb7c5",
				  "#0e1a40",
				  "#946b2d",
				  "#222f5b",
				  "#5d5d5d"
				];

				new Chart("myChart", {
				  type: "doughnut",
				  data: {
				    labels: xValues,
					 
				    datasets: [{
				      backgroundColor: barColors,
				      data: yValues
				    }]
					
				  },
				  options: {
				    title: {
				      display: true,
				      text: "Founder of the Coinshell Team"
				    }
				  }
				});
				</script>
					

			</body>