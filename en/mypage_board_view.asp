<!--#include virtual="/common/fun/fncSetup.asp"-->
<!--#include virtual="/common/inc/inc_clsInit.asp"-->
<!--#include virtual="/common/class/clsMember.asp"-->
<!--#include virtual="/common/class/clsBoard.asp"-->
<%
 
'########## // Request Paramas ##########
Dim iPage       : iPage         = fnSqlChk(Request("page"), 0, 0)   : iPage = NullValue(iPage,1)
Dim iBCode		: iBCode		= fnSqlChk(Request("bCode"), 0, 0)	: iBCode = NullValue(iBCode,0)
Dim iBType		: iBType		= fnSqlChk(Request("bType"), 0, 0)	': iBType = NullValue(iBType,"B0103")
'BOARD 구분 BOARD - B0103 , PHOTO - B0104, VOD - B0105
'########## Request Paramas // ##########
 
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
		Cols_SubTitleText = "Notice"
	ElseIf Cols_SubTitle = "2" Then 
		Cols_SubTitleText = "Event"
	ElseIf Cols_SubTitle = "9" Then 
		Cols_SubTitleText = "Etc"
	End If
Else
	Call MsgBack("The wrong approach.")
End If

Cols_ListUrl = ""

If Cols_bType = "B0103" Then
	Cols_ListUrl = "mypage_board.asp?page="&iPage
ElseIf Cols_bType = "B0104" Then
	Cols_ListUrl = "mypage_photo.asp?page="&iPage
ElseIf Cols_bType = "B0105" Then
	Cols_ListUrl = "mypage_vod.asp?page="&iPage
End If 
If Not(Cols_YoutubeUrl = "" Or IsNull(Cols_YoutubeUrl)) Then
	If Instr(Cols_YoutubeUrl,"v=") > 0 Then
		Cols_YoutubeUrl = Replace(Cols_YoutubeUrl, "/watch?v=", "/embed/")
	End If
	If Instr(Cols_YoutubeUrl,"https://youtu.be/") > 0 Then
		Cols_YoutubeUrl = Replace(Cols_YoutubeUrl, "https://youtu.be/", "https://www.youtube.com/embed/")
	End If
End If
%>

<!-- #include file = '../include/head.asp' -->
<!-- #include file = '../include/header.asp' -->
<!-- #include file = '../include/sub_title.asp' -->
<style>
.embed-container{
	position:relative;
	padding-bottom:56.25%;
	height:0;
	overflow:hidden;
	max-width:100%;
}
.embed-container iframe, .embed-container object, .embed-container embed{
	position:absolute;
	top:0;
	left:0;
	width:100%;
	height:100%;
}
</style>
<script>
	document.cookie = "safeCookie1=foo; SameSite=Lax"; 
	document.cookie = "safeCookie2=foo";  
	document.cookie = "crossCookie=bar; SameSite=None; Secure";
</script>
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
                        <li>
                            <a href="mypage.asp">1:1 inquiry</a>
                        </li>
                        <li>
                            <a href="mypage_info_change.asp">Change information</a>
                        </li>
                        <li>
                            <a href="mypage_info_edit.asp">Sponsored organization information management</a>
                        </li>
                        <li >
                            <a href="mypage_management.asp">Sponsored project management</a>
                        </li>
						<li<%If iBType = "B0103" Then%> class="on"<%End If%>>
                            <a href="mypage_board.asp">BOARD</a>
                        </li>
                        <li<%If iBType = "B0104" Then%> class="on"<%End If%>>
                            <a href="mypage_photo.asp">PHOTO</a>
                        </li>
                        <li<%If iBType = "B0105" Then%> class="on"<%End If%>>
                            <a href="mypage_vod.asp">VOD</a>
                        </li>
                    </ul>

                    <div class="my_board_viewbox">
                        <div class="top_box">
							<%If Cols_bType = "B0103" Then%>
                            <div class="board_common_type"><%=Cols_SubTitleText%></div>
							<%End If%>
                            <div class="tit"><%=Cols_Title%></div>
                            <div class="date"><%=fnDateFormat(Cols_RegDate,14)%></div>
                        </div>

                        <div class="b_alt_box">
							<%If Not(Cols_TitleImg = "" Or IsNull(Cols_TitleImg)) And Cols_bType = "B0103" Then%>
                            <a href="javascript:;" onclick="fn_FileDown(this)"><div class="board_common_add_file"><img src="/image/sub/add_file.png" alt=""><%=Cols_FileName%> Down</div></a>
							<%End If%>
                            <div class="ment">
								<%If Not(Cols_TitleImg = "" Or IsNull(Cols_TitleImg)) AND Cols_bType = "B0104" Then%>
								<img src="<%=Cols_TitleImg%>"><Br><Br>
								<%End If%>
								<%If Not(Cols_YoutubeUrl = "" Or IsNull(Cols_YoutubeUrl)) AND Cols_bType = "B0105" Then%>
								<div class="embed-container">
									<iframe src="<%=Cols_YoutubeUrl%>" frameborder="0" allowfullscreen></iframe>
								</div><Br>
								<%End If%>
								<%=Cols_Contents%>
							</div>
                        </div>

                        <div class="btn_box flex">
                            <div class="left flex">
                                <a href="mypage_board_write.asp?bType=<%=iBType%>&bCode=<%=iBCode%>&page=<%=iPage%>" class="btn">Update</a>
                                <a href="javascript:;" class="btn" id="del">Del</a>
                            </div>
                            <a href="<%=Cols_ListUrl%>" class="link_btn">List</a>
                        </div>
                    </div>

                </div>

            </div>
        </div>
    </div>
    <!-- END mypage -->
</div>
<!-- END container -->

<script>
    $(document).ready(function () {
		
		//게시글 삭제
		$("#del").click(function(){
			if (confirm("Are you sure you want to delete?")) {
				$.ajax({
					url : "/common/json/board/board.del.json.asp",
					type : "post",
					data : { bCode:<%=iBCode%> },
					dataType : 'json',
					success : function(result){
						//console.log(result);
						if(result.DATA =="0"){
							//alert("삭제 되었습니다.");
							location.href="<%=Cols_ListUrl%>";
						}else{
							alert("Delete failed.\n please contact the manager.");
						}					
					},				
					error : function(){
						alert("Server request failed");					
					}
				});

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
	function fn_FileDown(obj){
		$(obj).attr('href' , '<%=Cols_TitleImg%>');
		$(obj).attr('download' , '<%=Cols_FileName%>');
	}
    // END
</script>

<!-- #include file = '../include/footer.asp' -->