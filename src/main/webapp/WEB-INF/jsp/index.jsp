<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
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
<!--                 <link rel="stylesheet" href="/resources/demos/style.css"> -->
<!--                 index頁面css方法包 -->
                <link rel="stylesheet" type="text/css" href="${contextRoot}/css/indexCss.css">
<!--                 星星圖示導包 -->
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<!--                 新聞輪播 -->
				<link rel="stylesheet" href="${contextRoot}/css/slick.css" >
				<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css">
<!--                 應該是走勢圖 -->
                <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
                

            <body>
<div>
<p />
  <h2 class="news">&emsp;Coin news</h2>
  <br />
  <div class="slider responsive">
    <div id="n1">
      <img class="newsimg" src="https://picsum.photos/400/200/?random=2" alt="">
    </div>
    <div id="n2">
      <img class="newsimg" src="https://picsum.photos/400/200/?random=1" alt="">
    </div>
    <div id="n3">
      <img class="newsimg" src="https://picsum.photos/400/200/?random=1" alt="">
    </div>
    <div id="n4">
      <img class="newsimg" src="https://picsum.photos/400/200/?random=1" alt="">
    </div >
    <div id="n5">
      <img class="newsimg" src="https://picsum.photos/200/200/?random=1" alt="">
    </div>
    <div id="n6">
      <img class="newsimg" src="https://picsum.photos/200/200/?random=1" alt="">
    </div>
    <div id="n7">
      <img class="newsimg" src="https://picsum.photos/200/200/?random=1" alt="">
    </div>
    <div id="n8">
      <img class="newsimg" src="https://picsum.photos/200/200/?random=3" alt="">
    </div>
  </div>
</div>

 <script type="text/javascript" src="https://s3.tradingview.com/external-embedding/embed-widget-ticker-tape.js" async>
  {
  "symbols": [
    {
      "description": "",
      "proName": "BINANCEUS:BTCUSD"
    },
    {
      "description": "",
      "proName": "BINANCEUS:ETHUSD"
    },
    {
      "description": "",
      "proName": "BINANCEUS:USDTUSD"
    },
    {
      "description": "",
      "proName": "BINANCEUS:USDCUSD"
    },
    {
      "description": "",
      "proName": "BINANCEUS:BNBUSD"
    },
    {
      "description": "",
      "proName": "FTX:XRPUSD"
    },
    {
      "description": "",
      "proName": "BINANCEUS:BUSDUSD"
    },
    {
      "description": "",
      "proName": "BINANCEUS:ADAUSD"
    },
    {
      "description": "",
      "proName": "BINANCEUS:SOLUSD"
    },
    {
      "description": "",
      "proName": "BINANCEUS:DOGEUSD"
    }
  ],
  "showSymbolLogo": true,
  "colorTheme": "light",
  "isTransparent": false,
  "displayMode": "adaptive",
  "locale": "zh_TW"
}
  </script>
<br />

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

						<form class="form-inline my-1 my-lg-0">
							<div class="input-group">
								<input id="coinName" class="form-control pl-2 p-0" type="text" aria-label="Search">
								<div class="input-group-append">
									<input type="button" name="submit" value="Search" id="search" class="btn btn-outline-success my-2 my-sm-0" />
                                </div>
                            </div>
                        </form>
                        
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
        <h5 class="modal-title" id="exampleModalLabel">coinName:</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <h6 id="coinPrice">current price:</h6>
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
	   		setNews();
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
		    		
	    			var coinId   = $(obj).val();
// 	    			var paramId    = {
// 	                        "coinId" : coinId,
// 	                   			 }
	    			$.ajax({
	                    url : 'http://localhost:8080/coinshell/coin/getId?coinId=' + coinId,
	                    contentType : 'application/json; charset=UTF-8',
	                    dataType : 'json',
	                    method : 'get',
// 	                    data : JSON.stringify(paramId),
	                    success : function(result) {
	                        console.log(result);
	                        console.log("成功");
	                        $('#exampleModalLabel,#coinPrice').html("");
	                    	$.each(result, function(index, value) {
	                        	console.log(value.name)
	                        	console.log(value.price)
	                        	$('#exampleModalLabel').append(value.name);
	                        	$('#coinPrice').append("current price:" + value.price.toFixed(2));
	                    	})
	                    },
	                    error : function(err) {
	                        console.log("result====" + err)
	                        console.log("失敗");
	                    }
	                })
	            $('#exampleModal').modal("show")
	    		  }
		        
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
		
		function setNews() {
// 			從0~19數字中取8個不重複的值
			var status = [];
		    var n = 0;
		    for(i=0;i<=7;i++){   
		        n = Math.floor(Math.random()*20);  
		        if(status.indexOf(n)>0){     
		        i-=1;
		        continue;
		        }
		        else{
		        status.push(n);
		        };
		    };
		    var num1 = status[0];
		    var num2 = status[1];
		    var num3 = status[2];
		    var num4 = status[3];
		    var num5 = status[4];
		    var num6 = status[5];
		    var num7 = status[6];
		    var num8 = status[7];
			console.log("亂數值為==" + status)
				$.ajax({
			        url: "http://localhost:8080/coinshell/news/getAll",
			        contentType: 'application/json; charset=UTF-8',
			        dataType: 'json',
			        method: 'get',
			        success: function(result) {
			            console.log(result)
			            $.each(result, function(index, value) {
// 			            	console.log("id==" + result[num1].id + ",url==" +result[num1].url)
			            $('#n1').html(`<a href="#" onclick="window.open('` + result[num1].url +`')"><img class="newsimg" src="` + result[num1].imgUrl + `" alt=""></a>`);
			            $('#n2').html(`<a href="#" onclick="window.open('` + result[num2].url +`')"><img class="newsimg" src="` + result[num2].imgUrl + `" alt=""></a>`);
			            $('#n3').html(`<a href="#" onclick="window.open('` + result[num3].url +`')"><img class="newsimg" src="` + result[num3].imgUrl + `" alt=""></a>`);
			            $('#n4').html(`<a href="#" onclick="window.open('` + result[num4].url +`')"><img class="newsimg" src="` + result[num4].imgUrl + `" alt=""></a>`);
			            $('#n5').html(`<a href="#" onclick="window.open('` + result[num5].url +`')"><img class="newsimg" src="` + result[num5].imgUrl + `" alt=""></a>`);
			            $('#n6').html(`<a href="#" onclick="window.open('` + result[num6].url +`')"><img class="newsimg" src="` + result[num6].imgUrl + `" alt=""></a>`);
			            $('#n7').html(`<a href="#" onclick="window.open('` + result[num7].url +`')"><img class="newsimg" src="` + result[num7].imgUrl + `" alt=""></a>`);
			            $('#n8').html(`<a href="#" onclick="window.open('` + result[num8].url +`')"><img class="newsimg" src="` + result[num8].imgUrl + `" alt=""></a>`);
			        	})
                    },
                    error : function(err) {
                        console.log("result====" + err)
                        console.log("失敗");
                    }
                })
		}
		
	</script>
<!-- 	新聞輪播圖 要放在最下面才能渲染成功 -->
<script src="${contextRoot}/javascripts/slick.js" ></script>
<script src="${contextRoot}/javascripts/news.js"></script>
</body>

            </html>
