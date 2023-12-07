<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/6/2023
  Time: 10:25 AM
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
    <link rel="stylesheet" href="./steam.css">
    <link rel="stylesheet" href="./fonts/fontawesome-free-6.4.0-web/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.css"
          integrity="sha512-wR4oNhLBHf7smjy0K4oqzdWumd+r5/+6QO/vDda76MW5iug4PT7v86FoEkySIJft3XA0Ae6axhIvHrqwm793Nw=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
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

            <a class="container__header-login-a">${account.getEmail()   }</a>
            <a href="home.jsp">Log out</a>
            <span class="container__header-login-p">language
                    <i class="fa-solid fa-chevron-down"></i>
                </span>
        </div>
    </div>
</section>
<section class="fixHeight">
</section>
<!-- Body -->
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
                    <form class="search__form" action="/game-servlet?index=1" method="post">
                        <input placeholder="  search" class="search-input" type="text" name="txtSearch">
                        <button type="submit" class="btn__btn-sumit" name="action" value="search">
                            <i class="fa-solid fa-magnifying-glass"></i>
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<section style="height: 1450px;">
    <div class="menu__products">
        <div class="list_products">
            <!-- Product 1 -->
            <div class="item_products">
                <img src="https://cdn.akamai.steamstatic.com/steam/apps/2050650/hero_capsule_alt_assets_0.jpg?t=1696242724"
                     alt="">
                <div class="data__product-hover">
                    <div class="data__product-video">
                        <video loop="loop" muted autoplay >
                            <source
                                    src="https://cdn.cloudflare.steamstatic.com/steam/apps/256938327/microtrailer.webm?t=1680071426"
                                    type="video/webm">
                        </video>
                    </div>
                    <div class="data__product-description">
                        <div class="description-products">
                            <h3>Resident Evil 4</h3>
                            <p>Overwhelmingly Positive (69,542)</p>
                            <ul class="data__product-review">
                                <li><a href="">Action</a></li>
                                <li><a href="">Horror</a></li>
                                <li><a href="">Survival Horror</a></li>
                                <li><a href="">Third-Person Shooter</a></li>
                                <li><a href="">Zombies</a></li>
                            </ul>
                            <button><span><a class="new-a" href="http://localhost:8080/detail_game/detail_game.jsp">Add to Cart</a></span></button>
                        </div>
                    </div>
                </div>

                <div class="price__products">
                    <div class="discount">-50%</div>
                    <div class="price__products-container">
                        <div class="discount__price">1.900.000đ</div>
                        <div class="discount__price-final"> 900.000đ</div>
                    </div>
                </div>
            </div>
            <!-- Product 2 -->
            <div class="item_products">
                <img src="https://cdn.akamai.steamstatic.com/steam/apps/814380/hero_capsule.jpg?t=1678991267"
                     alt="">
                <div class="data__product-hover">
                    <div class="data__product-video">
                        <video loop="loop" muted autoplay >
                            <source
                                    src="https://cdn.cloudflare.steamstatic.com/steam/apps/256806899/microtrailer.webm?t=1603837979"
                                    type="video/webm">
                        </video>
                    </div>
                    <div class="data__product-description">
                        <div class="description-products">
                            <h3>Sekiro: Shadows Die Twice - GOTY Edition</h3>
                            <p>Overwhelmingly Positive (185,538)</p>
                            <ul class="data__product-review">
                                <li><a href="">Souls-like</a></li>
                                <li><a href="">Difficult</a></li>
                                <li><a href="">Action</a></li>
                                <li><a href="">Single player</a></li>
                                <li><a href="">Ninja</a></li>
                            </ul>
                            <button><span><a class="new-a" href="http://localhost:8080/detail_game/detail_game.jsp">Add to Cart</a></span></button>
                        </div>
                    </div>
                </div>

                <div class="price__products">
                    <div class="discount">-50%</div>
                    <div class="price__products-container">
                        <div class="discount__price">1.290.000đ</div>
                        <div class="discount__price-final">645.000đ</div>
                    </div>
                </div>
            </div>
            <!-- Product 3 -->
            <div class="item_products">
                <img src="https://cdn.akamai.steamstatic.com/steam/apps/1326470/hero_capsule.jpg?t=1697048131"
                     alt="">
                <div class="data__product-hover">
                    <div class="data__product-video">
                        <video loop="loop" muted autoplay >
                            <source
                                    src="https://cdn.akamai.steamstatic.com/steam/apps/256932123/microtrailer.webm?t=1677175226"
                                    type="video/webm">
                        </video>
                    </div>
                    <div class="data__product-description">
                        <div class="description-products">
                            <h3>Sons Of The Forest</h3>
                            <p>Overwhelmingly Positive (69,542)</p>
                            <ul class="data__product-review">
                                <li><a href="">Survival</a></li>
                                <li><a href="">Open World</a></li>
                                <li><a href="">Multiplayer</a></li>
                                <li><a href="">Survival Horror</a></li>
                                <li><a href="">Co-op</a></li>
                            </ul>
                            <button><span><a class="new-a" href="http://localhost:8080/detail_game/detail_game.jsp">Add to Cart</a></span></button>
                        </div>
                    </div>
                </div>

                <div class="price__products">
                    <div class="discount">-20%</div>
                    <div class="price__products-container">
                        <div class="discount__price">385.000đ</div>
                        <div class="discount__price-final">308.000đ</div>
                    </div>
                </div>
            </div>
            <!-- Product 4 -->
            <div class="item_products">
                <img src="https://cdn.akamai.steamstatic.com/steam/apps/1593500/hero_capsule.jpg?t=1695758729"
                     alt="">

                <div class="data__product-hover">
                    <div class="data__product-video">
                        <video loop="loop" muted autoplay >
                            <source
                                    src="https://cdn.cloudflare.steamstatic.com/steam/apps/256864004/microtrailer.webm?t=1639001817"
                                    type="video/webm">
                        </video>
                    </div>
                    <div class="data__product-description">
                        <div class="description-products">
                            <h3>God of War</h3>
                            <p>Overwhelmingly Positive (79,638)</p>
                            <ul class="data__product-review">
                                <li><a href="">Action</a></li>
                                <li><a href="">Singleplayer</a></li>
                                <li><a href="">Story Rich</a></li>
                                <li><a href="">Advendture</a></li>
                                <li><a href="">Mythology</a></li>
                            </ul>
                            <button><span><a class="new-a" href="http://localhost:8080/detail_game/detail_game.jsp">Add to Cart</a></span></button>
                        </div>
                    </div>
                </div>

                <div class="price__products">
                    <div class="discount">-40%</div>
                    <div class="price__products-container">
                        <div class="discount__price">1.159.000đ</div>
                        <div class="discount__price-final">695.500đ</div>
                    </div>
                </div>
            </div>
            <!-- Product 5 -->
            <div class="item_products">
                <img src="https://cdn.akamai.steamstatic.com/steam/apps/962130/hero_capsule.jpg?t=1699908769"
                     alt="">

                <div class="data__product-hover">
                    <div class="data__product-video">
                        <video loop="loop" muted autoplay >
                            <source
                                    src="https://cdn.cloudflare.steamstatic.com/steam/apps/256982368/microtrailer.webm?t=1699907911"
                                    type="video/webm">
                        </video>
                    </div>
                    <div class="data__product-description">
                        <div class="description-products">
                            <h3>Grounded</h3>
                            <p>Very Positive (50,176)</p>
                            <ul class="data__product-review">
                                <li><a href="">Survival</a></li>
                                <li><a href="">Multiplayer</a></li>
                                <li><a href="">Open World Survival Craft</a></li>
                                <li><a href="">Base Building</a></li>
                                <li><a href="">Co-op</a></li>
                            </ul>
                            <button><span><a class="new-a" href="http://localhost:8080/detail_game/detail_game.jsp">Add to Cart</a></span></button>
                        </div>
                    </div>
                </div>

                <div class="price__products">
                    <div class="discount">-40%</div>
                    <div class="price__products-container">
                        <div class="discount__price">649.000đ</div>
                        <div class="discount__price-final">389.500đ</div>
                    </div>
                </div>
            </div>
            <!-- Product 6 -->
            <div class="item_products">
                <img src="https://cdn.akamai.steamstatic.com/steam/apps/1501750/hero_capsule.jpg?t=1700572672"
                     alt="">

                <div class="data__product-hover">
                    <div class="data__product-video">
                        <video loop="loop" muted autoplay >
                            <source
                                    src="https://cdn.cloudflare.steamstatic.com/steam/apps/256975850/microtrailer.webm?t=1697236277"
                                    type="video/webm">
                        </video>
                    </div>
                    <div class="data__product-description">
                        <div class="description-products">
                            <h3>Lords of the Fallen</h3>
                            <p>Mixed (16,743)</p>
                            <ul class="data__product-review">
                                <li><a href="">Souls-like</a></li>
                                <li><a href="">RPG</a></li>
                                <li><a href="">Dark Fantasy</a></li>
                                <li><a href="">Co-op</a></li>
                                <li><a href="">Action</a></li>
                            </ul>
                            <button><span><a class="new-a" href="http://localhost:8080/detail_game/detail_game.jsp">Add to Cart</a></span></button>
                        </div>
                    </div>
                </div>

                <div class="price__products">
                    <div class="discount">-34%</div>
                    <div class="price__products-container">
                        <div class="discount__price">990.000đ</div>
                        <div class="discount__price-final">653.500đ</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container__header-part">
            <h2>TOP SALES</h2>
        </div>
        <div class="list__products-part2">
            <!-- product 1 -->
            <a href="http://localhost:8080/detail_game/detail_game.jsp">
                <div class="list__products-sales">
                    <img src="./img/outlast.jfif" alt="">
                    <div class="list__products-hover-min">
                        <div class="data__product-hover-min">
                            <video loop="loop" preload="none" muted autoplay >
                                <source
                                        src="./video/outlast.webm"
                                        type="video/webm" >
                            </video>
                        </div>
                    </div>
                    <div class="price__products">
                        <div class="discount">-12%</div>
                        <div class="price__products-container">
                            <div class="discount__price">260.000đ</div>
                            <div class="discount__price-final">229.000đ</div>
                        </div>
                    </div>
                </div>
            </a>

            <!-- product 2 -->
            <a href="http://localhost:8080/detail_game/detail_game.jsp">
                <div class="list__products-sales">
                    <img src="./img/payday 3.webp" alt="">
                    <div class="list__products-hover-min">
                        <div class="data__product-hover-min">
                            <video loop="loop" preload="none" muted autoplay >
                                <source
                                        src="./video/payday3.webm"
                                        type="video/webm" >
                            </video>
                        </div>
                    </div>
                    <div class="price__products">
                        <div class="discount">-60%</div>
                        <div class="price__products-container">
                            <div class="discount__price">321.000đ</div>
                            <div class="discount__price-final">128.500đ</div>
                        </div>
                    </div>
                </div>
            </a>
            <!-- product 3 -->
            <a href="http://localhost:8080/detail_game/detail_game.jsp">
                <div class="list__products-sales">
                    <img src="https://cdn.akamai.steamstatic.com/steam/apps/251570/capsule_616x353.jpg?t=1697073509" alt="">
                    <div class="list__products-hover-min">
                        <div class="data__product-hover-min">
                            <video loop="loop" preload="none" muted autoplay >
                                <source
                                        src="./video/7daystodie.webm"
                                        type="video/webm" >
                            </video>
                        </div>
                    </div>
                    <div class="price__products">
                        <div class="discount">-34%</div>
                        <div class="price__products-container">
                            <div class="discount__price">319.000đ</div>
                            <div class="discount__price-final">210.500đ</div>
                        </div>
                    </div>
                </div>
            </a>
            <!-- product 4 -->
            <a href="http://localhost:8080/detail_game/detail_game.jsp">
                <div class="list__products-sales">
                    <img src="https://cdn.akamai.steamstatic.com/steam/apps/394360/capsule_616x353.jpg?t=1700599414" alt="">
                    <div class="list__products-hover-min">
                        <div class="data__product-hover-min">
                            <video loop="loop" preload="none" muted autoplay >
                                <source
                                        src="./video/hearsofiron.webm"
                                        type="video/webm" >
                            </video>
                        </div>
                    </div>
                    <div class="price__products">
                        <div class="discount">-85%</div>
                        <div class="price__products-container">
                            <div class="discount__price">700.000đ</div>
                            <div class="discount__price-final">105.000đ</div>
                        </div>
                    </div>
                </div>
            </a>
            <!-- Part 2 -->
            <!-- product 1 -->
            <a href="http://localhost:8080/detail_game/detail_game.jsp">
                <div class="list__products-sales-large">
                    <img src="https://cdn.akamai.steamstatic.com/steam/apps/1222700/capsule_616x353.jpg?t=1626878628" alt="">
                    <div class="list__products-hover-large">
                        <div class="data__product-hover-min">
                            <video loop="loop" preload="none" muted autoplay >
                                <source
                                        src="https://cdn.akamai.steamstatic.com/steam/apps/256790157/microtrailer.webm?t=1592600313"
                                        type="video/webm" >
                            </video>
                        </div>
                    </div>
                    <div class="price__products">
                        <div class="discount">-12%</div>
                        <div class="price__products-container">
                            <div class="discount__price">260.000đ</div>
                            <div class="discount__price-final">229.000đ</div>
                        </div>
                    </div>
                </div>
            </a>

            <!-- product 2 -->
            <a href="http://localhost:8080/detail_game/detail_game.jsp">
                <div class="list__products-sales-large">
                    <img src="https://cdn.akamai.steamstatic.com/steam/apps/1888930/capsule_616x353.jpg?t=1697567304" alt="">
                    <div class="list__products-hover-large">
                        <div class="data__product-hover-min">
                            <video loop="loop" preload="none" muted autoplay >
                                <source
                                        src="https://cdn.cloudflare.steamstatic.com/steam/apps/256936971/microtrailer.webm?t=1680015399"
                                        type="video/webm" >
                            </video>
                        </div>
                    </div>
                    <div class="price__products">
                        <div class="discount">-33%</div>
                        <div class="price__products-container">
                            <div class="discount__price">1.399.000đ</div>
                            <div class="discount__price-final">937.500đ</div>
                        </div>
                    </div>
                </div>
            </a>
            <!-- product 3 -->
            <a href="http://localhost:8080/detail_game/detail_game.jsp">
                <div class="list__products-sales-large">
                    <img src="https://cdn.akamai.steamstatic.com/steam/apps/1426210/capsule_616x353.jpg?t=169100646" alt="">
                    <div class="list__products-hover-large">
                        <div class="data__product-hover-min">
                            <video loop="loop" preload="none" muted autoplay >
                                <source
                                        src="https://cdn.cloudflare.steamstatic.com/steam/apps/256827093/microtrailer.webm?t=1616514535"
                                        type="video/webm" >
                            </video>
                        </div>
                    </div>
                    <div class="price__products">
                        <div class="discount">-70%</div>
                        <div class="price__products-container">
                            <div class="discount__price">790.000đ</div>
                            <div class="discount__price-final">237.000đ</div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
    </div>
    <div class="end__container">
        <div class="container__content">
            <hr>
            <div class="container__content-main">
                <div class="container__content-img">
                    <img src="./img/399932046_361457652925746_2513704301500335433_n.jpg" alt="">
                </div>
                <div class="container__content-word">
                        <span>
                           @ Shop steam của Bảo Lê. Tất cả các nhãn hiệu đều là tài sản của chủ sở hữu tương ứng ở Việt Nam và các quốc gia khác.VAT đã bao gồm trong tất cả các giá nếu có.
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
</section>
<script src="./js.js">
</script>

</body>

</html>