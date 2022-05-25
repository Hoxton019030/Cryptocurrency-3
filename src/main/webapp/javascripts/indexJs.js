$(function() {
    $("#tabs").tabs();
});
//jquery控制分頁的功能

$(function() {
    upCoin();
})

// $(function(){
//     某個方法();
// })
// 讓程式一開始就執行某個方法
//這邊設定成這樣，讓整個Dom載入完成後執行upCoin();


var contextRoot = "http://localhost:8080/coinshell"

var day = new Date();
let month = day.getMonth() + 1
month = (month < 10 ? '0' : '') + month
var today = day.getFullYear() + "-" + month + "-" + day.getDate();
//這邊定義今天的日期，格式為yyyy-MM-dd (2022-05-20)




function upCoin() {
    var tableObj = document.getElementById("watch");
//    var checkStatus= false;
    for (var i = 1; i < tableObj.rows.length; i++) {
        tableObj.deleteRow(i)
    }

    $.ajax({
        url: 'http://localhost:8080/coinshell/coin/getAll',
        contentType: 'application/json; charset=UTF-8', //送過去的
        dataType: 'json', //傳回來的
        method: 'get',
        success: function(result) {
            $('#top tr td').remove();
//            $('#top tr td:not(:nth-child(1))').remove();
            console.log(result)
            coinList = '';
            $.each(result, function(index, value) {
                coinList += '<tr>'
                coinList += '<td>' + value.id + '</td>'
                
//                 if (!checkStatus){
				coinList +='<td><label><input type="checkbox" class="check" name="yes" id="watch' + value.id + '" value="' + value.name + '" onClick="watch(' + value.id + ',this.name)"><span class="star"><i  class="fa-solid fa-star"></i></span></label></td>'
//                 }

                coinList += '<td><img class=currencyIcon src="' + contextRoot + '/images/currencyIcon/' + value.symbol + '.png" alt=""><a href="http://localhost:8080/coinshell/individualCryptocurrencyInformation?currencyName=' + value.symbol + '&currentlyDay=' + value.lastUpdated.substr(0, 10) + '">' + value.name + '</a></td>'
                coinList += '<td>' + value.symbol + '</td>'
                coinList += '<td class="price">' + value.price + '</td>'
                coinList += '<td class="1h">' + value.percentChange1h + '</td>'
                coinList += '<td class="24h">' + value.percentChange24h + '</td>'
                coinList += '<td class="7d">' + value.percentChange7d + '</td>'
                coinList += '<td class="30d">' + value.percentChange30d + '</td>'
                coinList += '<td class="vol24h">' + value.volume24h + '</td>'
                coinList += '<td class="market">' + value.marketCap + '</td>'
                coinList += '<td style="width:10px;height:10px"><canvas id="myChart' + value.id + '"></canvas></td>'
                coinList += '</tr>';

                //注入折線圖至id=canvas
                var xmlHttp = new XMLHttpRequest();
                var url = "http://localhost:8080/coinshell/historical/get30days?currencyName=" + value.symbol;
                xmlHttp.open("GET", url, true);
                xmlHttp.send();
                xmlHttp.onreadystatechange = function() {
                    // alert(value.id);
                    console.log(value.id)
                    if (this.readyState == 4 && this.status == 200) {
                        var data = JSON.parse(this.responseText);
                        var days = data.map(function(elem) {
                            return elem.informationDate.substr(0, 14).replace('T', '').replace('-', '').replace('-', '').replace(':', '');
                        });
                        var price = data.map(function(elem) {
                            return elem.USD_Price_of_Cryptocurrency;
                        });

                        // const canvasTest = document.getElementById('canvasTest');
                        // const ctx = canvasTest.getContext('2d');
                        const ctx = document.getElementById('myChart' + value.id).getContext('2d');

                        const myChart = new Chart(ctx, {
                            type: 'line',
                            data: {
                                labels: days,
                                pointHitRadius: 0,
                                datasets: [{
                                    label: 'US',
                                    data: price,
                                    backgroundColor: [
                                        'transparent'
                                    ],
                                    borderColor: 'green',
                                    borderWidth: 3,
                                    lineTension: 0,
                                }]
                            },
                            options: {
                                plugins: {
                                    tooltip: {
                                        mode: 'nearest',
                                        intersect: false
                                    }
                                },
                                elements: {
                                    line: {
                                        lineTension: 0
                                    },
                                    point: {
                                        radius: 0
                                    }
                                },
                                scales: {
                                    xAxes: [{
                                        type: 'time',
                                        time: {
                                            unit: 'hour',
                                        },

                                    }],
                                    yAxes: {
                                        beginAtZero: false
                                    }
                                },
                                animation: {
                                    duration: 0
                                }

                            }
                        });
                    }
                }

            })
//            checkStatus= true;
            $('#top').append(coinList);
            setUpCoin();
            upjquery();
        },
        error: function(err) {
            console.log(err)
        }
    })
}

var timeoutID;

function setUpCoin(){
timeoutID  = window.setTimeout(function(){upCoin()},20000); //改2000僅為快速測試而已
}


