<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<title>${Article.title}</title>
</head>
<body>
<jsp:include page="../NavBar/CoinShellNavBar.jsp" />
<div class="container mb-5 mt-5">
    <div class="card">
        <div class="row">
            <div class="col-md-12">
                <h1>${Article.title}</h1>
                <input id="aid" type="hidden" value="${Article.id}"/>                
                <a href="${contextRoot}/editArticle/${Article.id}">Edit</a>
                <a href="${contextRoot}/deleteArticle/${Article.id}" onclick="return confirm('確認刪除嗎?')">Delete</a>
                <br>
                <div>${Article.text}</div><br/>
                <hr/>
                <div class="row section_title">
                    <div class="col-md-12" id="comment-list">

                    </div>
                </div>
                <div id="respond">
                    <!-- <form id="commentform"> -->
                        <ul class="comment-l">
                            <li style="height:28px;line-height: 28px;overflow: hidden">
                                <label for="text">Comment:(necessery)</label>
                            </li>
                            <li>
                                <textarea id="text-c" tabindex="1"></textarea>
                            </li>
                            <li class="comment-btn">
                                <button href="#" id="submit-c" tabindex="5">OK!Let's do this!</button>
                                <p>( Ctrl+Enter Quick Submit )&nbsp;&nbsp;&nbsp;&nbsp;</p>                                    
                            </li>
                        </ul>

                        <ul class="comment-r">
                            <li>
                                <label for="userName">Name:(necessery)</label>
                            </li>
                            <li>
                                <input type="text" id="userName-c" size="25" tabindex="2" aria-required='true'/>
                            </li>
                            <li>
                                <label for="userEmail">E-mail:(necessery)</label>
                            </li>
                            <li>
                                <input type="hidden" id="articleId" value="${Article.id}" />
                            </li>
                            <li>
                                <input type="text" id="userEmail-c" size="25" tabindex="3" aria-required='true'/>
                            </li>
                        </ul>
                    <!-- </form> -->
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
loadComment();
$("#submit-c").click(function(){comment()})

async function comment(){
    await commentTo();
    loadComment()
}

async function wait(ms) {
    console.log('ok')
    return new Promise(resolve => {
      setTimeout(resolve, ms);
    });
}

async function reply(id){
    await replyTo(id);
    await wait(100);
    loadReply(id)
}

function closeReply(id){
    $("#reply-list"+id).empty();
    $("#showR"+id).toggle();
    $("#closeR"+id).hide();
}

function doReply(id){
    $("#"+id).toggle()
}

function commentTo(){
var userNameC = document.getElementById("userName-c").value;
var userEmailC = document.getElementById("userEmail-c").value;
var textC = document.getElementById("text-c").value;
var articleIdC = document.getElementById("articleId").value; 
var comm = {
    "userName":userNameC,
    "userEmail":userEmailC,
    "text":textC,
    "type":"a",
    "deleted":"n",
    "articleId":articleIdC
}
var jsonComm = JSON.stringify(comm);
fetch('http://localhost:8080/coinshell/editComment', {
    // credentials: 'include',
    method:'POST',
    headers: {
        'Content-Type': 'application/json'    
    },
    body:jsonComm    
}).then(res => {
        return res.json();
    }).then(result =>{
        console.log(result);
    });
};

function replyTo(id){
var userNameR = document.getElementById("userName-r"+id).value;
var userEmailR = document.getElementById("userEmail-r"+id).value;
var textR = document.getElementById("text-r"+id).value;
var articleIdR = document.getElementById("articleId").value; 
var commentIdR = document.getElementById("commentId"+id).value;
var reply = {
    "userName":userNameR,
    "userEmail":userEmailR,
    "text":textR,
    "type":"b",
    "deleted":"n",
    "articleId":articleIdR,
    "commentId":commentIdR
}
var jsonReply = JSON.stringify(reply);
fetch('http://localhost:8080/coinshell/editReply?commentId='+commentIdR, {
    method:'POST',
    headers: {
        'Content-Type': 'application/json'    
    },
    body:jsonReply
}).catch(error => console.log('Error:', error))
.then(res => {
        return res.json();
    }).then(result =>{
        console.log(result);
    });
}

