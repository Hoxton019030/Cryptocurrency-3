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
            <link rel="stylesheet" href="${contextRoot}/css/article.css">
            <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
            <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
            <link rel="stylesheet" type="text/css" href="${contextRoot}/css/individualCryptocurrencyInformationCss.css">
            <script src="${contextRoot}/javascripts/individualCryptocurrencyInformationJs.js">
            </script>
            <style type="text/css">
                body {
                    padding-top: 82px;
                }
            </style>
        </head>

        <body>
            ${currencyInformation.percentChange24h}
            <div id="tabs">
                <div class="container-fluid">
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
                                <a href="#" class="badge badge-secondary">${currencyInformation.id-90976}</a>
                            </div>


                        </div>
                        <div class="col-sm-4">
                            <div class="text-nowrap ">
                                <div class="d-inline-block currentlyPrice" id="currentlyPrice">
                                    當前價位:${currencyInformation.twdPriceOfCryptocurrency}
                                </div>

                                <div class="d-inline-block badge badge-pill badge-danger" id="highLowRatio">
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
                        </div>
                        <div class="col-sm-8">
                            <div class="container">
                                <div class="row row-cols-4">
                                    <div class="col marketcap">
                                        <span class="badge badge-primary">Market Cap
                                        </span>
                                        <div class="market_cap_price" id="marketCapByTotalSupply">${currencyInformation.maxSupply}</div>
                                        <div class="market_cap_fluctuation "><span class="badge badge-pill badge-danger">(漲跌幅)</span></div>
                                    </div>
                                    <div class="col fullydilutedmarketcap">
                                        <span class="badge badge-primary">Fully Diluted Market Cap</span>
                                        <div class="Fully-DilutedMarket-Cap_price" id="Fully-DilutedMarket-Cap_price">$(45,002,502)</div>
                                        <div class="market_cap_fluctuation "><span class="badge badge-pill badge-danger">(漲跌幅)</span>
                                        </div>
                                    </div>

                                    <div class="col volume">
                                        <span class="badge badge-primary">Volume</span>
                                        <div class="volume" id="volume24h">${currencyInformation.volume24hUsd}</div>
                                        <div class=Volume_fluctuation><span class="badge badge-pill badge-danger ">(漲跌幅)</span>
                                        </div>
                                    </div>
                                    <div class="col circulatingsupply ">
                                        <span class="badge badge-primary ">Circulating Supply</span>
                                        <div class="Circulating_Supply_price" id="circulatingSupply">${currencyInformation.circulatingSupply}</div>
                                        <div class="Circulating_MaxSupply_Title ">
                                            <div class="title d-inline-block small text-left "> MaxSupply:</div>
                                            <div class="maxsupply d-inline-block small" id="maxSupply2">maxSupply:</div>
                                        </div>
                                        <div class="Circulating_TotalSupply_Title ">
                                            <div class="title d-inline-block small text-left "> TotalSupply:</div>
                                            <div class="totalSupply   d-inline-block small" id="totalSupply"> ${currencyInformation.totalSupply}</div>
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
                        <li>
                            <a href="#article" id="page-article">相關討論</a> </li>
                    </ul>

                    <div id="overview">
                        <p>
                            <div class="chart-container">
                                <canvas id="canvas" width="500" height="100">

                                </canvas>


                            </div>
                        </p>
                    </div>
                    <div id="historical">
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
                                <tbody id="historicalrow">

                                </tbody>

                            </thead>


                        </table>
                    </div>

                    <div id="news">
                        <input type="hidden" id="name" value="${currencyInformation.nameOfCryptocurrency}" />
                        <div id="nn1"><img class="newsimg" src="https://picsum.photos/550/300/?random=1" alt=""></div>
                        <div id="nn2"><img class="newsimg" src="https://picsum.photos/550/300/?random=1" alt=""></div>
                        <div id="nn3"><img class="newsimg" src="https://picsum.photos/550/300/?random=1" alt=""></div>
                        <div id="nn4"><img class="newsimg" src="https://picsum.photos/550/300/?random=2" alt=""></div>
                        <div id="nn5"><img class="newsimg" src="https://picsum.photos/550/300/?random=2" alt=""></div>
                        <div id="nn6"><img class="newsimg" src="https://picsum.photos/550/300/?random=2" alt=""></div>
                    </div>
                    <div id="article">
                        <input type="hidden" id="tag" value="${currencyInformation.symbolOfCryptocurrency}" />
                        <table class="table table-hover table-primary">
                            <thead class="thead-dark">
                                <tr>
                                    <th scope="col" class="col-2">幣別</th>
                                    <th scope="col" class="col-6">文章</th>
                                    <th scope="col" class="col-2" style="text-align: center;">讚數/閱讀/評論</th>
                                    <th scope="col" class="col-2">來自</th>
                                </tr>
                            </thead>
                            <tbody class="sel" id="atcTable">

                            </tbody>
                            <nav aria-label="Page navigation example">
                                <ul class="pagination" id="pageid">
                                </ul>
                            </nav>
                        </table>
                    </div>

                </div>


        </body>
        <script>
            var contextRoot = "http://localhost:8080/coinshell";
            var tag;
            var page = 1;
            let dataNow = {};
            loadAtc();
            setNewsbyName();

            function loadAtc() {
                $(function() {
                    var tag = document.getElementById("tag").value;
                    console.log(tag);
                    fetch("http://localhost:8080/coinshell/article/viewAllAjax?tag=BTC").then(function(response) {
                        return response.json();
                        // console.log(response.json())
                    }).then(function(data) {
                        console.log(data);
                        dataNow = data;
                        pagination(data, 1)
                    })
                })
            }

            function loadAtcByAuthorId(authorId) {
                $(function() {
                    console.log(authorId);
                    fetch("http://localhost:8080/coinshell/article/viewAllAjaxByAuthorId?authorId=" + authorId).then(function(response) {
                        return response.json();
                        // console.log(response.json())
                    }).then(function(data) {
                        console.log(data);
                        dataNow = data;
                        pagination(data, 1)
                    })
                })
            }

            pageid.addEventListener('click', switchPage);

            function switchPage(e) {
                e.preventDefault();
                if (e.target.nodeName !== 'A') return;
                const page = e.target.dataset.page;
                pagination(dataNow, page);
            }

            function pagination(array, nowPage) {
                console.log(nowPage);
                const dataTotal = array.length;
                const perpage = 5;
                const pageTotal = Math.ceil(dataTotal / perpage);
                console.log(`全部資料:` + dataTotal + ` 每一頁顯示:` + perpage + `筆`);
                let currentPage = nowPage;
                if (currentPage > pageTotal) {
                    currentPage = pageTotal;
                }
                const minData = (currentPage * perpage) - perpage + 1;
                const maxData = (currentPage * perpage);
                const data = [];
                array.forEach((item, index) => {
                    const num = index + 1;
                    if (num >= minData && num <= maxData) {
                        data.push(item);
                    }
                })
                console.log(data);
                displayData(data)
                const page = {
                    pageTotal,
                    currentPage,
                    hasPage: currentPage > 1,
                    hasNext: currentPage < pageTotal,
                }
                console.log(page);
                pageBtn(page)
            }

            function displayData(data) {
                $("#atcTable").empty();
                $.each(data, function(index, value) {
                        const added = new Date(Date.parse(value.added));
                        const MM = added.getMonth() + 1;
                        const dd = added.getDate();
                        const HH = added.getHours();
                        const mm = added.getMinutes();
                        const weekIndex = added.getDay();
                        const weekDay = ["星期天", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"];
                        const weekDayPrint = weekDay[weekIndex];
                        const peek = value.text.substr(0, 100);
                        // console.log(peek);
                        // console.log(array);
                        $("#atcTable").append(`
                        <tr class="table-info">
                        <td>` + value.tag + `</td>
                        <td><a href="` + contextRoot + `/viewArticle/` + value.id + `" style="display: block;"><div class="b-list"><div>` + value.title + `</div></a><p>` + peek + `....</p></div></td>
                        <td align="center">
                            <label><input type="checkbox" class="check" checked><span class="heart"><i class="fa-solid fa-heart"></i></span>` + value.goodNum + `</label>
                            <i class="fa fa-eye" aria-hidden="true"></i>` + value.readNum + `
                            <i class="fa fa-commenting-o" aria-hidden="true"></i>` + value.commentNum + `</td>
                        </td>
                        <td>
                            <div class="b-list">
                                <span><a href="#" style="display: block;" onclick="loadAtcByAuthorId(` + value.authorId + `)">` + value.CustomizedUserName + `</a></span>                                    
                                <span class="text-black-50">` + MM + `/` + dd + ` ` + HH + `:` + mm + ` ` + weekDayPrint + `</span>
                            </div>
                        </td>
                        </tr>
                    `)
                    }

                )
            }

            function pageBtn(page) {
                let str = '';
                const total = page.pageTotal;
                if (page.hasPage) {
                    str += `<li class="page-item"><a class="page-link" href="#" data-page="` + (Number(page.currentPage) - 1) + `">«</a></li>`;
                } else {
                    str += `<li class="page-item disabled"><a class="page-link">«</a></li>`;
                }

                for (let i = 1; i <= total; i++) {
                    if (Number(page.currentPage) === i) {
                        str += `<li class="page-item active"><a class="page-link" href="#" data-page="` + i + `">` + i + `</a></li>`;
                    } else {
                        str += `<li class="page-item"><a class="page-link" href="#" data-page="` + i + `">` + i + `</a></li>`;
                    }
                };

                if (page.hasNext) {
                    str += `<li class="page-item"><a class="page-link" href="#" data-page="` + (Number(page.currentPage) + 1) + `">»</a></li>`;
                } else {
                    str += `<li class="page-item disabled"><a class="page-link">»</a></li>`;
                }
                pageid.innerHTML = str;
                console.log(str);
            }


            function setNewsbyName() {
                var name = document.getElementById("name").value;
                debugger
                $.ajax({
                    url: "http://localhost:8080/coinshell/news/select?title=" + name,
                    contentType: 'application/json; charset=UTF-8',
                    dataType: 'json',
                    method: 'get',
                    success: function(result) {
                        console.log(result)
                        $.each(result, function(index, value) {
                            $('#nn1').html(`<a href="#" onclick="window.open('` + result[0].url + `')"><img class="newsimg" src="` + result[0].imgUrl + `" alt=""></a>`);
                            $('#nn2').html(`<a href="#" onclick="window.open('` + result[1].url + `')"><img class="newsimg" src="` + result[1].imgUrl + `" alt=""></a>`);
                            $('#nn3').html(`<a href="#" onclick="window.open('` + result[2].url + `')"><img class="newsimg" src="` + result[2].imgUrl + `" alt=""></a>`);
                            $('#nn4').html(`<a href="#" onclick="window.open('` + result[3].url + `')"><img class="newsimg" src="` + result[3].imgUrl + `" alt=""></a>`);
                            $('#nn5').html(`<a href="#" onclick="window.open('` + result[4].url + `')"><img class="newsimg" src="` + result[4].imgUrl + `" alt=""></a>`);
                            $('#nn6').html(`<a href="#" onclick="window.open('` + result[5].url + `')"><img class="newsimg" src="` + result[5].imgUrl + `" alt=""></a>`);
                        })
                    },
                    error: function(err) {
                        console.log("result====" + err)
                        console.log("失敗");
                    }
                })
            }
        </script>

        </html>