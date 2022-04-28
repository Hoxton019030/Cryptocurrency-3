<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>全員工列表</h1>


	<table>
		<tr>
			<th>id</th>
			<th>姓名</th>
			<th>Email</th>
			<th>年資</th>
		</tr>

		<c:forEach var="oneEmployee" items="${employeeList}">
			<tr>
				<th>${oneEmployee.id}</th>
				<th>${oneEmployee.name}</th>
				<th>${oneEmployee.email}</th>
				<th>${oneEmployee.jobAge</th>
			</tr>
		</c:forEach>
	</table>
</body>
</html>