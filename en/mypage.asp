<!--#include virtual="/common/fun/fncSetup.asp"-->
<!--#include virtual="/common/inc/inc_clsInit.asp"-->
<!--#include virtual="/common/class/clsMember.asp"-->
<!--#include virtual="/common/class/clsBoard.asp"-->
<%
  Language="KO"
  PageName = "mypage"
  SubName = "en"
  header = "sub"

If CKMemberCode = "" Or IsNull(CKMemberCode) Then	
	Call MoveTop("/en/main.asp")
	Response.end
End If

'########## // Request Paramas ##########
Dim iPage       : iPage         = fnSqlChk(Request("page"), 0, 0)   : iPage = NullValue(iPage,1)
'########## Request Paramas // ##########
Dim iPageSize   : iPageSize     = 10
Dim iTotalRecord: iTotalRecord  = 0
Dim iTotalPage  : iTotalPage    = 0

If isNumeric(iPage) = False Then '페이지 숫자 체크
	Response.redirect sysThisUrl
End If
If iPage = 0 Then '페이지 0 에러 예외처리
	Response.redirect sysThisUrl
End If


'# 마이페이지 상단 프로젝트 갯수, 후원금 합계 정보
Dim Cols_IngProject : Cols_IngProject = 0
Dim Cols_EndProject : Cols_EndProject = 0
Dim Cols_DonationSum : Cols_DonationSum = 0
Dim Cols_SgCode : Cols_SgCode = 0 '후원단체코드
Set objMember = New clsMember
Dim arrData : arrData = objMember.getMypageInfo(CKMemberCode)
Set objMember = Nothing
If IsArray(arrData) Then
	Cols_IngProject		= FormatNumber(arrData(0,0),0)
	Cols_EndProject		= FormatNumber(arrData(1,0),0)
	Cols_DonationSum	= FormatNumber(arrData(2,0),0)
	Cols_SgCode			= arrData(3,0)
End If
 

'1:1문의 리스트
Set objBoard = New clsBoard
Dim arrList : arrList = objBoard.GetBoardQnAList(CKMemberCode, iPage, iPageSize)
Set objBoard = Nothing
If IsArray(arrList) Then 
  iTotalRecord = arrList(6, 0)  : iTotalPage = arrList(7, 0)
End If
Dim sParameter
 
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
                                <div class="name"><%=CKUserName%> </div>
                            </div>
                        </div>
                        <div class="alt_box">
                            <div class="box">
                                <div class="num">
                                    <span><%=Cols_IngProject%></span>
                                    cases
                                </div>
                                <div class="name">an ongoing<br class="hide-default show-700"/> project</div>
                            </div>

                            <div class="box">
                                <div class="num">
                                    <span><%=Cols_EndProject%></span>
                                    cases
                                </div>
                                <div class="name">Project<br class="hide-default show-700"/> Ended</div>
                            </div>

                            <div class="box">
                                <div class="num">
                                    <span><%=Cols_DonationSum%></span>
                                </div>
                                <div class="name">a donation received<br class="hide-default show-700"/> this month($)</div>
                            </div>
                        </div>
                    </div>

                    <ul class="sub_menu_wrap">
                        <li class="on">
                            <a href="mypage.asp">1:1 inquiry</a>
                        </li>
                        <li>
                            <a href="mypage_info_change.asp">Change information</a>
                        </li>
						<%If Cols_SgCode <> "0" Then%>
                        <li>
                            <a href="mypage_info_edit.asp">Sponsored organization information management</a>
                        </li>
                        <li>
                            <a href="mypage_management.asp">Sponsored project management</a>
                        </li>
						<li>
                            <a href="mypage_board.asp">BOARD</a>
                        </li>
                        <li>
                            <a href="mypage_photo.asp">PHOTO</a>
                        </li>
                        <li>
                            <a href="mypage_vod.asp">VOD</a>
                        </li>
						<%End If%>
                    </ul>

                    <div class="my_question_box">
                        <div class="left">
                            <div class="tit">1:1 inquiry</div>
                            <div class="ment">You can check the status of the person in charge of handling the 1:1 inquiry and the contents of the response.</div>
                        </div>
                        <a href="/en/inquiry.asp" class="common_submit_btn">
                            Create
                        </a>
                    </div>

                    <div class="question_content">


<%
	If IsArray(arrList) Then
		For i = 0 To UBound(arrList,2)
		Cols_Replay = NullValue(arrList(3,i),"")

%>
                        <!-- 문의가 있을 시 -->
                        <div class="ques_box_wrap">
                            <div class="ques_box">
                                <div class="left ">
                                    <span class="name"><%=arrList(1,i)%> </span>
                                </div>
                                <div class="right">
                                    <div class="date"><%=Left(arrList(2,i),10)%></div>
									<%If Len(Cols_Replay) > 0 Then%>
                                    <div class="mode on">completed</div>
									<%Else%>
									<div class="mode">Waiting</div>
									<%End If%>
                                    <div class="arw"></div>
                                </div>
                            </div>                            
                            <div class="ques_answer_box">
                                <span class="state">A</span>
                                <span class="answer"><%=Cols_Replay%></span>
                            </div>
                        </div>
 
<%
		Next
	Else
%>
                        <!-- 문의가 없을 시 -->
                        <div class="no_ct">
                            <div class="img"></div>
                            No posts have been created.
                        </div>
                        <!-- END 문의가 없을 시 -->
<%
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
							'If isItMobile() = True Then							
							.NavigationSize = 5
							'Else
							'.NavigationSize = 5
							'End If
							.Navigation()
						End With
						Set objPN = Nothing
	End If
%>
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