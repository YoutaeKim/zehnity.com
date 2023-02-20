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

Set objBoard = New clsBoard
Dim arrList : arrList = objBoard.GetBoardCommonList("", "", "B0105", Cols_SgCode, 0, 3, iPage, iPageSize)
Set objBoard = Nothing
If IsArray(arrList) Then 
	iTotalRecord = arrList(16, 0)  : iTotalPage = arrList(17, 0)
Else
	If iPage > 1 Then
		Response.redirect sysThisUrl
	End If
End If
%>
 
<!-- #include file = '../include/head.asp' -->
<!-- #include file = '../include/header.asp' -->
<!-- #include file = '../include/sub_title.asp' -->

<!-- container -->
<div id="container" class="en">
    <!-- mypage -->
    <div class="mypage_wrap management">
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
                        <li >
                            <a href="mypage.asp">1:1 inquiry</a>
                        </li>
                        <li>
                            <a href="mypage_info_change.asp">Change information</a>
                        </li>
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
                        <li  class="on">
                            <a href="mypage_vod.asp">VOD</a>
                        </li>
                    </ul>

                    <div class="mypage_tit">
                        VOD
                        <div class="sub_tit">
                            <span>Registered VOD can be shared with the Zenity website.</span>
                            <a href="mypage_board_write.asp?bType=B0105" class="add_btn common_submit_btn">Writing</a>
                        </div>
                    </div>

<%
	If IsArray(arrList) Then 
%>
                    <div class="magnagement_wrap">

                        <div class="alt_box_wrap photo">
<%
		For i = 0 To UBound(arrList,2)
			Cols_titleImg = ""
			If arrList(9,i) = "0" Then
				Cols_open = "_on"
				Cols_openClass = " on"
			Else
				Cols_open = ""
				Cols_openClass = ""
			End If
			If Not(arrList(4,i) = "" Or IsNull(arrList(4,i))) Then
				Cols_titleImg = "<img src='" & arrList(4,i) & "'>"
			End If


%>
                            <a href="mypage_board_view.asp?bType=B0105&bCode=<%=arrList(0,i)%>" class="box common_box board">
                                <div class="p_img"><%=Cols_titleImg%></div>
                                <div class="p_alt_box">
                                    <div class="p_link flex<%=Cols_openClass%>">
                                        Homepage sharing
                                        <div class="share_icon">
                                            <img src="/image/sub/share_icon<%=Cols_open%>.png" alt="">
                                        </div>
                                    </div>
                                    <div class="p_name text_ov">
                                        <%=arrList(2,i)%>
                                    </div>
                                </div>
                                <div class="p_date"><%=fnDateFormat(arrList(8,i),6)%></div>
                            </a>
<%
		Next
%>
                        </div>
                    </div>

                    <div class="sub_page_nav"><% 
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
						Set objPN = Nothing %>
                    </div>
<%
	Else
%>
                    <!-- 게시글 없을 시 -->
                    <div class="no_ct">
                        <div class="img"></div>
                        작성하신 게시글이 없습니다.
                    </div>
                    <!-- END 게시글 없을 시 -->
<%
	End If
%>
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