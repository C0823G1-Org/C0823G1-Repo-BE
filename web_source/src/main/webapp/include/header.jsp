<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="navbar">
    <div class="container__header inner">
        <div class="container__header-home">
            <a href="/game-servlet"> <img class="img__steam"
                                          src="https://theme.hstatic.net/1000288298/1001020793/14/logo.png?v=280"
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
                            <li class="dropdown-item"><a  href="/game-servlet?action=game">Game management</a></li>
                            <li class="dropdown-item"><a  href="/game-servlet?action=user">User management</a></li>
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
            </c:if>
            <c:if test="${sessionScope.userDto == null}">
                <a class="container__header-login-a" href="/game-servlet?action=login">login</a>
            </c:if>
        </div>
    </div>
</section>
<div class="fixHeight"></div>
