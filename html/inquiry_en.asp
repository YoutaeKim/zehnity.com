<%
  Language="KO"
  PageName = "sub05"
  SubName = "en"
  Menu = "06"
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
                <div class="tit">Terms and Conditions</div>
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
    <!-- inquiry -->
    <div class="inquiry_wrap">
        <div class="sub_wrap two">
            <div class="inner con_inner">
                <div class="sub_commom_tit">
                    If you have any questions <br />
                    about using the sponsorship solution, <br />please contact us.
                </div>

                <div class="company_info_box">
                    <div class="box">
                        <div class="img_box">
                            <div class="img">
                                <img src="../image/sub/c_info_01.png" alt="">
                            </div>
                            E-mail
                        </div>
                        <div class="alt">
                            aron@arongoup.co.kr
                        </div>
                    </div>

                    <div class="box">
                        <div class="img_box">
                            <div class="img">
                                <img src="../image/sub/c_info_02.png" alt="">
                            </div>
                            Tel
                        </div>
                        <div class="alt">
                            070-8691-0166
                        </div>
                    </div>

                    <div class="box">
                        <div class="img_box">
                            <div class="img">
                                <img src="../image/sub/c_info_03.png" alt="">
                            </div>
                            Address
                        </div>
                        <div class="alt">
                            Room 1401, Digital-ro 33-gil,<br /> Guro-gu, Seoul, Republic of Korea
                        </div>
                    </div>
                </div>

                <form action="">
                    <div class="application_box">
                        <div class="tit">Please enter your information.</div>
                        <div class="label_box f en">
                            <label for="name" class="common_input_box r">
                                Group name
                                <input type="text" class="common_input" id="name">
                            </label>
                            <div class="radio_box">
                                Sponsorship classification
                                <div class="box_wrap">
                                    <label for="n_1" class="radio_label">
                                        <input type="radio" name="radio_btn" id="n_1" checked>
                                        <label for="n_1">a sponsoring organization</label>
                                    </label>

                                    <label for="n_2" class="radio_label">
                                        <input type="radio" name="radio_btn" id="n_2">
                                        <label for="n_2">religious group</label>
                                    </label>

                                    <label for="n_3" class="radio_label">
                                        <input type="radio" name="radio_btn" id="n_3">
                                        <label for="n_3">an educational body</label>
                                    </label>

                                    <label for="n_4" class="radio_label">
                                        <input type="radio" name="radio_btn" id="n_4">
                                        <label for="n_4">a political organization</label>
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="label_box f">
                            <label for="name_2" class="common_input_box r">
                                Applicant Name
                                <input type="text" class="common_input" id="name_2">
                            </label>

                            <label for="tell" class="common_input_box">
                                Contact Us
                                <input type="text" class="common_input" id="tell">
                            </label>
                        </div>

                        <div class="label_box">
                            <label for="email" class="common_input_box">
                                E-mail
                                <input type="text" class="common_input" id="email">
                            </label>
                        </div>

                        <label for="t_area" class="common_input_box t_area">
                            Contact details
                            <textarea id="t_area" class="common_area"></textarea>
                        </label>

                        <div class="alt_form_box">
                            <div class="use_box_wrap">
                                <input type="checkbox" id="use_2">
                                <label for="use_2">
                                    I agree to collect and use personal information.
                                </label>
                                <a href="javascript:;" class="use_view" onclick="use_modalOpen();">[View terms and conditions]</a>
                            </div>
                        </div>

                        <button type="button" class="common_submit_btn" >Contact Us</button>
                    </div>
                </form>

            </div>
        </div>
    </div>
    <!-- END inquiry -->
</div>
<!-- END container -->

<script>
    $(document).ready(function () {

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