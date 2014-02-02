//= require prism
//= require_self

$(document).ready(function() {
  var stickyNavTop = $('.navigation').offset().top;

  var stickyNav = function(){
    var scrollTop = $(window).scrollTop();

    if (scrollTop > stickyNavTop) {
        $('.navigation').addClass('sticky');
    } else {
        $('.navigation').removeClass('sticky');
    }
  };

  stickyNav();
  $(window).scroll(function() {
      stickyNav();
  });
});
