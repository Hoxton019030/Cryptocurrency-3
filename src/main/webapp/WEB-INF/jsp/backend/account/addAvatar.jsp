<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="../backendNavBar.jsp" />
    
<head>
<meta charset="UTF-8">
<title>新增會員圖像 | CoinShell Backend</title>
<link rel="stylesheet" href="${contextRoot}/css/backendNews.css">
</head>
<body>
<h2>新增會員圖像</h2>

<form action="uploadcua" method="post" enctype="multipart/form-data">

 

<div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="basic-addon1">Alias Name</span>
  </div>
  <input type="text" name="alias" value="我是圖像別名" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
</div>


圖像上傳：<input type="file" name="file" required="required" accept="image/png, image/gif, image/jpeg">

<input type="submit" value="送出" class="btn btn-success">
<button class="btn btn-outline-secondary"><a href="${contextRoot}/adm-showAllAvatars" style="text-decoration: none;">回到圖像頁面</a></button>
</form>

 
</body>