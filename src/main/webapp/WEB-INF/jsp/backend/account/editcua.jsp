<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="../backendNavBar.jsp" />
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改使用者圖像</title>
</head>
<body>
<h2>修改使用者圖像</h2>

<form action="editcua" method="post">

Avatar Id: 
<input type="text" name="id" value="${cua.id}">

<br> 

Avatar Nickname: <input type="text" name="alias" value="${cua.aliasAvatar}">   
<input type="submit" class="btn btn-info" value="Update Alias-Avatar">
</form>



</body>
</html>