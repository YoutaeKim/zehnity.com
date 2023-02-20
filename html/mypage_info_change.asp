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
    <div class="mypage_wrap login_wrap info">
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
                        <li class="on">
                            <a href="../html/mypage_info_change.asp">
                                정보 변경
                            </a>
                        </li>
                        <li>
                            <a href="../html/mypage_info_edit.asp">
                                후원단체 정보관리
                            </a>
                        </li>
                        <li>
                            <a href="../html/mypage_management.asp">
                                후원프로젝트 관리
                            </a>
                        </li>
                    </ul>
                    <div class="input_common_form_box">
                        <div class="cg_tit">비밀번호 변경</div>
                        <label for="pw" class="common_input_box">
                            현재 비밀번호
                            <div class="pw_wrap">
                                <input type="password" class="common_input pw" id="pw">
                                <button type="button" class="pw_btn"></button>
                            </div>
                        </label>

                        <label for="pw_2" class="common_input_box">
                            새로운 비밀번호
                            <div class="pw_wrap">
                                <input type="password" class="common_input pw" id="pw_2">
                                <button type="button" class="pw_btn"></button>
                            </div>
                        </label>

                        <button type="button" class="common_submit_btn">확인</button>

                        <div class="withdraw_box">
                            <div class="name">회원탈퇴</div>
                            <div class="alt">
                                Zehnity 서비스를 더 이상 이용하지 않을 경우 회원 정보를 삭제합니다. <br />
                                후원단체 및 후원 프로젝트가 있는 경우에는 삭제 후 탈퇴가 가능합니다.
                            </div>
                            <a href="javascript:;" class="withdraw_btn">회원탈퇴 하기</a>
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