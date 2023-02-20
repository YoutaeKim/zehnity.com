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
    <div class="mypage_wrap edit">
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
                        <li class="on">
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

                    <div class="mypage_tit">
                        템플릿 선택
                    </div>

                    <div class="t_edit_wrap">
                        <div class="box on">
                            <div class="img"></div>
                            <div class="btm_box">
                                <div class="name">Template Type A</div>
                                <div class="common_edit_btn_box">
                                    <button type="button">Preview</button>
                                    <button type="button" class="use_btn">In Use</button>
                                </div>
                            </div>
                        </div>

                        <div class="box">
                            <div class="img"></div>
                            <div class="btm_box">
                                <div class="name">Template Type B</div>
                                <div class="common_edit_btn_box">
                                    <button type="button">Preview</button>
                                    <button type="button" class="use_btn">Use</button>
                                </div>
                            </div>
                        </div>

                        <div class="box">
                            <div class="img"></div>
                            <div class="btm_box">
                                <div class="name">Template Type B</div>
                                <div class="common_edit_btn_box">
                                    <button type="button">Preview</button>
                                    <button type="button" class="use_btn">Use</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="info_edit_wrap common_edit_wrap">
                    <div class="mypage_tit">
                        Basic information
                    </div>

                    <div class="center_box">
                        <div class="edit_logo_box">
                            <div class="name">Logo registration</div>
                            <label for="file" class="common_file_box">
                                <input type="file" id="file">
                                <div class="img"></div>
                                <div class="ment">Please register your image</div>
                                <div class="sub_ment">Image size: 150 * 40</div>
                            </label>
                            <div class="common_edit_btn_box">
                                <button type="button" class="fir">로고 변경</button>
                                <button type="button" class="use_btn">삭제</button>
                            </div>
                        </div>
                        <div class="alt_box">
                            <div class="label_box">
                                <label for="name" class="common_input_box">
                                    Name of sponsor organization
                                    <input type="text" class="common_input" id="name">
                                </label>
                            </div>
                            <div class="label_box f">
                                <label for="tell" class="common_input_box r">
                                    Phone number
                                    <input type="text" class="common_input" id="tell">
                                </label>
                                <label for="email" class="common_input_box">
                                    E-mail
                                    <input type="text" class="common_input" id="email">
                                </label>
                            </div>
                            <div class="label_box f">
                                <label for="address" class="common_input_box r">
                                    Home page address
                                    <input type="text" class="common_input" id="address">
                                </label>
                                <label for="address_2" class="common_input_box">
                                    Group address
                                    <input type="text" class="common_input" id="address_2">
                                </label>
                            </div>
                            <div class="label_box">
                                <label for="alt" class="common_input_box">
                                    a brief description
                                    <textarea id="alt" class="common_area"></textarea>
                                </label>
                            </div>
                        </div>
                    </div>

                    <button type="button" class="common_submit_btn">Save</button>
                </div>

                <div class="title_edit_wrap common_edit_wrap">
                    <div class="mypage_tit">
                        Title design
                    </div>

                    <div class="photo_box">
                        <div class="common_file_box result_box">
                            <div class="result_img"></div>
                            <button type="button" class="remove_btn"></button>
                        </div>
                        <label for="i_file" class="common_file_box">
                            <input type="file" id="i_file">
                            <div class="img"></div>
                            <div class="ment">Please register your image</div>
                            <div class="sub_ment">Image size: 1920 * 820</div>
                        </label>
                        <label for="i_file_2" class="common_file_box">
                            <input type="file" id="i_file_2">
                            <div class="img"></div>
                            <div class="ment">Please register your image</div>
                            <div class="sub_ment">Image size: 1920 * 820</div>
                        </label>
                    </div>

                    <div class="label_box">
                        <label for="t_alt" class="common_input_box">
                            a title phrase
                            <textarea id="t_alt" class="common_area one"></textarea>
                        </label>
                    </div>

                    <div class="label_box">
                        <label for="t_alt_2" class="common_input_box">
                            an explanatory statement
                            <textarea id="t_alt_2" class="common_area two"></textarea>
                        </label>
                    </div>
                    <button type="button" class="common_submit_btn">Save</button>
                </div>

                <div class="info_edit_wrap common_edit_wrap title_edit_wrap s_edit_wrap">
                    <div class="mypage_tit">
                        Introduction of sponsoring organizations
                        <button type="button" class="alt_btn"></button>
                    </div>

                    <div class="center_box">
                        <div class="edit_logo_box">
                            <div class="name">Introduction image</div>
                            <div class="sub_name">You have to use at least one.</div>

                            <div class="file_box_wrap">
                                <div class="common_file_box result_box">
                                    <div class="result_img"></div>
                                    <button type="button" class="remove_btn"></button>
                                </div>
                                <label for="s_file_2" class="common_file_box">
                                    <input type="file" id="s_file_2">
                                    <div class="img"></div>
                                    <div class="ment">Please register your image</div>
                                    <div class="sub_ment">Image size: 1920 * 820</div>
                                </label>
                                <label for="s_file_3" class="common_file_box">
                                    <input type="file" id="s_file_3">
                                    <div class="img"></div>
                                    <div class="ment">Please register your image</div>
                                    <div class="sub_ment">Image size: 1920 * 820</div>
                                </label>
                            </div>
                        </div>
                        <div class="alt_box">
                            <div class="label_box">
                                <label for="s_alt" class="common_input_box">
                                    Introduction Title Phrase
                                    <textarea id="s_alt" class="common_area two"></textarea>
                                </label>
                            </div>

                            <div class="label_box m">
                                <label for="s_alt_2" class="common_input_box">
                                    an explanatory statement
                                    <textarea id="s_alt_2" class="common_area three"></textarea>
                                </label>
                            </div>
                        </div>
                    </div>

                    <button type="button" class="common_submit_btn">Save</button>

                </div>

                <div class="common_edit_wrap map_edit_wrap last">
                    <div class="mypage_tit">
                        Google Maps Coordinates
                    </div>
                    <div class="map_edit_box">
                        <div class="box fir">
                            <input type="text" class="txt_box fir" readonly>
                            <button type="button" class="search_btn">Search</button>
                        </div>
                        <div class="box">
                            <div class="txt_box">
                                <input type="text" class="sub_box" readonly>
                                <span>/</span>
                                <input type="text" class="sub_box" readonly>
                            </div>
                            <button type="button" class="search_btn">
                                <div class="icon"></div>
                                Google Maps
                            </button>
                        </div>
                    </div>
                    <button type="button" class="common_submit_btn">Save</button>
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