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
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.js"
            integrity="sha512-WNZwVebQjhSxEzwbettGuQgWxbpYdoLf7mH+25A7sfQbbxKeS5SQ9QBf97zOY4nOlwtksgDA/czSTmfj4DUEiQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

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
            <c:if test="${sessionScope.userDto != null}">
                <c:if test="${sessionScope.userDto.roleId == 1}">
                    <div class="dropdown">
                        <a class="container__header-login-a">${sessionScope.userDto.username}</a>
                        <ul class="dropdown-menu">
                            <li class="dropdown-item"><a href="#">Action</a></li>
                            <li class="dropdown-item"><a href="/game-servlet?action=game">Game management</a></li>
                            <li class="dropdown-item"><a href="/game-servlet?action=user">User management</a></li>
                        </ul>
                    </div>
                </c:if>
                <c:if test="${sessionScope.userDto.roleId != 1}">
                    <c:if test="${sessionScope.userDto.username != null}">
                        <a class="container__header-login-a">${sessionScope.userDto.username}</a>
                    </c:if>
                    <c:if test="${sessionScope.userDto.username == null}">
                        <a class="container__header-login-a"
                           style="text-decoration: none">${sessionScope.userDto.email}</a>
                    </c:if>
                </c:if>
                <div>
                    <a class="logout" href="/game-servlet?action=logout">Logout</a>
                </div>
            </c:if></div>
    </div>
</section>
<section class="fixHeight">
</section>
<section class="container__body-main" style="height: 540px;">
    <div align="center">
        <form method="post">
            <fieldset>
                <legend>Form edit user</legend>
                <table>
                    <tr>
                        <td>Name:</td>
                        <td><input type="text" name="name" value="${userDto.getUsername()}"></td>
                    </tr>
                    <tr>
                        <td>Birthday:</td>
                        <td><input type="text" name="birthday" value="${userDto.getBirthday()}"></td>
                    </tr>
                    <tr>
                        <td><input type="submit"  value="Confirm"></td>
                        <td><input type="hidden" name="action" value="edit"></td>
                        <td><a href="user_manager.jsp"> Back </a></td>
                    </tr>
                </table>
            </fieldset>
        </form>
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
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</html>