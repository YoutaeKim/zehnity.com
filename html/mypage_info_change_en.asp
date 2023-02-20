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
    <div class="mypage_wrap login_wrap info">
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
                                <div class="name">a donation received<br class="hide-default show-700"/>this month($)</div>
                            </div>
                        </div>
                    </div>

                    <ul class="sub_menu_wrap">
                        <li>
                            <a href="../html/mypage_en.asp">
                                1:1 inquiry
                            </a>
                        </li>
                        <li class="on">
                            <a href="../html/mypage_info_change_en.asp">
                                Change information
                            </a>
                        </li>
                        <li>
                            <a href="../html/mypage_info_edit_en.asp">
                                Sponsored organization information management
                            </a>
                        </li>
                        <li>
                            <a href="../html/mypage_management_en.asp">
                                Sponsored project management
                            </a>
                        </li>
                    </ul>

                    <div class="input_common_form_box">
                        <div class="cg_tit">Change password</div>
                        <label for="pw" class="common_input_box">
                            Current password
                            <div class="pw_wrap">
                                <input type="password" class="common_input pw" id="pw">
                                <button type="button" class="pw_btn"></button>
                            </div>
                        </label>

                        <label for="pw_2" class="common_input_box">
                            New password
                            <div class="pw_wrap">
                                <input type="password" class="common_input pw" id="pw_2">
                                <button type="button" class="pw_btn"></button>
                            </div>
                        </label>

                        <button type="button" class="common_submit_btn">Check</button>

                        <div class="withdraw_box">
                            <div class="name">Withdrawal</div>
                            <div class="alt">
                                Delete the membership information if you no longer use the Zehnity service. <br />
                                If you have a sponsoring organization or a sponsoring project, you can delete it and withdraw it.
                            </div>
                            <a href="javascript:;" class="withdraw_btn">Withdrawaling</a>
                        </div>

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
        // 아코디언
        $('.ques_box').on('click', function () {
            if ($(this).parent().hasClass('active')) {
                $(this).parent().removeClass('active');
                $(this).siblings('.ques_answer_box').slideUp();
                $(this).siblings('.sub_alt').slideUp();
            } else if ($(this).find('.mode').hasClass('on')) {
                $('.ques_box').siblings('.ques_answer_box').slideUp();
                $('.ques_box').siblings('.sub_alt').slideUp();
                $(this).parent().siblings().removeClass('active');
                $(this).parent().addClass('active');
                $(this).siblings('.ques_answer_box').slideDown();
                $(this).siblings('.sub_alt').slideDown();
            }
        });
        // END 아코디언
        // 비밀번호       

        $(".common_input.pw").on("keyup", function (event) {
            if (this.value) {
                $(this).next(".pw_btn").addClass("on");
            } else {
                $(this).next(".pw_btn").removeClass("on");
            }
        });

        $('.pw_btn').on('click', function () {
            $(this).parent().toggleClass('on');
            if ($(this).parent().hasClass('on')) {
                $(this).prev().attr('type', "text");
            } else {
                $(this).prev().attr('type', "password");
            }
        });

        // END 비밀번호
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