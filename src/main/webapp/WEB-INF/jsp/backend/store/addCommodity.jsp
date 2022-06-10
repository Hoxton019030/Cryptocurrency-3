<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="../backendNavBar.jsp" />

        <head>
            <meta charset="UTF-8">
            <title>新增商品</title>
            <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
            <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
            <script src="${contextRoot}/javascripts/indexJs.js"></script>
            <script>
            </script>
        </head>

        <body>
            <form action="commodityUpload" method="post" enctype="multipart/form-data">
                <br> Commodity Name: <input type="text" name="name" value="我是商品名稱">

                <div id="Shell"> Shell:<input type="number" value="100" name="shell" min="0" max="2147483647" required></div>

                <br> Photo: <input type="file" name="photo" required="required" accept="image/png, image/gif, image/jpeg">
                <br>
                <input type="submit" value="送出">
            </form>

        </body>
        <script>
        </script>
