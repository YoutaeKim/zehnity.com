$(document).ready(function () {
    // gnb
    $(window).scroll(function () {
        if ($(window).scrollTop() > 0) {
            $('#header').addClass('fix');
        } else {
            $('#header').removeClass('fix');
        }
    });    

    $('.mb_gnb_btn').on('click', function () {
        var btn = $('.gnb_box_wrap');
        $(this).toggleClass('on');
        btn.slideToggle();
        $('body, html').toggleClass('on');
        if (!$(window).scrollTop() > 0) {
            $('#header').addClass('fix');
        }
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
// END