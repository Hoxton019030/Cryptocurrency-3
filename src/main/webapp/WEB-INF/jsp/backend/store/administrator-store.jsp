<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="../backendNavBar.jsp" />

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
    </head>

    <body>

        <a href="store/addCommodity">新增商品 </a>
        <br>
        <a href="store/showAllCommodities">全部商品 </a>

    </body>
