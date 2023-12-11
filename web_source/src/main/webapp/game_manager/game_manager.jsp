<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/6/2023
  Time: 10:34 AM
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
    <link rel="stylesheet" href="../css/game_manager.css">
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
                <a class="container__header-login-a" href="">login</a>
                <span class="container__header-login-p">language
                    <i class="fa-solid fa-chevron-down"></i>
                </span>
            </div>
        </div>
    </section>
    <section class="fixHeight">
    </section>
    <section class="container__body-main" style="height: 1400px;">
    <!-- Thao tác trong này -->
        <h2>
            <a href="/users?action=create">Add New Game</a>
        </h2>

        <div align="center">
            <table border="1" cellpadding="5">
                <caption><h2>List of Game</h2></caption>
                <tr>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Url</th>
<%--                    <th>UrlVideo</th>--%>
                    <th>PercentDiscount</th>
                    <th>Rating</th>
                    <th>Action</th>
                </tr>
                <c:forEach var="game" items="${list}">
                    <tr>
                        <td><c:out value="${game.name}"/></td>
                        <td><c:out value="${game.price}"/></td>
                        <td><c:out value="${game.url}"/></td>
<%--                        <td><c:out value="${game.urlVideo}"/></td>--%>
                        <td><c:out value="${game.percentDiscount}"/></td>
                        <td><c:out value="${game.rating}"/></td>
<%--                        <td>--%>
<%--                            <a href="/users?action=edit&id=${game.name}">Edit</a>--%>
<%--                            <a href="/users?action=delete&id=${game.name}">Delete</a>--%>
<%--                        </td>--%>
                    </tr>
                </c:forEach>
            </table>
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