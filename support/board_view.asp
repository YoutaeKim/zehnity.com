<!--#include virtual="/common/fun/fncSetup.asp"-->
<!--#include virtual="/common/inc/inc_clsInit.asp"-->
<!--#include virtual="/common/class/clsCommon.asp"-->
<!--#include virtual="/common/class/clsBoard.asp"-->
<%
'########## // Request Paramas ##########
Dim sgCode      : sgCode		= fnSqlChk(Request("sgCode"), 0, 0)
Dim iPage       : iPage         = fnSqlChk(Request("page"), 0, 0)   : iPage = NullValue(iPage,1)
Dim iBCode		: iBCode		= fnSqlChk(Request("bCode"), 0, 0)	: iBCode = NullValue(iBCode,0)
Dim iSchText	: iSchText		= fnSqlChk(Request("schText"), 0, 0)
Dim iSchType	: iSchType		= fnSqlChk(Request("schType"), 0, 0): iSchType = NullValue(iSchType,"")
'########## Request Paramas // ##########
sParameter = "page="&iPage&"&sgCode="&sgCode&"&schText="&iSchText&"&schType="&iSchType

Set objCommon = New clsCommon
Dim arrSupportInfo : arrSupportInfo = objCommon.GetSupportMainInfo(sgCode)
Set objCommon = Nothing
If IsArray(arrSupportInfo) Then 
	Cols_GroupName			= arrSupportInfo(0,0) 
	Cols_GroupType			= arrSupportInfo(1,0) 
	Cols_Homepage			= arrSupportInfo(2,0) 
	Cols_WorkerName			= arrSupportInfo(3,0) 
	Cols_Tel				= arrSupportInfo(4,0) 
	Cols_Email				= arrSupportInfo(5,0) 
	Cols_PayMethod			= arrSupportInfo(6,0) 
	Cols_LogoImg			= arrSupportInfo(7,0) 
	Cols_Addr				= arrSupportInfo(8,0) 
	Cols_Description		= arrSupportInfo(9,0) 		
	Cols_Template			= arrSupportInfo(10,0) 
	Cols_TitleImg1			= arrSupportInfo(11,0) 
	Cols_TitleImg2			= arrSupportInfo(12,0) 
	Cols_TitleImg3			= arrSupportInfo(13,0) 
	Cols_TitleName			= arrSupportInfo(14,0) 
	Cols_TitleDescription	= arrSupportInfo(15,0) 
	Cols_IntroImg1			= arrSupportInfo(16,0) 
	Cols_IntroImg2			= arrSupportInfo(17,0) 
	Cols_IntroImg3			= arrSupportInfo(18,0) 
	Cols_IntroTitle			= arrSupportInfo(19,0) 
	Cols_IntroDescription	= arrSupportInfo(20,0) 
	Cols_MapX				= arrSupportInfo(21,0) 
	Cols_MapY				= arrSupportInfo(22,0) 
Else
	Response.redirect "/"
End If  
'게시판 상세정보 조회
Set objBoard = New clsBoard
Dim arrList : arrList = objBoard.GetBoardCommonInfo(iBCode)
Set objBoard = Nothing
If IsArray(arrList) Then
	Cols_bType		= arrList(0,0)
	Cols_WriteCode	= arrList(1,0)
	Cols_WriteName	= arrList(2,0)
	Cols_Title		= arrList(3,0)	
	Cols_SubTitle	= arrList(4,0)
	Cols_TitleImg	= arrList(5,0)
	Cols_YoutubeUrl	= arrList(6,0)
	Cols_Contents	= arrList(7,0)
	Cols_ReadCnt	= arrList(8,0)
	Cols_Open		= arrList(9,0)	
	Cols_sgCode		= arrList(10,0)
	Cols_pCode		= arrList(11,0)
	Cols_RegDate	= arrList(12,0)
	Cols_FileName	= arrList(13,0)
	'	서브 타이틀 말머리(1-공지사항, 2-이벤트, 9-기타)
	If Cols_SubTitle = "1" Then
		Cols_SubTitleText = "공지사항"
	ElseIf Cols_SubTitle = "2" Then 
		Cols_SubTitleText = "이벤트"
	ElseIf Cols_SubTitle = "9" Then 
		Cols_SubTitleText = "기타"
	End If
Else
	Call MsgBack("잘못된 접근입니다.")
End If

  Language="KO"
  PageName = "sub04"
  SubName = "ko"
  footer = "add"
%>
<!-- #include virtual = '/support/include/head.asp' -->
<!-- #include virtual = '/support/include/header.asp' -->
<!-- #include virtual = '/support/include/sub_title.asp' -->

<!-- modal -->

<!-- END modal -->

<!-- container -->
<div id="container" class="">
    <div class="common_sub_wrap board_wrap board_view_wrap">
        <div class="inner sub_inner">
            <div class="view_box">
                <div class="tit_box">
                    <div class="tit"><%=Cols_SubTitleText%></div>
                    <div class="sub_tit"><%=Cols_Title%></div>
                    <div class="common_date_box">
                        <div class="img_box">
                            <img src="/support/image/sub/date_icon.png" alt="">
                        </div>
                        <%=fnDateFormat(Cols_RegDate,6)%>
                    </div>
                </div>
                <div class="edit_box">
                    <%=Cols_Contents%>
                </div>
                <div class="back_btn_box">
                    <a href="board.asp?<%=sParameter%>" class="common_h_btn back_btn">목록으로</a>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<!-- END container -->

<script>
    $(document).ready(function () {

    });
</script>

<!-- #include virtual = '/support/include/footer.asp' -->