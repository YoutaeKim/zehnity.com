<%
  Language="KO"
  PageName = "sub05"
  SubName = "en"
  Menu = "05"
  header = "sub"
%>

<!-- #include file = '../include/head.asp' -->
<!-- #include file = '../include/header.asp' -->
<!-- #include file = '../include/sub_title.asp' -->

<!-- container -->
<div id="container" class="">
    <!-- qusetion -->
    <div class="qusetion_wrap">
        <div class="sub_wrap two">
            <div class="inner con_inner">
                <div class="sub_commom_tit">
                    Frequently Asked Questions
                </div>

                <ul class="question_list">
                    <li >
                        <a href="../html/question_en.asp">
                            Zehnity Service
                        </a>
                    </li>
                    <li >
                        <a href="../html/question02_en.asp">
                            Donation activities
                        </a>
                    </li>
                    <li >
                        <a href="../html/question03_en.asp">
                            Support activities
                        </a>
                    </li>
                    <li class="active">
                        <a href="../html/question04_en.asp">
                            Etc
                        </a>
                    </li>
                </ul>

                <div class="question_content">
                    <div class="ques_box_wrap">
                        <div class="ques_box">
                            <div class="left">
                                <span class="state">Q</span>
                                <span class="name f">제니티는시스템은 어떤 후원방식이 있나요?제니티는시스템은 어떤 후원방식이 있나요?제니티는시스템은 어떤 후원방식이 있나요? </span>
                            </div>
                            <div class="arw"></div>
                        </div>

                        <div class="ques_answer_box">
                            <span class="state">A</span>
                            <span class="answer">자주 묻는 질문 답변이 들어갑니다.</span>
                        </div>
                    </div>

                    <div class="ques_box_wrap">
                        <div class="ques_box">
                            <div class="left">
                                <span class="state">Q</span>
                                <span class="name f">제니티는시스템은 어떤 후원방식이 있나요? </span>
                            </div>
                            <div class="arw"></div>
                        </div>

                        <div class="ques_answer_box">
                            <span class="state">A</span>
                            <span class="answer">자주 묻는 질문 답변이 들어갑니다.</span>
                        </div>
                    </div>
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
    <!-- END qusetion -->
</div>
<!-- END container -->

<script>
    $(document).ready(function () {
        // 아코디언
        $('.ques_box').on('click', function () {
            if ($(this).parent().hasClass('active')) {
                $(this).parent().removeClass('active');
                $(this).next('.ques_answer_box').slideUp();
            } else {
                $('.ques_box').next('.ques_answer_box').slideUp();
                $(this).parent().siblings().removeClass('active');
                $(this).parent().addClass('active');
                $(this).next('.ques_answer_box').slideDown();
            }
        });
        // END 아코디언
    });
</script>

<!-- #include file = '../include/footer.asp' -->