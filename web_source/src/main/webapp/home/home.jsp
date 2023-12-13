<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/6/2023
  Time: 10:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">--%>
        <link rel="stylesheet" href="../home/home.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
          integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
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
<jsp:include page="../include/header.jsp"/>
<!-- Body -->
<c:if test="${Sucssesful == true}">
    <div class="boxes animate__backInDown animate__animated">
        <div class="toast__icon">
            <i class="fa-solid fa-check"></i>
        </div>
        <div class="toast__body">
            <h3 class="toast__tittle">Thành Công</h3>
            <p class="toast__msg">Chúc bạn đăng kí thành công</p>
        </div>
    </div>
</c:if>
<section class="content">
    <div class="container_body">
        <div class="page_background_holder">
        </div>
        <div class="inner book__menu-main">
            <div class="container__menu">
                <ul class="container__list">
                    <li class="container__list-menu"><a href="">Your Store</a></li>
                    <li class="container__list-menu header__navbar-user"><a href="">New & Noteworthy</a></li>
                    <li class="container__list-menu">
                        <a href="">Categories</a>
                        <ul class="tag__game">
                            <li class="tag__game-list"><a
                                    href="/game-servlet?action=searchCatelogy&catelogy=Action&index=1">Action</a></li>
                            <li class="tag__game-list"><a
                                    href="/game-servlet?action=searchCatelogy&catelogy=Role-Playing&index=1">Role-Playing</a>
                            </li>
                            <li class="tag__game-list"><a
                                    href="/game-servlet?action=searchCatelogy&catelogy=JRPG&index=1">JRPG</a></li>
                            <li class="tag__game-list"><a
                                    href="/game-servlet?action=searchCatelogy&catelogy=Hack&index=1">Hack & Slash</a>
                            </li>
                            <li class="tag__game-list"><a
                                    href="/game-servlet?action=searchCatelogy&catelogy=Arcade&index=1">Arcade &
                                Rhythm</a></li>
                            <li class="tag__game-list"><a
                                    href="/game-servlet?action=searchCatelogy&catelogy=Casual&index=1">Casual</a></li>
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
<section style="height: 1450px;">
    <div class="menu__products">
        <div class="list_products">
            <!-- Product 1 -->
            <c:if test="${Sucssesful == true}">
                <c:forEach items="${newList}" var="game">
                    <div class="item_products">
                        <img src="${game.url}"
                             alt="">
                        <div class="data__product-hover">
                            <div class="data__product-video">
                                <video loop="loop" muted autoplay>
                                    <source
                                            src="${game.videoUrl}"
                                            type="video/webm">
                                </video>
                            </div>
                            <div class="data__product-description">
                                <div class="description-products">
                                    <input type="text">
                                    <a href="/game-servlet?showList&nameTag=${game.name}"><h3>${game.name}</h3></a>
                                    <p>Overwhelmingly ${game.rating}</p>
                                    <ul class="data__product-review">
                                        <c:forEach items="${tagGame}" var="entry">
                                            <c:if test="${entry.key == game.gameId}">
                                                <c:forEach items="${entry.value}" var="value">
                                                    <li><a href="#">${value.tagGame}</a></li>
                                                </c:forEach>
                                            </c:if>
                                        </c:forEach>
                                    </ul>
                                    <button><span><a class="new-a"
                                                     href="/detail_game/detail_game.jsp">Add to Cart</a></span>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="price__products">
                            <div class="discount">${game.percentDiscount}</div>
                            <div class="price__products-container">
                                <div class="discount__price">${game.price}$</div>
                                <c:choose>
                                    <c:when test="${game.percentDiscount == '50%'}">
                                        <div class="discount__price-final"><fmt:formatNumber type="number"
                                                                                             maxFractionDigits="2"
                                                                                             value="${game.price * 0.5}"/>$
                                        </div>
                                    </c:when>
                                    <c:when test="${game.percentDiscount == '30%'}">
                                        <div class="discount__price-final"><fmt:formatNumber type="number"
                                                                                             maxFractionDigits="2"
                                                                                             value="${game.price * 0.3}"/>$
                                        </div>
                                    </c:when>
                                    <c:when test="${game.percentDiscount == '40%'}">
                                        <div class="discount__price-final"><fmt:formatNumber type="number"
                                                                                             maxFractionDigits="2"
                                                                                             value="${game.price * 0.4}"/>$
                                        </div>
                                    </c:when>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
            <c:forEach items="${list}" var="game">
                <div class="item_products">
                    <img src="${game.url}"
                         alt="">
                    <div class="data__product-hover">
                        <div class="data__product-video">
                            <video loop="loop" muted autoplay>
                                <source
                                        src="${game.videoUrl}"
                                        type="video/webm">
                            </video>
                        </div>
                        <div class="data__product-description">
                            <div class="description-products">
                                <h3>${game.name}</h3>
                                <p>Overwhelmingly ${game.rating}</p>
                                <ul class="data__product-review">
                                    <c:forEach items="${tagGame}" var="entry">
                                        <c:if test="${entry.key == game.gameId}">
                                            <c:forEach items="${entry.value}" var="value">
                                                <li><a href="#">${value.tagGame}</a></li>
                                            </c:forEach>
                                        </c:if>
                                    </c:forEach>
                                </ul>
                                <button><span><a class="new-a" href="/game-servlet?action=detail&title=${game.name}">Add to Cart</a></span>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="price__products">
                        <div class="discount">${game.percentDiscount}</div>
                        <div class="price__products-container">
                            <div class="discount__price">${game.price}$</div>
                            <c:choose>
                                <c:when test="${game.percentDiscount == '50%'}">
                                    <div class="discount__price-final"><fmt:formatNumber type="number"
                                                                                         maxFractionDigits="2"
                                                                                         value="${game.price * 0.5}"/>$
                                    </div>
                                </c:when>
                                <c:when test="${game.percentDiscount == '30%'}">
                                    <div class="discount__price-final"><fmt:formatNumber type="number"
                                                                                         maxFractionDigits="2"
                                                                                         value="${game.price * 0.3}"/>$
                                    </div>
                                </c:when>
                                <c:when test="${game.percentDiscount == '40%'}">
                                    <div class="discount__price-final"><fmt:formatNumber type="number"
                                                                                         maxFractionDigits="2"
                                                                                         value="${game.price * 0.4}"/>$
                                    </div>
                                </c:when>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </c:forEach>
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
                            <video loop="loop" preload="none" muted autoplay>
                                <source
                                        src="./video/outlast.webm"
                                        type="video/webm">
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
                            <video loop="loop" preload="none" muted autoplay>
                                <source
                                        src="./video/payday3.webm"
                                        type="video/webm">
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
                    <img src="https://cdn.akamai.steamstatic.com/steam/apps/251570/capsule_616x353.jpg?t=1697073509"
                         alt="">
                    <div class="list__products-hover-min">
                        <div class="data__product-hover-min">
                            <video loop="loop" preload="none" muted autoplay>
                                <source
                                        src="./video/7daystodie.webm"
                                        type="video/webm">
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
                    <img src="https://cdn.akamai.steamstatic.com/steam/apps/394360/capsule_616x353.jpg?t=1700599414"
                         alt="">
                    <div class="list__products-hover-min">
                        <div class="data__product-hover-min">
                            <video loop="loop" preload="none" muted autoplay>
                                <source
                                        src="./video/hearsofiron.webm"
                                        type="video/webm">
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
                    <img src="https://cdn.akamai.steamstatic.com/steam/apps/1222700/capsule_616x353.jpg?t=1626878628"
                         alt="">
                    <div class="list__products-hover-large">
                        <div class="data__product-hover-min">
                            <video loop="loop" preload="none" muted autoplay>
                                <source
                                        src="https://cdn.akamai.steamstatic.com/steam/apps/256790157/microtrailer.webm?t=1592600313"
                                        type="video/webm">
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
                    <img src="https://cdn.akamai.steamstatic.com/steam/apps/1888930/capsule_616x353.jpg?t=1697567304"
                         alt="">
                    <div class="list__products-hover-large">
                        <div class="data__product-hover-min">
                            <video loop="loop" preload="none" muted autoplay>
                                <source
                                        src="https://cdn.cloudflare.steamstatic.com/steam/apps/256936971/microtrailer.webm?t=1680015399"
                                        type="video/webm">
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
                    <img src="https://cdn.akamai.steamstatic.com/steam/apps/1426210/capsule_616x353.jpg?t=169100646"
                         alt="">
                    <div class="list__products-hover-large">
                        <div class="data__product-hover-min">
                            <video loop="loop" preload="none" muted autoplay>
                                <source
                                        src="https://cdn.cloudflare.steamstatic.com/steam/apps/256827093/microtrailer.webm?t=1616514535"
                                        type="video/webm">
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
                    <img src="https://theme.hstatic.net/1000288298/1001020793/14/logo.png?v=280" alt="">
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
                    <img src="https://theme.hstatic.net/1000288298/1001020793/14/logo.png?v=280" alt="">
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
<%--<script src="${pageContext.request.contextPath}/js/js.js">--%>
<%--</script>--%>
<%--<script src="${pageContext.request.contextPath}/css/js.js">--%>
<script src="${pageContext.request.contextPath}/home/js.js">

</script>
</body>

</html>