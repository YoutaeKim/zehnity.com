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
    <div class="mypage_wrap edit management">
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
                        <li>
                            <a href="../html/mypage_info_change.asp">
                                정보 변경
                            </a>
                        </li>
                        <li>
                            <a href="../html/mypage_info_edit.asp">
                                후원단체 정보관리
                            </a>
                        </li>
                        <li class="on">
                            <a href="../html/mypage_management.asp">
                                후원프로젝트 관리
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
                                <div class="name">템플릿 A타입</div>
                                <div class="common_edit_btn_box">
                                    <button type="button">미리보기</button>
                                    <button type="button" class="use_btn">사용중</button>
                                </div>
                            </div>
                        </div>

                        <div class="box">
                            <div class="img"></div>
                            <div class="btm_box">
                                <div class="name">템플릿 B타입</div>
                                <div class="common_edit_btn_box">
                                    <button type="button">미리보기</button>
                                    <button type="button" class="use_btn">사용하기</button>
                                </div>
                            </div>
                        </div>

                        <div class="box">
                            <div class="img"></div>
                            <div class="btm_box">
                                <div class="name">템플릿 B타입</div>
                                <div class="common_edit_btn_box">
                                    <button type="button">미리보기</button>
                                    <button type="button" class="use_btn">사용하기</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="info_edit_wrap common_edit_wrap s_edit_wrap">
                    <div class="mypage_tit">
                        후원단체소개
                        <button type="button" class="alt_btn"></button>
                    </div>

                    <div class="center_box">
                        <div class="edit_logo_box">
                            <div class="name">프로젝트 사진</div>
                            <label for="file" class="common_file_box">
                                <input type="file" id="file">
                                <div class="img"></div>
                                <div class="ment">이미지를 등록해주세요</div>
                                <div class="sub_ment">Image size: 150 * 40</div>
                            </label>

                        </div>
                        <div class="alt_box">
                            <div class="label_box">
                                <label for="name" class="common_input_box">
                                    프로젝트명
                                    <input type="text" class="common_input" id="name">
                                </label>
                            </div>
                            <div class="label_box f">
                                <label for="tell" class="common_input_box r">
                                    목표금액($)
                                    <input type="text" class="common_input" id="tell">
                                </label>
                                <label for="" class="common_input_box radio_box">
                                    후원수단
                                    <div class="box_wrap">
                                        <label for="n_1" class="radio_label">
                                            <input type="radio" name="radio_btn" id="n_1" checked="">
                                            <label for="n_1">신용카드</label>
                                        </label>

                                        <label for="n_2" class="radio_label">
                                            <input type="radio" name="radio_btn" id="n_2">
                                            <label for="n_2">마이통장</label>
                                        </label>
                                    </div>
                                </label>
                            </div>
                            <div class="label_box f">
                                <label for="address" class="common_input_box r">
                                    전화번호
                                    <input type="text" class="common_input" id="address">
                                </label>
                                <label for="address_2" class="common_input_box">
                                    이메일
                                    <input type="text" class="common_input" id="address_2">
                                </label>
                            </div>
                            <div class="label_box">
                                <label for="" class="common_input_box r">
                                    운영기간
                                    <div class="date_box">
                                        <div class="date"><input type="text" class="common_input" id="fromDate"
                                                readonly></div> <span>-</span>
                                        <div class="date"><input type="text" class="common_input" id="toDate" readonly>
                                        </div>
                                    </div>
                                </label>

                            </div>
                            <div class="label_box">
                                <label for="" class="common_input_box radio_box">
                                    메뉴선택
                                    <div class="box_wrap">
                                        <label for="n_3" class="radio_label">
                                            <input type="radio" name="radio_btn_2" id="n_3" checked="">
                                            <label for="n_3">포토</label>
                                        </label>

                                        <label for="n_4" class="radio_label">
                                            <input type="radio" name="radio_btn_2" id="n_4">
                                            <label for="n_4">비디오</label>
                                        </label>

                                        <label for="n_5" class="radio_label">
                                            <input type="radio" name="radio_btn_2" id="n_5">
                                            <label for="n_5">문의하기</label>
                                        </label>
                                    </div>
                                </label>
                            </div>
                        </div>
                    </div>

                    <button type="button" class="common_submit_btn">저장하기</button>
                </div>

                <div class="info_edit_wrap common_edit_wrap s_edit_wrap">
                    <div class="mypage_tit">
                        후원단체소개
                        <button type="button" class="alt_btn"></button>
                    </div>

                    <div class="manage_edit_box">
                        에디터 박스 입니다.
                    </div>

                    <button type="button" class="common_submit_btn">저장하기</button>
                </div>

            </div>
        </div>
    </div>
    <!-- END mypage -->
</div>
<!-- END container -->

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>

<script>
    $(document).ready(function () {
        $.datepicker.setDefaults($.datepicker.regional['ko']);

        // 시작일(fromDate)은 종료일(toDate) 이후 날짜 선택 불가
        // 종료일(toDate)은 시작일(fromDate) 이전 날짜 선택 불가

        //시작일.
        $('#fromDate').datepicker({
            showOn: "both", // 달력을 표시할 타이밍 (both: focus or button)
            buttonImage: "../image/sub/d_icon.png", // 버튼 이미지
            buttonImageOnly: true, // 버튼 이미지만 표시할지 여부
            buttonText: "날짜선택", // 버튼의 대체 텍스트
            dateFormat: "yy-mm-dd", // 날짜의 형식
            changeMonth: true, // 월을 이동하기 위한 선택상자 표시여부
            //minDate: 0,      // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
            onClose: function (selectedDate) {
                // 시작일(fromDate) datepicker가 닫힐때
                // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                $("#toDate").datepicker("option", "minDate", selectedDate);
            }
        });

        //종료일
        $('#toDate').datepicker({
            showOn: "both",
            buttonImage: "../image/sub/d_icon.png",
            buttonImageOnly: true,
            buttonText: "날짜선택",
            dateFormat: "yy-mm-dd",
            changeMonth: true,
            //minDate: 0, // 오늘 이전 날짜 선택 불가
            onClose: function (selectedDate) {
                // 종료일(toDate) datepicker가 닫힐때
                // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
                $("#fromDate").datepicker("option", "maxDate", selectedDate);
            }
        });

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