
(function fixHeigt(){
    divElement = document.querySelector(".navbar");
        elemHeight = divElement.offsetHeight;
        document.querySelector(".fixHeight1").style.height
            = 0 + "px";
})()

$('.list_products').slick({
    dots: true,
    infinite: true,
    slidesToShow: 3,
    slidesToScroll: 1
  });