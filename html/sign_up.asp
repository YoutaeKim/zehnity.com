<%
  Language="KO"
  PageName = "sub07"
  SubName = "ko"
  header = "sub"
%>

<!-- #include file = '../include/head.asp' -->
<!-- #include file = '../include/header.asp' -->
<!-- #include file = '../include/sub_title.asp' -->

<!-- modal -->
<div class="use_modal_wrap">
    <div class="modal">
        <div class="use_modal_box common_modal_box">
            <div class="top_box">
                <div class="tit">이용약관</div>
                <button type="button" class="close_btn" onclick="use_modalClose();"></button>
            </div>
            <div class="alt_box">
                <div class="alt">
                    이용약관 내용이 들어갑니다.
                </div>
            </div>
        </div>
    </div>
</div>
<!-- END modal -->

<!-- container -->
<div id="container" class="">
    <!-- sign -->
    <div class="login_wrap sgin_wrap">
        <div class="sub_wrap two">
            <div class="inner con_inner">
                <div class="sub_commom_tit">
                    회원가입
                </div>

                <form action="">
                    <div class="input_common_form_box">
                        <span class="nav_ment">개인정보를 입력해 주세요.</span>
                        <label for="name" class="common_input_box">
                            이름
                            <input type="text" class="common_input" id="name">
                        </label>
                        <!-- 사용중인 id일 때 나오는 멘트 입니다. -->
                        <span class="used_id">이미 사용중인 아이디입니다.</span>
                        <!-- END -->

                        <label for="email" class="common_input_box">
                            이메일
                            <input type="text" class="common_input" id="email">
                        </label>

                        <label for="p_num" class="common_input_box">
                            핸드폰번호
                            <input type="text" class="common_input" id="p_num">
                        </label>

                        <label for="pw" class="common_input_box">
                            비밀번호
                            <div class="pw_wrap">
                                <input type="password" class="common_input pw" id="pw">
                                <button type="button" class="pw_btn"></button>
                            </div>
                        </label>

                        <label for="pw_2" class="common_input_box">
                            비밀번호 확인
                            <div class="pw_wrap">
                                <input type="password" class="common_input pw" id="pw_2">
                                <button type="button" class="pw_btn"></button>
                            </div>
                        </label>

                        <span class="nav_ment two">약관동의</span>

                        <div class="alt_form_box">
                            <div class="use_box_wrap">
                                <input type="checkbox" id="use">
                                <label for="use">
                                    이용약관에 동의합니다.
                                </label>
                                <a href="javascript:;" class="use_view" onclick="use_modalOpen();">[약관내용보기]</a>
                            </div>
                            <div class="use_box_wrap">
                                <input type="checkbox" id="use_2">
                                <label for="use_2">
                                    개인정보처리방침에 동의합니다.
                                </label>
                                <a href="javascript:;" class="use_view" onclick="use_modalOpen();">[약관내용보기]</a>
                            </div>
                        </div>

                        <button type="button" class="common_submit_btn">회원가입</button>
                        <div class="sns_ment">SNS로 간편하게 시작하기</div>
                        <div class="sns_link_box">
                            <a href="javascript:;" class="link"></a>
                            <a href="javascript:;" class="link"></a>
                            <a href="javascript:;" class="link"></a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- END sign -->
</div>
<!-- END container -->

<script>
    $(document).ready(function () {
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
    // modal
    function use_modalOpen() {
        $(".use_modal_wrap .modal").fadeIn();
        $('body, html').addClass('on');
    }

    function use_modalClose() {
        $(".use_modal_wrap .modal").fadeOut();
        $('body, html').removeClass('on');
    }
    // END modal
</script>

<!-- #include file = '../include/footer.asp' -->