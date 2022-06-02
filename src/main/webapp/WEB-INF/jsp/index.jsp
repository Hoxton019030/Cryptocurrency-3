<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
            <c:set var="contextRoot" value="${pageContext.request.contextPath}" />
            <jsp:include page="NavBar/CoinShellNavBar.jsp" />

            <head>
            <style type="text/css">
			body{
				padding-top: 82px;
				}
			</style>
			
                <meta charset="UTF-8">
                <title>CoinShell</title>
                <link rel="Shortcut Icon" type="image/x-icon" href="https://cdn-icons-png.flaticon.com/512/1490/1490853.png" />
                <link rel="stylesheet" href="/resources/demos/style.css">
<!--                 index頁面css方法包 -->
                <link rel="stylesheet" type="text/css" href="${contextRoot}/css/indexCss.css">
<!--                 星星圖示導包 -->
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
                <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
                <style type="text/css">
                    body {
                        padding-top: 82px;
                    }
                </style>
            </head>

            <body>
                <div class="main">
                    <div class="top-web-space">
                        <p>${loginError}</p>
                    </div>


                </div>

                <div class=" news">
                    <div class="banner">
                        <div class="news-banner-font">&emsp;Coin News</div>
                    </div>
                    <div class="news-image">
                        <img src="https://picsum.photos/300/180/?random=10"> <img src="https://picsum.photos/300/180/?random=11"> <img src="https://picsum.photos/300/180/?random=12"> <img src="https://picsum.photos/300/180/?random=13">
                    </div>
                </div>

                <div class="top-coin">
                    <div class="banner">
                        <div class="news-banner-font">&emsp;Top Coin</div>
                    </div>
                    <div id="tabs">
                        <ul>
                            <li><a href="#overview" id="page-overview">TOP 100</a></li>
                            <li><a href="#focus" id="page-historical">Follow List</a></li>
                        </ul>
                        <div id="overview">

                            <input id="coinName" type="text" placeholder="Search" /> <input type="button" name="submit" value="查詢" id="search" />

                            <table class="table table-hover" id="top">
                                <thead>
                                    <tr>
                                        <th scope="col">Top</th>
                                        <th scope="col">#</th>
                                        <th scope="col">setting</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Currency</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">1h%</th>
                                        <th scope="col">24h%</th>
                                        <th scope="col">7d%</th>
                                        <th scope="col">30d%</th>
                                        <th scope="col">Volume24h</th>
                                        <th scope="col">Market Cap</th>
                                        <th scope="col">Line Chart</th>
                                    </tr>
                                </thead>
                                <tbody class="cointable">
                                </tbody>
                            </table>
                        </div>
                        <div id="focus">
                            <table class="table table-hover" id="watch">
                                <thead>
                                    <tr>
                                        <th scope="col">Top</th>
                                        <th scope="col">#</th>
                                        <th scope="col">setting</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Currency</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">1h%</th>
                                        <th scope="col">24h%</th>
                                        <th scope="col">7d%</th>
                                        <th scope="col">30d%</th>
                                        <th scope="col">Volume24h</th>
                                        <th scope="col">Line Chart</th>
                                    </tr>
                                </thead>
                                <tbody class="cointable" id="followTbody">
								</tbody>
                            </table>
                        </div>
                    </div>


                </div>
<!-- Button trigger modal -->
<button type="button" style="display:none" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
  Launch demo modal
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">CoinName:${coin.Name}</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <h6>current price:${coin.price}</h6>
      	<h6><input type="radio" name="h" id="heigh" value="H" checked/>higher &nbsp;<input type="radio" id="low" value="L" name="h"/>lower</h6>
        <h5>USD<input id="setPrice" type="number" placeholder="Set Price"></h5>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary" data-dismiss="modal" id="save">Save</button>
      </div>
    </div>
  </div>
