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
                                    href="/game-servlet?action=searchCatelogy&catelogy='Arcade'&index=1">Arcade &
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
<section style="height: 800px;">
    <div class="menu__products-cart">
        <div class="container__products-cart">
            <div class="header-cart">
                <h1>
                    Search Game
                    <span><i class="fa-solid fa-gamepad icon__game"></i></span>
                </h1>
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
                        <img style="width: 200px;height:150px !important; " src="${game.url}" alt="">
                    </div>
                    <div class="container__cart-name">
                        <span>
                             <a class="name-detail" href=""> ${game.title}</a>
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
                        <img style="width: 200px;height:150px !important; " src="${catelogy.url}" alt="">
                    </div>
                    <div class="container__cart-name">
                        <span class="icon__game">
                            <a class="name-detail" href=""> ${catelogy.title}</a>
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
        <c:if test="${endPage == 0}">
            <div style="margin-top: 50px"><span
                    style="color: #c7d5e0; font-size: 30px ; font-weight: bold">${Error}</span></div>
        </c:if>
        <c:if test="${countCatelogy == 0}">
            <div style="margin-top: 50px"><span
                    style="color: #c7d5e0; font-size: 30px ; font-weight: bold">${Error}</span></div>
        </c:if>
    </div>
    <!-- Pay -->
    <div class="menu__cart">
        <div class="btn__pay">
            <c:if test="${checkS == true}">
                <c:forEach begin="1" end="${endPage}" var="i">
                    <a id="${i}" style="padding: 3px;background-color: cadetblue;border-radius: 5px;margin-right: 5px" href="/game-servlet?action=search&index=${i}&txtSearch=${save}">${i}</a>
                </c:forEach>
            </c:if>
            <c:if test="${check == true}">
                <c:forEach begin="1" end="${endPage}" var="i">
                    <a  id="${i}" style="padding: 3px;background-color: cadetblue;border-radius: 5px;margin-right: 5px" href="/game-servlet?action=searchCatelogy&index=${i}&catelogy=${text}">${i}</a>
                </c:forEach>
            </c:if>
        </div>
    </div>
</section>
<div class="end__container">
    <div class="container__content">
        <hr>
        <div class="container__content-main">
            <div class="container__content-img">
                <img src="https://theme.hstatic.net/1000288298/1001020793/14/logo.png?v=280" alt="">
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
<script>
    document.getElementById('${index}').style.color = "red";
</script>
</body>

</html>