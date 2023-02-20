<!--#include virtual="/common/fun/fncSetup.asp"-->
<!--#include virtual="/common/inc/inc_clsInit.asp"-->
<!--#include virtual="/common/class/clsBoard.asp"-->
<%
'########## // Request Paramas ##########
Dim iPage       : iPage         = fnSqlChk(Request("page"), 0, 0)   : iPage = NullValue(iPage,1)
Dim iBType		: iBType		= fnSqlChk(Request("bType"), 0, 0)	: iBType = NullValue(iBType,"B0106")


'########## Request Paramas // ##########
Dim iPageSize   : iPageSize     = 5
Dim iTotalRecord: iTotalRecord  = 0
Dim iTotalPage  : iTotalPage    = 0 
sParameter = "&bType="&iBType
If isNumeric(iPage) = False Then '페이지 숫자 체크
	Response.redirect sysThisUrl
End If
If iPage = 0 Then '페이지 0 에러 예외처리
	Response.redirect sysThisUrl
End If

Set objBoard = New clsBoard
Dim arrList : arrList = objBoard.GetBoardCommonList( "", "", iBType, 0, 0, 3, iPage, iPageSize)
Set objBoard = Nothing
If IsArray(arrList) Then 
	iTotalRecord = arrList(16, 0)  : iTotalPage = arrList(17, 0)
Else
	If iPage > 1 Then
		Response.redirect sysThisUrl
	End If
End If
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
                    <li<%If iBType = "B0106" Then%> class="active"<%End If%>>
                        <a href="question.asp">
                            전체
                        </a>
                    </li>
                    <li<%If iBType = "B010601" Then%> class="active"<%End If%>>						
                        <a href="?bType=B010601">
                            제니티 서비스
                        </a>
                    </li>
                    <li<%If iBType = "B010602" Then%> class="active"<%End If%>>
                        <a href="?bType=B010602">
                            기부활동
                        </a>
                    </li>
                    <li<%If iBType = "B010603" Then%> class="active"<%End If%>>
                        <a href="?bType=B010603">
                            지원활동
                        </a>
                    </li>
                    <li<%If iBType = "B010604" Then%> class="active"<%End If%>>
                        <a href="?bType=B010604">
                            기타
                        </a>
                    </li>
                </ul>

                <div class="question_content">
<%
	If IsArray(arrList) Then
		For i = 0 To UBound(arrList,2)
%>
                    <div class="ques_box_wrap">
                        <div class="ques_box">
                            <div class="left">
                                <span class="state">Q</span>
                                <span class="name f"><%=arrList(2, i)%> </span>
                            </div>
                            <div class="arw"></div>
                        </div>

                        <div class="ques_answer_box">
                            <span class="state">A</span>
                            <span class="answer"><%=arrList(5, i)%></span>
                        </div>
                    </div>
<%
		Next
 	End If
%>
                </div>


                <div class="sub_page_nav">
<%
	If IsArray(arrList) Then
						'// 페이징
						Set objPN = New PageNavigation
						With objPN
							.CurrentPage    = iPage
							.ListSize       = iPageSize
							.TotalPage      = iTotalPage
							.TotalRecord    = iTotalRecord
							.QueryString    = sParameter							
							.NavigationSize = 5
							.Navigation()
						End With
						Set objPN = Nothing
	End If
%>
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