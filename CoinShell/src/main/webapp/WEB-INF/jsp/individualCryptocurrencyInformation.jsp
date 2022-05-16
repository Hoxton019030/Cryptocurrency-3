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
                                <div class="d-inline-block">
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
                        <p>這裡放總覽</p>
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
                                <tbody>
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
                        $("#page-news").click(function() {
                            $("#news").empty();
                            fetch("http://localhost:8080/myapp/news/get?currencyName=BTC", {
                                method: "GET"
                            }).then(function(response) {
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
                            return false;
                        })


                        // fetch("http://localhost:8080/myapp/news/get?currencyName=BTC").then(function(response) {
                        //     return response.json();
                        // }).then(function(myJson) {
                        //     console.log(myJson);
                        // })
                    </script>

                </div>


        </body>

        </html>