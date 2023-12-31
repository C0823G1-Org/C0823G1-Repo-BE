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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
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
    <style>
        a{
            text-decoration: none;
        }
    </style>
</head>

<body>
<!-- Header -->
<section class="navbar">
    <div class="container__header inner">
        <div class="container__header-home">
            <a href="/game-servlet"> <img class="img__steam"
                             src="https://theme.hstatic.net/1000288298/1001020793/14/logo.png?v=280"
                             alt=""></a>
        </div>
        <div class="container__header-select">
            <a style="text-decoration: none !important;"  href="" class="container__header-select-link">STORE</a>
            <a style="text-decoration: none !important;" href="" class="container__header-select-link">COMMUNITY</a>
            <a style="text-decoration: none !important;" href="" class="container__header-select-link">ABOUT</a>
            <a style="text-decoration: none !important;" href="" class="container__header-select-link">SUPPORT</a>
        </div>

            <c:if test="${sessionScope.userDto.roleId == 1}">
                <a class="container__header-login-a">${sessionScope.userDto.username}</a>
                <div class="dropdown">
                    <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                       data-bs-toggle="dropdown" aria-expanded="false">
                            ${sessionScope.userDto.roleName}
                    </a>
                    <ul class="dropdown-menu .bg-body-tertiary " aria-labelledby="dropdownMenuLink">
                        <li><a class="dropdown-item" href="#">Action</a></li>
                        <li><a class="dropdown-item" href="/game-servlet?action=game">Game management</a></li>
                        <li><a class="dropdown-item" href="/game-servlet?action=user">User management</a></li>
                    </ul>
                </div>
            </c:if>

    </div>
</section>
<section class="fixHeight">
</section>
<section class="container__body-main" style="height: 900px;">
    <!-- Thao tác trong này -->
    <h1 style="margin-left: 800px ; color: red " >
        List Game
    </h1>
    <h2>
        <button type="button" class="btn btn-primary "><a href="/game-manager?action=add_game" class="text-danger">Add New Game</a></button>
    </h2>

    <div align="center">
        <table class="table">
            <thead class="thead-dark text-primary">
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Name</th>
                <th scope="col">Price</th>
<%--                <th scope="col">Url</th>--%>
<%--                <th scope="col">UrlVideo</th>--%>
                <th scope="col">PercentDiscount</th>
                <th scope="col">Rating</th>
                <th scope="col">Action</th>
            </tr>
            </thead>

            <c:forEach var="game" items="${list}" varStatus="loop">
            <tr class="text-primary">
                <td><c:out value="${loop.count}"/></td>
                <td><c:out value="${game.name}"/></td>
                <td><c:out value="${game.price}"/></td>
                <td><c:out value="${game.percentDiscount}"/></td>
                <td><c:out value="${game.rating}"/></td>
                <td>
                    <a href="http://localhost:8080/game-manager?action=edit_game=${game.name}">Edit</a>
                    <a href="/users?action=delete&id=${game.name}">Delete</a>
                </td>
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
</body>

</html>