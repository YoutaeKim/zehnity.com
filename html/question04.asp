<%
  Language="KO"
  PageName = "sub05"
  SubName = "ko"
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
                    자주 묻는 질문
                </div>

                <ul class="question_list">
                    <li >
                        <a href="../html/question.asp">
                            제니티 서비스
                        </a>
                    </li>
                    <li >
                        <a href="../html/question02.asp">
                            기부활동
                        </a>
                    </li>
                    <li >
                        <a href="../html/question03.asp">
                            지원활동
                        </a>
                    </li>
                    <li class="active">
                        <a href="../html/question04.asp">
                            기타
                        </a>
                    </li>
                </ul>

                <div class="question_content">
                    <div class="ques_box_wrap">
                        <div class="ques_box">
                            <div class="left">
                                <span class="state">Q</span>
                                <span class="name">제니티는시스템은 어떤 후원방식이 있나요? </span>
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
                                <span class="name">제니티는시스템은 어떤 후원방식이 있나요? </span>
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