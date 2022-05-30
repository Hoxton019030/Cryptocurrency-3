<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
			<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
			<jsp:include page="../NavBar/CoinShellNavBar.jsp" />

			<head>
				<title>Account Settings | CoinShell</title>
				<style type="text/css">
					body {
						padding-top: 82px;
					}

					.label {
						margin-top: 20px;
					}

					label img {
						size: 100px;
						border-radius: 50%;
					}
				</style>
			</head>

			<body>
				<div class="jumbotron jumbotron-fluid">
					<div class="container">
						<div class="lead" style="background-color:#fff; border-radius:30px; padding: 25px;">
							<h3 class="display-5">Account Settings</h3>

							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text font-weight-bold"
										id="inputGroup-sizing-default">Avatar</span>
								</div>
								<div id="user-img">
									<img src="${login.customizedUserAvatar }"
										style="border-radius: 50%; height: 100px; ">
								</div>
								<button class="btn btn-outline-primary" type="button" data-toggle="modal"
									data-target="#chooseAvatar">Edit Avatar</button>
								<script>
									var memId = '${login.id}'
									var url = "http://localhost:8080/coinshell/selectMemberAvatar?id="

							$(function(){
								$("#user-img").empty()
								var url = "http://localhost:8080/coinshell/selectMemberAvatar?id=";
								var id =`${login.id}`;
								fetch(url+id).then(function(response){
                                return response.json()
								}).then(function(jsonObject){

                                 $("#user-img").append(`<img src="`+jsonObject[0].userAvatarBase64+`"
										style="border-radius: 50%; height: 100px; ">`);
								})

							
							})

									
							


								</script>
							</div>

							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-default">User Referral
										ID</span>
								</div>
								<input type="text" disabled value="${ login.id }" class="form-control"
									aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
							</div>

							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text font-weight-bold"
										id="inputGroup-sizing-default">UserName</span>
								</div>
								<input type="text" value="${ login.customizedUserName }" class="form-control"
									aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
								<button class="btn btn-outline-primary" type="button">Change UserName</button>
							</div>

							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-default">Email Address</span>
								</div>
								<input type="email" disabled value="${login.eMail}" class="form-control"
									aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
							</div>

							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-default">MyShell Balance</span>
								</div>
								<input type="text" disabled value="${login.myShell}" class="form-control"
									aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
							</div>

							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-default">Join Time</span>
								</div>
								<input type="text" disabled value="${login.joinTime}" class="form-control"
									aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
							</div>
							<div class="card">
								<h5 class="card-header font-weight-normal">Password</h5>
								<div class="card-body">
									<p class="card-text">Set a unique password to protect your personal account.</p>
									<a type="button" class="btn btn-outline-primary" data-toggle="modal"
										data-target="#changePwd">Change password</a>
								</div>
							</div>

						</div>
					</div>
				</div>
				</div>


				<!-- 選擇 avatar 的modal -->
				<div class="modal fade text-left" id="chooseAvatar" tabindex="-1">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Your Avatar</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>

							<form action="selectAvatar" method="post">
								<div class="modal-body">
									<p>Select an avatar for your profile. You can redeem more avatars from the Rewards
										page.
									</p>
									<input type="text" value="${login.id}" name="id">
									<input type="radio" name="radio-emotion" id="sad" class="input-hidden" value="1" />
									<label for="sad">
										<img src="${contextRoot}/images/NavBarImg/bubbleAvatar.png" alt="I'm sad" />
									</label>

									<input type="radio" name="radio-emotion" id="happy1" class="input-hidden"
										value="2" />
									<label for="happy1">
										<img src="${contextRoot}/images/NavBarImg/hulaAvatar.png" alt="I'm happy1" />
									</label>

									<input type="radio" name="radio-emotion" id="happy2" class="input-hidden"
										value="3" />
									<label for="happy2">
										<img src="${contextRoot}/images/NavBarImg/magnetaAvatar.png" alt="I'm happy2" />
									</label>

									<input type="radio" name="radio-emotion" id="happy3" class="input-hidden"
										value="4" />
									<label for="happy3">
										<img src="${contextRoot}/images/NavBarImg/purAvatar.png" alt="I'm happy3" />
									</label>

									<input type="radio" name="radio-emotion" id="happy4" class="input-hidden"
										value="5" />
									<label for="happy4">
										<img src="${contextRoot}/images/NavBarImg/defaultAvatar.png" alt="I'm happy4" />
									</label>
							</form>



							<p style="margin-top: 30px;">Unlock more cool avatars with myShells. <a href="#">Go to
									Rewards page →</a></p>
							<button type="submit" class="btn btn-info btn-block mt-4">Select</button>
						</div>

					</div>
				</div>
				</div>
				</div>

				<!-- 變更密碼的 modal -->
				<div class="modal fade text-left" id="changePwd" tabindex="-1">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Reset password</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<p>You will receive an email with instructions on how to reset your password in a few
									minutes. You can also set a new password if you've never set one before.</p>
								<h6 style="margin-top: 30px;">Email Address</h6>
								<form action="#sendpswmail" method="#doOrPost"></form>
								<!--這裡要加上 javax.mail 寄送密碼驗證-->
								<input type="email" value="${login.eMail}" class="form-control"
									aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
								<button class="btn btn-info btn-block mt-1" type="button">Send Instructions</button>
							</div>
							</form>
						</div>
					</div>
				</div>
				</div>



				<!-- jQuery + Bootstrap Bundle with Popper | Bootstrap 導入程式 JS -->
				<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
					integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
					crossorigin="anonymous"></script>
				<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
					integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
					crossorigin="anonymous"></script>


			</body>