function watch(id, name) {
    if (name == 'yes') {
        var name = document.getElementById("watch" + id).value;
        $.ajax({
            url: 'http://localhost:8080/coinshell/watch?name=' + name,
            contentType: 'application/json; charset=UTF-8', //送過去的
            dataType: 'json', //傳回來的
            method: 'get',
            success: function(result) {
                console.log(result)
                coinList = '';
                $.each(result, function(index, value) {
                    coinList += '<tr>'

                    coinList += '<td>' + value.id + '</td>'
                    coinList +='<td><label><input type="checkbox" class="check" name="yes" id="watch' + value.id + '" value="' + value.name + '" onClick="watch(' + value.id + ',this.name)"><span class="star"><i  class="fa-solid fa-star"></i></span></label></td>'

                    coinList += '<td><img class=currencyIcon src="' + contextRoot + '/images/currencyIcon/' + value.symbol + '.png" alt=""><a href="http://localhost:8080/coinshell/individualCryptocurrencyInformation?currencyName=' + value.symbol + '&currentlyDay=' + value.lastUpdated.substr(0, 10) + '">' + value.name + '</a></td>'
                    coinList += '<td>' + value.symbol + '</td>'
                    coinList += '<td class="price">' + value.price + '</td>'
                    coinList += '<td class="1h">' + value.percentChange1h + '</td>'
                    coinList += '<td class="24h">' + value.percentChange24h + '</td>'
                    coinList += '<td class="7d">' + value.percentChange7d + '</td>'
                    coinList += '<td class="30d">' + value.percentChange30d + '</td>'
                    coinList += '<td class="vol24h">' + value.volume24h + '</td>'
                    coinList += '<td class="market">' + value.marketCap + '</td>'
                    coinList += '</td>'
                })
                $('#watch').append(coinList);
                upjquery();
            },
            error: function(err) {
                console.log(err)
            }
        })
        document.getElementById('watch' + id).setAttribute("name", "no");
    } else {
        document.getElementById('watch' + id).setAttribute("name", "yes");
        var tableObj = document.getElementById("watch");
        for (var i = 0; i < tableObj.rows.length; i++) {
            if (id == tableObj.rows[i].cells[0].innerText) {
                tableObj.deleteRow(i)
                break;
            }
        }
    }

}


function loadCoinByName() {
    var coinName = document.getElementById("coinName").value;
    $.ajax({
        url: 'http://localhost:8080/coinshell/coin/select?name=' + coinName,
        contentType: 'application/json; charset=UTF-8', //送過去的
        dataType: 'json', //傳回來的
        method: 'get',
        success: function(result) {
            $('#top tr td').remove();
            console.log(result)
            coinList = '';
            $.each(result, function(index, value) {
                coinList += '<tr>'
                coinList += '<td>' + value.id + '</td>'

                coinList +='<td><label><input type="checkbox" class="check" name="yes" id="watch' + value.id + '" value="' + value.name + '" onClick="watch(' + value.id + ',this.name)"><span class="star"><i  class="fa-solid fa-star"></i></span></label></td>'
                
                coinList += '<td><img class=currencyIcon src="' + contextRoot + '/images/currencyIcon/' + value.symbol + '.png" alt=""><a href="http://localhost:8080/coinshell/individualCryptocurrencyInformation?currencyName=' + value.symbol + '&currentlyDay=' + value.lastUpdated.substr(0, 10) + '">' + value.name + '</a></td>'
                coinList += '<td>' + value.symbol + '</td>' 
                coinList += '<td class="price">'  + value.price + '</td>'
                coinList += '<td class="1h">'     + value.percentChange1h  + '</td>' 
                coinList += '<td class="24h">'    + value.percentChange24h + '</td>' 
                coinList += '<td class="7d">'     + value.percentChange7d  + '</td>' 
                coinList += '<td class="30d">'    + value.percentChange30d + '</td>' 
                coinList += '<td class="vol24h">' + value.volume24h + '</td>' 
                coinList += '<td class="market">' + value.marketCap + '</td>' 
                coinList += '</tr>'      
             })
                $('#top').append(coinList);
                	                
                window.clearTimeout(timeoutID);
                	                
                //查詢後持續即時更新
                 window.setTimeout(function(){loadCoinByName()},10000); //改2000僅為快速測試而已

            upjquery();
        },
        error: function(err) {
            console.log(err)
        }
    })
}


//function全部封裝起來 讓setinterval再跑時候讀取	

function upjquery() {

    //.toLocaleString =>千分位 
    //(undefined, {maximumFractionDigits: 0}) =>去小數點 設1則顯示小數點後1位
    //如果用 (td.toFixed(0)).toLocaleString(); 會失敗 只會顯示無小數點 但不會千分位

    $('.vol24h,.market').each(function(i, el) {
        var td = parseFloat($(el).text());
        if (!isNaN(td)) {
            $(el).text('$' + td.toLocaleString(undefined, { maximumFractionDigits: 0 }));
        }
    });


    //取小數後2位+百分比


    $('.1h,.24h,.7d,.30d').each(function(i, el) {
        var td = parseFloat($(el).text());
        if (!isNaN(td)) {
            $(el).text(td.toFixed(2) + '%');
        }
    });

    //取小數後兩位 + 前面加上錢字號

    $('.price,.price1').each(function(i, el) {
        var td = parseFloat($(el).text());
        if (!isNaN(td)) {
            $(el).text('$' + td.toFixed(2));
        }
    });


    //判斷大於0顯綠 反之顯紅

    $(function() {
        $('.1h,.24h,.7d,.30d').each(function() {
            var elem = $(this),
                value = parseFloat(elem.text());
            if (value < 0) {
                elem.css('color', 'red');
            }
            if (value > 0) {
                elem.css('color', 'green');
            }
        });
    });
}