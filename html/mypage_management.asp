<%
  Language="KO"
  PageName = "mypage"
  SubName = "ko"
  header = "sub"
%>

<!-- #include file = '../include/head.asp' -->
<!-- #include file = '../include/header.asp' -->
<!-- #include file = '../include/sub_title.asp' -->

<!-- container -->
<div id="container" class="">
    <!-- mypage -->
    <div class="mypage_wrap management">
        <div class="sub_wrap two">
            <div class="inner con_inner">
                <div class="mypage_box_wrap">

                    <div class="info_box">
                        <div class="profile">
                            <div class="img_box">
                                <div class="img"></div>
                                <div class="name">홍길동 님</div>
                            </div>
                        </div>
                        <div class="alt_box">
                            <div class="box">
                                <div class="num">
                                    <span>80</span>
                                    건
                                </div>
                                <div class="name">진행중인<br class="hide-default show-700"/> 프로젝트</div>
                            </div>

                            <div class="box">
                                <div class="num">
                                    <span>36</span>
                                    건
                                </div>
                                <div class="name">종료된<br class="hide-default show-700"/> 프로젝트</div>
                            </div>

                            <div class="box">
                                <div class="num">
                                    <span>3,507</span>
                                </div>
                                <div class="name">이번달 받은<br class="hide-default show-700"/> 후원금($)</div>
                            </div>
                        </div>
                    </div>

                    <ul class="sub_menu_wrap">
                        <li>
                            <a href="../html/mypage.asp">
                                1:1문의
                            </a>
                        </li>
                        <li>
                            <a href="../html/mypage_info_change.asp">
                                정보 변경
                            </a>
                        </li>
                        <li>
                            <a href="../html/mypage_info_edit.asp">
                                후원단체 정보관리
                            </a>
                        </li>
                        <li class="on">
                            <a href="../html/mypage_management.asp">
                                후원프로젝트 관리
                            </a>
                        </li>
                    </ul>

                    <div class="mypage_tit">
                        후원프로젝트 관리
                        <div class="sub_tit">
                            <span>후원이 필요한 행사를 등록하시면 별도의 후원전용 페이지가 생성됩니다.</span>
                            <a href="../html/mypage_management_add.asp" class="add_btn common_submit_btn">프로젝트 등록</a>
                        </div>
                    </div>
                    <!-- 게시글 없을 시 -->
                    <div class="no_ct">
                        <div class="img"></div>
                        작성하신 게시글이 없습니다.
                    </div>
                    <!-- END 게시글 없을 시 -->
                    <div class="magnagement_wrap">
                        <div class="top_box common_box">
                            <div class="num">No</div>
                            <div class="tit">후원 프로젝트 제목</div>
                            <div class="date">운영 기간</div>
                            <div class="won">목표 금액</div>
                            <div class="people">참여 인원</div>
                            <div class="won2">모집금액</div>
                            <div class="percent">달성률</div>
                        </div>
                        <div class="alt_box_wrap ">
                            <div class="box common_box">
                                <div class="num">5</div>
                                <div class="tit">40년만의 최악의 가뭄, 굶주리는 동동동</div>
                                <div class="date">2022.11.02 ~ 2022.12.22</div>
                                <div class="won">$ 1,035,000</div>
                                <div class="people">287</div>
                                <div class="won2">1,024,500 $ </div>
                                <div class="percent">
                                    <span class="p">70%</span>
                                    <button type="button" class="mg_btn">관리</button>
                                </div>
                            </div>
                            <div class="box common_box">
                                <div class="num">5</div>
                                <div class="tit">40년만의 최악의 가뭄, 굶주리는 동동동</div>
                                <div class="date">2022.11.02 ~ 2022.12.22</div>
                                <div class="won">$ 1,035,000</div>
                                <div class="people">287</div>
                                <div class="won2">1,024,500 $ </div>
                                <div class="percent">
                                    <span class="p">70%</span>
                                    <button type="button" class="mg_btn">관리</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="sub_page_nav">
                        <a href="javascript:;" class="box left"></a>
                        <a href="javascript:;" class="box left0"></a>
                        <a href="javascript:;" class="box num active">1</a>
                        <a href="javascript:;" class="box num">2</a>
                        <a href="javascript:;" class="box right0"></a>
                        <a href="javascript:;" class="box right"></a>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- END mypage -->
</div>
<!-- END container -->

<script>
    $(document).ready(function () {

    });

    // test
    window.onload = function () {
        var scroll = $('.sub_menu_wrap');
        var box = $('.sub_menu_wrap li.on a').offset().left;
        var scrollX = box - 40;
        scroll.stop().animate({
            scrollLeft: (scrollX)
        }, 1200);

    };
    // END
</script>

<!-- #include file = '../include/footer.asp' -->