$(document).ready(function () {
    // gnb
    $(window).scroll(function () {
        if ($(window).scrollTop() > 0) {
            $('#header').addClass('fix');
            $('.top_btn').addClass('on');
        } else {
            $('#header').removeClass('fix');
            $('.top_btn').removeClass('on');
        }
    });

    $('.mb_gnb_btn').on('click', function () {
        var btn = $('.mb_gnb');
        $(this).toggleClass('on');
        btn.toggleClass('on');
    });

    function gnbMenu() {
        if (window.innerWidth > 1599) {
            $('.gnb > li').on('mouseenter focusin', function () {
                $(this).siblings().removeClass('active');
                $(this).siblings().find('.lang').stop().hide();
                $(this).addClass('active');
                $(this).find('.lang').stop().show();
            });
            $('.gnb > li').on('mouseleave focusout', function () {
                $('.gnb > li').siblings().find('.lang').stop().hide();
                $('.gnb > li').removeClass('active');
            });
        } else {
            $('.gnb > li').on('click', function () {
                $(this).siblings().removeClass('active');
                $(this).siblings().find('.lang').slideUp();
                $(this).toggleClass('active');
                $(this).find('.lang').slideToggle();
            });
        }
    }
    gnbMenu();
    // END

    // sub_mv
    if (window.innerWidth < 900) {
        $('.sub_mv .dark_bg').on('click', function () {
            var dim = $(".sub_wrap ");
            $(this).find('.sub_menu_wrap').stop().slideToggle();
            dim.toggleClass('on');
        });
    }
    // END sub_mv

    // 한/영
    $('.global_box').on('click', function () {
        $(this).find('.lang').toggleClass('on');
    });
    // END 한/영

    // 필터
    $('.select').on('click', function () {
        $(this).parent().toggleClass('on');
    });

    $('.select_menu .menu').on('click', function () {
        var txt = $(this).text();
        var box = $(".select span");
        box.text(txt);
    });
    // END

    // 이미지
    const useLazyLoading = () => {
        const imgs = document.querySelectorAll('.lazy');

        const observerCallback = (entries, observer) => {
            entries.forEach(({
                isIntersecting,
                intersectionRatio,
                target
            }) => {
                if (isIntersecting && intersectionRatio > 0) {
                    target.src = target.dataset.src;
                    target.classList.remove("lazy");
                    observer.unobserve(target);
                }
            });
        };

        const io = new IntersectionObserver(observerCallback);
        imgs.forEach((img) => io.observe(img));
    };
    useLazyLoading();
    // END 이미지  

    // 텍스트 애니메이션
    var target = $('.animated');
    var target2 = $('.animated_2');
    var target3 = $('.animated_3');
    var target4 = $('.animated_4');
    var target5 = $('.scale');
    var target6 = $('.ani');

    target.each(function (i, v) {
        $(this).waypoint(function () {
            $(v).addClass('on')
        }, {
            offset: '100%'
        })
    })

    target2.each(function (i, v) {
        $(this).waypoint(function () {
            $(v).addClass('on')
        }, {
            offset: '100%'
        })
    })
    target3.each(function (i, v) {
        $(this).waypoint(function () {
            $(v).addClass('on')
        }, {
            offset: '100%'
        })
    })
    target4.each(function (i, v) {
        $(this).waypoint(function () {
            $(v).addClass('on')
        }, {
            offset: '100%'
        })
    })

    target5.each(function (i, v) {
        $(this).waypoint(function () {
            $(v).addClass('on')
        }, {
            offset: '100%'
        })
    })

    target6.each(function (i, v) {
        $(this).waypoint(function () {
            $(v).addClass('on')
        }, {
            offset: '100%'
        })
    })



});

//페이지 맨 위로 보내기
function goPageTop() {
    $("html, body").stop().animate({
        scrollTop: 0
    }, 1200);
}

//페이지 로드
// window.onbeforeunload = function () {
//     $('#load').show();
//     $('body, html').addClass('on');
// }

// $(window).load(function () {
//     $('#load').hide();
//     $('body, html').removeClass('on');
// });

// $(window).unload(function () {
//     $('#load').hide();
//     $('body, html').removeClass('on');
// });
// END