<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/6/2023
  Time: 10:34 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/web.css" type="text/css">--%>
    <link rel="stylesheet" href="../css/web.css">
<%--    <link rel="stylesheet" href="/css/web.css">--%>
    <link rel="stylesheet" href="./fonts/fontawesome-free-6.4.0-web/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.css"
          integrity="sha512-wR4oNhLBHf7smjy0K4oqzdWumd+r5/+6QO/vDda76MW5iug4PT7v86FoEkySIJft3XA0Ae6axhIvHrqwm793Nw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.js"
            integrity="sha512-WNZwVebQjhSxEzwbettGuQgWxbpYdoLf7mH+25A7sfQbbxKeS5SQ9QBf97zOY4nOlwtksgDA/czSTmfj4DUEiQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <style>
        .price__products button span{
            display: block;
            padding: 6px 14px;
            font-size: 15px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<!-- Header -->
<jsp:include page="../include/header.jsp"/>
<!-- Body -->
<section class="content">
    <div class="container_body">
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
                            <li class="tag__game-list"><a href="/game-servlet?action=searchCatelogy&catelogy=Hack & Slash&index=1">Hack & Slash</a></li>
                            <li class="tag__game-list"><a href="/game-servlet?action=searchCatelogy&catelogy=Arcade & Rhythm&index=1">Arcade & Rhythm</a></li>
                            <li class="tag__game-list"><a href="/game-servlet?action=searchCatelogy&catelogy=Casual&index=1">Casual</a></li>
                        </ul>
                    </li>
                    <li class="container__list-menu"><a href="">Points Shop</a></li>
                    <li class="container__list-menu"><a href="">News</a></li>
                    <li class="container__list-menu"><a href="">Labs</a></li>
                </ul>
                <div class="container__search">
                    <form class="search__form" action="/game-servlet" method="get">
                        <input placeholder="  search" class="search-input" type="text" name="txtSearch">
                        <input type="hidden" name="index" value="1">
                        <input type="hidden" name="action" value="search">
                        <button type="submit" class="btn__btn-sumit" name="action" value="search">
                            <i class="fa-solid fa-magnifying-glass"></i>
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="container__body-main" style="height: 1700px;">
    <div class="menu__products-web">
        <div class="container__body-products">
            <div class="container__wed-product">
                <div class="name__product">
                    <span>${listDetail.title}</span>
                    <div class="comminity__product">
                        <a href="">Community Hub</a>
                    </div>
                </div>
                <div class="body__wed-product">
                    <div class="products__video">
                        <video autoplay loop="loop" muted
                               src="${listDetail.videoUrl}"></video>
                    </div>
                    <div class="products_description">
                        <img src="${listDetail.url}"
                             alt="">
                        <span>
                                ${listDetail.description}
                            </span>
                        <div class="wed__category">
                            <span>Popular user-defined tags for this product:</span>
                            <ul class="web__product-review">
                                <li><a href="">Action</a></li>
                                <li><a href="">Horror</a></li>
                                <li><a href="">Survival Horror</a></li>
                                <li><a href="">Third-Person Shooter</a></li>
                                <li><a href="">Zombies</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Produce -->
        <div class="container__body-products">
            <div class="container__wed-product">
                <div class="body__wed-product">
                    <!-- Left column -->
                    <div class="left__column">
                        <div class="products__buy">
                            <!-- Detail1 -->
                            <div class="products__buy-products">
                                <div class="products__buy-games">
                                    <img src="https://store.akamai.steamstatic.com/public/images/v6/icon_platform_win.png?v=3"
                                         alt="">
                                    <h1>Buy ${listDetail.title}</h1>
                                    <p>SPECIAL PROMOTION! Offer ends in </p>
                                </div>
                                <%-- When user is a guess --%>
                                <c:if test="${sessionScope.userDto == null}">
                                    <c:if test="${requestScope.isInGuessCart==null}">
                                        <jsp:forward page="/game-servlet">
                                            <jsp:param name="action" value="check_if_game_in_cart"/>
                                            <jsp:param name="game_id" value="1"/>
                                            <jsp:param name="path_to_return" value="/detail_game/detail_game.jsp"/>
                                        </jsp:forward>
                                    </c:if>
                                    <c:if test="${requestScope.isInGuessCart}">
                                        <div class="price__products">
                                            <form action="/game-servlet">
                                                <input type="hidden" name="game_id" value="1">
                                                <button type="submit" name="action" value="show_cart">
                                                    <span>In Cart</span>
                                                </button>
                                            </form>
                                        </div>
                                    </c:if>
                                    <c:if test="${!requestScope.isInGuessCart}">
                                        <div class="price__products">
                                            <span class="discount">${listDetail.percentDiscount}</span>
                                            <div class="price__products-container">
                                                <div class="discount__price">${listDetail.price}$</div>
                                                <c:choose>
                                                    <c:when test="${listDetail.percentDiscount == '50%'}">
                                                        <div class="discount__price-final"><fmt:formatNumber type="number" maxFractionDigits="2" value="${listDetail.price * 0.5}"/>$</div>
                                                    </c:when>
                                                    <c:when test="${listDetail.percentDiscount == '30%'}">
                                                        <div class="discount__price-final"><fmt:formatNumber type="number" maxFractionDigits="2" value="${listDetail.price * 0.3}"/>$</div>
                                                    </c:when>
                                                    <c:when test="${listDetail.percentDiscount == '40%'}">
                                                        <div class="discount__price-final"><fmt:formatNumber type="number" maxFractionDigits="2" value="${listDetail.price * 0.4}"/>$</div>
                                                    </c:when>
                                                </c:choose>
<%--                                                <div class="discount__price-final">872.500đ</div>--%>
                                            </div>
                                            <form action="/game-servlet">
                                                <input type="hidden" name="game_id" value="1">
                                                <button type="submit" name="action" value="add_to_cart"><span>Add to Cart</span>
                                                </button>
                                            </form>
                                        </div>
                                    </c:if>
                                </c:if>
                                <c:if test="${sessionScope.userDto != null}">
                                    <c:if test="${requestScope.isInUserCart==null}">
                                        <jsp:forward page="/game-servlet">
                                            <jsp:param name="action" value="check_if_game_in_cart"/>
                                            <jsp:param name="path_to_return" value="/detail_game/detail_game.jsp"/>
                                            <jsp:param name="game_id" value="1"/>
                                        </jsp:forward>
                                    </c:if>
                                    <c:if test="${requestScope.isInUserCart}">
                                        <div class="price__products">
                                            <form action="/game-servlet">
                                                <input type="hidden" name="game_id" value="1">
                                                <button type="submit" name="action" value="show_cart">
                                                    <span>In Cart</span>
                                                </button>
                                            </form>
                                        </div>
                                    </c:if>
                                    <c:if test="${!requestScope.isInUserCart}">
                                        <div class="price__products">
                                            <span class="discount">${listDetail.percentDiscount}</span>
                                            <div class="price__products-container">
                                                <div class="discount__price">${listDetail.price}$</div>
                                                <c:choose>
                                                    <c:when test="${listDetail.percentDiscount == '50%'}">
                                                        <div class="discount__price-final"><fmt:formatNumber type="number" maxFractionDigits="2" value="${listDetail.price * 0.5}"/>$</div>
                                                    </c:when>
                                                    <c:when test="${listDetail.percentDiscount == '30%'}">
                                                        <div class="discount__price-final"><fmt:formatNumber type="number" maxFractionDigits="2" value="${listDetail.price * 0.3}"/>$</div>
                                                    </c:when>
                                                    <c:when test="${listDetail.percentDiscount == '40%'}">
                                                        <div class="discount__price-final"><fmt:formatNumber type="number" maxFractionDigits="2" value="${listDetail.price * 0.4}"/>$</div>
                                                    </c:when>
                                                </c:choose>
                                            </div>
                                            <form action="/game-servlet">
                                                <input type="hidden" name="game_id" value="1">
                                                <button type="submit" name="action" value="add_to_cart"><span>Add to Cart</span>
                                                </button>
                                            </form>
                                        </div>
                                    </c:if>
                                </c:if>
                            </div>
                        </div>
                        <!-- Detail4 -->
                        <div class="products__buy-description">
                            <div class="products__description-product-left">
                                <div class="left__about-game">
                                    ABOUT THIS GAME
                                </div>
                                <hr>
                                <p>Survival is just the beginning.</p>
                                <br>
                                <p>
                                    Six years have passed since the biological disaster in Raccoon City.
                                </p>
                                <p>
                                    Agent Leon S. Kennedy, one of the survivors of the incident, has been sent to
                                    rescue the president's kidnapped daughter.
                                </p>
                                <p>
                                    He tracks her to a secluded European village, where there is something terribly
                                    wrong with the locals.
                                </p>
                                <p>
                                    And the curtain rises on this story of daring rescue and grueling horror where
                                    life and death, terror and catharsis intersect.
                                </p>
                                <br>
                                <p>
                                    Featuring modernized gameplay, a reimagined storyline, and vividly detailed
                                    graphics,
                                    Resident Evil 4 marks the rebirth of an industry juggernaut.
                                </p>
                                <br>
                                <p>
                                    Relive the nightmare that revolutionized survival horror.
                                </p>
                                <br>
                                <br>
                                <div class="left__about-game">
                                    SYSTEM REQUIREMENTS
                                </div>
                                <hr>
                                <p>${listDetail.minimum}</p>
                                <p>
                                 ${listDetail.recommend}
                                </p>
                                <br>
                            </div>
                        </div>
                    </div>
                    <!-- Right Column -->
                    <div class="right__column">
                        <div class="righlt__column-description1">
                            <div class="description__header">
                                Information producer
                            </div>
                            <div class="description__select">
                                <i style="color: green; padding-right: 10px;" class="fa-solid fa-check"></i>
                                <span class="reason">${listDetail.nameDeveloper}</span>
                                <hr>
                                <i style="color: green;  padding-right: 10px;" class="fa-solid fa-check"></i>
                                <span>${listDetail.developerDesciption}</span>
                                <hr>
                                <i style="color: green;  padding-right: 10px;" class="fa-solid fa-check"></i>
                               <span><a href="${listDetail.developerUrl}">${listDetail.developerUrl}</a></span>
                            </div>
                        </div>
                        <div class="righlt__column-description2">
                            <!-- 1 -->
                            <div class="feature__list">
                                <a href="">
                                    <div class="icon">
                                        <img class="category_icon"
                                             src="https://store.akamai.steamstatic.com/public/images/v6/ico/ico_singlePlayer.png">
                                    </div>
                                    <div class="lable">Single-player</div>
                                </a>
                            </div>
                            <!-- 2 -->
                            <div class="feature__list">
                                <a href="">
                                    <div class="icon">
                                        <img class="category_icon"
                                             src="https://store.cloudflare.steamstatic.com/public/images/v6/ico/ico_achievements.png">
                                    </div>
                                    <div class="lable">Steam Achievements</div>
                                </a>
                            </div>
                            <!-- 3 -->
                            <div class="feature__list">
                                <a href="">
                                    <div class="icon">
                                        <img class="category_icon"
                                             src="https://store.cloudflare.steamstatic.com/public/images/v6/ico/ico_controller.png">
                                    </div>
                                    <div class="lable">Full controller support</div>
                                </a>
                            </div>
                            <!-- 4 -->
                            <div class="feature__list">
                                <a href="">
                                    <div class="icon">
                                        <img class="category_icon"
                                             src="https://store.cloudflare.steamstatic.com/public/images/v6/ico/ico_cards.png">
                                    </div>
                                    <div class="lable">Steam Trading Cards</div>
                                </a>
                            </div>
                            <!-- 5 -->
                            <div class="feature__list">
                                <a href="">
                                    <div class="icon">
                                        <img class="category_icon"
                                             src="https://store.cloudflare.steamstatic.com/public/images/v6/ico/ico_cloud.png">
                                    </div>
                                    <div class="lable">Steam Cloud</div>
                                </a>
                            </div>
                            <!-- 6 -->
                            <div class="feature__list">
                                <div class="feature__list-control">Full Controller Support</div>
                                <a href="">
                                    <div class="icon">
                                        <img class="category_icon"
                                             src="https://store.cloudflare.steamstatic.com/public/images/v6/ico/ico_controller.png">
                                    </div>
                                    <div class="lable">Steam Cloud</div>
                                </a>
                            </div>
                            <!-- 7 -->
                            <div class="feature__list">
                                <a href="">
                                    <div class="icon">
                                        <i class="fa-solid fa-spinner"></i>
                                    </div>
                                    <div class="lable">Steam Cloud</div>
                                </a>
                            </div>
                        </div>
                        <div class="righlt__column-description3">
                            <div class="description3__header">
                                Languages:
                            </div>
                            <div class="description__select">
                                <table class="game_language_options" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <th style="width: 94px;"></th>
                                        <th class="checkcol">Interface</th>
                                        <th class="checkcol">Full Audio</th>
                                        <th class="checkcol">Subtitles</th>
                                    </tr>
                                    <tr>
                                        <td style="width: 94px; text-align: left" class="ellipsis">
                                            English
                                        </td>
                                        <td class="checkcol">
                                            <span>&#10004;</span>
                                        </td>
                                        <td class="checkcol">
                                            <span>&#10004;</span>
                                        </td>
                                        <td class="checkcol">
                                            <span>&#10004;</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 94px; text-align: left" class="ellipsis">
                                            French
                                        </td>
                                        <td class="checkcol">
                                            <span>&#10004;</span>
                                        </td>
                                        <td class="checkcol">
                                            <span>&#10004;</span>
                                        </td>
                                        <td class="checkcol">
                                            <span>&#10004;</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 94px; text-align: left" class="ellipsis">
                                            Italian
                                        </td>
                                        <td class="checkcol">
                                            <span>&#10004;</span>
                                        </td>
                                        <td class="checkcol">
                                            <span>&#10004;</span>
                                        </td>
                                        <td class="checkcol">
                                            <span>&#10004;</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 94px; text-align: left" class="ellipsis">
                                            German
                                        </td>
                                        <td class="checkcol">
                                            <span>&#10004;</span>
                                        </td>
                                        <td class="checkcol">
                                            <span>&#10004;</span>
                                        </td>
                                        <td class="checkcol">
                                            <span>&#10004;</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 94px; text-align: left" class="ellipsis">
                                            Spanish - Spain
                                        </td>
                                        <td class="checkcol">
                                            <span>&#10004;</span>
                                        </td>
                                        <td class="checkcol">
                                            <span>&#10004;</span>
                                        </td>
                                        <td class="checkcol">
                                            <span>&#10004;</span>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
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
                <img src="https://store.akamai.steamstatic.com/public/images/v6/logo_steam_footer.png"
                     alt="">
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