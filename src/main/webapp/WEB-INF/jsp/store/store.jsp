<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <c:set var="contextRoot" value="${pageContext.request.contextPath}" />
            <jsp:include page="../NavBar/CoinShellNavBar.jsp" />

            <html>
            <!-- 38:00 無法倫播標題-->

            <head>
                <meta charset="UTF-8">
                <title>Shell Shop | Coinshell</title>
                <link rel="Shortcut Icon" href="https://cdn-icons-png.flaticon.com/512/1490/1490853.png"
                    type="image/x-icon" />
                <link rel="stylesheet" href="${contextRoot}/css/bootstrap.min.css">
                <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
                <link rel="stylesheet" type="text/css" href="${contextRoot}/css/storeStyle.css">
                <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
                <script type="text/javascript" src="${contextRoot}/javascripts/store.js"></script>
                <script type="text/javascript" src="${contextRoot}/javascripts/jquery.countdown.min.js"></script>
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
                                        <p>2nd hand ipads, iphones, iMacs, MacMinis, MacbookPros, M1, black apples.</p>
                                        <a href="#">Buy Now</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-12 p-0">
                                        <div class="categories_item">
                                            <img src="${contextRoot}/images/store/coinable/category_2.png"
                                                alt="Paperbacks" class="img-fluid">
                                            <div class="categories_text">
                                                <h4>Paperbacks</h4>
                                                <p>666 items</p>
                                                <a href="#">Buy now</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-12 p-0">
                                        <div class="categories_item">
                                            <img src="${contextRoot}/images/store/coinable/category_3.png"
                                                alt="Apparels" class="img-fluid">
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
                                        <img src="https://picsum.photos/300/600" alt="">
                                        <div class="label new">New</div>
                                        <ul class="product_hover">
                                            <li><a href="#"><i class="fa fa-arrows-alt">
                                                    </i></a></li>
                                            <li><a href="#"><i class="fa fa-heart">
                                                    </i></a></li>
                                            <li><a href="#"><i class="fa fa-shopping-bag">
                                                    </i></a></li>
                                        </ul>
                                    </div>
                                    <div class="product_item_text">
                                        <h6><a href="#">ProductName1</a></h6>
                                        <div class="rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <div class="product_price">NTD 11</div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-4 col-sm-6">
                                <div class="product_item">
                                    <div class="product_item_pic">
                                        <img src="https://picsum.photos/300/602" alt="">
                                        <ul class="product_hover">
                                            <li><a href="#"><i class="fa fa-arrows-alt">
                                                    </i></a></li>
                                            <li><a href="#"><i class="fa fa-heart">
                                                    </i></a></li>
                                            <li><a href="#"><i class="fa fa-shopping-bag">
                                                    </i></a></li>
                                        </ul>
                                    </div>
                                    <div class="product_item_text">
                                        <h6><a href="#">ProductName2</a></h6>
                                        <div class="rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <div class="product_price">NTD 22</div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-4 col-sm-6">
                                <div class="product_item">
                                    <div class="product_item_pic">
                                        <img src="https://picsum.photos/303/600?grayscale" alt="">
                                        <div class="label stockout">out of stock</div>
                                        <ul class="product_hover">
                                            <li><a href="#"><i class="fa fa-arrows-alt">
                                                    </i></a></li>
                                            <li><a href="#"><i class="fa fa-heart">
                                                    </i></a></li>
                                            <li><a href="#"><i class="fa fa-shopping-bag">
                                                    </i></a></li>
                                        </ul>
                                    </div>
                                    <div class="product_item_text">
                                        <h6><a href="#">ProductName3</a></h6>
                                        <div class="rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <div class="product_price">NTD 33</div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-4 col-sm-6">
                                <div class="product_item">
                                    <div class="product_item_pic">
                                        <img src="https://picsum.photos/304/600" alt="">
                                        <ul class="product_hover">
                                            <li><a href="#"><i class="fa fa-arrows-alt">
                                                    </i></a></li>
                                            <li><a href="#"><i class="fa fa-heart">
                                                    </i></a></li>
                                            <li><a href="#"><i class="fa fa-shopping-bag">
                                                    </i></a></li>
                                        </ul>
                                    </div>
                                    <div class="product_item_text">
                                        <h6><a href="#">ProductName4</a></h6>
                                        <div class="rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <div class="product_price">NTD 44</div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-4 col-sm-6">
                                <div class="product_item">
                                    <div class="product_item_pic">
                                        <img src="https://picsum.photos/300/605?grayscale" alt="">
                                        <ul class="product_hover">
                                            <li><a href="#"><i class="fa fa-arrows-alt">
                                                    </i></a></li>
                                            <li><a href="#"><i class="fa fa-heart">
                                                    </i></a></li>
                                            <li><a href="#"><i class="fa fa-shopping-bag">
                                                    </i></a></li>
                                        </ul>
                                    </div>
                                    <div class="product_item_text">
                                        <h6><a href="#">ProductName5</a></h6>
                                        <div class="rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <div class="product_price">NTD 55</div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-4 col-sm-6">
                                <div class="product_item">
                                    <div class="product_item_pic">
                                        <img src="https://picsum.photos/300/606" alt="">
                                        <div class="label new">New</div>
                                        <ul class="product_hover">
                                            <li><a href="#"><i class="fa fa-arrows-alt">
                                                    </i></a></li>
                                            <li><a href="#"><i class="fa fa-heart">
                                                    </i></a></li>
                                            <li><a href="#"><i class="fa fa-shopping-bag">
                                                    </i></a></li>
                                        </ul>
                                    </div>
                                    <div class="product_item_text">
                                        <h6><a href="#">ProductName6</a></h6>
                                        <div class="rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <div class="product_price">NTD 66</div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-4 col-sm-6">
                                <div class="product_item">
                                    <div class="product_item_pic">
                                        <img src="https://picsum.photos/300/607" alt="">
                                        <div class="label sale">Sale</div>
                                        <ul class="product_hover">
                                            <li><a href="#"><i class="fa fa-arrows-alt">
                                                    </i></a></li>
                                            <li><a href="#"><i class="fa fa-heart">
                                                    </i></a></li>
                                            <li><a href="#"><i class="fa fa-shopping-bag">
                                                    </i></a></li>
                                        </ul>
                                    </div>
                                    <div class="product_item_text">
                                        <h6><a href="#">ProductName7</a></h6>
                                        <div class="rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <div class="product_price">NTD 77 <span>NTD 88</span></div>
                                        <!--span裡面是定價-->
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-4 col-sm-6">
                                <div class="product_item">
                                    <div class="product_item_pic">
                                        <img src="https://picsum.photos/300/608?grayscale" alt="">
                                        <ul class="product_hover">
                                            <li><a href="#"><i class="fa fa-arrows-alt">
                                                    </i></a></li>
                                            <li><a href="#"><i class="fa fa-heart">
                                                    </i></a></li>
                                            <li><a href="#"><i class="fa fa-shopping-bag">
                                                    </i></a></li>
                                        </ul>
                                    </div>
                                    <div class="product_item_text">
                                        <h6><a href="#">ProductName8</a></h6>
                                        <div class="rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <div class="product_price">NTD 88</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section class="banner bg-img">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-8 m-auto">
                                <div class="banner_slider owl-carousel owl-theme">
                                    <div class="banner_item">
                                        <div class="banner_text">
                                            <span>The Seagull Collection</span>
                                            <h1>The brand new turbines</h1>
                                            <a href="#">Buy Now</a>
                                        </div>
                                    </div>
                                    <div class="banner_item">
                                        <div class="banner_text">
                                            <span>The Seagull Collection</span>
                                            <h1>The brand new turbines</h1>
                                            <a href="#">Buy Now</a>
                                        </div>
                                    </div>
                                    <div class="banner_item">
                                        <div class="banner_text">
                                            <span>The Seagull Collection</span>
                                            <h1>The brand new turbines</h1>
                                            <a href="#">Buy Now</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section class="discount spad">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6 p-0">
                                <div class="discount_pic">
                                    <img src="${contextRoot}/images/store/discount.png" alt="" class="img-fluid">
                                </div>
                            </div>
                            <div class="col-lg-6 p-0">
                                <div class="discount_text">
                                    <div class="discount_text_title">
                                        <span>Discount</span>
                                        <h2>Summer 2022</h2>
                                        <h5><span>Sale</span> 20% OFF</h5>
                                    </div>
                                    <div class="discount_countdown" id="countdown-time">
                                        <div class="countdown_item">
                                            <span>22</span>
                                            <p>Days</p>
                                        </div>
                                        <div class="countdown_item">
                                            <span>18</span>
                                            <p>Hours</p>
                                        </div>
                                        <div class="countdown_item">
                                            <span>46</span>
                                            <p>Min</p>
                                        </div>
                                        <div class="countdown_item">
                                            <span>05</span>
                                            <p>Sec</p>
                                        </div>
                                    </div>
                                    <a href="#">Buy now</a>
                                </div>

                            </div>
                        </div>
                    </div>
                </section>

                <section class="shop-method-area spad">
                    <div class="container">
                        <div class="row d-flex justify-content-between">
                            <div class="col-lg-3 col-md-6 col-sm-12">
                                <div class="single-method mb-40">
                                    <i class="fa fa-shopping-bag"></i>
                                    <h6>Free Shipping Method</h6>
                                    <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit.!</p>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-12">
                                <div class="single-method mb-40">
                                    <i class="fa fa-lock"></i>
                                    <h6>Secure Payment System</h6>
                                    <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit.!</p>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-12">
                                <div class="single-method mb-40">
                                    <i class="fa fa-briefcase"></i>
                                    <h6>Online Support 24/7</h6>
                                    <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit.!</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section class="instagram">
                    <div class="container-fluid">
                        <div class="row m-0">
                            <div class="col-lg-2 p-0">
                                <div class="instagram_item">
                                    <img src="https://picsum.photos/300">
                                    <div class="instagram_text">
                                        <i class="fa fa-instagram"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-2 p-0">
                                <div class="instagram_item">
                                    <img src="https://picsum.photos/301">
                                    <div class="instagram_text">
                                        <i class="fa fa-instagram"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-2 p-0">
                                <div class="instagram_item">
                                    <img src="https://picsum.photos/302">
                                    <div class="instagram_text">
                                        <i class="fa fa-instagram"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-2 p-0">
                                <div class="instagram_item">
                                    <img src="https://picsum.photos/300">
                                    <div class="instagram_text">
                                        <i class="fa fa-instagram"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-2 p-0">
                                <div class="instagram_item">
                                    <img src="https://picsum.photos/301">
                                    <div class="instagram_text">
                                        <i class="fa fa-instagram"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-2 p-0">
                                <div class="instagram_item">
                                    <img src="https://picsum.photos/302">
                                    <div class="instagram_text">
                                        <i class="fa fa-instagram"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section class="newsletter-area spad">
                    <div class="container">
                        <form method="post" action="#">
                            <p class="text-center">
                                Subscribe to us for mailing list to receive updates on new arrivals, special offers and
                                other discount information.
                            </p>
                            <div class="row subscribe-sec">
                                <div class="col-md-9">
                                    <input type="email" class="form-control" id="email" name=""
                                        placeholder="${login.eMail}">
                                </div>
                                <div class="col-md-3">
                                    <button type="submit" class="btn submit">
                                        Subscribe
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </section>

                <section class="footer spad">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-4 col-md-6 col-sm-12">
                                <div class="footer_about">
                                    <div class="footer_logo">
                                        <a href="${contextPath}">Shellshop<span>.</span></a>
                                    </div>
                                    <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Commodi reiciendis
                                        aliquid porro ad et officia sit sunt quae nisi praesentium.</p>
                                    <div class="footer-social">
                                        <a href="#">
                                            <i class="fa fa-facebook"></i>
                                        </a>
                                        <a href="#">
                                            <i class="fa fa-twitter"></i>
                                        </a>
                                        <a href="#">
                                            <i class="fa fa-instagram"></i>
                                        </a>
                                        <a href="#">
                                            <i class="fa fa-linkedin"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-3">
                                <div class="footer_widget">
                                    <h6>Quick Links</h6>
                                    <ul>
                                        <li><a href="#">About</a></li>
                                        <li><a href="#">Blogs</a></li>
                                        <li><a href="#">Services</a></li>
                                        <li><a href="#">FAQ</a></li>
                                        <li><a href="#">Contact</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-3">
                                <div class="footer_widget">
                                    <h6>Accounts</h6>
                                    <ul>
                                        <li><a href="#">Accounts</a></li>
                                        <li><a href="#">Login</a></li>
                                        <li><a href="#">Order Tracking</a></li>
                                        <li><a href="#">Checkout</a></li>
                                        <li><a href="#">Wishlist</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-3">
                                <div class="footer_widget">
                                    <h6>Support</h6>
                                    <ul>
                                        <li><a href="#">Frequently Asked Questions</a></li>
                                        <li><a href="#">Terms & Conditions</a></li>
                                        <li><a href="#">Privacy Policy</a></li>
                                        <li><a href="#">Report a Payment Issue</a></li>
                                        <li><a href="#">24/7 Support</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>

                </section>
            </body>

            </html>