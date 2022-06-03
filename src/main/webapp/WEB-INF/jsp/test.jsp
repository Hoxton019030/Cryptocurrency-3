<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
        
        <c:set var="contextRoot" value="${pageContext.request.contextPath}" />
            <jsp:include page="NavBar/CoinShellNavBar.jsp" />
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
<%--     			<link rel="stylesheet" href="${contextRoot}/css/bootstrap.min.css"> --%>
                <link rel="stylesheet" href="${contextRoot}/css/slick.css" >
				<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css">
<%--                 <script src="${contextRoot}/javascripts/slick.js" ></script> --%>
<%--                 <script src="${contextRoot}/javascripts/news.js"></script> --%>
    
    
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

</head>

<body>

<div>
  <h2 class="bg-primary p-2">Coin news</h2>
  <div class="slider responsive">
    <div>
      <img src="https://picsum.photos/200/200/?random=2" alt="">
    </div>
    <div>
      <img src="https://picsum.photos/200/200/?random=1" alt="">
    </div>
    <div>
      <img src="https://picsum.photos/200/200/?random=1" alt="">
    </div>
    <div>
      <img src="https://picsum.photos/200/200/?random=1" alt="">
    </div>
    <div>
      <img src="https://picsum.photos/200/200/?random=1" alt="">
    </div>
    <div>
      <img src="https://picsum.photos/200/200/?random=1" alt="">
    </div>
    <div>
      <img src="https://picsum.photos/200/200/?random=1" alt="">
    </div>
    <div>
      <img src="https://picsum.photos/200/200/?random=3" alt="">
    </div>
  </div>
</div>



    <form action="fileUpload" method="post" enctype="multipart/form-data">
        name: <input id="photoName" name="photoName" />
        <br /> file: <input type="file" name="file">

        <br />
        <input type="submit" value="éåº">

    </form>
    
                <script src="${contextRoot}/javascripts/slick.js" ></script>
                <script src="${contextRoot}/javascripts/news.js"></script>
</body>

</html>