<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/6/2023
  Time: 10:41 AM
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">
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
<!-- Header -->
<jsp:include page="../include/header.jsp"/>
<%--Body--%>
<section class="container__body-main" style="height: 700px;">
    <div class="background__login">
        <div class="container__login">
            <div class="tag__login">
                <h1>CREATE ACCOUNT</h1>
            </div>
            <br>
            <div class="login__inner">
                <div class="login__inner-container">
                    <!-- Left -->
                    <form method="post" action="/game-servlet">
                        <div class="left__login">
                            <div class="left__login-sign-header">
                                Email Address
                            </div>
                            <input type="text" class="login__input-account" name="email">
                            <div class="left__login-sign">
                                Name
                            </div>
                            <input type="text" class="login__input-account" name="name">
                            <div class="left__login-sign">
                                Date
                            </div>
                            <input type="date" class="login__input-account" name="date">
                            <div class="left__login-sign">
                                Password
                            </div>
                            <input type="password" class="login__input-account" name="password">
                            <div class="left__login-sign">
                                Confirm your Password
                            </div>
                            <input type="password" class="login__input-account" name="confirm_password">
                            <c:if test="${message !=null}">
                                <div style="color: #842029 ">${message}</div>
                            </c:if>
                            <div class="btn__sign">
                                <button type="submit" name="action" value="sign_up">Sign in</button>
                            </div>
                            <div class="link__help">
                                I have an account!
                                <a href="/game-servlet?action=login"> Login</a>
                            </div>
                        </div>
                    </form>
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
