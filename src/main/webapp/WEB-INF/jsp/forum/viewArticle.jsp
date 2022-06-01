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
<style type="text/css">
    body{
    padding-top: 82px;
    }
</style>
</head>
<body>
<jsp:include page="../NavBar/CoinShellNavBar.jsp" />
<div class="container mb-5 mt-5">
    <div class="card">
        <div class="row">
            <div class="col-md-12">
                <h1>${Article.title}</h1>
                <input id="aid" type="hidden" value="${Article.id}"/>
                <input id="authorid" type="hidden" value="${Article.authorId}"/>
                <span style="display: none;" id="editList">
                    <a href="${contextRoot}/editArticle/${Article.id}">Edit</a>
                    <a href="${contextRoot}/deleteArticle/${Article.id}" onclick="return confirm('確認刪除嗎?')">Delete</a>
                </span>
                <br>
                <div class="d-flex">                    
                    <img class="mr-3 rounded-circle" style="display:block; width:40px;height:40px;" src="${img}"/><h2>${userName}</h2>                               
                </div>
                <div>${Article.text}</div><br/>
                <hr/>
                <button id="doComment">Leave comment here...</button>
                <button id="closeComment" style="display: none;">Umm...let me think about it...</button>
                <div id="respond">
                    <!-- <form id="commentform"> -->                        
                        <ul class="comment-l" style="display: none;">
                            <li style="height:28px;line-height: 28px;overflow: hidden">
                                <label for="text">Comment:(necessery)</label>
                            </li>
                            <li>
                                <textarea id="text-c" tabindex="1" placeholder="我其實也不是一定要評論" style="resize:none;width:600px;height:90px;">我其實也不是一定要評論</textarea>
                            </li>
                            <li class="comment-btn">
                                <button href="#" id="submit-c" tabindex="5">OK!Let's do this!</button>
                                <!-- <p>( Ctrl+Enter Quick Submit )&nbsp;&nbsp;&nbsp;&nbsp;</p>                                     -->
                            </li>                   
                        </ul>

                        <ul class="comment-r" style="display: none;">
                            <li>
                                <label for="userName">Name:(necessery)</label>
                            </li>
                            <li>
                                <input type="text" id="userName-c" size="25" tabindex="2" aria-required='true' value="${login.customizedUserName}"/>
                            </li>
                            <li>
                                <label for="userEmail">E-mail:(necessery)</label>
                            </li>
                            <li>
                                <input type="hidden" id="articleId" value="${Article.id}" />
                                <input type="hidden" id="userId" value="${login.id}" />
                            </li>
                            <li>
                                <input type="text" id="userEmail-c" size="25" tabindex="3" aria-required='true' value="${login.eMail}"/>
                            </li>                            
                        </ul>
                    <!-- </form> -->
                </div>
                <div class="row section_title">
                    <div class="col-md-12" id="comment-list">

                    </div>
                    <nav aria-label="Page navigation example">
                        <ul class="pagination" id="pageidC">
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
var page = 1;
let commDataNow = {};
let replyDataNow = {};
loadComment();
verifyMembershipOnload();
$("#submit-c").click(function(){comment()})
doComment.addEventListener('click',verifyMembership);
closeComment.addEventListener('click',closeCommentL);

function verifyMembershipOnload(){
    if ("${Article.authorId}" == "${login.id}") {
        $("#editList").toggle()
    }
}

function verifyMembership(){
    if ("${login == null }" == "true") {
        $('#loginModal').modal("show")
    }else{
        $(".comment-l").toggle();
        $("#closeComment").toggle();
        $("#doComment").hide();
    }
}

function closeCommentL(){
    $(".comment-l").hide();
    $("#doComment").toggle();
    $("#closeComment").hide();
}

async function comment(){
    await commentTo();
    await wait(100);
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
    $("#pageidR"+id).empty();
    $("#showR"+id).toggle();
    $("#closeR"+id).hide();
}

function doReply(id){
    if ("${login == null }" == "true") {
        $('#loginModal').modal("show")
    }else{
    $("#replySection"+id).toggle()
    }
}

pageidC.addEventListener('click',switchPageC);

function switchPageC(e){
    e.preventDefault();
    if(e.target.nodeName !== 'A') return;
    const page = e.target.dataset.page;
    commPagination(commDataNow, page);
}

function switchPageR(e, id){
    console.log("這裡是"+id);
    e.preventDefault();
    if(e.target.nodeName !== 'A') return;
    const page = e.target.dataset.page;
    console.log("這是第幾頁"+page);
    replyPagination(replyDataNow, page, id);
    console.log("現在的reply是"+replyDataNow);
}

