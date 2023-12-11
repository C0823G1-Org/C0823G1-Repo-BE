<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/6/2023
  Time: 3:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Document</title>
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/cart.css">--%>
    <link rel="stylesheet" href="../search/cart.css">
    <link rel="stylesheet" href="./fonts/fontawesome-free-6.4.0-web/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.css"
          integrity="sha512-wR4oNhLBHf7smjy0K4oqzdWumd+r5/+6QO/vDda76MW5iug4PT7v86FoEkySIJft3XA0Ae6axhIvHrqwm793Nw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.js"
            integrity="sha512-WNZwVebQjhSxEzwbettGuQgWxbpYdoLf7mH+25A7sfQbbxKeS5SQ9QBf97zOY4nOlwtksgDA/czSTmfj4DUEiQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.css"/>
</head>
<body>
<!-- Header -->
<jsp:include page="../include/header.jsp"></jsp:include>
<%--Body--%>
<section class="content">
    <div class="container_body">
        <div class="page_background_holder">
        </div>
        <div class="inner book__menu-main">
            <div class="container__menu">
                <ul class="container__list">
                    <li class="container__list-menu"><a href="">Your Store</a></li>
                    <li class="container__list-menu"><a href="">New & Noteworthy</a></li>
                    <li class="container__list-menu">
                        <a href="">Categories</a>
                        <ul class="tag__game">
                            <li class="tag__game-list"><a href="/game-servlet?action=searchCatelogy&catelogy=Action&index=1">Action</a></li>
                            <li class="tag__game-list"><a href="/game-servlet?action=searchCatelogy&catelogy=Role-Playing&index=1">Role-Playing</a></li>
                            <li class="tag__game-list"><a href="/game-servlet?action=searchCatelogy&catelogy=JRPG&index=1">JRPG</a></li>
                            <li class="tag__game-list"><a href="/game-servlet?action=searchCatelogy&catelogy=Hack&index=1">Hack & Slash</a></li>
                            <li class="tag__game-list"><a href="/game-servlet?action=searchCatelogy&catelogy='Arcade'&index=1">Arcade & Rhythm</a></li>
                            <li class="tag__game-list"><a href="/game-servlet?action=searchCatelogy&catelogy=Casual&index=1">Casual</a></li>
                        </ul>
                    </li>
                    <li class="container__list-menu"><a href="">Points Shop</a></li>
                    <li class="container__list-menu"><a href="">News</a></li>
                    <li class="container__list-menu"><a href="">Labs</a></li>
                </ul>
                <div class="container__search">
                    <form class="search__form" action="/game-servlet?index=1" method="post">
                        <input placeholder="  search" class="search-input" type="text" name="txtSearch">
                        <button type="submit" class="btn__btn-sumit" name="action" value="search">
                            <i style="color: black !important;" class="fa-solid fa-magnifying-glass"></i>
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<section style="height: 800px;">
    <div class="menu__products-cart">
        <div class="container__products-cart">
            <div class="header-cart">
                <h1>Search Game</h1>
            </div>
            <div class="products__cart-list">

            </div>
        </div>
    </div>
    <div class="menu__cart">
        <!-- 1 -->
        <c:forEach items="${list}" var="game">
            <div style="margin-bottom: 40px !important;" class="menu__cart-list">
                <div class="container__cart">
                    <div class="container__cart-img">
                        <img style="width: 200px;height:150px !important; "src="${game.url}" alt="">
                    </div>
                    <div class="container__cart-name">
                        <span class="name-detail">
                                ${game.name}
                        </span>
                        <span class="icon__window"></span>
                    </div>
                    <div class="cart-price">
                        <div style="color: #c7d5e0; font-size: 20px !important;" class="cart__price-final">
                                ${game.price}$
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
        <c:forEach items="${listCatelogy}" var="catelogy">
            <div style="margin-bottom: 40px !important;" class="menu__cart-list">
                <div class="container__cart">
                    <div class="container__cart-img">
                        <img style="width: 200px;height:150px !important; "src="${catelogy.url}" alt="">
                    </div>
                    <div class="container__cart-name">
                        <span class="name-detail">
                                ${catelogy.title}
                        </span>
                        <span class="icon__window"></span>
                    </div>
                    <div class="cart-price">
                        <div style="color: #c7d5e0; font-size: 20px !important;" class="cart__price-final">
                                ${catelogy.price}$
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
        <c:if test="${count == 0}">
            <div style="margin-top: 50px"><span style="color: #c7d5e0; font-size: 30px ; font-weight: bold">${Error}</span></div>
        </c:if>
        <c:if test="${countCatelogy == 0}">
            <div style="margin-top: 50px"><span style="color: #c7d5e0; font-size: 30px ; font-weight: bold">${Error}</span></div>
        </c:if>
    </div>
    <!-- Pay -->
    <div class="menu__cart">
        <div style="display: block !important;" class="btn__pay">
            <c:forEach begin="1" end="${endPage}" var="i">
                <a href="/game-servlet?action=search&index=${i}&txtSearch=${text}">${i}</a>
            </c:forEach>
        </div>
    </div>
</section>
<div class="end__container">
    <div class="container__content">
        <hr>
        <div class="container__content-main">
            <div class="container__content-img">
                <img src="./img/399932046_361457652925746_2513704301500335433_n.jpg" alt="">
            </div>
            <div class="container__content-word">
                    <span>
                        @ Shop steam của Bảo Lê. Tất cả các nhãn hiệu đều là tài sản của chủ sở hữu tương ứng ở
                        Việt Nam và các quốc gia khác.VAT đã bao gồm trong tất cả các giá nếu có.
                        <a href="">Privacy Policy </a>|
                        <a href="">Legal</a>|
                        <a href="">Steam Subscriber Agreement</a>|
                        <a href="">Refunds</a>|
                        <a href="">Cookies</a>
                    </span>
            </div>
            <div class="container__content-steam">
                <img src="https://store.akamai.steamstatic.com/public/images/v6/logo_steam_footer.png" alt="">
            </div>
        </div>
        <hr>
        <div class="container__content-link">
                <span>
                    <a href="">About Vavle</a>|
                    <a href="">Jobs</a>|
                    <a href="">Steamworks</a>|
                    <a href="">Steam Distribution</a>|
                    <a href="">Support</a>|
                    <a href="">Gift Cards</a>|
                    <a href=""><i class="fa-brands fa-facebook"></i> Steam</a>|
                    <a href=""><i class="fa-brands fa-twitch"></i> @Steam</a>
                </span>
        </div>
    </div>
</div>
</body>

</html>