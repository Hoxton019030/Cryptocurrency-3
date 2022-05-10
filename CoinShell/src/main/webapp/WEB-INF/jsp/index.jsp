<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>跳轉頁面</title>
                <c:set var="contextRoot" value="${pageContext.request.contextPath}"></c:set>
            </head>

            <body>

                <form action="individualCryptocurrencyInformation" method="get">
                    <input type="text" name="currencyName" value="BTC">
                    <input type="submit">
                </form>




            </body>

            </html>