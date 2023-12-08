<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/6/2023
  Time: 10:44 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Document</title>
    <link rel="stylesheet" href="./cart.css">
    <link rel="stylesheet" href="./fonts/fontawesome-free-6.4.0-web/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.css"
          integrity="sha512-wR4oNhLBHf7smjy0K4oqzdWumd+r5/+6QO/vDda76MW5iug4PT7v86FoEkySIJft3XA0Ae6axhIvHrqwm793Nw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.js"
            integrity="sha512-WNZwVebQjhSxEzwbettGuQgWxbpYdoLf7mH+25A7sfQbbxKeS5SQ9QBf97zOY4nOlwtksgDA/czSTmfj4DUEiQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>

<body>
<!-- Header -->
<section class="navbar">
    <div class="container__header inner">
        <div class="container__header-home">
            <a href=""> <img class="img__steam"
                             src="https://store.cloudflare.steamstatic.com/public/shared/images/header/logo_steam.svg?t=962016"
                             alt=""></a>
        </div>
        <div class="container__header-select">
            <a href="" class="container__header-select-link">STORE</a>
            <a href="" class="container__header-select-link">COMMUNITY</a>
            <a href="" class="container__header-select-link">ABOUT</a>
            <a href="" class="container__header-select-link">SUPPORT</a>
        </div>
        <div class="container__header-login">
            <div class="container__header-login-install">
                <button class="btn_installe">
                    <i class="fa-solid fa-download"></i>
                    <span>Install Steam</span>
                </button>
            </div>
            <a class="container__header-login-a" href="">login</a>
            <span class="container__header-login-p">language
                    <i class="fa-solid fa-chevron-down"></i>
                </span>
        </div>
        <div class="incon__cart">
            <i class="fa-solid fa-cart-shopping"></i>
        </div>
    </div>
</section>
<section class="fixHeight">
</section>
<section class="content">
    <div class="container_body">
        <div class="page_background_holder">
        </div>
        <div class="inner book__menu-main">
            <div class="container__menu">
                <ul class="container__list">
                    <li class="container__list-menu"><a href="">Your Store</a></li>
                    <li class="container__list-menu"><a href="">New & Noteworthy</a></li>
                    <li class="container__list-menu"><a href="">Categories</a></li>
                    <li class="container__list-menu"><a href="">Points Shop</a></li>
                    <li class="container__list-menu"><a href="">News</a></li>
                    <li class="container__list-menu"><a href="">Labs</a></li>
                </ul>
                <div class="container__search">
                    <form class="search__form" action="">
                        <input placeholder="  search" class="search-input" type="text">
                        <button class="btn__btn-sumit">
                            <i class="fa-solid fa-magnifying-glass"></i>
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<section style="height: 1000px;">
    <div class="menu__products-cart">
        <div class="container__products-cart">
            <div class="header-cart">
                <h1>YOUR SHOPPING CART</h1>
            </div>
            <div class="products__cart-list">

            </div>
        </div>
    </div>
    <div class="menu__cart">
        <!-- 1 -->
        <c:forEach items="${cart_list}" var="game" varStatus="loop">
        <div class="menu__cart-list">
            <div class="container__cart">
                <div class="container__cart-img">
                    <img src="${game.imageCoverUrl}" alt="cover image error">
                </div>
                <div class="container__cart-name">
                        <span class="name-detail">
                            ${game.title}
                        </span>
                    <span class="icon__window"></span>
                </div>
                <div class="cart-price">
                    <div class="cart__price-final">
                        ${game.price}
                    </div>
                    <form action="/game-servlet" method="post">
                        <input type="hidden" name="user_id" value="1">
                        <input type="hidden" name="game_id" value="${game.gameId}">
                        <button type="submit" name="action" value="remove_cart_item">Remove</button>
                    </form>

                </div>
            </div>
        </div>
        </c:forEach>

        <!-- Pay -->
        <div class="menu__cart">
            <div class="btn__pay">
                <button>Purchase</button>
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