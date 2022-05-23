<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form:form action="/signup" >
<h3>註冊</h3>
<%-- 信箱：<form:input type="email" path="eMail"/> --%>
<%-- 密碼：<form:input type="password" path="password" /> --%>
<%-- <form:input type="text hidden" path="joinTime"/> --%>

<button type="submit">建立帳號</button>
</form:form>

</body>
</html>