<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>貨幣資訊頁面</title>
            <c:set var="contextRoot" value="${pageContext.request.contextPath}"></c:set>
            <link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
            <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
            <link rel="stylesheet" href="/resources/demos/style.css">
            <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
            <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>

        </head>

        <body>

            <div id="test">

            </div>
            <script>
                $(function() {
                    fetch("http://localhost:8080/myapp/news/get?currencyName=BTC").then(function(response) {
                        return response.json();
                    }).then(function(array) {
                        $.each(array, function(index, value) {
                            $("#test").append(`id:` + value.id).append(`<br>Title:` + value.title + `<br>`)
                        })



                    })
                })
            </script>

        </body>

        </html>