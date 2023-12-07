
function fixHeigt(){
    divElement = document.querySelector(".navbar");
        elemHeight = divElement.offsetHeight;
        document.querySelector(".fixHeight").style.height
            = elemHeight + "px";
}
fixHeigt()

$('.list_products').slick({
    dots: true,
    infinite: true,
    slidesToShow: 3,
    slidesToScroll: 1
  });