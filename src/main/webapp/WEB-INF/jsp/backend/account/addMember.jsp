<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="../backendNavBar.jsp" />
    
<head>
<meta charset="UTF-8">
<title>新增會員</title>
</head>
<body>
<h2>新增使用會員</h2>
<form action="uploadcua" method="post" enctype="multipart/form-data">
圖像別名： <input type="text" name="alias" value="我是圖像別名">
<br/>
圖像上傳：<input type="file" name="file" required="required" accept="image/png, image/gif, image/jpeg">

<input type="submit" value="送出">
</form>
</body>