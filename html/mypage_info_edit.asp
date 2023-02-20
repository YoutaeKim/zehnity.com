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
    <div class="mypage_wrap edit">
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
                        <li class="on">
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

                <div class="info_edit_wrap common_edit_wrap">
                    <div class="mypage_tit">
                        기본정보
                    </div>

                    <div class="center_box">
                        <div class="edit_logo_box">
                            <div class="name">로고 등록</div>
                            <label for="file" class="common_file_box">
                                <input type="file" id="file">
                                <div class="img"></div>
                                <div class="ment">이미지를 등록해주세요</div>
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
                                    후원단체명
                                    <input type="text" class="common_input" id="name">
                                </label>
                            </div>
                            <div class="label_box f">
                                <label for="tell" class="common_input_box r">
                                    전화번호
                                    <input type="text" class="common_input" id="tell">
                                </label>
                                <label for="email" class="common_input_box">
                                    이메일
                                    <input type="text" class="common_input" id="email">
                                </label>
                            </div>
                            <div class="label_box f">
                                <label for="address" class="common_input_box r">
                                    홈페이지 주소
                                    <input type="text" class="common_input" id="address">
                                </label>
                                <label for="address_2" class="common_input_box">
                                    단체주소
                                    <input type="text" class="common_input" id="address_2">
                                </label>
                            </div>
                            <div class="label_box">
                                <label for="alt" class="common_input_box">
                                    간략한 설명
                                    <textarea id="alt" class="common_area"></textarea>
                                </label>
                            </div>
                        </div>
                    </div>

                    <button type="button" class="common_submit_btn">저장하기</button>
                </div>

                <div class="title_edit_wrap common_edit_wrap">
                    <div class="mypage_tit">
                        타이틀 디자인
                    </div>

                    <div class="photo_box">
                        <div class="common_file_box result_box">
                            <div class="result_img"></div>
                            <button type="button" class="remove_btn"></button>
                        </div>
                        <label for="i_file" class="common_file_box">
                            <input type="file" id="i_file">
                            <div class="img"></div>
                            <div class="ment">이미지를 등록해주세요</div>
                            <div class="sub_ment">Image size: 1920 * 820</div>
                        </label>
                        <label for="i_file_2" class="common_file_box">
                            <input type="file" id="i_file_2">
                            <div class="img"></div>
                            <div class="ment">이미지를 등록해주세요</div>
                            <div class="sub_ment">Image size: 1920 * 820</div>
                        </label>
                    </div>

                    <div class="label_box">
                        <label for="t_alt" class="common_input_box">
                            타이틀 문구
                            <textarea id="t_alt" class="common_area one"></textarea>
                        </label>
                    </div>

                    <div class="label_box">
                        <label for="t_alt_2" class="common_input_box">
                            설명 문구
                            <textarea id="t_alt_2" class="common_area two"></textarea>
                        </label>
                    </div>
                    <button type="button" class="common_submit_btn">저장하기</button>
                </div>

                <div class="info_edit_wrap common_edit_wrap title_edit_wrap s_edit_wrap">
                    <div class="mypage_tit">
                        후원단체소개
                        <button type="button" class="alt_btn"></button>
                    </div>

                    <div class="center_box">
                        <div class="edit_logo_box">
                            <div class="name">소개이미지</div>
                            <div class="sub_name">최소 1개는 사용하셔야 합니다.</div>

                            <div class="file_box_wrap">
                                <div class="common_file_box result_box">
                                    <div class="result_img"></div>
                                    <button type="button" class="remove_btn"></button>
                                </div>
                                <label for="s_file_2" class="common_file_box">
                                    <input type="file" id="s_file_2">
                                    <div class="img"></div>
                                    <div class="ment">이미지를 등록해주세요</div>
                                    <div class="sub_ment">Image size: 1920 * 820</div>
                                </label>
                                <label for="s_file_3" class="common_file_box">
                                    <input type="file" id="s_file_3">
                                    <div class="img"></div>
                                    <div class="ment">이미지를 등록해주세요</div>
                                    <div class="sub_ment">Image size: 1920 * 820</div>
                                </label>
                            </div>
                        </div>
                        <div class="alt_box">
                            <div class="label_box">
                                <label for="s_alt" class="common_input_box">
                                    소개 타이틀 문구
                                    <textarea id="s_alt" class="common_area two"></textarea>
                                </label>
                            </div>

                            <div class="label_box m">
                                <label for="s_alt_2" class="common_input_box">
                                    설명 문구
                                    <textarea id="s_alt_2" class="common_area three"></textarea>
                                </label>
                            </div>
                        </div>
                    </div>

                    <button type="button" class="common_submit_btn">저장하기</button>

                </div>

                <div class="common_edit_wrap map_edit_wrap last">
                    <div class="mypage_tit">
                        구글 지도 좌표
                    </div>
                    <div class="map_edit_box">
                        <div class="box fir">
                            <input type="text" class="txt_box fir" readonly>
                            <button type="button" class="search_btn">좌표검색</button>
                        </div>
                        <div class="box">
                            <div class="txt_box">
                                <input type="text" class="sub_box" readonly>
                                <span>/</span>
                                <input type="text" class="sub_box" readonly>
                            </div>
                            <button type="button" class="search_btn">
                                <div class="icon"></div>
                                구글지도
                            </button>
                        </div>
                    </div>
                    <button type="button" class="common_submit_btn">저장하기</button>
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