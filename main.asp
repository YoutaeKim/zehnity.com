<!--#include virtual="/common/fun/fncSetup.asp"-->
<!--#include virtual="/common/inc/inc_clsInit.asp"-->
<!--#include virtual="/common/class/clsBoard.asp"-->
<%
  Language="KO"
  PageName = ""
  SubName = "ko"
Set objBoard = New clsBoard
Dim arrPhotoList : arrPhotoList = objBoard.GetBoardCommonList( "", "", "B0104", 0, 0, 0, 1, 10)
Dim arrNewsList : arrNewsList = objBoard.GetBoardCommonList( "", "", "B0101", 0, 0, 0, 1, 10)
Set objBoard = Nothing
%>

<!-- #include file = './include/head.asp' -->
<!-- #include file = './include/header.asp' -->

<!-- container -->
<div id="container" class="">
    <!-- mv -->
    <div class="mv">
        <div class="mv_bg">
            <div class="mv_img"></div>
        </div>
        <div class="inner con_inner">
            <div class="mv_tit_box">
                Use the Sponsorship System <br class="hide-900" />
                to <span>Facilitate Sponsorship</span>
            </div>
            <div class="mv_sub_txt">
                제니티는 무료로 제공되는 후원시스템입니다.
            </div>
            <div class="mv_info_box">
                <div class="box animated d-1s">
                    <div class="img_wrap">
                        <img class="lazy" data-src="/image/main/mv_icon_01.png" alt="">
                    </div>
                    <div class="alt_box">
                        <div class="name">진행중인 프로젝트</div>
                        <div class="num"><span class="counter">780</span><span class="plus">+</span></div>
                    </div>
                </div>

                <div class="box animated d-3s">
                    <div class="img_wrap">
                        <img class="lazy" data-src="/image/main/mv_icon_02.png" alt="">
                    </div>
                    <div class="alt_box">
                        <div class="name">기부된 금액 ($)</div>
                        <div class="num counter">37,800</div>
                    </div>
                </div>

                <div class="box animated d-5s">
                    <div class="img_wrap">
                        <img class="lazy" data-src="/image/main/mv_icon_03.png" alt="">
                    </div>
                    <div class="alt_box">
                        <div class="name">함께하는 후원단체</div>
                        <div class="num"><span class="counter">480</span><span class="plus">+</span></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- END mv -->

    <!-- con1 -->
    <div class="con1 con">
        <div class="wave_box">
            <div class="dot dot1"></div>
            <div class="dot dot2"></div>
            <div class="dot dot3"></div>
            <div class="dot dot4"></div>
            <div class="dot dot5"></div>
            <div class="dot dot6"></div>
            <div class="wave_1">
                <svg version="1.1" xmlns="http://www.w3.org/2000/svg">
                    <defs></defs>
                    <path id="wave" d="" />
                </svg>
            </div>
            <div class="wave_2">
                <svg version="1.1" xmlns="http://www.w3.org/2000/svg">
                    <defs></defs>
                    <path id="wave1" d="" />
                </svg>
            </div>
        </div>

        <div class="inner">

            <div class="common_tit_box animated d-1s">
                <div class="tit">APP SERVICE</div>
                <div class="name">
                    제니티 서비스는 앱으로도 <br />
                    이용하실 수 있습니다.
                </div>
            </div>

            <div class="common_btn_box animated d-2s">
                <a href="javascript:;" class="common_btn a">
                    <div class="icon"></div>
                    <div class="txt">Google Play store</div>
                </a>

                <a href="javascript:;" class="common_btn">
                    <div class="icon a"></div>
                    <div class="txt">iOS App store</div>
                </a>
            </div>

            <div class="device_slide_box animated d-3s">
                <div class="swiper mySwiper device_slide">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide item">
                            <div class="img_box">
                                <img src="/image/main/device_img_01.png" alt="">
                            </div>
                        </div>

                        <div class="swiper-slide item">
                            <div class="img_box">
                                <img src="/image/main/device_img_02.png" alt="">
                            </div>
                        </div>

                        <div class="swiper-slide item">
                            <div class="img_box">
                                <img src="/image/main/device_img_03.png" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <!-- END con1 -->

    <!-- con2 -->
    <div class="con2 con">

        <div class="common_tit_box">
            <div class="tit">APPLICATION METHOD</div>
            <div class="name">후원 시스템 신청 방법</div>
        </div>

        <div class="step_wrap">
            <ul class="step_box" data-rolling-time="2000">
                <li class="box">
                    <div class="img_wrap">
                        <span class="bg"></span>
                        <span class="bg"></span>
                        <span class="bg"></span>
                        <span class="bg"></span>
                    </div>
                    <div class="txt_box">
                        <div class="step">STEP 01</div>
                        <div class="name">
                            후원시스템 <br />
                            신청서 작성하기
                        </div>
                    </div>
                </li>
                <li class="box">
                    <div class="img_wrap">
                        <span class="bg"></span>
                        <span class="bg"></span>
                        <span class="bg"></span>
                        <span class="bg"></span>
                    </div>
                    <div class="txt_box">
                        <div class="step">STEP 02</div>
                        <div class="name">MVSI 등록하기</div>
                    </div>
                </li>
                <li class="box">
                    <div class="img_wrap">
                        <span class="bg"></span>
                        <span class="bg"></span>
                        <span class="bg"></span>
                        <span class="bg"></span>
                    </div>
                    <div class="txt_box">
                        <div class="step">STEP 03</div>
                        <div class="name">후원업체 인증하기</div>
                    </div>
                </li>
                <li class="box">
                    <div class="img_wrap">
                        <span class="bg"></span>
                        <span class="bg"></span>
                        <span class="bg"></span>
                        <span class="bg"></span>
                    </div>
                    <div class="txt_box">
                        <div class="step">STEP 04</div>
                        <div class="name">후원프로젝트 등록하기</div>
                    </div>
                </li>
                <li class="box">
                    <div class="img_wrap">
                        <span class="bg"></span>
                        <span class="bg"></span>
                        <span class="bg"></span>
                        <span class="bg"></span> </div>
                    <div class="txt_box">
                        <div class="step">STEP 05</div>
                        <div class="name">후원내역 확인하기</div>
                    </div>
                </li>
            </ul>
        </div>



    </div>
    <!-- END con2 -->

    <!-- con3 -->
    <div class="con3 con">
        <div class="inner">
            <div class="common_tit_box">
                <div class="tit">INTRODUCTION OF SPONSORS</div>
                <div class="name">함께하는 후원단체</div>
            </div>

            <div class="spon_box">
                <div class="box">
                    <div class="img_wrap">
                        <img class="lazy" data-src="/image/main/con3_img_01.png" alt="">
                    </div>
                    <div class="img_wrap">
                        <img class="lazy" data-src="/image/main/con3_img_02.png" alt="">
                    </div>
                    <div class="img_wrap">
                        <img class="lazy" data-src="/image/main/con3_img_03.png" alt="">
                    </div>
                    <div class="img_wrap">
                        <img class="lazy" data-src="/image/main/con3_img_04.png" alt="">
                    </div>
                </div>
                <div class="box">
                    <div class="img_wrap">
                        <img class="lazy" data-src="/image/main/con3_img_02.png" alt="">
                    </div>
                    <div class="img_wrap">
                        <img class="lazy" data-src="/image/main/con3_img_03.png" alt="">
                    </div>
                    <div class="img_wrap">
                        <img class="lazy" data-src="/image/main/con3_img_04.png" alt="">
                    </div>
                    <div class="img_wrap">
                        <img class="lazy" data-src="/image/main/con3_img_01.png" alt="">
                    </div>
                </div>
            </div>
            <div class="common_btn_box">
                <a href="/html/support.asp" class="common_btn">
                    <div class="txt">후원단체 더보기</div>
                </a>
            </div>

            <!-- con4 -->
            <div class="con4 con">
                <div class="common_tit_box">
                    <div class="tit">PHOTO GALLERY</div>
                    <div class="name">
                        후원단체 활동사진
                        <div class="con4_arw common_arw_box">
                            <div class="left slide_arw"></div>
                            <span></span>
                            <div class="right slide_arw"></div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END con4 -->
        </div>
        <div class="con4_slide_wrap">
            <div class="swiper mySwiper con4_slide">
                <div class="swiper-wrapper">
