<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="../NavBar/CoinShellNavBar.jsp" />

			<head>
				<meta charset="UTF-8">
				<title>About Us | CoinShell</title>
				<link rel="stylesheet" href="${contextRoot}/css/aboutsidebar.css">
			</head>

			<body>

				<!-- side bar 側邊欄位 -->
				<div class="sidebar">
					<a href="${contextRoot}/aboutUs/intro">About Our Team</a> <a
						href="${contextRoot}/account/cookie">Cookie Policy</a> <a
						href="${contextRoot}/account/privacy">Privacy Policy</a> <a href="#">Admin
						Log In</a>
				</div>

				<!--Page content-->
				<div class="container" style="margin-top: 30px; background-color: #fff; border-radius: 30px;">
					<div class="col-9">
						<h3>About Coinshell</h3>
						<div>Coinshell is a price-tracking website for cryptoassets in
							the rapidly growing cryptocurrency space. Its mission is to make
							crypto discoverable and efficient globally by empowering retail
							users with unbiased, high quality and accurate information for
							drawing their own informed conclusions.</div>
						<h5>Our team:</h5>
						<ul>
							<li>Chief executive officer: Pietersite Crystal</li>
							<li>Chief technology officer: Huginn Hoxton</li>
							<li>Chief information officer: Fenrir Feeder</li>
							<li>Chief financial officer: Bjarki Bear</li>
							<li>Chief security officer: Sváfnir Celine</li>
						</ul>
						<div>
							<canvas id="chart"></canvas>
						</div>
					</div>
				</div>

				<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
				<script>

					// SetUp block
					const DATA_COUNT = 5;
					const NUMBER_CFG = { count: DATA_COUNT, min: 0, max: 100 };

					const data = {
						labels: ['Red', 'Orange', 'Yellow', 'Green', 'Blue'],
						datasets: [
							{
								label: 'Dataset 1',
								data: Utils.numbers(NUMBER_CFG),
								backgroundColor: Object.values(Utils.CHART_COLORS),
							}
						]
					};

					// Config block
					const config = {
						type: 'doughnut',
						data: data,
						options: {
							responsive: true,
							plugins: {
								legend: {
									position: 'top',
								},
								title: {
									display: true,
									text: 'Chart.js Doughnut Chart'
								}
							}
						},
					};

					// Render / Action
					const actions = [
						{
							name: 'Randomize',
							handler(chart) {
								chart.data.datasets.forEach(dataset => {
									dataset.data = Utils.numbers({ count: chart.data.labels.length, min: 0, max: 100 });
								});
								chart.update();
							}
						},
						{
							name: 'Add Dataset',
							handler(chart) {
								const data = chart.data;
								const newDataset = {
									label: 'Dataset ' + (data.datasets.length + 1),
									backgroundColor: [],
									data: [],
								};

								for (let i = 0; i < data.labels.length; i++) {
									newDataset.data.push(Utils.numbers({ count: 1, min: 0, max: 100 }));

									const colorIndex = i % Object.keys(Utils.CHART_COLORS).length;
									newDataset.backgroundColor.push(Object.values(Utils.CHART_COLORS)[colorIndex]);
								}

								chart.data.datasets.push(newDataset);
								chart.update();
							}
						},
						{
							name: 'Add Data',
							handler(chart) {
								const data = chart.data;
								if (data.datasets.length > 0) {
									data.labels.push('data #' + (data.labels.length + 1));

									for (var index = 0; index < data.datasets.length; ++index) {
										data.datasets[index].data.push(Utils.rand(0, 100));
									}

									chart.update();
								}
							}
						},
						{
							name: 'Remove Dataset',
							handler(chart) {
								chart.data.datasets.pop();
								chart.update();
							}
						},
						{
							name: 'Remove Data',
							handler(chart) {
								chart.data.labels.splice(-1, 1); // remove the label first

								chart.data.datasets.forEach(dataset => {
									dataset.data.pop();
								});

								chart.update();
							}
						}
					];
				</script>

			</body>