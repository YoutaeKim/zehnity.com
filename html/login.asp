<%
  Language="KO"
  PageName = "sub06"
  SubName = "ko"
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
                    로그인
                </div>

                <form action="">
                    <div class="input_common_form_box">
                        <label for="email" class="common_input_box">
                            이메일
                            <input type="text" class="common_input" id="email">
                        </label>

                        <label for="pw" class="common_input_box">
                            비밀번호
                            <div class="pw_wrap">
                                <input type="password" class="common_input pw" id="pw">
                                <button type="button" class="pw_btn"></button>
                            </div>
                        </label>

                        <div class="alt_form_box">
                            <input type="checkbox" id="login_chk">
                            <label for="login_chk">
                                로그인유지
                            </label>
                            <a href="javascript:;" class="pw_link">비밀번호 찾기</a>
                        </div>

                        <button type="button" class="common_submit_btn">로그인</button>
                        <div class="sns_ment">SNS로 간편하게 시작하기</div>
                        <div class="sns_link_box">
                            <a href="javascript:;" class="link"></a>
                            <a href="javascript:;" class="link"></a>
                            <a href="javascript:;" class="link"></a>
                        </div>
                        <div class="sns_etc_ment">
                            아직 제니티 계정이 없으신가요?
                            <a href="../html/sign_up.asp" class="pw_link">회원가입 하기</a>
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