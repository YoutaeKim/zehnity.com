<!--#include virtual="/common/fun/fncSetup.asp"-->
<!--#include virtual="/common/inc/inc_clsInit.asp"-->
<!--#include virtual="/common/class/clsCommon.asp"-->
<!--#include virtual="/common/class/clsMember.asp"--><%
  Language="KO"
  PageName = "mypage"
  SubName = "ko"
  header = "sub"



If CKMemberCode = "" Or IsNull(CKMemberCode) Then	
	Call MoveTop("/")
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
Set objMember = New clsMember
Dim arrData : arrData = objMember.getMypageInfo(CKMemberCode)
Set objMember = Nothing
If IsArray(arrData) Then
	Cols_IngProject = FormatNumber(arrData(0,0),0)
	Cols_EndProject = FormatNumber(arrData(1,0),0)
	Cols_DonationSum = FormatNumber(arrData(2,0),0)
	Cols_sgCode		= arrData(3,0)
End If

'프로젝트 리스트
Set objCommon = New clsCommon
Dim arrList : arrList = objCommon.GetProjectList(CKMemberCode, iPage, iPageSize)
Set objCommon = Nothing
If IsArray(arrList) Then 
  iTotalRecord = arrList(8, 0)  : iTotalPage = arrList(9, 0)
End If
Dim sParameter
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
                                <div class="name">진행중인<br class="hide-default show-700"/> 프로젝트</div>
                            </div>

                            <div class="box">
                                <div class="num">
                                    <span><%=Cols_EndProject%></span>
                                    건
                                </div>
                                <div class="name">종료된<br class="hide-default show-700"/> 프로젝트</div>
                            </div>

                            <div class="box">
                                <div class="num">
                                    <span><%=Cols_DonationSum%></span>
                                </div>
                                <div class="name">이번달 받은<br class="hide-default show-700"/> 후원금($)</div>
                            </div>
                        </div>
                    </div>

                    <ul class="sub_menu_wrap">
                        <li>
                            <a href="mypage.asp">1:1문의</a>
                        </li>
                        <li>
                            <a href="mypage_info_change.asp">정보 변경</a>
                        </li>
                        <li>
                            <a href="mypage_info_edit.asp">후원단체 정보관리</a>
                        </li>
                        <li class="on">
                            <a href="mypage_management.asp">후원프로젝트 관리</a>
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
                    </ul>

                    <div class="mypage_tit">
                        후원프로젝트 관리
                        <div class="sub_tit">
                            <span>후원이 필요한 행사를 등록하시면 별도의 후원전용 페이지가 생성됩니다.</span>
                            <a href="mypage_management_add.asp" class="add_btn common_submit_btn">프로젝트 등록</a>
                        </div>
                    </div>
<%
	If Not(IsArray(arrList)) Then
%>
                    <!-- 게시글 없을 시 -->
                    <div class="no_ct">
                        <div class="img"></div>
                        작성하신 게시글이 없습니다.
                    </div>
<%
	Else
%>

                    <!-- END 게시글 없을 시 -->
                    <div class="magnagement_wrap">
                        <div class="top_box common_box">
                            <div class="num">No</div>
                            <div class="tit">후원 프로젝트 제목</div>
                            <div class="date">운영 기간</div>
                            <div class="won">목표 금액</div>
                            <div class="people">참여 인원</div>
                            <div class="won2">모집금액</div>
                            <div class="percent">달성률</div>
                        </div>
                        <div class="alt_box_wrap ">
<%
							For i = 0 To UBound(arrList,2)
								Cols_TargetMoney= arrList(4,i)
								Cols_TotalMoney	= arrList(5,i)
								Cols_ApplyCnt	= arrList(6,i)
								If Cols_TargetMoney > 0 Then
									Cols_Rate		= Cols_TotalMoney / Cols_TargetMoney * 100
								Else
									Cols_Rate = 0	
								End If
															
%>
                            <div class="box common_box">
                                <div class="num"><%=arrList(7,i)%></div>
                                <div class="tit"><a href="/support/introduce.asp?sgCode=<%=Cols_sgCode%>&pCode=<%=arrList(0,i)%>" target="_blank"><%=arrList(1,i)%></a></div>
                                <div class="date"><%=Replace(arrList(2,i),"-",".")%> ~ <%=Replace(arrList(3,i),"-",".")%></div>
                                <div class="won">$ <%=FormatNumber(Cols_TargetMoney,0)%></div>
                                <div class="people"><%=FormatNumber(Cols_ApplyCnt,0)%></div>
                                <div class="won2"><%=FormatNumber(Cols_TotalMoney,0)%> $ </div>
                                <div class="percent">
                                    <span class="p"><%=FormatNumber(Cols_Rate,0)%>%</span>
                                    <button type="button" class="mg_btn" data-pCode="<%=arrList(0,i)%>">관리</button>
                                </div>
                            </div>
							<%Next%>                             
                        </div>
                    </div>

                    <div class="sub_page_nav">
<%
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
%>
                    </div>
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
    $(document).ready(function(){
		$(".mg_btn").click(function(){
			var pCode = $(this).attr("data-pCode");
			if(pCode){
				location.href = "mypage_management_add.asp?pcode="+pCode;
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