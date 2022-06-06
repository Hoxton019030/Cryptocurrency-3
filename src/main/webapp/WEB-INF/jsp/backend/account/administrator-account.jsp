<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="../backendNavBar.jsp" />

<head>
	<meta charset="UTF-8">
	<title>會員 | CoinShell Backend</title>
	<link rel="stylesheet" href="${contextRoot}/css/backendNews.css">
</head>

<body>

	<div id="test-account">
		<table class="table table-hover" id="accountAddTable">
			<thead class="bg-success">
				<tr>
					<th scope="col">CustomizedUserName</th>
					<th scope="col">E-Mail</th>
					<th scope="col">Password</th>
					<th scope="col">Add</th>
				</tr>
			</thead>
			<tr>
				<td><input type="text" id="accountAddName"></td>
				<td><input type="text" id="accountAddEmail"></td>
				<td><input type="text" id="accountAddPassword"></td>
				<td><input type="button" class="btn btn-success" value="Add" onClick="add()"></td>
			</tr>
		</table>

		<table class="table table-hover" id="accountUpdateTable">
			<thead class="bg-info">
				<th scope="col">ID</th>
				<th scope="col">CustomizedUserName</th>
				<th scope="col">E-Mail</th>
				<th scope="col">Password</th>
				<th scope="col">Update</th>
			</thead>
			<tr>
				<td>ID</td>
				<td><input type="text" id="accountUpdateName"></td>
				<td><input type="text" id="accountUpdateEmail"></td>
				<td><input type="text" id="accountUpdatePassword"></td>
				<td><button class="btn btn-info" onClick="">Update</button></td>
			</tr>
		</table>

		<form class="form-inline my-1 my-lg-0">
			<div class="input-group">
				<input id="accountName" class="form-control pl-2 p-0" type="text" aria-label="Search">
				<div class="input-group-append">
					<input type="button" name="submit" value="Search" id="searchAccount"
						class="btn btn-outline-dark my-2 my-sm-0" />
				</div>
			</div>
			<hr />
			<nav aria-label="Page navigation example">
				<ul class="pagination" id="pageid">
				</ul>
			</nav>
		</form>

		<table class="table table-hover" id="accountTable">
			<thead class="bg-primary">
				<tr>
					<th scope="col" class="id">ID</th>
					<th scope="col" class="name">CustomizedUserName</th>
					<th scope="col" class="avatar">CustomizedUserAvatar</th>
					<th scope="col" class="email">E-Mail</th>
					<th scope="col" class="password">Password</th>
					<th scope="col" class="myShell">MyShell</th>
					<th scope="col" class="coin">Coin</th>
					<th scope="col" class="date">JoinTime</th>
					<th scope="col" class="update">Update</th>
					<th scope="col" class="delete">Delete</th>
				</tr>
			</thead>
			<tbody id="accountTbody">
			</tbody>
		</table>
	</div>
	<div id="ttest"></div>
</body>

<script>
// 這裡要放 loadAccountByName() 但是function loadAccountByName 未完成
$("#searchAccount").click(function () {
    loadAccountByName();
});

let dataNow = {};
getAccount();
// allAccounts();

pageid.addEventListener('click',switchPage);

function switchPage(e) {
	e.preventDefault();
	if(e.target.nodeName != 'A') return;
	const page = e.target.dataset.page;
	pagination(dataNow, page);
}

function getAccount(){
	$.ajax({
		url: "http://localhost:8080/coinshell/account/getAll",
		contentType: "application/json; charset=UTF-8",
		dataType: "json",
		method: "GET",
		success: function(data){
			console.log(data);
			dataNow = data;
			pagination(data,1)
		},
		error: function(err) {
			console.log(err)
		}
	})
}

