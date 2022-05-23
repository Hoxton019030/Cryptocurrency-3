<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
				<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

				<!DOCTYPE html>
				<html lang="en">

				<head>
					<meta charset="UTF-8">

					<!--響應式網站-->
					<meta name="viewport" content="width=device-width, initial-scale=1.0">

					<!-- Bootstrap CSS -->
					<link rel="stylesheet" href="${contextRoot}/css/bootstrap.min.css">

					<!-- 這裡放title Logo -->
					<link rel="icon" href="${contextRoot}/images/NavBarImg/icon.jpg" type="image/x-icon">

					<!-- FONT AWESOME: Place your kit's code here -->
					<script src="https://kit.fontawesome.com/0ef2a35b44.js" crossorigin="anonymous"></script>

					<!--Only for this login modal's CSS 連結-->
					<link rel="stylesheet" href="${contextRoot}/css/loginStyle.css">
					<style>
						body {
							background-image: url("tempbackground.png");
							min-height: 100%;
							background-attachment: fixed;
							background-repeat: no-repeat;
							background-position: center;
							background-size: contain;
						}
					</style>

					<!--reCAPTCHA v2 代碼-->
					<script src="https://www.google.com/recaptcha/api.js"></script>
				</head>

				<body>
					<!-- Start of the Navbar-->
					<nav class="navbar navbar-expand-lg navbar-light bg-light">
						<a class="navbar-brand" href="${contextRoot}"><img
								src="${contextRoot}/images/NavBarImg/CoinShell.png" style="width: 150px;"
								alt="logo"></a>
						<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
							aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse" id="navbarNav">
							<ul class="navbar-nav">
								<li class="nav-item active"><a class="nav-link" href="#">About
										us<span class="sr-only">(current)</span>
									</a></li>
								<li class="nav-item"><a class="nav-link" href="#">BeachTown</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#">Portfolio</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#">Learn</a></li>
								<li class="nav-item"><a class="nav-link" href="#">Shell
										Shop</a></li>
							</ul>
						</div>
						<!-- 使用者設定 Dropdowns -->
						<div class="btn-group">
							<button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown"
								aria-expanded="false">
								${Members.customizedUserName}'s Settings
							</button>
							<div class="dropdown-menu dropdown-menu-right">
								<button class="dropdown-item" type="button">Watchlist</button>
								<button class="dropdown-item" type="button">Portfolio</button>
								<button class="dropdown-item" type="button">Referral Program</button>
								<button class="dropdown-item" type="button">Account Settings</button>
								<button class="dropdown-item" type="button">Log out</button>
							</div>
						</div>

						<!--Search navbar-->
						<form class="form-inline my-1 my-lg-0">
							<div class="input-group">
								<input class="form-control pl-2 p-0" type="search" placeholder="Search"
									aria-label="Search">
								<div class="input-group-append">
									<button class="btn btn-secondary input-group-append" type="submit">
										<i class="fa-solid fa-magnifying-glass"></i>
									</button>
								</div>
							</div>
						</form>
					</nav>
					<!-- End of the Navbar -->


					<!-- jQuery + Bootstrap Bundle with Popper | Bootstrap 導入程式 JS -->
					<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
						integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
						crossorigin="anonymous"></script>
					<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
						integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
						crossorigin="anonymous"></script>

					<script>
					</script>

				</body>

				</html>