</div>

    <script src="${contextRoot}/javascripts/indexJs.js"></script>
	<script>
		var memId = '${login.id}';
		console.log("memId=" + memId);
	
		$(function() {
	   		upCoin(memId);
		})
		var timeoutID;
		function setUpCoin(){
		timeoutID  = window.setTimeout(function(){upCoin(memId)},30000);
		}
		
		$("#page-overview").click(function() {
			upCoin();
		});
		
		$("#page-historical").click(function() {
			followList();
		});
		
		$("#search").click(function() {
			loadCoinByName(memId);
		});
		
		function watch(obj) {
			if ('${login == null }' == 'true') {
				$('#loginModal').modal("show")
			} else {
				var coinId = $(obj).val();
				var checked = $(obj).prop('checked');

				if (checked == true) {
					var param = {
						"memId" : memId,
						"coinId" : coinId
					}
					console.log("memId==" + memId + "," + "coinId==" + coinId);
					$.ajax({
						url : 'http://localhost:8080/coinshell/insertWatch',
						contentType : 'application/json; charset=UTF-8',
						dataType : 'json',
						method : 'post',
						data : JSON.stringify(param),
						success : function(result) {
							console.log("result====" + result.status)
							console.log("成功");
						},
						error : function(err) {
							console.log("result====" + err)
							console.log("失敗");
						}
					})
				} else {
					var param = {
						"memId" : memId,
						"coinId" : coinId
					}
					console.log("delete:" + memId + "," + "delete:" + coinId);
					$.ajax({
						url : 'http://localhost:8080/coinshell/deleteWatch/'+ coinId,
						contentType : 'application/json; charset=UTF-8',
						dataType : 'json',
						method : 'delete',
						data : JSON.stringify(param),
						success : function(result) {
							console.log("result====" + result.status)
							console.log("成功");
							if (result.status == '200') {
								$('#followTbody').find('[id="' + coinId + '"]').closest('tr').remove();
								$('#topTbody').find('[id="' + coinId + '"]').prop('checked', false);
							}
						},
						error : function(err) {
							console.log("result====" + err)
							console.log("失敗");

						}
					})
				}
			}
		}
		
		
		
		function set(obj) {
			var checked = $(obj).prop('checked');
	        var coinId   = $(obj).val();
	        
	        
		    	if ('${login == null }' == 'true') {
		            $('#loginModal').modal("show")
		        } ;
		        
		    	if(checked==true && '${login == null }' != 'true') {
		            $('#exampleModal').modal("show")
		        };
		        
		    	$("#save").off("click").on("click",function() {
		    		var setPrice = document.getElementById("setPrice").value;
		    		var type = $("[name='h']:checked").val();
		    		var param = {
		                    "memId" : memId,
		                    "coinId" : coinId,
		                    "setPrice": setPrice,
		                    "type":type
		               			 }
	            	console.log("按下了");
	                console.log("memId==" + memId + "," + "coinId==" + coinId + "," + "setPrice==" + setPrice + "," + "type==" +type);
	                if(setPrice=""){
	                	$('#topTbody,#followTbody').find('[id="' + coinId + '"]').prop('checked', false);
	                }
	                else{
	                $.ajax({
	                    url : 'http://localhost:8080/coinshell/coin/getSetCoin',
	                    contentType : 'application/json; charset=UTF-8',
	                    dataType : 'json',
	                    method : 'post',
	                    data : JSON.stringify(param),
	                    success : function(result) {
	                        console.log("result====" + result.status)
	                        console.log("成功");
	                    },
	                    error : function(err) {
	                        console.log("result====" + err)
	                        console.log("失敗");
	                    }
	                })
	                }
	             })
		    	
	            if(checked == false) {
	            	
	            	var setPrice =document.getElementById("setPrice").value;
		    		var param    = {
		                    "memId" : memId,
		                    "coinId" : coinId,
		                    "setPrice": setPrice
		               			 }
		    		
	                console.log("delete:" + memId + "," + "delete:" + coinId+ "," + "delete:" + setPrice);
	                $.ajax({
	                    url : 'http://localhost:8080/coinshell/coin/deletegetSetCoin/'+ coinId,
	                    contentType : 'application/json; charset=UTF-8',
	                    dataType : 'json',
	                    method : 'delete',
	                    data : JSON.stringify(param),
	                    success : function(result) {
	                        console.log("result====" + result.status)
	                        console.log("成功");
	                        if (result.status == '200') {
	                            $('#topTbody,#followTbody').find('[id="' + coinId + '"]').prop('checked', false);
	                        }
	                    },
	                    error : function(err) {
	                        console.log("result====" + err)
	                        console.log("失敗");

	                    }
	                })
	            }
	        }
		
		
		
	</script>

            </body>

            </html>
