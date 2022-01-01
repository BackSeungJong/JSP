/**
 * 
 */

// 기본 위치(top)값
//var floatPosition = parseInt($(".sideBanner").css('top'));
var floatPosition = 0;

// scroll 인식
$(window).scroll(function () {

  // 현재 스크롤 위치
  var currentTop = $(window).scrollTop();
  var bannerTop = currentTop + floatPosition + "px";

  //이동 애니메이션
  $("header").stop().animate({
    "top": bannerTop
  }, 0);

}).scroll();

/******************************************************************************/
//current position
var pos = 0;
//number of slides
var totalSlides = $('#slider-wrap ul li').length;
console.log(totalSlides); // 5 
//get the slide width
var sliderWidth = $('#slider-wrap').width();
console.log(sliderWidth); // 800
$(document).ready(function () {


  /*****************
   BUILD THE SLIDER
  *****************/
  //set width to be 'x' times the number of slides
  $('#slider-wrap ul#slider').width(sliderWidth * totalSlides);

  //next slide  
  $('#next').click(function () {
    slideRight();
  });

  //previous slide
  $('#previous').click(function () {
    slideLeft();
  });



  /*************************
   //*> OPTIONAL SETTINGS
  ************************/
  //automatic slider
  var autoSlider = setInterval(slideRight, 3000);

  // jquery - each() 메서드
  // ㄴ jquery를 사용해 배열을 관리할 때 사용
  // ㄴ object, 배열 모두 사용할 수 있는 일반적인 반복 함수

  //for each slide 
  $.each($('#slider-wrap ul li'), function () {

    //create a pagination
    var li = document.createElement('li');
    $('#pagination-wrap ul').append(li);
  });

  //counter
  //countSlides();

  //pagination
  pagination();

  //hide/show controls/btns when hover
  //pause automatic slide when hover
  $('#slider-wrap').hover(
    function () {
       $(this).addClass('active'); 
       clearInterval(autoSlider); 
      },
    function () {
       $(this).removeClass('active'); 
       autoSlider = setInterval(slideRight, 3000); 
      }
  );



});//DOCUMENT READY


/************
 SLIDE RIGHT
*************/
function slideRight() {
  pos++;
  if (pos == totalSlides) { pos = 0; }
  $('#slider-wrap ul#slider').css('left', -(sliderWidth * pos));

  //*> optional 
  //countSlides();
  pagination();
}

/************************
 //*> OPTIONAL SETTINGS
************************/
// function countSlides(){
//   $('#counter').html(pos+1 + ' / ' + totalSlides);
// }

function pagination() {
  $('#pagination-wrap ul li').removeClass('active');
  $('#pagination-wrap ul li:eq(' + pos + ')').addClass('active');
}