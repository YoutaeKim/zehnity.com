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
    <div class="mypage_wrap">
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
                        <li class="on">
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
                        <li>
                            <a href="../html/mypage_management.asp">
                                후원프로젝트 관리
                            </a>
                        </li>
                    </ul>

                    <div class="my_question_box">
                        <div class="left">
                            <div class="tit">1:1문의</div>
                            <div class="ment">1:1 문의에 대한 담당자 처리상태 및 답변내용을 확인하실 수 있습니다.</div>
                        </div>
                        <a href="javascript:;" class="common_submit_btn">
                            작성하기
                        </a>
                    </div>

                    <div class="question_content">

                        <!-- 문의가 없을 시 -->
                        <div class="no_ct">
                            <div class="img"></div>
                            작성하신 게시글이 없습니다.
                        </div>
                        <!-- END 문의가 없을 시 -->

                        <!-- 문의가 있을 시 -->
                        <div class="ques_box_wrap">
                            <div class="ques_box">
                                <div class="left ">
                                    <span class="name">제니티는시스템은 어떤 후원방식이 있나요?제니티는시스템은 어떤 후원방식이 있나요? </span>
                                </div>
                                <div class="right">
                                    <div class="date">2022-10-31</div>
                                    <div class="mode on">답변완료</div>
                                    <div class="arw"></div>
                                </div>
                            </div>
                            
                            <div class="ques_answer_box">
                                <span class="state">A</span>
                                <span class="answer">자주 묻는 질문 답변이 들어갑니다.</span>
                            </div>
                        </div>

                        <div class="ques_box_wrap">
                            <div class="ques_box">
                                <div class="left ">
                                    <span class="name">제니티는시스템은 어떤 후원방식이 있나요? </span>
                                </div>
                                <div class="right">
                                    <div class="date">2022-10-31</div>
                                    <div class="mode on">답변완료</div>
                                    <div class="arw"></div>
                                </div>
                            </div>
                            
                            <div class="ques_answer_box">
                                <span class="state">A</span>
                                <span class="answer">자주 묻는 질문 답변이 들어갑니다.</span>
                            </div>
                        </div>

                        <div class="ques_box_wrap">
                            <div class="ques_box">
                                <div class="left ">
                                    <span class="name">제니티는시스템은 어떤 후원방식이 있나요? </span>
                                </div>
                                <div class="right">
                                    <div class="date">2022-10-31</div>
                                    <div class="mode">답변대기</div>
                                    <div class="arw"></div>
                                </div>
                            </div>

                        </div>
                        <!-- END 문의가 있을 시 -->

                    </div>

                    <div class="sub_page_nav">
                        <a href="javascript:;" class="box left"></a>
                        <a href="javascript:;" class="box left0"></a>
                        <a href="javascript:;" class="box num active">1</a>
                        <a href="javascript:;" class="box num">2</a>
                        <a href="javascript:;" class="box right0"></a>
                        <a href="javascript:;" class="box right"></a>
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