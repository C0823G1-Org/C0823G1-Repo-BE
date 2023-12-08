<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="navbar">
    <c:if test="${sessionScope.userDto != null}">
        <c:if test="${sessionScope.userDto.username == null}">
            <div style=" background-color: yellow;
    align-items: center;
    text-align: center;
    padding: 5px;
    line-height: 15px;
    font-size: 19px;
    margin-bottom: 3px;">
                <a href="#" class="container__header-login-a">Vui long cap nhat thong tin</a>
            </div>
        </c:if>
    </c:if>
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
        <%--        <div class="update__account">--%>
        <%--            <c:if test="${sessionScope.userDto != null}">--%>
        <%--                <c:if test="${sessionScope.userDto.username == null}">--%>
        <%--                    <a href="#" class="container__header-login-a">Vui long cap nhat thong tin</a>--%>
        <%--                </c:if>--%>
        <%--            </c:if>--%>
        <%--        </div>--%>
        <div class="container__header-login">
            <div class="container__header-login-install">
                <button class="btn_installe">
                    <i class="fa-solid fa-download"></i>
                    <span>Install Steam</span>
                </button>
            </div>
            <c:if test="${sessionScope.userDto != null}">
                <c:if test="${sessionScope.userDto.username != null}">
                    <a class="container__header-login-a">${sessionScope.userDto.username}</a>
                </c:if>
                <c:if test="${sessionScope.userDto.username == null}">
                    <a class="container__header-login-a">${sessionScope.userDto.email}</a>
                </c:if>
                <a href="/game-servlet?action=logout">Log out</a>
            </c:if>
            <c:if test="${sessionScope.userDto == null}">
                <a class="container__header-login-a" href="login/login.jsp">login</a>
            </c:if>
            <span class="container__header-login-p">language
                    <i class="fa-solid fa-chevron-down"></i>
                </span>
        </div>
    </div>
</section>
<section class="fixHeight">
</section>
