<!--#include virtual="/common/fun/fncSetup.asp"-->
<!--#include virtual="/common/inc/inc_clsInit.asp"-->
<!--#include virtual="/common/class/clsBoard.asp"-->
<%
'########## // Request Paramas ##########
Dim iPage       : iPage         = fnSqlChk(Request("page"), 0, 0)   : iPage = NullValue(iPage,1)
Dim iSchText	: iSchText		= fnSqlChk(Request("schText"), 0, 0)
Dim iSchType	: iSchType		= fnSqlChk(Request("schType"), 0, 0)	: iSchType = NullValue(iSchType,"all")

'########## Request Paramas // ##########
Dim iPageSize   : iPageSize     = 9
Dim iTotalRecord: iTotalRecord  = 0
Dim iTotalPage  : iTotalPage    = 0
Dim iBType : iBType = "B0104" 'BOARD 구분 BOARD - B0103 , PHOTO - B0104, VOD - B0105

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
	iSchTypeText = "Content" 
End If


Set objBoard = New clsBoard
Dim arrList : arrList = objBoard.GetBoardCommonList( iSchType, iSchText, "B0104", 0, 0, 0, iPage, iPageSize)
Set objBoard = Nothing
If IsArray(arrList) Then 
	iTotalRecord = arrList(16, 0)  : iTotalPage = arrList(17, 0)
Else
	If iPage > 1 Then
		Response.redirect sysThisUrl
	End If
End If
sParameter = "&schText="&iSchText&"&schType="&iSchType

  Language="KO"
  PageName = "sub02"
  SubName = "en"
  Menu = "02"
  header = "sub"
%>

<!-- #include file = '../include/head.asp' -->
<!-- #include file = '../include/header.asp' -->
<!-- #include file = '../include/sub_title.asp' -->
<style>
.photo_wrap .sub_content_wrap .box .sub_tit {
min-height:25px;
}
</style>
<!-- click_modal -->
<div class="click_modal_wrap">
    <div class="modal">
        <div class="click_modal_box en common_modal_box">
            <div class="top_box">
                <div class="tit">View</div>
                <button type="button" class="close_btn" onclick="click_modalClose();"></button>
            </div>
            <div class="img_box">
                <div class="img"></div>
                <div class="img_alt text_ov2">
                    사진 제목이 최대 두줄까지 보여집니다 사진제목이 최대 두줄까지
                    보여집니다 사진 제목이 최대 두줄까지 보여집니다
                </div>
                <div class="btn_box">
                    <button type="button" class="btn fir" id="linkSupport">A sponsoring organization</button>
                    <button type="button" class="btn" id="linkProject">Sponsored project</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- END click_modal -->

<!-- container -->
<div id="container" class="">
    <!-- photo -->
    <div class="photo_wrap">
        <div class="sub_wrap two">
            <div class="inner con_inner">
                <div class="sub_commom_tit">
                    Photo
                </div>
                <div class="sub_common_nav_box">
                    <div class="total">
                        Total <span><%=FormatNumber(iTotalRecord,0)%></span> cases
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

                <div class="sub_content_wrap">
<%
	If IsArray(arrList) Then
		For i = 0 To UBound(arrList,2)
			If Not(arrList(4, i) = "" Or isNull(arrList(4, i))) Then
				Cols_TitleImg = " style='background: url("&arrList(4, i)&") no-repeat center / cover;'"
			Else
				Cols_TitleImg = ""
			End If
			If arrList(13, i) = "0" Then
				Cols_GroupTypeText = "후원단체"
			ElseIf arrList(13, i) = "1" Then
				Cols_GroupTypeText = "종교단체"
			ElseIf arrList(13, i) = "2" Then
				Cols_GroupTypeText = "교육단체"
			ElseIf arrList(13, i) = "3" Then
				Cols_GroupTypeText = "정치단체"
			ElseIf arrList(13, i) = "9" Then
				Cols_GroupTypeText = "기타"
			Else
				Cols_GroupTypeText = "기타"
			End If
			If Not(arrList(14, i) = "" Or isNull(arrList(14, i))) Then
				Cols_LogoImg = " style='background: url("&arrList(14, i)&") no-repeat center / cover;'"
			Else
				Cols_LogoImg = ""
			End If
%>
                    <a href="javascript:;" class="box" data-pCode="<%=arrList(7, i)%>" data-sgCode="<%=arrList(6, i)%>">
                        <div class="sub_box">
                            <div class="img_wrap_box">
                                <div class="img_wrap"<%=Cols_TitleImg%>></div>
                            </div>
                            <div class="btm_box">
                                <div class="tit text_ov"><%=arrList(2, i)%></div>
                                <div class="sub_tit text_ov3"><%=RemoveHTML(arrList(5, i))%></div>                              
								
                            </div>
							<div class="last_box">
								<div class="alt_box p">
									<div class="icon_img"<%=Cols_LogoImg%>></div>
									<div class="alt">
										<div class="name text_ov"><%=Cols_GroupTypeText%></div>
										<div class="sub_name text_ov"><%=arrList(12, i)%></div>
									</div>
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
    <!-- END photo -->
</div>
<!-- END container -->

<script>
	var pCode;
	var sgCode;
    $(document).ready(function () {
        $('.sub_content_wrap .box').on("click", function () {
            var img = $(this).find('.img_wrap').css("background-image").replace(/^url\(['"](.+)['"]\)/, '$1');
			var title = $(this).find('.tit.text_ov').text();
			pCode = $(this).attr("data-pCode");
			sgCode = $(this).attr("data-sgCode");			 
            var box = $('.click_modal_wrap .modal').find('.img');
            box.css("background-image", "url(" + img + ")");
			$(".img_alt.text_ov2").html(title);
            $(".click_modal_wrap .modal").fadeIn();
            $('body, html').addClass('on');
        });
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
		$("#linkSupport").click(function(){
			if(sgCode){
				 var popup = window.open('/support/main.asp?sgCode='+sgCode, 'Support', '');
			}
		});
		$("#linkProject").click(function(){
			if(pCode){
				 var popup = window.open('/support/introduce.asp?sgCode='+sgCode+'&pCode='+pCode, 'Project', '');
			}
		});
		
    });
    // modal
    function click_modalOpen() {
        $(".click_modal_wrap .modal").fadeIn();
        $('body, html').addClass('on');
    }

    function click_modalClose() {
        $(".click_modal_wrap .modal").fadeOut();
        $('body, html').removeClass('on');
    }
    // END modal
</script>

<!-- #include file = '../include/footer.asp' -->