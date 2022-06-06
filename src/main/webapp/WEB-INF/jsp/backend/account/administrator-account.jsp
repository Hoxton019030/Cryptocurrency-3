<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="../backendNavBar.jsp" />

<head>
<meta charset="UTF-8">
<title>會員管理 | CoinShell Backend</title>
<link rel="stylesheet" href="${contextRoot}/css/backendNews.css">
</head>

<body>
<h2>會員資料 / 會員圖像管理</h2>
<fieldset>
<legend>Members</legend>
<a href="${contextRoot}/adm-addMember">新增使用會員</a>
<br>
<a href="${contextRoot}/adm-showAllMembers">全部使用會員</a>
<br>
</fieldset>

<fieldset>
<legend>Avatars</legend>
<a href="${contextRoot}/adm-addAvatar">新增會員圖像</a>
<br>
<a href="${contextRoot}/adm-showAllAvatars">全部會員圖像</a>

</fieldset>
</body>