function commentTo(){
    var userNameC = document.getElementById("userName-c").value;
    var userEmailC = document.getElementById("userEmail-c").value;
    var textC = document.getElementById("text-c").value;
    var articleIdC = document.getElementById("articleId").value;
    var userIdC = document.getElementById("userId").value;
    var comm = {
        "userName":userNameC,
        "userEmail":userEmailC,
        "text":textC,
        "type":"a",
        "deleted":"n",
        "articleId":articleIdC,
        "userId":userIdC
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
    var userIdR = document.getElementById("userId").value;
    var reply = {
        "userName":userNameR,
        "userEmail":userEmailR,
        "text":textR,
        "type":"b",
        "deleted":"n",
        "articleId":articleIdR,
        "commentId":commentIdR,
        "userId":userIdR
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
        }).then(function(data) {
            console.log(data);
            commDataNow = data;
            commPagination(data, 1)
        })
    })
}

function commPagination(array, nowPage){
    console.log("Comment傳過來是第幾頁"+nowPage);
    console.log("Comment傳過來是"+array);
    const dataTotal = array.length;
    const perpage = 5;
    const pageTotal = Math.ceil(dataTotal / perpage);
    console.log(`全部評論:`+dataTotal+` 每一頁顯示:`+perpage+`筆`);
    let currentPage = nowPage;
    if (currentPage > pageTotal) {currentPage = pageTotal;}
    const minData = (currentPage * perpage) - perpage + 1 ;
    const maxData = (currentPage * perpage) ;
    const data = [];
    array.forEach((item, index) => {
        const num = index + 1;
        if ( num >= minData && num <= maxData) {
            data.push(item);
        }
    })
    console.log(data);
    displayComm(data)
    const page = {
        pageTotal,
        currentPage,
        hasPage: currentPage > 1,
        hasNext: currentPage < pageTotal,
    } 
    console.log(page);
    pageBtn(page)
}

function displayComm(data){
    $("#comment-list").empty();
    $.each(data, function(index, value) {
            var added = new Date(Date.parse(value.added));
            var MM = added.getMonth();
            var dd = added.getDate();
            var HH = added.getHours();
            var mm = added.getMinutes();
            var weekIndex = added.getDay();
            var weekDay = ["星期天", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"];
            var weekDayPrint = weekDay[weekIndex];
            var id = value.id;
            var cidForReply = value.commentId;   
            var img = value.userAvatarBase64;        
            // <img class="mr-3 rounded-circle" alt="Bootstrap Media Preview" src="https://i.imgur.com/stD0Q19.jpg" />
            $("#comment-list").append(`
                    <div class="media-body">
                        <div class="row">
                            <div class="col-8 d-flex">
                                <img class="mr-3 rounded-circle" style="display:block; width:40px;height:40px;" src="`+img+`" /><h5>`+value.userName+`</h5>
                                <span>-`+MM+`/`+dd+` `+HH+`:`+mm+` `+weekDayPrint+`</span>
                            </div>                                
                            <div class="col-4">                                
                                <div class="pull-right reply">
                                    <span onclick="doReply(`+id+`)"><i class="fa fa-reply"></i>reply</span>
                                    <div id="replySection`+id+`" class="reply-section"  style="display: none;">
                                        <ul class="reply-l">
                                            <li style="height:28px;line-height: 28px;overflow: hidden">
                                                Comment content:(necessery)
                                            </li>
                                            <li>
                                                <textarea id="text-r`+id+`" tabindex="1" aria-required="true"></textarea>
                                            </li>
                                            <li class="reply-btn">
                                                <button class="submit-r" onclick="reply(`+id+`)" tabindex="5">OK!Let's do this!</button>                                                
                                            </li>
                                        </ul>
                                        <ul class="reply-r" style="display: none;">
                                            <li>
                                                <label for="userName">Name:(necessery)</label>
                                            </li>
                                            <li>
                                                <input type="text" id="userName-r`+id+`" size="25" tabindex="2" aria-required='true' value="${login.customizedUserName}"/>
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
                                                <input type="text" id="userEmail-r`+id+`" size="25" tabindex="3" aria-required='true' value="${login.eMail}"/>
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
                        <nav aria-label="Page navigation example">
                            <ul class="pagination pageR" id="pageidR`+id+`" onclick="switchPageR(event,`+id+`)"></ul>
                        </nav>                       
                    </div>
                    `)                    
            })
        }

function pageBtn(page){
    let str = '';
    const total = page.pageTotal;
    if(page.hasPage) {
        str += `<li class="page-item"><a class="page-link" href="#" data-page="`+(Number(page.currentPage)-1)+`">Previous</a></li>`;
    } else {
        str += `<li class="page-item disabled"><span class="page-link">Previous</span></li>`;
    }
    
    for(let i = 1; i <= total; i++){
        if(Number(page.currentPage) === i) {
            str +=`<li class="page-item active"><a class="page-link" href="#" data-page="`+i+`">`+i+`</a></li>`;
        } else {
            str +=`<li class="page-item"><a class="page-link" href="#" data-page="`+i+`">`+i+`</a></li>`;
        }
    };

    if(page.hasNext) {
        str += `<li class="page-item"><a class="page-link" href="#" data-page="`+(Number(page.currentPage)+1)+`">Next</a></li>`;
    } else {
        str += `<li class="page-item disabled"><span class="page-link">Next</span></li>`;
    }
    pageidC.innerHTML = str;
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
        }).then(function(data) {
            console.log(data);
            replyDataNow = data;
            replyPagination(data, 1, id)
        })
    })
}

