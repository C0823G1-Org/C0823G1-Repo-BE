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
    <link rel="stylesheet" href="./web.css">
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
<!-- Body -->
<section class="content">
    <div class="container_body">
        <div class="inner book__menu-main">
            <div class="container__menu">
                <ul class="container__list">
                    <li class="container__list-menu"><a href="">Your Store</a></li>
                    <li class="container__list-menu"><a href="">New & Noteworthy</a></li>
                    <li class="container__list-menu"><a href="">Categories</a></li>
                    <li class="container__list-menu"><a href="">Points Shop</a></li>
                    <li class="container__list-menu"><a href="">News</a></li>
                    <li class="container__list-menu"><a href="">Labs</a></li>
                </ul>
                <div class="container__search">
                    <form class="search__form" action="">
                        <input placeholder="  search" class="search-input" type="text">
                        <button class="btn__btn-sumit">
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
                    <span>Resident Evil 4</span>
                    <div class="comminity__product">
                        <a href="">Community Hub</a>
                    </div>
                </div>
                <div class="body__wed-product">
                    <div class="products__video">
                        <video autoplay loop="loop" muted
                               src="https://cdn.cloudflare.steamstatic.com/steam/apps/256938324/movie480_vp9.webm?t=1684904131"></video>
                    </div>
                    <div class="products_description">
                        <img src="https://cdn.cloudflare.steamstatic.com/steam/apps/2050650/header_alt_assets_0.jpg?t=1696242724"
                             alt="">
                        <span>
                                Survival is just the beginning. Six years have passed since the biological disaster in
                                Raccoon City.
                                Leon S. Kennedy, one of the survivors, tracks the president's kidnapped daughter to a
                                secluded European village, where there is something terribly wrong with the locals.
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
                                    <h1>Buy Resident Evil 4</h1>
                                    <p>SPECIAL PROMOTION! Offer ends in </p>
                                </div>
                                <div class="price__products">
                                    <span class="discount">-34%</span>
                                    <div class="price__products-container">
                                        <div class="discount__price">1.322.000đ</div>
                                        <div class="discount__price-final">872.500đ</div>
                                    </div>
                                    <button><span>Add to Cart</span></button>
                                </div>
                            </div>
                        </div>
                        <!-- Detail2 -->
                        <div class="products__buy">
                            <div class="products__buy-products">
                                <div class="products__buy-games">
                                    <img src="https://store.akamai.steamstatic.com/public/images/v6/icon_platform_win.png?v=3"
                                         alt="">
                                    <h1>Buy Resident Evil 4 Deluxe Edition</h1>
                                    <p>SPECIAL PROMOTION! Offer ends in </p>
                                </div>
                                <div class="price__products" style="left: -45px;">
                                    <span class="discount">-30%</span>
                                    <div class="price__products-container">
                                        <div class="discount__price">1.542.000đ</div>
                                        <div class="discount__price-final">1.079.500đ</div>
                                    </div>
                                    <button><span>Add to Cart</span></button>
                                </div>
                            </div>
                        </div>
                        <!-- Detail3 -->
                        <div class="products__buy">
                            <div class="products__buy-products">
                                <div class="products__buy-games">
                                    <img src="https://store.akamai.steamstatic.com/public/images/v6/icon_platform_win.png?v=3"
                                         alt="">
                                    <h1>Buy Resident Evil 4 Extra DLC Pack BUNDLE (?)</h1>
                                    <p>Buy this bundle to save 22% off all 9 items!</p>
                                </div>
                                <div class="price__products">
                                    <span class="discount">-42%</span>
                                    <div class="price__products-container">
                                        <div class="discount__price">563.000đ</div>
                                        <div class="discount__price-final">327.500đ</div>
                                    </div>
                                    <button><span>Add to Cart</span></button>
                                </div>
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
                                    MATURE CONTENT DESCRIPTION
                                </div>
                                <hr>
                                <p>The developers describe the content like this:</p>
                                <p>
                                    This Game may contain content not appropriate for all ages, or may not be
                                    appropriate for viewing at work: Frequent Violence or Gore, General Mature
                                    Content
                                </p>
                                <br>
                            </div>
                        </div>
                    </div>
                    <!-- Right Column -->
                    <div class="right__column">
                        <div class="righlt__column-description1">
                            <div class="description__header">
                                Is this game relevant to you?
                            </div>
                            <div class="description__select">
                                <i style="color: green; padding-right: 10px;" class="fa-solid fa-check"></i>
                                <span class="reason">Players like you love this game.</span>
                                <hr>
                                <i style="color: green;  padding-right: 10px;" class="fa-solid fa-check"></i>
                                <span>User reviews: Overwhelmingly Positive</span>
                                <hr>
                                <i style="color: green;  padding-right: 10px;" class="fa-solid fa-check"></i>
                                <span>Currently popular</span>
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
                                            English </td>
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
                                            French </td>
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
                                            Italian </td>
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
                                            German </td>
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
                                            Spanish - Spain </td>
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