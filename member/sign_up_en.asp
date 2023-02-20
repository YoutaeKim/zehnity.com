<%
  Language="KO"
  PageName = "sub07"
  SubName = "en"
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
                    Sign Up
                </div>

                <form action="">
                    <div class="input_common_form_box">
                        <span class="nav_ment">Please enter your personal information.</span>
                        <label for="name" class="common_input_box">
                            Name
                            <input type="text" class="common_input" id="name">
                        </label>
                        <!-- 사용중인 id일 때 나오는 멘트 입니다. -->
                        <span class="used_id">The ID is already in use.</span>
                        <!-- END -->

                        <label for="email" class="common_input_box">
                            E-mail
                            <input type="text" class="common_input" id="email">
                        </label>

                        <label for="p_num" class="common_input_box">
                            Cell phone number
                            <input type="text" class="common_input" id="p_num">
                        </label>

                        <label for="pw" class="common_input_box">
                            Password
                            <div class="pw_wrap">
                                <input type="password" class="common_input pw" id="pw">
                                <button type="button" class="pw_btn"></button>
                            </div>
                        </label>

                        <label for="pw_2" class="common_input_box">
                            Confirm password
                            <div class="pw_wrap">
                                <input type="password" class="common_input pw" id="pw_2">
                                <button type="button" class="pw_btn"></button>
                            </div>
                        </label>

                        <span class="nav_ment two">agreed to the terms and conditions</span>

                        <div class="alt_form_box">
                            <div class="use_box_wrap">
                                <input type="checkbox" id="use">
                                <label for="use">
                                    I accept the terms and conditions.
                                </label>
                                <a href="javascript:;" class="use_view" onclick="use_modalOpen();">[View the terms and conditions]</a>
                            </div>
                            <div class="use_box_wrap">
                                <input type="checkbox" id="use_2">
                                <label for="use_2">
                                    I agree with the privacy policy.
                                </label>
                                <a href="javascript:;" class="use_view" onclick="use_modalOpen();">[View the terms and conditions]</a>
                            </div>
                        </div>

                        <button type="button" class="common_submit_btn">Sign Up</button>
                        <div class="sns_ment">Get started easily with SNS</div>
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