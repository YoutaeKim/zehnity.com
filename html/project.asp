<!--#include virtual="/common/fun/fncSetup.asp"-->
<!--#include virtual="/common/inc/inc_clsInit.asp"-->
<!--#include virtual="/common/class/clsCommon.asp"-->
<%
 
  Language="KO"
  PageName = "sub04"
  SubName = "ko"
  header = "sub"

'########## // Request Paramas ##########
Dim iPage       : iPage         = fnSqlChk(Request("page"), 0, 0)		: iPage = NullValue(iPage,1)
Dim iSchText	: iSchText		= fnSqlChk(Request("schText"), 0, 0)
Dim iSchType	: iSchType		= fnSqlChk(Request("schType"), 0, 0)	: iSchType = NullValue(iSchType,"all")
Dim iPtype      : iPtype        = fnSqlChk(Request("ptype"), 0, 0)		: iPtype = NullValue(iPtype,0)
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

'프로젝트 리스트
Set objCommon = New clsCommon
Dim arrList : arrList = objCommon.GetAllProjectList(iSchType, iSchText, iPtype,  iPage, iPageSize)
Set objCommon = Nothing
If IsArray(arrList) Then 
  iTotalRecord = arrList(12, 0)  : iTotalPage = arrList(13, 0)
End If
Dim sParameter
sParameter = "&ptype=" & iPtype & "&schText=" & iSchText & "&schType=" & iSchType

%>

<!-- #include file = '../include/head.asp' -->
<!-- #include file = '../include/header.asp' -->
<!-- #include file = '../include/sub_title.asp' -->

<!-- container -->
<div id="container" class="">
    <!-- project -->
    <div class="photo_wrap project">
        <div class="sub_wrap two">
            <div class="inner con_inner">
                <div class="sub_top_tab">
                    <div class="link<%If iPtype = "0" Then%> active<%End If%>" data-ptype="0">진행중인 후원 프로젝트</div>
                    <div class="link<%If iPtype = "1" Then%> active<%End If%>" data-ptype="1">종료된 후원 프로젝트</div>
                </div>
                <div class="content">
                    <div class="sub_common_nav_box">
                        <div class="total">
                            총 <span><%=iTotalRecord%></span>건
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
                            <input type="hidden" id="ptype" value="<%=iPtype%>">
                            <input type="hidden" id="schType" value="<%=iSchType%>">
							<input type="text" id="schText" maxlength="40" placeholder="검색어를 입력하세요." value="<%=iSchText%>">
                            <button type="button" class="search_btn"></button>
                        </div>
                    </div>

                    <div class="sub_content_wrap">
<%
	If IsArray(arrList) Then
		For i = 0 To UBound(arrList,2)
		Cols_pCode	= arrList(0, i)
		Cols_sgCode = arrList(1, i)
		If Not(arrList(3, i) = "" Or IsNull(arrList(3, i))) Then
			Cols_ProjectImg = " style='background: url(" & arrList(3, i) & ") no-repeat center / cover;'"
		Else
			Cols_ProjectImg = ""
		End If
		If arrList(8, i) = "0" Then
			Cols_GroupTypeText = "후원단체"
		ElseIf arrList(8, i) = "1" Then
			Cols_GroupTypeText = "종교단체"
		ElseIf arrList(8, i) = "2" Then
			Cols_GroupTypeText = "교육단체"
		ElseIf arrList(8, i) = "3" Then
			Cols_GroupTypeText = "정치단체"
		ElseIf arrList(8, i) = "9" Then
			Cols_GroupTypeText = "기타"
		Else
			Cols_GroupTypeText = "기타"
		End If
		If Not(arrList(9, i) = "" Or IsNull(arrList(9, i))) Then
			Cols_Logoimg = " style='background: url(" & arrList(9, i) & ") no-repeat center / cover;'"
		Else
			Cols_Logoimg = ""
		End If
		If iPtype = 0 Then
			If arrList(5, i) = 0 Then
				Cols_Rate = 1
			Else
				Cols_Rate = arrList(5, i) / arrList(4, i) * 100
			End If


%>		
						<a href="/support/introduce.asp?sgCode=<%=Cols_sgCode%>&pCode=<%=Cols_pCode%>" target="_blank" class="box">
                            <div class="sub_box">
                                <div class="img_wrap_box">									
                                    <div class="gage_box">
                                        <div class="gage_bar" style="overflow:hidden;">
                                            <div class="bar" style="width:<%=Cols_Rate%>%;"></div>
                                        </div>
                                        <div class="gage_alt">
                                            <div class="people">
                                                <div class="icon"></div>
                                                <%=FormatNumber(arrList(6, i),0)%>
                                            </div>
                                            <div class="won">
                                                <span>$ </span>
                                                <%=FormatNumber(arrList(5, i),0)%>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="img_wrap" <%=Cols_ProjectImg%>>
                                    </div>
                                </div>
                                <div class="btm_box">
                                    <div class="tit text_ov2">
                                        <%=arrList(2, i)%>
                                    </div>
                                    <div class="alt_box p">
                                        <div class="icon_img"<%=Cols_Logoimg%>></div>
                                        <div class="alt">
                                            <div class="name text_ov"><%=Cols_GroupTypeText%></div>
                                            <div class="sub_name text_ov"><%=arrList(7, i)%></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
			<%Else%>                         
						<a href="javascript:;" class="box">
                            <div class="sub_box">
                                <div class="img_wrap_box">
                                    <div class="img_wrap" <%=Cols_ProjectImg%>>
                                        <div class="bg">
                                            <div class="span">종료</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="btm_box">
                                    <div class="tit text_ov2">
                                        <%=arrList(2, i)%>
                                    </div>
                                    <div class="alt_box p">
                                        <div class="icon_img"<%=Cols_Logoimg%>></div>
                                        <div class="alt ">
                                            <div class="name text_ov"><%=Cols_GroupTypeText%></div>
                                            <div class="sub_name text_ov"><%=arrList(7, i)%></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
<%
			End If
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
    </div>
    <!-- END project -->
</div>
<!-- END container -->

<script>
    $(document).ready(function () {
		$('.select_menu .menu').on('click', function () {
			$("#schType").val($(this).attr("data-type"));
		});	
        // 탭기능 
        $(".sub_top_tab .link").on("click", function () {
			$(this).attr("data-ptype")
			location.href="?ptype=" + $(this).attr("data-ptype");
        });
		//검색
		$(".search_btn").click(function(){
			location.href="?ptype="+$("#ptype").val()+"&schText="+$("#schText").val()+"&schType="+$("#schType").val();
		});
		//검색 엔터 실행
		$("#schText").keydown(function(key) {
			if( key.keyCode == 13 ){
				location.href="?ptype="+$("#ptype").val()+"&schText="+$("#schText").val()+"&schType="+$("#schType").val();
			}
		});
    });
</script>

<!-- #include file = '../include/footer.asp' -->