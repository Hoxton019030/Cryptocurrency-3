<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <c:set var="contextRoot" value="${pageContext.request.contextPath}" />
            <jsp:include page="../NavBar/CoinShellNavBar.jsp" />

            <html>

            <head>
                <meta charset="UTF-8">
                <title>Shell Shop | Coinshell</title>
                <link rel="Shortcut Icon" href="https://cdn-icons-png.flaticon.com/512/1490/1490853.png"
                    type="image/x-icon" />
                <link rel="stylesheet" href="${contextRoot}/css/bootstrap.min.css">
                <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
                <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
                <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
                <link rel="stylesheet" type="text/css" href="${contextRoot}/css/storeStyle.css">
            </head>

            <body>
                <header class="header">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-3">
                                <div class="header_logo">
                                    <a href="${contextPath}"><span>Shell</span>Shop_</a>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <nav class="header_menu">
                                    <ul>
                                        <li class="active"><a href="${contextPath}">Home</a></li>
                                        <li><a href="#">Electronics</a></li>
                                        <li><a href="#">Paperbacks</a></li>
                                        <li><a href="#">Apparels</a></li>
                                        <li><a href="#">Accessories</a></li>
                                        <li><a href="#"><i class="fa-solid fa-sailboat"></i>&nbsp;Avatars</a></li>
                                        <li><a href="#"><i class="fa-solid fa-sailboat"></i>&nbsp;Badges</a></li>
                                    </ul>
                                </nav>
                            </div>
                            <div class="col-lg-3">
                                <div class="header_right">
                                    <div class="header_right_auth">
                                        <a href="#">Saved (LN)</a>
                                        <a href="#">Cart (RG)</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </header>
                
                <section class="categories">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-6 p-0">
                                <div class="categories_item categories_large_item">
                                    <img src="${contextRoot}/images/store/coinable/category_1.png" alt="Electronics"
                                        class="img-fluid">
                                    <div class="categories_text">
                                        <h1>Electronics</h1>
                                        <p>Ipads, iphones, iMacs, MacMinis, MacbookPros, M1, black apples.</p>
                                        <a href="#">Buy Now</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-12 p-0">
                                        <div class="categories_item">
                                            <img src="${contextRoot}/images/store/coinable/category_2.png" alt="Paperbacks"
                                                class="img-fluid">
                                            <div class="categories_text">
                                                <h4>Paperbacks</h4>
                                                <p>666 items</p>
                                                <a href="#">Buy now</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-12 p-0">
                                        <div class="categories_item">
                                            <img src="${contextRoot}/images/store/coinable/category_3.png" alt="Apparels"
                                                class="img-fluid">
                                                <div class="categories_text">
                                                    <h4>Apparels</h4>
                                                    <p>666 items</p>
                                                    <a href="#">Buy now</a>
                                                </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-12 p-0">
                                        <div class="categories_item">
                                            <img src="${contextRoot}/images/store/coinable/category_4.png"
                                                alt="Accessories" class="img-fluid">
                                                <div class="categories_text">
                                                    <h4>Accessories</h4>
                                                    <p>666 items</p>
                                                    <a href="#">Buy now</a>
                                                </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-12 p-0">
                                        <div class="categories_item">
                                            <img src="${contextRoot}/images/store/shellable/category_5.png"
                                                alt="Avatars" class="img-fluid">
                                                <div class="categories_text">
                                                    <h4><i class="fa-solid fa-sailboat"></i>&nbsp;Avatars</h4>
                                                    <p>666 items</p>
                                                    <a href="#">Buy now</a>
                                                </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                </section>
                <section class="product spad">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 text-center">
                                <div class="section-title">
                                    <h4>New Product</h4>
                                </div>
                            </div>
                        </div>
                        <div class="row property_gallery">
                            <div class="col-lg-3 col-md-4 col-sm-6">
                                <div class="product_item">
                                    <div class="product_item_pic">
                                        <img src="#" alt="">
                                        <div class="label">New</div>
                                        <ul class="product_hover">
                                            <li><a href="#"><span class="arrow_axpand">
                                            </span></a></li>
                                            <li><a href="#"><span class="arrow_axpand">
                                            </span></a></li>
                                            <li><a href="#"><span class="arrow_axpand">
                                            </span></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

            </body>

            </html>