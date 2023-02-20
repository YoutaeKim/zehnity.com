<%
  Language="KO"
  PageName = "sub05"
  SubName = "en"
  Menu = "07"
  header = "sub"
%>

<!-- #include file = '../include/head.asp' -->
<!-- #include file = '../include/header.asp' -->
<!-- #include file = '../include/sub_title.asp' -->



<!-- container -->
<div id="container" class="">
    <!-- system -->
    <div class="system_wrap">
        <div class="sub_wrap two">
            <div class="inner con_inner">
                <div class="sub_commom_tit">
                    Zenit Sponsorship System <br />
                    Available Online and Offline
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
                        <div class="label_box f">
                            <label for="name" class="common_input_box r">
                                Organization/organization name
                                <input type="text" class="common_input" id="name">
                            </label>
                            <label for="address" class="common_input_box ">
                                Home page address
                                <input type="text" class="common_input" id="address">
                            </label>                            
                        </div>

                        <div class="label_box f">
                            <label for="name_2" class="common_input_box r">
                                Contact Name
                                <input type="text" class="common_input" id="name_2">
                            </label>

                            <label for="tell" class="common_input_box">
                                Phone number
                                <input type="text" class="common_input" id="tell">
                            </label>
                        </div>

                        <div class="label_box f">
                            <label for="email" class="common_input_box r">
                                E-mail
                                <input type="text" class="common_input" id="email">
                            </label>
                            <div class="radio_box">
                                Payment method
                                <div class="box_wrap">
                                    <label for="n_1" class="radio_label">
                                        <input type="radio" name="radio_btn" id="n_1" checked>
                                        <label for="n_1">CARD</label>
                                    </label>

                                    <label for="n_2" class="radio_label">
                                        <input type="radio" name="radio_btn" id="n_2">
                                        <label for="n_2">MY ID</label>
                                    </label>                                   
                                </div>
                            </div>
                        </div>     
                        
                        <div class="label_box">
                            <label for="file" class="common_input_box">
                                The attached file
                                <input type="text" class="common_input" id="file" readonly>
                            </label>

                            <input type="file" id="file_btn">
                            <label for="file_btn" class="file_btn">Find a file</label> 
                        </div>

                        <button type="button" class="common_submit_btn" >To apply</button>
                    </div>
                </form>

            </div>
        </div>
    </div>
    <!-- END system -->
</div>
<!-- END container -->

<script>
    $(document).ready(function () {

    });
</script>

<!-- #include file = '../include/footer.asp' -->