function loadComment(){
    $(function() {
        var aid = document.getElementById("aid").value;
        console.log(aid);
        $("#comment-list").empty();
        fetch("http://localhost:8080/coinshell/viewComment?articleId="+aid).then(function(response) {
            return response.json();
            console.log(response.json())
        }).then(function(array) {
            $.each(array, function(index, value) {
                var added = new Date(Date.parse(value.added));
                var MM = added.getMonth();
                var dd = added.getDate();
                var HH = added.getHours();
                var mm = added.getMinutes();
                var weekIndex = added.getDay();
                var weekDay = ["星期天", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"];
                var weekDayPrint = weekDay[weekIndex];
                var id = value.id;             
                // <img class="mr-3 rounded-circle" alt="Bootstrap Media Preview" src="https://i.imgur.com/stD0Q19.jpg" />
                $("#comment-list").append(`
                        <div class="media-body">
                            <div class="row">
                                <div class="col-8 d-flex">
                                   <h5>`+value.userName+`</h5>
                                   <span>-`+MM+`/`+dd+` `+HH+`:`+mm+` `+weekDayPrint+`</span>
                                </div>                                
                                <div class="col-4">                                
                                    <div class="pull-right reply">
                                        <a href="#" onclick="doReply(`+id+`)"><span><i class="fa fa-reply"></i>reply</span></a>
                                        <div id="`+id+`" class="reply-section" style="display: none">
                                            <ul class="comment-l">
                                                <li style="height:28px;line-height: 28px;overflow: hidden">
                                                    Comment content:(necessery)
                                                </li>
                                                <li>
                                                    <textarea id="text-r`+id+`" tabindex="1" aria-required="true"></textarea>
                                                </li>
                                                <li class="comment-btn">
                                                    <button class="submit-r" onclick="reply(`+id+`)" tabindex="5">OK!Let's do this!</button>
                                                    <p>( Ctrl+Enter Quick Submit )&nbsp;&nbsp;&nbsp;&nbsp;</p>
                                                </li>
                                            </ul>
                                            <ul class="comment-r">
                                                <li>
                                                    <label for="userName">Name:(necessery)</label>
                                                </li>
                                                <li>
                                                    <input type="text" id="userName-r`+id+`" size="25" tabindex="2" aria-required='true'/>
                                                </li>
                                                <li>
                                                    <label for="userEmail">E-mail:(necessery)</label>
                                                </li>
                                                <li>
                                                    <input type="hidden" id="articleId" value="${Article.id}" />
                                                </li>
                                                <li>
                                                    <input type="hidden" id="commentId`+id+`" value="`+id+`" />
                                                </li>
                                                <li>
                                                    <input type="text" id="userEmail-r`+id+`" size="25" tabindex="3" aria-required='true'/>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            `+value.text+`
                            <span onclick="loadReply(`+id+`)" id="showR`+id+`"><i class="fa fa-reply"></i>See reply</span>
                            <span onclick="closeReply(`+id+`)" id="closeR`+id+`" style="display: none"><i class="fa fa-reply"></i>Close reply</span>
                            <div id="reply-list`+id+`">
                            </div>
                        </div>
                        `)                    
            })
        })
    })
}

function loadReply(id){
    $(function() {
        var aid = document.getElementById("aid").value;
        console.log(aid);
        var cid = id;
        console.log(cid);
        $("#reply-list"+id).empty();
        $("#showR"+id).hide();
        $("#closeR"+id).toggle();
        fetch("http://localhost:8080/coinshell/viewReply?articleId="+aid+"&commentId="+cid).then(function(response) {
            return response.json();
            console.log(response.json())
        }).then(function(array) {
            $.each(array, function(index, value) {
                var added = new Date(Date.parse(value.added));
                var MM = added.getMonth();
                var dd = added.getDate();
                var HH = added.getHours();
                var mm = added.getMinutes();
                var weekIndex = added.getDay();
                var weekDay = ["星期天", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"];
                var weekDayPrint = weekDay[weekIndex];                  
                // <a class="pr-3" href="#"><img class="rounded-circle" alt="Bootstrap Media Another Preview" src="https://i.imgur.com/xELPaag.jpg" /></a>
                $("#reply-list"+id).append(`
                <div class="media mt-4">
                            <div class="media-body">
                                <div class="row">
                                    <div class="col-12 d-flex">
                                        <h5>`+value.userName+`</h5>
                                        <span>-`+MM+`/`+dd+` `+HH+`:`+mm+` `+weekDayPrint+`</span>
                                    </div>
                                </div>
                                `+value.text+`
                            </div>
                        </div>
                        `)                    
            })
        })
    })
}

// function deleteAtc(){
//     alert("確認刪除?")
// }

   //驗證Email的正確性
// function mail_test(thisform) {
//     with (thisform) {
//     user_email = commentform.user_email.value;
//     if (!/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test(user_email)) {
//         alert("電子郵件格式錯誤");
//         commentform.user_email.focus();
//         return false
//     }else{return true}
//     }
// }
// $('.btn-respond').click(function(){
//     alert(123)
//     $(this).next('.container').css('display','block')
// })


//   $('.btn-respond').each(function(){
// 	$(this).click(function(){
//       $(this).next('.container').css('display', 'block');
//     });
//   });
//   //取消回复
//   $('.btn-revoke').each(function(){
//     $(this).click(function(){
//       $(this).parent().css('display','none');
//     });
//   });


</script>
</body>
</html>