// function pagination 分頁功能
function pagination(array, nowPage) {
	console.log(nowPage);
	const dataTotal = array.length();
	const perpage = 15;
	const pageTotal = Math.ceil(dataTotal / perpage);
	console.log(`全部資料:`+dataTotal+` 每一頁顯示:`+perpage+`筆`);
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
	displayData(data)
	const page = {
		pageTotal,
		currentPage,
		hasPage: currentPage > 1,
		hasNext: currentPage < pageTotal,
	}
	console.log(page);
	pageBtn (page)
}

// function displayData (value 在哪裡?)
function displayData(data) {
	$('#accountTbody').empty();
	$.each(data, function(index, value) {
		accountList = '';
		accountList += '<tr>';
		accountList += '<td>' + value.id + '</td>';
		accountList += '<td>' + value.name + '</td>';  
		accountList += '<td>' + value.avatar + '</td>';
		accountList += '<td>' + value.email + '</td>';
		accountList += '<td>' + value.password + '</td>';
		accountList += '<td>' + value.myShell + '</td>';
		accountList += '<td>' + value.coin + '</td>';
		accountList += '<td>' + value.date + '</td>';
		accountList += '<td><button id="up'  + value.id + '" class="btn btn-info" value="' + value.id + '" onClick="update(this)">Update</button></td>';
		accountList += '<td><button id="del' + value.id + '" class="btn btn-danger"  value="' + value.id + '" onClick="del(this)">Delete</button></td>';
		accountList += '</tr>';

		$('#accountTable').append(accountList);
	})
}

// function pagBtn
function pageBtn (page){
	let str = '';
	const total = page.pageTotal;
	if(page.hasPage) {
		str += `<li class="page-item"><a class="page-link" href="#" data-page="`+(Number(page.currentPage)-1)+`">Previous</a></li>`;
	} else {
		str += `<li class="page-item disabled"><span class="page-link">Previous</span></li>`;
	}

	for(let i = 1; i <= total; i++) {
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
    pageid.innerHTML = str;    
    console.log(str);
}

// function add
function add() {
	var name = document.getElementById("accountAddName").value;
	var email = document.getElementById("accountAddEmail").value;
	var password = document.getElementById("accountAddPassword").value;

	var param = {
		"name" : name,
		"email" : email,
		"password" : password,
		}
	$.ajax({
		url: 'http://localhost:8080/coinshell/account/add',
		contentType: 'application/json; charset=UTF-8',
		dataType: 'json',
		method: 'post',
		data: JSON.stringify(param),
		success: function(result) {
			console.log(result)
			console.log("成功");
			parent.location.reload();
		//  document.querySelector('#ttest').scrollIntoView()
		},
		error: function(err) {
			console.log(err)
			console.log("失敗");
		}
	})
}
 
// function del
function del(obj) {
	var r = confirm("確定刪除嗎?");
	if (r == true) {
		var id = $(obj).val();
		var param = {
			"id" : id,
			}
		console.log("delId==" + id);
		$.ajax({
			url : 'http://localhost:8080/coinshell/deleteAccount'+ id,
			contentType : 'application/json; charset=UTF-8',
			dataType : 'json',
			method : 'delete',
			data: JSON.stringify(param),
			success: function(result){
				console.log("result====" + result.status)
				console.log("成功");
				if (result.status == '200') {
					$('#accountTbody').find('[id="del' + id + '"]').closest('tr').remove();
				}
			},
			error : function(err) {
				console.log("result====" + err)
				console.log("失敗");
			}
		})
	}
}

// function loadAccountByName
function loadAccountByName(){
	var name = document.getAnimations("accountName").value;
	$.ajax({
		url: 'http://localhost:8080/coinshell/account/select?name=' + name,
		contentType: 'application/json; charset=UTF-8',
		dataType: 'json',
		method: 'get',
		success: function (data) {
			console.log(data);
			dataNow = data;      // dataNow 是對應到一開始的pagination
			pagination(data, 1)
		},
		error: function(err) {
			console.log(err)
		}
	})
}

// function update

// function upSave



</script>