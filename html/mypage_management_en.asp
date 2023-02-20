<%
  Language="KO"
  PageName = "mypage"
  SubName = "en"
  header = "sub"
%>

<!-- #include file = '../include/head.asp' -->
<!-- #include file = '../include/header.asp' -->
<!-- #include file = '../include/sub_title.asp' -->

<!-- container -->
<div id="container" class="en">
    <!-- mypage -->
    <div class="mypage_wrap management">
        <div class="sub_wrap two">
            <div class="inner con_inner">
                <div class="mypage_box_wrap">

                    <div class="info_box">
                        <div class="profile">
                            <div class="img_box">
                                <div class="img"></div>
                                <div class="name">ID Hong Gildong</div>
                            </div>
                        </div>
                        <div class="alt_box">
                            <div class="box">
                                <div class="num">
                                    <span>80</span>
                                    cases
                                </div>
                                <div class="name">an ongoing<br class="hide-default show-700"/> project</div>
                            </div>

                            <div class="box">
                                <div class="num">
                                    <span>36</span>
                                    cases
                                </div>
                                <div class="name">Project<br class="hide-default show-700"/> Ended</div>
                            </div>

                            <div class="box">
                                <div class="num">
                                    <span>3,507</span>
                                </div>
                                <div class="name">a donation received<br class="hide-default show-700"/> this month($)</div>
                            </div>
                        </div>
                    </div>

                    <ul class="sub_menu_wrap">
                        <li>
                            <a href="../html/mypage_en.asp">
                                1:1 inquiry
                            </a>
                        </li>
                        <li>
                            <a href="../html/mypage_info_change_en.asp">
                                Change information
                            </a>
                        </li>
                        <li>
                            <a href="../html/mypage_info_edit_en.asp">
                                Sponsored organization information management
                            </a>
                        </li>
                        <li class="on">
                            <a href="../html/mypage_management_en.asp">
                                Sponsored project management
                            </a>
                        </li>
                    </ul>

                    <div class="mypage_tit">
                        Sponsored project management
                        <div class="sub_tit">
                            <span>If you register for an event that requires sponsorship, a separate sponsorship-only page will be created.</span>
                            <a href="../html/mypage_management_add_en.asp" class="add_btn common_submit_btn">Register a project</a>
                        </div>
                    </div>
                    <!-- 게시글 없을 시 -->
                    <div class="no_ct">
                        <div class="img"></div>
                        No posts have been created.
                    </div>
                    <!-- END 게시글 없을 시 -->
                    <div class="magnagement_wrap">
                        <div class="top_box common_box">
                            <div class="num">No</div>
                            <div class="tit">Sponsored Project Title</div>
                            <div class="date">Period of operation</div>
                            <div class="won">Target amount</div>
                            <div class="people">the number of participants</div>
                            <div class="won2">Recruitment amount</div>
                            <div class="percent">attainment rate</div>
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
                                    <button type="button" class="mg_btn">Management</button>
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
                                    <button type="button" class="mg_btn">Management</button>
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