<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <jsp:include page="NavBar/CoinShellNavBar.jsp" />
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>貨幣資訊頁面</title>
            <c:set var="contextRoot" value="${pageContext.request.contextPath}"></c:set>
            <link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
            <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
            <link rel="stylesheet" href="/resources/demos/style.css">
            <link href="stylesheets/jquery-ui/base/jquery-ui.min.css" rel="stylesheet" />
            <link href="stylesheets/myStyleSheet.css" rel="stylesheet" />
            <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
            <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
            <script>
                $(function() {
                    $("#tabs").tabs();
                });
            </script>
        </head>

        <body>
            <div id="tabs">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="text-nowrap">
                                <div class="icon d-inline-block">
                                    <img src="./images/currencyIcon/${currencyInformation.symbolOfCryptocurrency}.png" alt="找不到圖片" width="32px" height="32px">
                                </div>
                                <div class="text-nowrap d-inline-block">${currencyInformation.symbolOfCryptocurrency}</div>

                                <button type="button" class="btn btn-info d-inline-block">★</button>
                            </div>
                            <div>
                                <a href="#" class="badge badge-secondary">Rank#${currencyInformation.id%100}</a>
                            </div>


                        </div>
                        <div class="col-sm-4">
                            <div class="text-nowrap ">
                                <div class="d-inline-block currentlyPrice">
                                    當前價位:${currencyInformation.twdPriceOfCryptocurrency}
                                </div>
                                <div class="d-inline-block badge badge-pill badge-danger">
                                    漲跌幅:${currencyInformation.percentChange24h}
                                </div>
                                <div class="lower_highest_price">
                                    <div class="lower_Price d-inline-block ">
                                        <span> Low:</span>
                                        <span>(最低價格)</span>
                                        <span> High:</span>
                                        <span>(最高價格)</span>
                                        <div class="dropdown d-inline-block">
                                            <button class="btn btn-secondary dropdown-toggle btn-sm" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                          24h
                                        </button>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                <a class="dropdown-item" href="#">24h</a>
                                                <a class="dropdown-item" href="#">7d</a>
                                                <a class="dropdown-item" href="#">30d</a>
                                            </div>
                                        </div>
                                    </div>

                                </div>


                            </div>

                        </div>

                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-sm-4">
                            1/3佔位
                        </div>
                        <div class="col-sm-8">
                            <div class="container">
                                <div class="row row-cols-4">
                                    <div class="col marketcap">
                                        <span class="badge badge-primary">MaxSupply</span>
                                        <div class="market_cap_price">${currencyInformation.maxSupply}</div>
                                        <div class="market_cap_fluctuation "><span class="badge badge-pill badge-danger">(漲跌幅)</span></div>
                                    </div>
                                    <div class="col fullydilutedmarketcap">
                                        <span class="badge badge-primary">Fully Diluted Market Cap</span>
                                        <div class="Fully_DilutedMarket Cap_price">$(45,002,502)</div>
                                        <div class="market_cap_fluctuation "><span class="badge badge-pill badge-danger">(漲跌幅)</span>
                                        </div>
                                    </div>

                                    <div class="col volume">
                                        <span class="badge badge-primary">Volume</span>
                                        <div class="Volume">${currencyInformation.volume24hUsd}</div>
                                        <div class=Volume_fluctuation><span class="badge badge-pill badge-danger ">(漲跌幅)</span>
                                        </div>
                                    </div>
                                    <div class="col circulatingsupply ">
                                        <span class="badge badge-primary ">Circulating Supply</span>
                                        <div class="Circulating_Supply_price ">${currencyInformation.circulatingSupply}</div>
                                        <div class="Circulating_MaxSupply_Title ">
                                            <div class="title d-inline-block small text-left "> MaxSupply</div>
                                            <div class="maxsupply d-inline-block small ">${currencyInformation.maxSupply}</div>
                                        </div>
                                        <div class="Circulating_TotalSupply_Title ">
                                            <div class="title d-inline-block small text-left "> TotalSupply</div>
                                            <div class="maxsupply d-inline-block small "> ${currencyInformation.totalSupply}</div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
                <hr>
                <div id="tabs">
                    <ul>
                        <li>
                            <a href="#overview" id="page-overview">總覽</a> </li>
                        <li>
                            <a href="#historical" id="page-historical">歷史資訊</a> </li>
                        <li>
                            <a href="#news" id="page-news">新聞</a> </li>

                    </ul>

                    <div id="overview">
                        <p>
                            <div>
                                <canvas id="canvas" width="500" height="100">

                                </canvas>


                            </div>
                        </p>
                    </div>
                    <div id="historical">
                        <p>歷史資料</p>
                        <!-- 這邊抓一個月的資料 -->
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">日期</th>
                                    <th scope="col">開盤</th>
                                    <th scope="col">最高點</th>
                                    <th scope="col">最低點</th>
                                    <th scope="col">收盤價</th>
                                    <th scope="col">24小時交易量</th>
                                    <th scope="col">整體市值</th>
                                </tr>
                                <tbody id="historical-row">
                                    <tr>
                                        <th scope="col"> 2022/5/13</th>
                                        <th scope="col">100</th>
                                        <th scope="col">150</th>
                                        <th scope="col">90</th>
                                        <th scope="col">103</th>
                                        <th scope="col">122</th>
                                        <th scope="col">12332</th>
                                    </tr>
                                </tbody>

                            </thead>


                        </table>
                    </div>
                    <div id="news">

                    </div>



                    <script>
                        var getUrlString = location.href;
                        var url = new URL(getUrlString);
                        var currencyName = url.searchParams.get('currencyName');
                        var day = url.searchParams.get('currentlyDay');


                        $("#page-news").click(function() {
                            $("#news").empty();
                            fetch("http://localhost:8080/coinshell/news/get?currencyName=" + currencyName).then(function(response) {
                                return response.json();
                            }).then(function(array) {
                                $.each(array, function(index, value) {
                                    $("#news").append(`<div class="card mb-3" style="width: 150;">
                            <div class="row no-gutters">
                                <div class="col-md-4">
                                    <img width="300" height="200" src="` + value.imageOfNews + `">
                                </div>
                                <div class="col-md-8">
                                    <div class="new-card-body">
                                        <h5 class="card-title">` + value.title + `</h5>
                                        <p class="card-text">` + value.contentOfNews + `</p>
                                        <p class="card-text"><small class="text-muted">上傳日期:` + value.date + `</small></p>
                                    </div>

                                </div>
                            </div>
                        </div>`)
                                })
                            })
                        })


                        $("#page-historical").click(function() {
                            $("#historical-row").empty()
                            fetch("http://localhost:8080/coinshell/historical/get?currencyName=" + currencyName + "&day=" + day).then(function(response) {
                                return response.json();
                            }).then(function(array) {
                                $.each(array, function(index, value) {
                                    $("#historical-row").append(`<tr>
                                        <th scope="col"> ` + day + `</th>
                                        <th scope="col">` + value.TheFristUsdDate + `</th>
                                        <th scope="col">` + value.TheHighestUsdPricePerUnit + `</th>
                                        <th scope="col">` + value.TheLowerUsdPricePerUnit + `</th>
                                        <th scope="col">` + value.TheLastUsdDate + `</th>
                                        <th scope="col">` + value.Usd24hVolume + `</th>
                                        <th scope="col">` + value.UsdMarkCap + `</th>
                                    </tr>3`);
                                })
                            })
                        })
                        var xmlHttp = new XMLHttpRequest();
                        var url = "http://localhost:8080/coinshell/historical/get30days?currencyName=" + currencyName
                        xmlHttp.open("GET", url, true);
                        xmlHttp.send()
                        xmlHttp.onreadystatechange = function() {
                            if (this.readyState == 4 && this.status == 200) {
                                var data = JSON.parse(this.responseText);
                                var days = data.map(function(elem) {
                                    return elem.informationDate
                                        .substr(0, 14).replace('T', '').replace('-', '').replace('-', '').replace(':', '')
                                });
                                var price = data.map(function(elem) {
                                    return elem.USD_Price_of_Cryptocurrency;
                                })
                                console.log(days)
                                console.log(price)
                                    // document.write(days)
                                    // document.write(price)
                                const ctx = document.getElementById('canvas').getContext('2d');
                                const myChart = new Chart(ctx, {
                                    type: 'line',
                                    data: {
                                        labels: days,
                                        datasets: [{
                                            label: 'US',
                                            data: price,
                                            backgroundColor: [
                                                'transparent'
                                            ],
                                            borderColor: 'black',
                                            borderWidth: 4,
                                            lineTension: 0

                                        }]
                                    },
                                    options: {
                                        element: {
                                            line: {
                                                lineTension: 0
                                            }
                                        },
                                        scales: {
                                            xAxes: [{
                                                type: 'time',
                                                time: {
                                                    unit: 'hour'
                                                }
                                            }],
                                            y: {
                                                beginAtZero: true
                                            }


                                        }
                                    }
                                });
                            }
                        }
                    </script>
                    <!-- <script>
                        function updateCoinData() {
                            $(function() {
                                $(".currentlyPrice").empty()
                                fetch("")
                            })
                        }
                    </script> -->

                </div>
                <div id="test">

                </div>


        </body>

        </html>