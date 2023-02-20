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
    <div class="mypage_wrap">
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
                        <li class="on">
                            <a href="mypage_en.asp">
                                1:1 inquiry
                            </a>
                        </li>
                        <li>
                            <a href="mypage_info_change_en.asp">
                                Change information
                            </a>
                        </li>
                        <li>
                            <a href="mypage_info_edit_en.asp">
                                Sponsored organization information management
                            </a>
                        </li>
                        <li>
                            <a href="mypage_management_en.asp">
                                Sponsored project management
                            </a>
                        </li>
                    </ul>

                    <div class="my_question_box">
                        <div class="left">
                            <div class="tit">1:1 inquiry</div>
                            <div class="ment">You can check the status of the person in charge of handling the 1:1 inquiry and the contents of the response.</div>
                        </div>
                        <a href="javascript:;" class="common_submit_btn">
                            Create
                        </a>
                    </div>

                    <div class="question_content">

                        <!-- 문의가 없을 시 -->
                        <div class="no_ct">
                            <div class="img"></div>
                            No posts have been created.
                        </div>
                        <!-- END 문의가 없을 시 -->

                        <!-- 문의가 있을 시 -->
                        <div class="ques_box_wrap">
                            <div class="ques_box">
                                <div class="left ">
                                    <span class="name">What kind of sponsorship does Zehnity have?What kind of sponsorship does Zehnity have? </span>
                                </div>
                                <div class="right">
                                    <div class="date">2022-10-31</div>
                                    <div class="mode on">completed</div>
                                    <div class="arw"></div>
                                </div>
                            </div>
                            
                            <div class="ques_answer_box">
                                <span class="state">A</span>
                                <span class="answer">Answers to frequently asked questions will be included.</span>
                            </div>
                        </div>

                        <div class="ques_box_wrap">
                            <div class="ques_box">
                                <div class="left ">
                                    <span class="name">제니티는시스템은 어떤 후원방식이 있나요? </span>
                                </div>
                                <div class="right">
                                    <div class="date">2022-10-31</div>
                                    <div class="mode on">completed</div>
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
                                    <div class="mode">Waiting</div>
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