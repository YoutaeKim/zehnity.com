<!--#include virtual="/common/fun/fncSetup.asp"-->
<!--#include virtual="/common/inc/inc_clsInit.asp"-->
<!--#include virtual="/common/class/clsBoard.asp"-->
<%
'########## // Request Paramas ##########
Dim iPage       : iPage         = fnSqlChk(Request("page"), 0, 0)   : iPage = NullValue(iPage,1)
Dim iBCode		: iBCode		= fnSqlChk(Request("bCode"), 0, 0)	: iBCode = NullValue(iBCode,0)
'########## Request Paramas // ##########

  Language="KO"
  PageName = "sub02"
  SubName = "en"
  Menu = "01"
  header = "sub"
  
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
	  
Else
	Call MsgBack("잘못된 접근입니다.")
End If
%>

<!-- #include file = '../include/head.asp' -->
<!-- #include file = '../include/header.asp' -->
<!-- #include file = '../include/sub_title.asp' -->
<style>
.view_edit_box{min-height:500px;}
</style>
<!-- container -->
<div id="container" class="">
    <!-- photo -->
    <div class="photo_wrap">
        <div class="sub_wrap two">
            <div class="inner con_inner">

                <div class="sub_news_box view">
                    <div class="tit"><%=Cols_Title%></div>
                    <div class="box">
                        <div class="date">
                            <div class="type">News Room</div>
                            <div class="date"><%=fnDateFormat(Cols_RegDate,6)%></div>
                        </div>
                    </div>

                    <div class="view_edit_box">
						<%If Not(Cols_TitleImg = "" Or IsNull(Cols_TitleImg)) Then%>
							<img src="<%=Cols_TitleImg%>"><br>	
						<%End If%>
                        <%=Cols_Contents%>
                    </div>

                    <a href="javascript:window.history.back();" class="common_submit_btn">
                       In a list
                    </a>
                </div>

            </div>
        </div>
    </div>
    <!-- END photo -->
</div>
<!-- END container -->

<script>
    $(document).ready(function () {

    });
</script>

<!-- #include file = '../include/footer.asp' -->