<%
	If IsArray(arrPhotoList) Then
		For i = 0 To UBound(arrPhotoList,2)
			If Not(arrPhotoList(4, i) = "" Or isNull(arrPhotoList(4, i))) Then
				Cols_TitleImg = arrPhotoList(4, i)
			Else
				Cols_TitleImg = "/image/main/con4_img_01.png"
			End If
%>
	
					<div class="swiper-slide item">
                        <div class="img_wrap">
                            <img src="<%=Cols_TitleImg%>" alt="">
                        </div>
                        <div class="name text_ov"><%=arrPhotoList(12, i)%></div>
                        <div class="alt text_ov2">
                            <%=arrPhotoList(2, i)%>
                        </div>
                        <div class="date"><%=fnDateFormat(arrPhotoList(8, i),6)%></div>
                    </div>
<%
		Next
	End If
%>
                     
                </div>
            </div>
        </div>
        <div class="common_btn_box">
            <a href="/html/photo.asp" class="common_btn">
                <div class="txt">활동사진 더보기</div>
            </a>
        </div>
    </div>
    <!-- END con3 -->

    <!-- con5 -->
    <div class="con5 con">
        <div class="inner">
            <div class="common_tit_box">
                <div class="tit">NEWS ROOM</div>
                <div class="name">
                    제니티 뉴스룸
                </div>
                <div class="con5_arw common_arw_box">
                    <div class="left slide_arw"></div>
                    <span></span>
                    <div class="right slide_arw"></div>
                </div>
            </div>

            <div class="con5_slide_box animated d-1s">
                <div class="swiper mySwiper con5_slide">
                    <div class="swiper-wrapper">
<%
	If IsArray(arrNewsList) Then
		For i = 0 To UBound(arrNewsList,2)
			If Not(arrNewsList(4, i) = "" Or isNull(arrNewsList(4, i))) Then
				Cols_TitleImg = arrNewsList(4, i)
			Else
				Cols_TitleImg = "/image/main/con5_img_01.png"
			End If
