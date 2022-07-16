//1.풀페이지 스크롤
$(function(){
    $('#fullpage').fullpage({
        fingersonly: true,
        anchors:['firstPage','secondPage','thirdPage','fourthPage','fifthPage','sixthPage','seventhPage'],
        menu:'.rightNav',
        afterLoad: function(anchorLink, index){
            if(index == 2){
                $('.count').counterUp({delay: 10,time: 550});
                }
            if(index == 3){
                $('.count2').counterUp({delay: 10,time: 550});
            }
        }
    });
});

    
    
    
    
    
//2.GNB
$(function(){
    setGnb();
    function setGnb(){
        $('.innerHeader .gnb > li > a ').on('mouseenter focus', function(){
            $('.innerHeader ').addClass('on');
            $('.innerHeader .gnb > li > .inner').addClass('on');
            $('header').css({'border':'none'});
        });
        $('header').on('mouseleave', function(){
            $('.innerHeader ').removeClass('on');
            $('.innerHeader .gnb > li > .inner').removeClass('on');
            $('header').css({'border':'1px solid rgba(255,255,255,0.1)'});
        });
    }
});

//3.이미지슬라이드
$(function(){
    $('.visual').slick({
        arrows: false,
        dots: true,
        fade: true,
        autoplay : true,
        pauseOnHover: false,
        pauseOnFocus: false,
        autoplaySpeed : 2800,
        customPaging: function(slider, i){
            var tit = $(slider.$slides[i]).find('.dot').html();
            return '<div class="pager-tit" class= "+ i +">'+ tit + '</div>';     
        }         
    });
});

//4.이미지슬라이드- 넓이 높이 스크립트

$(function(){
    var winW = $(window).width();
    var winH = $(window).height();
         list = $('.visual .list');
    list.css({width: winW+ 'px', height:winH+ 'px'});
});


 









 