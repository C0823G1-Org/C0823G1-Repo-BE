<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/6/2023
  Time: 10:40 AM
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
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
<section class="container__body-main" style="height: 700px;">
    <div class="background__login">
        <div class="container__login">
            <div class="tag__login">
                <h1>Sign in</h1>
            </div>
            <br>
            <div class="login__inner">
                <div class="login__inner-container">
                    <!-- Left -->
                    <form method="post" action="/game-servlet">
                    <div class="left__login">
                        <div class="left__login-sign-header">
                            SIGN IN WITH ACCOUNT NAME
                        </div>
                        <input type="text" class="login__input-account" name="email" value="${userAccount.email}">
                        <div class="left__login-sign">
                            Password
                        </div>
                        <input type="password" class="login__input-account" name="password" value="${userAccount.password}">
                        <div class="btn__sign">
                            <button style="padding: 8px 0 ; color: #ffffff"  type="submit" name="action" value="sign_in">
                                 <span style="font-size: 16px;font-weight: 400;">Sign In</span>
                            </button>
                        </div>
                        <div class="btn__sign-create">
                            <button><a style="color: #fff" href="http://localhost:8080/register/register.jsp">Create an account</a></button>
                        </div>
                        <c:if test="${message != null}">
                            <div>${message}</div>
                        </c:if>
                        <div class="link__help">
                            <a href="https://help.steampowered.com/en/wizard/HelpWithLogin">Help, I can't sign in</a>
                        </div>
                    </div>
                    </form>
                    <!-- Right -->
                    <div class="right__login">
                        <div class="contain__right">
                            <div class="right__login-code">
                                OR SIGN IN WITH QR
                            </div>
                            <div class="right__login-qr">
                                <img src="https://scontent.fdad1-3.fna.fbcdn.net/v/t1.15752-9/403607003_1089876045337260_5115818614783867516_n.png?_nc_cat=111&ccb=1-7&_nc_sid=8cd0a2&_nc_ohc=OIbm_XoPpzsAX-ll2H6&_nc_ht=scontent.fdad1-3.fna&oh=03_AdSiQvFv7_e_iGfJVeP8LKI4OoBixShWxuz7em3GMnDhGQ&oe=659905D6" alt="">
                            </div>
                            <div class="help__link">
                                Use the
                                <a href="" style="text-decoration: underline; color:#afafaf ;">Steam Mobile App</a>
                                to sign in via QR code
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