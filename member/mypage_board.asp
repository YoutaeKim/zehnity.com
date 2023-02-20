<!--#include virtual="/common/fun/fncSetup.asp"-->
<!--#include virtual="/common/inc/inc_clsInit.asp"-->
<!--#include virtual="/common/class/clsMember.asp"-->
<!--#include virtual="/common/class/clsBoard.asp"-->
<%
 
  Language="KO"
  PageName = "mypage"
  SubName = "ko"
  header = "sub"

If CKMemberCode = "" Or IsNull(CKMemberCode) Then	
	Call MoveTop("/")
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
Dim arrList : arrList = objBoard.GetBoardCommonList("", "", "B0103", Cols_SgCode, 0, 3, iPage, iPageSize)
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
<div id="container" class="">
    <!-- mypage -->
    <div class="mypage_wrap management">
        <div class="sub_wrap two">
            <div class="inner con_inner">
                <div class="mypage_box_wrap">

                    <div class="info_box">
                        <div class="profile">
                            <div class="img_box">
                                <div class="img"></div>
                                <div class="name"><%=CKUserName%> 님</div>
                            </div>
                        </div>
                        <div class="alt_box">
                            <div class="box">
                                <div class="num">
                                    <span><%=Cols_IngProject%></span>
                                    건
                                </div>
                                <div class="name">진행중인<br class="hide-default show-700" /> 프로젝트</div>
                            </div>

                            <div class="box">
                                <div class="num">
                                    <span><%=Cols_EndProject%></span>
                                    건
                                </div>
                                <div class="name">종료된<br class="hide-default show-700" /> 프로젝트</div>
                            </div>

                            <div class="box">
                                <div class="num">
                                    <span><%=Cols_DonationSum%></span>
                                </div>
                                <div class="name">이번달 받은<br class="hide-default show-700" /> 후원금($)</div>
                            </div>
                        </div>
                    </div>

                    <ul class="sub_menu_wrap">
                        <li >
                            <a href="mypage.asp">1:1문의</a>
                        </li>
                        <li>
                            <a href="mypage_info_change.asp">정보 변경</a>
                        </li>
                        <li>
                            <a href="mypage_info_edit.asp">후원단체 정보관리</a>
                        </li>
                        <li>
                            <a href="mypage_management.asp">후원프로젝트 관리</a>
                        </li>
						<li class="on">
                            <a href="mypage_board.asp">BOARD</a>
                        </li>
                        <li>
                            <a href="mypage_photo.asp">PHOTO</a>
                        </li>
                        <li>
                            <a href="mypage_vod.asp">VOD</a>
                        </li>
                    </ul>

                    <div class="mypage_tit">
                        BOARD
                        <div class="sub_tit">
                            <span>BOARD는 후원단체 홈페이지에 표시됩니다.</span>
                            <a href="mypage_board_write.asp?bType=B0103" class="add_btn common_submit_btn">작성하기</a>
                        </div>
                    </div>

<%
	If IsArray(arrList) Then 
%>
                    <div class="magnagement_wrap">
                        <div class="top_box common_box board">
                            <div class="num">No</div>
                            <div class="tit">제목</div>
                            <div class="date">등록일시</div>
                        </div>
                        <div class="alt_box_wrap">
<%
		For i = 0 To UBound(arrList,2)
			If arrList(3,i) = "1" Then
				Cols_SubTitle = "공지사항"
			ElseIf arrList(3,i) = "2" Then
				Cols_SubTitle = "이벤트"
			ElseIf arrList(3,i) = "9" Then
				Cols_SubTitle = "기타"
			Else	
				Cols_SubTitle = ""
			End If

%>
							<a href="mypage_board_view.asp?bType=B0103&bCode=<%=arrList(0,i)%>&page=<%=iPage%>" class="box common_box board">
                                <div class="num"><%=arrList(10,i)%></div>
                                <div class="tit">
                                    <span class="board_common_type"><%=Cols_SubTitle%></span>
                                    <span class="name text_ov"><%=arrList(2,i)%></span>
                                    <span class="board_common_add_file bg"><%If Not(arrList(4,i) ="" Or IsNull(arrList(4,i))) Then%><img src="/image/sub/add_file.png" alt=""><%End If%></span>
                                </div>
                                <div class="date"><%=fnDateFormat(arrList(8,i),14)%></div>
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
							'If isItMobile() = True Then							
							.NavigationSize = 5
							'Else
							'.NavigationSize = 5
							'End If
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
	End If%>


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