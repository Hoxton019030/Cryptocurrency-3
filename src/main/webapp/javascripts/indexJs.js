$(function() {
    $("#tabs").tabs();
});
//jquery控制分業的功能

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


//function upCoin(){
//	 $.ajax({
//            url:'http://localhost:8080/coinshell/coin/getAll',
//            contentType:'application/json; charset=UTF-8',  //送過去的
//            dataType:'json', //傳回來的
//            method:'get',
//            success: function(result){
//            	$('#top tr td').remove();
//                console.log(result)
//                coinList = '';
//                $.each(result,function(index, value){
//                	coinList += '<tr>'
//                	coinList += '<td>' + value.id + '</td>'
//                	
//                	coinList += '<td><input type="checkbox" style="height:30px width:30px" id="watch' + value.id + '" value="' + value.name + '" onClick="watch(' + value.id + ')"></td>'
////                	coinList += '<td><button id="watch' + value.id + '" value="' + value.name + '" onClick="watch(' + value.id + ')">watch</button></td>'
//                	
//                	coinList += '<td><img class=currencyIcon src="' + contextRoot + '/images/currencyIcon/' + value.symbol + '.png" alt=""><a href="http://localhost:8080/coinshell/individualCryptocurrencyInformation?currencyName=' + value.symbol + '&currentlyDay=' + value.lastUpdated.substr(0, 10) + '">' + value.name + '</a></td>'
//                	coinList += '<td>' + value.symbol + '</td>' 
//                	coinList += '<td class="price">'  + value.price + '</td>'
//                	coinList += '<td class="1h">'     + value.percentChange1h  + '</td>' 
//                	coinList += '<td class="24h">'    + value.percentChange24h + '</td>' 
//                	coinList += '<td class="7d">'     + value.percentChange7d  + '</td>' 
//                	coinList += '<td class="30d">'    + value.percentChange30d + '</td>' 
//                	coinList += '<td class="vol24h">' + value.volume24h + '</td>' 
//                	coinList += '<td class="market">' + value.marketCap + '</td>' 
//                	coinList += '</tr>'      
//                })
//                $('#top').append(coinList);
//                
//                setUpCoin();
//                upjquery();
//            },
//            error: function(err){
//                console.log(err)
//            } 
//         })
//}
//
//var myInterval
//
//function setUpCoin(){
//myInterval  = window.setInterval(function(){upCoin()},30000);
//}


//每30秒更新一次
//window.setInterval(function(){upCoin()},30000);


//function watch(id){
//  var name = document.getElementById("watch" + id).value;
//	 $.ajax({
//            url:'http://localhost:8080/coinshell/watch?name=' + name,
//            contentType:'application/json; charset=UTF-8',  //送過去的
//            dataType:'json', //傳回來的
//            method:'get',
//            success: function(result){
//                console.log(result)
//                coinList = '';
//                $.each(result,function(index, value){
//                	coinList += '<tr>'
//                	coinList += '<td>' + value.id + '</td>'
//                	
//                	coinList += '<td><input type="checkbox" style="height:30px width:30px" id="watch' + value.id + '" value="' + value.name + '" onClick="watch(' + value.id + ')"></td>'
//                	
//                	coinList += '<td><img class=currencyIcon src="' + contextRoot + '/images/currencyIcon/' + value.symbol + '.png" alt=""><a href="http://localhost:8080/coinshell/individualCryptocurrencyInformation?currencyName=' + value.symbol + '&currentlyDay=' + value.lastUpdated.substr(0, 10) + '">' + value.name + '</a></td>'
//                	coinList += '<td>' + value.symbol + '</td>' 
//                	coinList += '<td class="price">'  + value.price + '</td>'
//                	coinList += '<td class="1h">'     + value.percentChange1h  + '</td>' 
//                	coinList += '<td class="24h">'    + value.percentChange24h + '</td>' 
//                	coinList += '<td class="7d">'     + value.percentChange7d  + '</td>' 
//                	coinList += '<td class="30d">'    + value.percentChange30d + '</td>' 
//                	coinList += '<td class="vol24h">' + value.volume24h + '</td>' 
//                	coinList += '<td class="market">' + value.marketCap + '</td>' 
//                	coinList += '</tr>'      
//                })
//                $('#watch').append(coinList);
//                upjquery();
//            },
//            error: function(err){
//                console.log(err)
//            } 
//         })
//}



