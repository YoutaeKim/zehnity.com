<!--#include virtual="/common/fun/fncSetup.asp"-->
<!--#include virtual="/common/inc/inc_clsInit.asp"-->
<!--#include virtual="/common/class/clsCommon.asp"-->
<%
  Language="KO"
  PageName = "sub03"
  SubName = "ko"
  header = "sub"

'########## // Request Paramas ##########
Dim iPage       : iPage         = fnSqlChk(Request("page"), 0, 0)   : iPage = NullValue(iPage,1)
Dim iSchText	: iSchText		= fnSqlChk(Request("schText"), 0, 0)
Dim iSchType	: iSchType		= fnSqlChk(Request("schType"), 0, 0): iSchType = NullValue(iSchType,"all")
'########## Request Paramas // ##########
Dim iPageSize   : iPageSize     = 9
Dim iTotalRecord: iTotalRecord  = 0
Dim iTotalPage  : iTotalPage    = 0

Dim iSchTypeText
If iSchType = "all" Then
	iSchTypeText = "전체"
ElseIf iSchType = "title" Then
	iSchTypeText = "제목"
ElseIf iSchType = "content" Then
	iSchTypeText = "내용" 
End If

'후원단체 리스트
Set objCommon = New clsCommon
Dim arrList : arrList = objCommon.GetAllSupportGroupList(iSchType, iSchText, iPage, iPageSize)
Set objCommon = Nothing
If IsArray(arrList) Then 
  iTotalRecord = arrList(9, 0)  : iTotalPage = arrList(10, 0)
End If
Dim sParameter
sParameter = "&schText=" & iSchText & "&schType=" & iSchType
%>

<!-- #include file = '../include/head.asp' -->
<!-- #include file = '../include/header.asp' -->
<!-- #include file = '../include/sub_title.asp' -->

<!-- container -->
<div id="container" class="">
    <!-- support -->
    <div class="support_wrap photo_wrap">
        <div class="sub_wrap two">
            <div class="inner con_inner">
                <div class="sub_common_nav_box">
                    <div class="total">
                        총 <span><%=FormatNumber(iTotalRecord,0)%></span>건
                    </div>
                    <div class="search_wrap">
                        <a href="javascript:;" class="select">
                            <span><%=iSchTypeText%></span>
                            <div class="select_menu">
								<div class="menu" data-type="all">전체</div>
                                <div class="menu" data-type="title">제목</div>
                                <div class="menu" data-type="content">내용</div>
                            </div>
                        </a>
						<input type="hidden" id="schType" value="<%=iSchType%>">
                        <input type="text" id="schText" maxlength="40" placeholder="검색어를 입력하세요." value="<%=iSchText%>">
                        <button type="button" class="search_btn"></button>
                    </div>
                </div>

                <div class="sub_content_wrap">
<%
	If IsArray(arrList) Then
		For i = 0 To UBound(arrList,2)
			If Not(arrList(3, i) = "" Or IsNull(arrList(3, i))) Then
				Cols_LogoImg = "style='background:url("&arrList(3, i)&") no-repeat center / cover;'"
			End If
			If arrList(1, i) = "0" Then
				Cols_GroupTypeText = "후원단체"
			ElseIf arrList(1, i) = "1" Then
				Cols_GroupTypeText = "종교단체"
			ElseIf arrList(1, i) = "2" Then
				Cols_GroupTypeText = "교육단체"
			ElseIf arrList(1, i) = "3" Then
				Cols_GroupTypeText = "정치단체"
			ElseIf arrList(1, i) = "9" Then
				Cols_GroupTypeText = "기타"
			Else
				Cols_GroupTypeText = "기타"
			End If
%>                    
					<a href="/support/main.asp?sgCode=<%=arrList(0, i)%>" target="_blank" class="box">
                        <div class="sub_box">
                            <div class="t_box">
                                <div class="icon" <%=Cols_LogoImg%>></div>
                                <div class="txt_alt ">
                                    <div class="name text_ov"><%=Cols_GroupTypeText%></div>
                                    <div class="sub_name text_ov"><%=arrList(2, i)%></div>
                                </div>
                            </div>
                            <div class="c_box text_ov4">
                                <%=arrList(4, i)%>
                            </div>
                            <div class="alt_box p">
                                <div class="box2">
                                    <div class="left">
                                        <div class="icon">
                                            <div class="img"></div>
                                        </div>
                                        진행중인 후원
                                    </div>
                                    <div class="right"><%=arrList(5, i)%>건</div>
                                </div>
                                <div class="box2">
                                    <div class="left two">
                                        <div class="icon">
                                            <div class="img"></div>
                                        </div>
                                        누적 후원금
                                    </div>
                                    <div class="right">$<%=FormatNumber(arrList(6, i),0)%></div>
                                </div>
                            </div>
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
    <!-- END support -->
</div>
<!-- END container -->

<script>
	$(document).ready(function () {
		//검색타입 선택
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