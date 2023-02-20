<!--#include virtual="/common/fun/fncSetup.asp"-->
<!--#include virtual="/common/inc/inc_clsInit.asp"-->
<!--#include virtual="/common/class/clsCommon.asp"-->
<!--#include virtual="/common/class/clsBoard.asp"-->
<%
'########## // Request Paramas ##########
Dim sgCode      : sgCode		= fnSqlChk(Request("sgCode"), 0, 0)
Dim iPage       : iPage         = fnSqlChk(Request("page"), 0, 0)   : iPage = NullValue(iPage,1)
Dim iSchText	: iSchText		= fnSqlChk(Request("schText"), 0, 0)
Dim iSchType	: iSchType		= fnSqlChk(Request("schType"), 0, 0)	: iSchType = NullValue(iSchType,"all")
'########## Request Paramas // ##########
Dim iPageSize   : iPageSize     = 9
Dim iTotalRecord: iTotalRecord  = 0
Dim iTotalPage  : iTotalPage    = 0
 
sParameter = "&sgCode="&sgCode&"&schText="&iSchText&"&schType="&iSchType

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
Set objBoard = New clsBoard
Dim arrList : arrList = objBoard.GetBoardCommonList(iSchType, iSchText, "B0103", sgCode, 0, 3, iPage, iPageSize)
Set objBoard = Nothing

If IsArray(arrList) Then 
	iTotalRecord = arrList(16, 0)  : iTotalPage = arrList(17, 0)
Else
	If iPage > 1 Then
		Response.redirect sysThisUrl&"?page=1" & sParameter
	End If
End If

  Language="KO"
  PageName = "sub04"
  SubName = "ko"
  footer = "add"
%>

<!-- #include virtual = '/support/include/head.asp' -->
<!-- #include virtual = '/support/include/header.asp' -->
<!-- #include virtual = '/support/include/sub_title.asp' -->
 

<!-- container -->
<div id="container" class="">
    <div class="common_sub_wrap board_wrap">
        <div class="inner sub_inner">
            <div class="sub_common_nav_box">
                <div class="total">
                    총 <span><%=FormatNumber(iTotalRecord,0)%></span>건
                </div>
                <div class="search_wrap">
                    <select name="schType" id="schType">
                        <option value="all">전체</option>
						<option value="title"<%If iSchType = "title" Then%> selected<%End If%>>제목</option>
						<option value="content"<%If iSchType = "content" Then%> selected<%End If%>>내용</option>
                    </select>
                    <input type="text" name="schText" id="schText" value="<%=iSchText%>" placeholder="검색어를 입력해주세요">
                    <button type="button" class="search_btn"></button>
                </div>
            </div>

            <div class="sub_content_wrap board">
<%
	If IsArray(arrList) Then
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
				<a href="board_view.asp?sgCode=<%=sgCode%>&bCode=<%=arrList(0, i)%>" class="box">
                    <div class="sub_box">
                        <div class="b_tit"><%=Cols_SubTitle%></div>
                        <div class="b_sub_tit text_ov2">
                            <%=arrList(2, i)%>
                        </div>
                        <div class="b_alt text_ov4">
                            <%=RemoveHTML(arrList(5, i))%>
                        </div>
                        <div class="date common_date_box">
                            <div class="img_box">
                                <img src="/support/image/sub/date_icon.png" alt="">
                            </div>
                            <%=fnDateFormat(arrList(8, i),6)%>
                        </div>
                    </div>
                </a>
<%
		Next
	Else
%>
				<div class="no_ct">
					<div class="img"></div>
					게시글이 없습니다.
				</div>
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
							.NavigationSize = 5
							.Navigation2()
						End With
						Set objPN = Nothing
	End If
%> 
            </div>
        </div>
    </div>
</div>
</div>
<!-- END container -->

<script>
    $(document).ready(function () {
		//검색
        $('.search_btn').on('click', function () {
			location.href="?sgCode=<%=sgCode%>&schText="+$("#schText").val()+"&schType="+$("#schType").val();
		});
		$("#schText").keydown(function(key) {
			if( key.keyCode == 13 ){
				location.href="?sgCode=<%=sgCode%>&schText="+$("#schText").val()+"&schType="+$("#schType").val();
			}
		});
    });
</script>

<!-- #include virtual = '/support/include/footer.asp' -->