function upCoin(){
    var tableObj = document.getElementById("watch");
    for (var i = 1; i < tableObj.rows.length; i++ ){
        tableObj.deleteRow(i)
    }
//     $("#watch").html("");
	 $.ajax({
            url:'http://localhost:8080/coinshell/coin/getAll',
            contentType:'application/json; charset=UTF-8',  //送過去的
            dataType:'json', //傳回來的
            method:'get',
            success: function(result){
            	$('#top tr td').remove();
                console.log(result)
                coinList = '';
                $.each(result,function(index, value){
                	coinList += '<tr>'

                	coinList += '<td>' + value.id + '</td>'
                    
                	var div_color= value.id+"div";
                	coinList += '<td><div  id="'+div_color+'"+" style="background-color:#FFBB73;text-align: center;"><input type="checkbox" style="height:30px width:10px" name="yes" id="watch' + value.id + '" value="' + value.name + '" onClick="watch(' + value.id + ',this.name)"></div></td>'

//                	coinList += '<td><button id="watch' + value.id + '" value="' + value.name + '" onClick="watch(' + value.id + ')">watch</button></td>'
                	
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
                upjquery();
            },
            error: function(err){
                console.log(err)
            } 
         })
}

//每30秒更新一次
window.setInterval(function(){upCoin()},30000);


function watch(id,name) {
    if(name =='yes') {
        document.getElementById(id+'div').setAttribute("style","background-color:#FF2D2D;text-align: center;");
        var name = document.getElementById("watch" + id).value;
        $.ajax({
            url: 'http://localhost:8080/coinshell/watch?name=' + name,
            contentType: 'application/json; charset=UTF-8',  //送過去的
            dataType: 'json', //傳回來的
            method: 'get',
            success: function (result) {
                console.log(result)
                coinList = '';
                $.each(result, function (index, value) {
                    coinList += '<tr>'
                    coinList += '<td>' + value.id + '</td>'

                    var div_color= value.id+"div";
                	coinList += '<td><div  id="'+div_color+'"+" style="background-color:#FFBB73;text-align: center;"><input type="checkbox" style="height:30px width:10px" name="yes" id="watch' + value.id + '" value="' + value.name + '" onClick="watch(' + value.id + ',this.name)"></div></td>'

//                  coinList += '<td><input type="checkbox" style="height:30px width:30px" id="watch' + value.id + '" value="' + value.name + '" onClick="watch(' + value.id + ')"></td>'


                    coinList += '<td><img class=currencyIcon src="' + contextRoot + '/images/currencyIcon/' + value.symbol + '.png" alt=""><a href="http://localhost:8080/coinshell/individualCryptocurrencyInformation?currencyName=' + value.symbol + '&currentlyDay=' + value.lastUpdated.substr(0, 10) + '">' + value.name + '</a></td>'
                    coinList += '<td>' + value.symbol + '</td>'
                    coinList += '<td class="price">' + value.price + '</td>'
                    coinList += '<td class="1h">' + value.percentChange1h + '</td>'
                    coinList += '<td class="24h">' + value.percentChange24h + '</td>'
                    coinList += '<td class="7d">' + value.percentChange7d + '</td>'
                    coinList += '<td class="30d">' + value.percentChange30d + '</td>'
                    coinList += '<td class="vol24h">' + value.volume24h + '</td>'
                    coinList += '<td class="market">' + value.marketCap + '</td>'
                    coinList += '</tr>'
                })
                $('#watch').append(coinList);
                upjquery();
            },
            error: function (err) {
                console.log(err)
            }
        })
        document.getElementById('watch'+id).setAttribute("name","no");
    }else
    {
        document.getElementById(id+'div').setAttribute("style","background-color:#FFBB73;text-align: center;")
        document.getElementById('watch'+id).setAttribute("name","yes");
        var tableObj = document.getElementById("watch");
        for (var i = 0; i < tableObj.rows.length; i++ ){
            if(id==tableObj.rows[i].cells[0].innerText)
            {
                tableObj.deleteRow(i)
                break;
            }
        }
    }

}






                function loadCoinByName(){
                	var coinName = document.getElementById("coinName").value;
                		 $.ajax({
                	            url:'http://localhost:8080/coinshell/coin/select?name=' + coinName,
                	            contentType:'application/json; charset=UTF-8',  //送過去的
                	            dataType:'json', //傳回來的
                	            method:'get',
                	            success: function(result){
                	            	$('#top tr td').remove();
                	                console.log(result)
                	                coinList = '';
                	                $.each(result,function(index, value){
                	                	coinList += '<tr>'
                	                	coinList += '<td>' + value.id + '</td>'

                                        var div_color= value.id+"div";
                	                    coinList += '<td><div  id="'+div_color+'"+" style="background-color:#FFBB73;text-align: center;"><input type="checkbox" style="height:30px width:10px" name="yes" id="watch' + value.id + '" value="' + value.name + '" onClick="watch(' + value.id + ',this.name)"></div></td>'
//                	                	coinList += '<td><input type="checkbox" style="height:30px width:30px" id="watch' + value.id + '" value="' + value.name + '" onClick="watch(' + value.id + ')"></td>'


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
                	                
                	                console.log("myInterval=",myInterval);
                	                window.clearInterval(myInterval);
                	                
                	                //查詢後持續即時更新
//                	                window.setInterval(function(){loadCoinByName()},10000);

                	                upjquery();
                	            },
                	            error: function(err){
                	                console.log(err)
                	            } 
                	         })
                	}




//function全部封裝起來 讓setinterval再跑時候讀取	
	
function upjquery(){
	
//.toLocaleString =>千分位 
//(undefined, {maximumFractionDigits: 0}) =>去小數點 設1則顯示小數點後1位
//如果用 (td.toFixed(0)).toLocaleString(); 會失敗 只會顯示無小數點 但不會千分位

$('.vol24h,.market').each(function(i, el) {
	var td = parseFloat($(el).text());
	if (!isNaN(td)) {
	$(el).text('$' + td.toLocaleString(undefined, {maximumFractionDigits: 0}));
	}
});	


//取小數後2位+百分比


$('.1h,.24h,.7d,.30d').each(function(i,el){
   var td = parseFloat($(el).text());
   if(!isNaN(td)){
      $(el).text(td.toFixed(2) + '%');
   }
});	

//取小數後兩位 + 前面加上錢字號

$('.price,.price1').each(function(i,el){
   var td = parseFloat($(el).text());
   if(!isNaN(td)){
      $(el).text('$' + td.toFixed(2));
   }
});	


//判斷大於0顯綠 反之顯紅


$(function() {
  $('.1h,.24h,.7d,.30d').each( function() {
    var elem = $(this) ,
        value = parseFloat( elem.text() );
    if( value < 0 ) {
      elem.css('color', 'red');
    }
    if( value > 0 ) {
      elem.css('color', 'green');
    }
  });
});

}

