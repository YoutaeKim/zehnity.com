<%
  Language="KO"
  PageName = "sub01"
  SubName = "ko"
  header = "sub"
%>

<!-- #include file = '../include/head.asp' -->
<!-- #include file = '../include/header.asp' -->
<!-- #include file = '../include/sub_title.asp' -->

<!-- container -->
<div id="container" class="">
    <!-- service -->
    <div class="service_wrap ">
        <div class="sub_wrap">
            <div class="inner con_inner">
                <div class="top_txt">
                    제니티 후원 시스템은 <br />
                    종교단체, 학교후원, 정부후원에 <br />
                    사용이가능합니다.
                </div>
                <div id="text" class="txt_move"></div>
                <div class="img_con_box">
                    <div class="box scroll_box d-1s">
                        <div class="img_wrap"></div>
                        <div class="alt_box">
                            <div class="name">종교단체</div>
                            <div class="alts">
                                교회, 천주교 등 제니티 후원 시스템을 사용하여 <br class="hide-1399"/>
                                오프라인과 동일한 온라인 기부 환경을 만들어 드립니다
                            </div>
                        </div>
                    </div>
                    <div class="box animated d-2s">
                        <div class="img_wrap"></div>
                        <div class="alt_box">
                            <div class="name">학교후원</div>
                            <div class="alts">
                                학교에서 바자회, 플리마켓, 후원모금 등 다양한 활동에서<br class="hide-1399" />
                                제니티의 후원 시스템을 이용하실 수 있습니다. <br class="hide-1399" />
                                나눔의 실천으로 행복을 경험하세요.
                            </div>
                        </div>
                    </div>
                    <div class="box animated d-2s">
                        <div class="img_wrap"></div>
                        <div class="alt_box">
                            <div class="name">정부기관</div>
                            <div class="alts">
                                학교에서 바자회, 플리마켓, 후원모금 등 다양한 활동에서 <br class="hide-1399" />
                                제니티의 후원 시스템을 이용하실 수 있습니다. <br class="hide-1399" />
                                나눔의 실천으로 행복을 경험하세요.
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="btm_wrap">
            <div class="btm_bg ani"></div>
            <div class="txt_box animated d-1s">
                홍보 시스템을 통해 내 지인과 친구들에게 <br class="hide-900"/>
                캠페인을 홍보해 보세요
            </div>
        </div>
    </div>
    <!-- END service -->
</div>
<!-- END container -->

<script>
    $(document).ready(function () {
        // 스크롤 이벤트
        $(window).scroll(function () {
            if ($(window).scrollTop() > 0) {
                $('.scroll_box').addClass('on');
            }
        });
        // END

    });
    // 스크롤 이벤트
    let stars = document.getElementById('text');

    window.addEventListener('scroll', function () {
        let value = window.scrollY;
        text.style.marginRight = value * 1 + 'px';
    })
</script>

<!-- #include file = '../include/footer.asp' -->