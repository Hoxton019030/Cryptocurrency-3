<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="../backendNavBar.jsp" />
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>會員資料 / 會員圖像管理</h2>
<fieldset>
<legend>Members</legend>
<a href="account/addMember">新增使用會員</a>
<br>
<a href="account/showAllMembers">全部使用會員</a>
<br>

</fieldset>

<fieldset>
<legend>Avatars</legend>
<a href="account/addAvatar">新增會員圖像</a>
<br>
<a href="account/showAllAvatars">全部會員圖像</a>

</fieldset>
</body>
</html>