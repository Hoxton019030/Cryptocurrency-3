<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
            <c:set var="contextRoot" value="${pageContext.request.contextPath}" />
            <jsp:include page="../NavBar/CoinShellNavBar.jsp" />

            <html>

            <head>
                <meta charset="UTF-8">
                <title>Shell Shop | Coinshell</title>
                <link rel="Shortcut Icon" href="https://cdn-icons-png.flaticon.com/512/1490/1490853.png" type="image/x-icon" />
                <link rel="stylesheet" href="${contextRoot}/css/bootstrap.min.css">
                <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
                <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
                <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
                <style>

                </style>
            </head>

            <body>
                <header class="bg-dark py-5">
                    <div class="container px-4 px-lg-5 my-5">
                        <div class="text-center text-white">
                            <h1 class="display-4 fw-bolder">Shop in style</h1>
                            <p class="lead fw-normal text-white-50 mb-0">With this shop hompeage template</p>
                        </div>
                    </div>
                </header>
            </body>

            </html>