async function replyPagination(array, nowPage, id){
    console.log("傳過來是第幾頁"+nowPage);
    console.log("傳過來是"+array);
    const dataTotal = array.length;
    const perpage = 5;
    const pageTotal = Math.ceil(dataTotal / perpage);
    console.log(`全部回覆:`+dataTotal+` 每一頁顯示:`+perpage+`筆`);
    let currentPage = nowPage;
    if (currentPage > pageTotal) {currentPage = pageTotal;}
    const minData = (currentPage * perpage) - perpage + 1 ;
    const maxData = (currentPage * perpage) ;
    const dataR = [];
    array.forEach((item, index) => {
        const num = index + 1;
        if ( num >= minData && num <= maxData) {
            dataR.push(item);
        }
    })
    console.log(dataR);
    await displayReply(dataR, id)
    const page = {
        pageTotal,
        currentPage,
        hasPage: currentPage > 1,
        hasNext: currentPage < pageTotal,
        id
    } 
    console.log(page);
    pageBtnSm(page)
}

function displayReply(data, id){
    $("#reply-list"+id).empty();
    $.each(data, function(index, value) {
                var added = new Date(Date.parse(value.added));
                var MM = added.getMonth();
                var dd = added.getDate();
                var HH = added.getHours();
                var mm = added.getMinutes();
                var weekIndex = added.getDay();
                var weekDay = ["星期天", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"];
                var weekDayPrint = weekDay[weekIndex];  
                var img = value.userAvatarBase64;                
                // <a class="pr-3" href="#"><img class="rounded-circle" alt="Bootstrap Media Another Preview" src="https://i.imgur.com/xELPaag.jpg" /></a>
                $("#reply-list"+id).append(`
                <div class="media mt-4">
                            <div class="media-body">
                                <div class="row">
                                    <div class="col-12 d-flex">
                                        <img class="mr-3 rounded-circle" style="display:block; width:40px;height:40px;" src="`+img+`" />
                                        <h5>`+value.userName+`</h5>
                                        <span>-`+MM+`/`+dd+` `+HH+`:`+mm+` `+weekDayPrint+`</span>
                                    </div>
                                </div>
                                `+value.text+`
                            </div>
                        </div>
                        `)                    
            })
}

function pageBtnSm(page){
    console.log("page的ID是:"+page.id);
    let str = '';
    const total = page.pageTotal;
    console.log("第幾頁"+page.currentPage);
    if(page.hasPage) {
        str += `<li class="page-item"><a class="page-link" href="#" data-page="`+(Number(page.currentPage)-1)+`">Previous</a></li>`;
    } else {
        str += `<li class="page-item disabled"><span class="page-link">Previous</span></li>`;
    }
    
    for(let i = 1; i <= total; i++){
        if(Number(page.currentPage) === i) {
            str +=`<li class="page-item active"><a class="page-link" href="#" data-page="`+i+`">`+i+`</a></li>`;
        } else {
            str +=`<li class="page-item"><a class="page-link" href="#" data-page="`+i+`">`+i+`</a></li>`;
        }
    };

    if(page.hasNext) {
        str += `<li class="page-item"><a class="page-link" href="#" data-page="`+(Number(page.currentPage)+1)+`">Next</a></li>`;
    } else {
        str += `<li class="page-item disabled"><span class="page-link">Next</span></li>`;
    }
    // pageidR.innerHTML = str;
    
    console.log('pageidR'+page.id);
    $("#pageidR"+page.id).empty();
    $("#pageidR"+page.id).append(str);
    // var el = document.getElementById("pageidR"+page.id);
    // console.log("這是?????"+el);
    // el.innerHTML = str;
    // var listener = document.querySelector("#pageidR"+page.id);
    // console.log(listener);
    // listener.addEventListener('click',switchPageR);

    console.log("載入成功");
    console.log(str);
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