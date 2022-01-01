/**
 * 
 */

// 기본 위치(top)값
//var floatPosition = parseInt($(".sideBanner").css('top'));
var floatPosition = 0;

// scroll 인식
$(window).scroll(function() {
  
    // 현재 스크롤 위치
    var currentTop = $(window).scrollTop();
    var bannerTop = currentTop + floatPosition + "px";

    //이동 애니메이션
    $("header").stop().animate({
      "top" : bannerTop
    }, 0);

   

}).scroll();
