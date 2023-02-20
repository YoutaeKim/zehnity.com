<%
  Language="KO"
  PageName = "sub06"
  SubName = "en"
  header = "sub"
%>

<!-- #include file = '../include/head.asp' -->
<!-- #include file = '../include/header.asp' -->
<!-- #include file = '../include/sub_title.asp' -->

<!-- container -->
<div id="container" class="">
    <!-- login -->
    <div class="login_wrap">
        <div class="sub_wrap two">
            <div class="inner con_inner">
                <div class="sub_commom_tit">
                    Login
                </div>

                <form action="">
                    <div class="input_common_form_box">
                        <label for="email" class="common_input_box">
                            E-mail
                            <input type="text" class="common_input" id="email">
                        </label>

                        <label for="pw" class="common_input_box">
                            Password
                            <div class="pw_wrap">
                                <input type="password" class="common_input pw" id="pw">
                                <button type="button" class="pw_btn"></button>
                            </div>
                        </label>

                        <div class="alt_form_box">
                            <input type="checkbox" id="login_chk">
                            <label for="login_chk">
                                Maintain Login
                            </label>
                            <a href="javascript:;" class="pw_link">Find Password</a>
                        </div>

                        <button type="button" class="common_submit_btn">Login</button>
                        <div class="sns_ment">Get started easily with SNS</div>
                        <div class="sns_link_box">
                            <a href="javascript:;" class="link"></a>
                            <a href="javascript:;" class="link"></a>
                            <a href="javascript:;" class="link"></a>
                        </div>
                        <div class="sns_etc_ment">
                            Don't you have a Zehnity account yet?
                            <a href="../html/sign_up_en.asp" class="pw_link">Sign Up</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- END login -->
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
</script>

<!-- #include file = '../include/footer.asp' -->