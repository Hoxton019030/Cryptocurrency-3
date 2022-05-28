<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
			<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
			<jsp:include page="../NavBar/CoinShellNavBar.jsp" />

			<!DOCTYPE html>
			<html lang="en">

			<head>
				<meta charset="UTF-8">
				<meta http-equiv="X-UA-Compatible" content="IE=edge">
				<meta name="viewport" content="width=device-width, initial-scale=1.0">
				<title>Referral Program | Coinshell</title>
				<link rel="stylesheet" type="text/css" href="${contextRoot}/css/fullpage.css" />
				<link rel="stylesheet" href="${contextRoot}/css/referralStyle.css">
			</head>

			<body>
				<div id="fullpage">
					<div class="section active" id="section0">
						<h1>Invite Friends. </h1>
						<h1>Earn Rewards Together.</h1>
						<p>Invite your friends to join and you will both get 20 myShells, as soon as they accumulate 100
							myShells. </p>

						<button type="button" class="btn btn-outline-warning col-sms">Join Now</button>
						<script>
							$("button").click(function () {
								alert("Your balance requires at least 1200 myShells.");
							});
						</script>
					</div>
					<div class="section" id="section1">
						<div class="slide active">
							<h1><i class="fa-solid fa-link"></i> #1</h1>
							<h1>Get your referral link</h1>
							<p>You need to have 1200 myShells in your balance to become a referrer and generate the
								referral link which you can send to your friends</p>
						</div>
						<div class="slide">
							<h1><i class="fa-solid fa-envelopes-bulk"></i> #2 </h1>
							<h1>Invite friends</h1>
							<p>Share your referral link to social networks and track the performance of each registered
								invitee on the Referral page.</p>
						</div>
						<div class="slide">
							<h1><i class="fa-solid fa-coins"></i> #3 </h1>
							<h1>Earn rewards together</h1>
							<p>You will both get 20 myShells when new users accumulate 100 myShells.</p>
						</div>
					</div>
					<div class="section" id="section2">
						<h1>FAQs</h1>
						<div class="accordion col-md-auto" id="accordionExample">
							<!--FAQ #1-->
							<div class="card">
								<div class="card-header" id="headingOne">
									<h2 class="mb-0">
										<button class="btn btn-link btn-block text-left" type="button"
											data-toggle="collapse" data-target="#collapseOne" aria-expanded="true"
											aria-controls="collapseOne">
											<i class="fa-solid fa-circle-question"></i> How to join referral program?
										</button>
									</h2>
								</div>

								<div id="collapseOne" class="collapse show" aria-labelledby="headingOne"
									data-parent="#accordionExample">
									<div class="card-body text-left">
										Your balance needs at least 1200 myShells to become a referrer, joining the
										referral program will not consume myShells.
									</div>
								</div>
							</div>

							<!--FAQ #2-->
							<div class="card">
								<div class="card-header" id="headingTwo">
									<h2 class="mb-0">
										<button class="btn btn-link btn-block text-left collapsed" type="button"
											data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false"
											aria-controls="collapseTwo">
											<i class="fa-solid fa-circle-question"></i> How to earn referral rewards?
										</button>
									</h2>
								</div>
								<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
									data-parent="#accordionExample">
									<div class="card-body text-left">
										Get a referral link on referral page and share it with your friends. When a new
										user signs up through your referral link and accumulates 100 myShells, you will
										both get 20 myShells.
									</div>
								</div>
							</div>
							<!--FAQ #3-->
							<div class="card">
								<div class="card-header" id="headingThree">
									<h2 class="mb-0">
										<button class="btn btn-link btn-block text-left collapsed" type="button"
											data-toggle="collapse" data-target="#collapseThree" aria-expanded="false"
											aria-controls="collapseThree">
											<i class="fa-solid fa-circle-question"></i> How to claim my referral
											rewards?
										</button>
									</h2>
								</div>
								<div id="collapseThree" class="collapse" aria-labelledby="headingThree"
									data-parent="#accordionExample">
									<div class="card-body text-left">
										Click the "Claim" button in the referral list on the referral page to get
										rewards, and new users who sign up through the referral link can get rewards in
										the "Collect more myShells" list on myShells page after accumulating 100
										myShells.
									</div>
								</div>
							</div>
							<!--FAQ #4-->
							<div class="card">
								<div class="card-header" id="headingFour">
									<h2 class="mb-0">
										<button class="btn btn-link btn-block text-left collapsed" type="button"
											data-toggle="collapse" data-target="#collapseFour" aria-expanded="false"
											aria-controls="collapseFour">
											<i class="fa-solid fa-circle-question"></i> Is there a limit to the amount
											of rewards I can earn?
										</button>
									</h2>
								</div>
								<div id="collapseFour" class="collapse" aria-labelledby="headingFour"
									data-parent="#accordionExample">
									<div class="card-body text-left ">
										<span>For referrer, you can claim a maximum of 20 referral rewards for the first
											10
											users who are invited to sign up that day. New users after the 10th place
											will
											also get 20 myShells, but referrer will not get a share.</span>
										<br>
										<span>For example: if 15 new users sign up through Jack's referral link today
											and
											collect 100 myShells, all new users will get 20 myShells, but Jack will only
											get
											10*20=200 myShells.</span>
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
						sectionsColor: ['white', 'red', 'orange', 'green', 'blue']
					});


				</script>

			</body>

			</html>