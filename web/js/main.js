(function($) {
// 预加载动画
    $(window).on('load',function(){
        $('.andro_preloader').addClass('hidden');
    })
    //登陆方式
    $("#username-login").click(function(){
        $("#username-login").addClass("selected-type"),
        $("#phone-login").removeClass("selected-type"),
        $("#username-login-form").show(),
        $("#phone-login-form").hide()
        // $("#username-login").addClass("selected-type")
    })
    $("#phone-login").click(function(){
        $("#username-login").removeClass("selected-type"),
        $("#phone-login").addClass("selected-type"),
        $("#username-login-form").hide(),
        $("#phone-login-form").show()
        
    })
     //注册方式
     $("#username-register").click(function(){
        $("#username-register").addClass("selected-type"),
        $("#phone-register").removeClass("selected-type"),
        $("#username-register-form").show(),
        $("#phone-register-form").hide()
    })
    $("#phone-register").click(function(){
        $("#username-register").removeClass("selected-type"),
        $("#phone-register").addClass("selected-type"),
        $("#username-register-form").hide(),
        $("#phone-register-form").show()
        
    })
// 版头轮播图    
    $(".banner-1 .andro_banner-slider").slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: false,
        dots: true,
        autoplay: true
        
      });
      /*-------------------------------------------------------------------------------
  热销新品
  -------------------------------------------------------------------------------*/
  // $(".andro_fresh-arrivals-slider").slick({
  //   slidesToShow: 3,
  //   slidesToScroll: 1,
  //   arrows: true,
  //   dots: false,
  //   autoplay: true,
  //   prevArrow: $('.andro_fresh-arrivals .slider-prev'),
  //   nextArrow: $('.andro_fresh-arrivals .slider-next'),
  //   responsive: [
  //     {
  //       breakpoint: 991,
  //       settings: {
  //         slidesToShow: 2,
  //       }
  //     },
  //     {
  //       breakpoint: 575,
  //       settings: {
  //         slidesToShow: 1,
  //       }
  //     }
  //   ]
  // });
/*-------------------------------------------------------------------------------
  商品数量加减
  -------------------------------------------------------------------------------*/
  $(".qty span").on('click', function(){
    var qty = $(this).closest('.qty').find('input');
    var qtyVal = parseInt(qty.val());
    if($(this).hasClass('qty-add')){
      qty.val(qtyVal + 1);
    }else{
      return qtyVal > 1 ? qty.val(qtyVal - 1) : 0;
    }
  })
  $('.andro_product-single-thumb')
    .wrap('<span style="display:inline-block" class="andro_product-single-zoom"></span>')
    .css('display', 'block')
    .parent()
    .zoom();
   

    $('.cart_add input[name="select_all"]').click(function() {
        // 获取总复选框的状态
        var isChecked = $(this).prop('checked');
        // 设置所有商品复选框的状态与总复选框一致
        $('td.cart_add input[name="checkItem"]').prop('checked', isChecked);
      });
  


      // 当任一商品复选框被点击时
      $('td.cart_add input[name="checkItem"]').click(function() {
        // 检查是否所有商品复选框都被选中
        var allChecked = $('td.cart_add input[name="checkItem"]:checked').length === $('td.cart_add input[name="checkItem"]').length;
        // 更新总复选框的状态
        $('th.cart_add input[name="select_all"]').prop('checked', allChecked);
      });

})(jQuery);
