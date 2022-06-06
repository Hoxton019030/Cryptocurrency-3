<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>購物車顯示頁面</title>
</head>
<body>
<h1>購物車顯示頁面</h1>
<%--empty函式是判斷集合中有沒有元素--%>
<%--如果購物車是沒有任何購物項的--%>
<c:if test="${empty(cart.bookMap)}">
<h1>您還沒有購買過任何的書籍呀！</h1>
</c:if>
<%--如果購物車有購物項，就應該把購物項的資訊顯示給使用者--%>
<c:if test="${!empty(cart.bookMap)}">
<table border="1px">
<tr>
<td>書籍編號</td>
<td>名稱</td>
<td>數量</td>
<td>小計</td>
<td>操作</td>
</tr>
<c:forEach items="${cart.bookMap}" var="me">
<tr>
<td>${me.key}</td>
<td>${me.value.book.name}</td>
<td>${me.value.quantity}</td>
<td>${me.value.price}</td>
<td><a href="#">刪除</a></td>
</tr>
</c:forEach>
<tr>
<td colspan="2"><a href="#">清空購物車</a></td>
<td colspan="2">合計：</td>
<td>${cart.price}</td>
</tr>
</table>
</c:if>
</table>
</body>
</html>