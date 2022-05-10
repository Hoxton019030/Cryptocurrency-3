<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>貨幣資訊頁面</title>
            <c:set var="contextRoot" value="${pageContext.request.contextPath}"></c:set>
            <link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
        </head>

        <body>
            <div class="container">
                <div class="row">
                    <div class="col-sm-4">
                        <div class="text-nowrap">
                            <div class="icon d-inline-block">
                                <img src="./images/${currencyInformation.symbolOfCryptocurrency}.png" alt="找不到圖片" width="32px" height="32px">
                            </div>
                            <div class="text-nowrap d-inline-block">${currencyInformation.symbolOfCryptocurrency}</div>

                            <button type="button" class="btn btn-info d-inline-block">★</button>
                        </div>
                        <div>
                            <a href="#" class="badge badge-secondary">Rank#(?)</a>
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
                                    <div class="Volume">${currencyInformation.volume24h}</div>
                                    <div class=Volume_fluctuation "><span class="badge badge-pill badge-danger ">(漲跌幅)</span>
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
            </div>

            <hr>


            

            <script src="${contextRoot}/js/jquery-3.6.0.min.js " type="text/javascript "></script>
            <script src="${contextRoot}/js/bootstrap.bundle.min.js " type="text/javascript "></script>
        </body>

        </html>