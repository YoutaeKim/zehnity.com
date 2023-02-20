<!--#include virtual="/common/fun/fncSetup.asp"-->
<!--#include virtual="/common/inc/inc_clsInit.asp"-->
<!--#include virtual="/common/class/clsBoard.asp"-->
<%
'########## // Request Paramas ##########
Dim iPage       : iPage         = fnSqlChk(Request("page"), 0, 0)   : iPage = NullValue(iPage,1)
Dim iSchText	: iSchText		= fnSqlChk(Request("schText"), 0, 0)
Dim iSchType	: iSchType		= fnSqlChk(Request("schType"), 0, 0)	: iSchType = NullValue(iSchType,"all")

'########## Request Paramas // ##########
Dim iPageSize   : iPageSize     = 5
Dim iTotalRecord: iTotalRecord  = 0
Dim iTotalPage  : iTotalPage    = 0
Dim iBType : iBType = "B0102" 'BOARD 구분 BOARD - B0103 , PHOTO - B0104, VOD - B0105
sParameter = "&schText="&iSchText&"&schType="&iSchType
If isNumeric(iPage) = False Then '페이지 숫자 체크
	Response.redirect sysThisUrl
End If
If iPage = 0 Then '페이지 0 에러 예외처리
	Response.redirect sysThisUrl
End If

Dim iSchTypeText
If iSchType = "all" Then
	iSchTypeText = "All"
ElseIf iSchType = "title" Then
	iSchTypeText = "Title"
ElseIf iSchType = "content" Then
	iSchTypeText = "내용" 
End If


Set objBoard = New clsBoard
Dim arrList : arrList = objBoard.GetBoardCommonList( iSchType, iSchText, iBType, 0, 0, 3, iPage, iPageSize)
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
  SubName = "en"
  Menu = "04"
  header = "sub"
%>

<!-- #include file = '../include/head.asp' -->
<!-- #include file = '../include/header.asp' -->
<!-- #include file = '../include/sub_title.asp' -->

<!-- container -->
<div id="container" class="">
    <!-- photo -->
    <div class="photo_wrap">
        <div class="sub_wrap two">
            <div class="inner con_inner">
                <div class="sub_commom_tit">
                    Notice
                </div>
                <div class="sub_common_nav_box">
                    <div class="total">
                        Total <span><%=iTotalRecord%></span> cases
                    </div>
                    <div class="search_wrap">
                        <a href="javascript:;" class="select">
                            <span><%=iSchTypeText%></span>
                            <div class="select_menu">
                                <div class="menu" data-type="all">All</div>
								<div class="menu" data-type="title">Title</div>
								<div class="menu" data-type="content">Content</div>
                            </div>
                        </a>
                        <input type="hidden" id="schType" value="<%=iSchType%>">
						<input type="text" id="schText" maxlength="40" placeholder="Please enter a search term." value="<%=iSchText%>">
                        <button type="button" class="search_btn"></button>
                    </div>
                </div>

                <div class="sub_news_box">
<%
	If IsArray(arrList) Then
		For i = 0 To UBound(arrList,2)
%>
                    <a href="notice_view.asp?bCode=<%=arrList(0, i)%>&page=<%=iPage%>" class="box">
                        <div class="tit text_ov">
                            <%=arrList(2, i)%>
                        </div>
                        <div class="alt text_ov2">
                            <%=RemoveHTML(arrList(5, i))%>
                        </div>
                        <div class="date">
                            <div class="type">NOTICE</div>
                            <div class="date"><%=fnDateFormat(arrList(8, i),6)%></div>
                        </div>
                    </a>
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
    <!-- END photo -->
</div>
<!-- END container -->

<script>
    $(document).ready(function () {
		$('.select_menu .menu').on('click', function () {
			$("#schType").val($(this).attr("data-type"));
		});
		//검색
		$(".search_btn").click(function(){
			location.href="?schText="+$("#schText").val()+"&schType="+$("#schType").val();
		});
		//검색 엔터 실행
		$("#schText").keydown(function(key) {
			if( key.keyCode == 13 ){
				location.href="?schText="+$("#schText").val()+"&schType="+$("#schType").val();
			}
		});
    });
</script>

<!-- #include file = '../include/footer.asp' -->