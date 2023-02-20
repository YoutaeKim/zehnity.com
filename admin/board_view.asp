<!--#include virtual="/common/fun/fncSetup.asp"-->
<!--#include virtual="/common/inc/inc_clsInit.asp"-->
<!--#include virtual="/common/class/clsBoard.asp"-->
<%
  Language="KO"
  PageName = ""
  SubName = ""
'########## // Request Paramas ##########
Dim iPage       : iPage         = fnSqlChk(Request("page"), 0, 0)   : iPage = NullValue(iPage,1)
Dim iSchText	: iSchText		= fnSqlChk(Request("schText"), 0, 0)
Dim iSchType	: iSchType		= fnSqlChk(Request("schType"), 0, 0)	
Dim iBType		: iBType		= fnSqlChk(Request("bType"), 0, 0)		
Dim iBCode		: iBCode		= fnSqlChk(Request("bCode"), 0, 0)
'########## Request Paramas // ##########
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
If Not(Cols_YoutubeUrl = "" Or IsNull(Cols_YoutubeUrl)) Then
	If Instr(Cols_YoutubeUrl,"v=") > 0 Then
		Cols_YoutubeUrl = Replace(Cols_YoutubeUrl, "/watch?v=", "/embed/")
	End If
	If Instr(Cols_YoutubeUrl,"https://youtu.be/") > 0 Then
		Cols_YoutubeUrl = Replace(Cols_YoutubeUrl, "https://youtu.be/", "https://www.youtube.com/embed/")
	End If
End If
%>
<!-- #include file = './include/head.asp' -->
<!-- #include file = './include/header.asp' -->
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
<!-- container -->
<div id="container">
	<!-- #include file = './include/gnb.asp' -->
	<!-- content -->
	<div class="content ">
		<div class="path_wrap">
			<div class="inner">	
				<ul class="path inline_wrap">
					<li class="home"><a href="/admin"><img src="/admin/image/common/home.png"></a></li>
					<li><a href="javascript:$('.gnb_wrap').toggleClass('on_m'); $('.content').toggleClass('on_m');$('.gnb > li').eq(3).addClass('select');">게시판</a></li>
					<li><a href="board_list.asp?bType=<%=iBType%>"><%=BoardTitleName(iBType)%></a></li>
				</ul>
			</div>
		</div>		
		<div class="inner">	

			<div class="white_box">
				<!-- board view -->
				<div class="board-view">
					
					<p class="board-view-tit">
						<%If Cols_bType = "B010601" Then%>[제니티서비스]
						<%ElseIf Cols_bType = "B010602" Then%>[기부활동]
						<%ElseIf Cols_bType = "B010603" Then%>[지원활동]
						<%ElseIf Cols_bType = "B010604" Then%>[기타]<%End If%>
						<%=Cols_Title%>
					</p>
					<p class="board-view-info"><%=Cols_RegDate%> <!-- <span>|</span> 조회 1029 --></p>
					
					<div class="board-view-ct">
						<%If Not(Cols_TitleImg = "" Or IsNull(Cols_TitleImg)) AND Cols_bType = "B0104" Then%>
						<img src="<%=Cols_TitleImg%>"><Br><Br>
						<%End If%>
						<%If Not(Cols_YoutubeUrl = "" Or IsNull(Cols_YoutubeUrl)) AND Cols_bType = "B0105" Then%>
						<div class="embed-container">
							<iframe src="<%=Cols_YoutubeUrl%>" frameborder="0" allowfullscreen></iframe>
						</div><Br>
						<%End If%>
						<%=Cols_Contents%>
						<%If Not(Cols_TitleImg = "" Or IsNull(Cols_TitleImg)) And Cols_bType = "B0103" Then%>
						<!-- 첨부 -->
						<ul class="board-view-file">
							<li>첨부파일 : <a href="javascript:;" onclick="fn_FileDown(this)"><%=Cols_FileName%> 다운</a></li> 
						</ul><!-- END 첨부 -->
						<%End If%>
					</div>

					<!-- 이전/다음 컨텐츠 -->
					<ul class="board-view-nav">
						<!-- <li><span class="lb">이전글<img src="/admin/image/sub/icon_prev.gif" alt=""></span><span class="dh_gray">이전글이 없습니다.</span></li>
						<li><span class="lb">다음글<img src="/admin/image/sub/icon_next.gif" alt=""></span><a href="#">다음글의 제목이 들어갑니다.</a></li> -->
					</ul>
					<!-- END 이전/다음 컨텐츠 -->
					
					<!-- Buttons -->
					<div class="board-view-btns">
						<div class="btn small"><a href="board_list.asp?bType=<%=iBType%>&page=<%=iPage%>&schText=<%=iSchText%>&schType=<%=iSchType%>" class="">목록으로</a></div>
						<div class="right btn gray">
							<a href="board_write.asp?bCode=<%=iBCode%>&bType=<%=iBType%>&page=<%=iPage%>&schText=<%=iSchText%>&schType=<%=iSchType%>">수정</a>
							<a href="javascript:fn_del(<%=iBCode%>);">삭제</a>
						</div>
					</div><!-- END Buttons -->

				</div><!-- END board view -->
			</div>

		</div>

	</div>	
	<!-- END content -->

</div>
<!-- END container -->
<script>
	function fn_FileDown(obj){
		$(obj).attr('href' , '<%=Cols_TitleImg%>');
		$(obj).attr('download' , '<%=Cols_FileName%>');
	}
	function fn_del(val){
		if (confirm("삭제하시겠습니까?")) {
				$.ajax({
					url : "/common/json/board/board.del.json.asp",
					type : "post",
					data : { bCode:<%=iBCode%> },
					dataType : 'json',
					success : function(result){
						//console.log(result);
						if(result.DATA =="0"){
							//alert("삭제 되었습니다.");
							location.href="board_list.asp?bType=<%=iBType%>";
						}else{
							alert("삭제 실패 하였습니다.\n관리자에게 문의 해주세요.");
						}					
					},				
					error : function(){
						alert("서버요청실패");					
					}
				});

			}
	}
</script>
<!-- #include file = './include/footer.asp' -->
  