%>                        
						<div class="swiper-slide item" onclick="location.href='/html/news_room_view.asp?bCode=<%=arrNewsList(0, i)%>';" style="cursor:pointer;">
                            <div class="img_box">
                                <img src="<%=Cols_TitleImg%>" alt="">
                            </div>
                            <div class="name text_ov2">
                                <%=arrNewsList(2, i)%>
                            </div>
                            <div class="date"><%=fnDateFormat(arrNewsList(8, i),6)%></div>
                        </div>
<%
		Next
	End If
%>


                    </div>
                </div>
            </div>

        </div>
    </div>
    <!-- END con5 -->

    <!-- con6 -->
    <div class="con6 con scale">
        <div class="inner">
            <div class="common_tit_box animated d-1s">
                <div class="name">
                    <span>사랑이 필요한 모든곳에서</span> <br />
                    제니티는 여러분과 함께합니다.
                </div>
            </div>

            <div class="common_btn_box animated d-3s">
                <a href="javascript:;" class="common_btn a">
                    <div class="txt">제안서 다운</div>
                    <div class="down"></div>
                </a>

                <a href="/html/system.asp" class="common_btn center">
                    <div class="txt">후원시스템 신청</div>
                </a>
            </div>
        </div>
    </div>
    <!-- END con6 -->

</div>
<!-- END container -->

<link rel="preload" as="style" href="https://unpkg.com/swiper@8/swiper-bundle.min.css">
<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css">

<!-- <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script> -->

<script src="/js/swiper.min.js"></script>

<script>
    $(document).ready(function () {

        // device_sldie
        var swiper3 = new Swiper(".device_slide", {
            slidesPerView: 'auto',
            spaceBetween: 40,
            centeredSlides: true,
            loop: true,
            touchRatio: 0,
            simulateTouch: false,
            allowTouchMove: false,
            autoplay: {
                delay: 2500,
                disableOnInteraction: false,
            },
            breakpoints: {
                900: {
                    spaceBetween: 90,
                },
            },
        });

        // END device_sldie

        // con4_slide
        var swiper4 = new Swiper(".con4_slide", {
            spaceBetween: 30,
            slidesPerView: 'auto',
            loop: true,
            navigation: {
                nextEl: ".con4_arw .right",
                prevEl: ".con4_arw .left",
            },
            autoplay: {
                delay: 2500,
                disableOnInteraction: false,
            },
        });

        // END con4_slide

        // con5_slide
        var swiper5 = new Swiper(".con5_slide", {
            spaceBetween: 30,
            slidesPerView: 'auto',
            loop: true,
            navigation: {
                nextEl: ".con5_arw .right",
                prevEl: ".con5_arw .left",
            },
            autoplay: {
                delay: 2500,
                disableOnInteraction: false,
            },
        });
        // END con5_slide       

        // 카운팅
        $('.counter').counterUp({
            delay: 10,
            time: 1000
        });
        // END       

        // wave

        /* *
         * height : 파도 path 의 height
         * bones : 파도 폭 (숫자가 클수록 파도 갯수가 많아짐)
         * amplitude : 파도 높이 (숫자가 클수록 많이 넘실거림)
         * color : 파도 path fill 색상
         * speed : 파도 치는 속도
         * */

        var bsWaveOption1;
        var bsWaveOption2;

        bsWaveOption1 = {
            height: 50,
            bones: 2,
            amplitude: 95,
            color: "transparent",
            speed: 0.4
        };
        bsWaveOption2 = {
            height: 50,
            bones: 2,
            amplitude: 120,
            color: "transparent",
            speed: 0.3
        };

        wave1 = new Wavify($("#wave"), bsWaveOption1);
        wave2 = new Wavify($("#wave1"), bsWaveOption2);
        // END wave        

        rollingActive(".step_box");
    });
    // circle
    function rollingActive(activeList) {
        $(activeList).each(function (index) {
            $itemList = $(this);
            $item = $itemList.find("li");
            itemLength = $item.length;
            startNum = 0;
            rollingSpeed = $itemList.data("rolling-time");

            function visualTime() {
                if (startNum < (itemLength - 1)) {
                    startNum++;
                } else {
                    startNum = 0;
                }
                visualPlay();
            }

            function visualPlay() {
                $item.each(function (id) {
                    if (id == startNum) {
                        $(this).addClass("active");
                    } else {
                        $(this).removeClass("active");
                    }
                });
            };
            visualPlay();
            visual_timer = setInterval(visualTime, rollingSpeed);

            if (window.innerWidth > 900) {
                $(".step_box li").hover(function () {
                    clearInterval(visual_timer);
                    $(".step_box li").removeClass("active");
                    $(this).addClass("active");
                }, function () {
                    clearInterval(visual_timer);
                    $(".step_box li").removeClass("active");
                    visual_timer = setInterval(visualTime, rollingSpeed);
                });
            }
        });
    }

    // END circle
</script>

<!-- #include file = './include/footer.asp' -->