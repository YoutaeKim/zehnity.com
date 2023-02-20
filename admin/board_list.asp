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
Dim iSchType	: iSchType		= fnSqlChk(Request("schType"), 0, 0)	: iSchType = NullValue(iSchType,"all")
Dim iBType		: iBType		= fnSqlChk(Request("bType"), 0, 0)		: iBType = NullValue(iBType,"B0102")
'########## Request Paramas // ##########
Dim iPageSize   : iPageSize     = 10
Dim iTotalRecord: iTotalRecord  = 0
Dim iTotalPage  : iTotalPage    = 0
' iBType  'BOARD 구분 BOARD - B0103 , PHOTO - B0104, VOD - B0105
sParameter = "&bType="&iBType&"&schText="&iSchText&"&schType="&iSchType
If isNumeric(iPage) = False Then '페이지 숫자 체크
	Response.redirect sysThisUrl
End If
If iPage = 0 Then '페이지 0 에러 예외처리
	Response.redirect sysThisUrl
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
%>
<!-- #include file = './include/head.asp' -->
<!-- #include file = './include/header.asp' -->
<style>
#preview{
	    position: absolute;
}
.share{float:left;}
.question_list {
    display: flex;
	margin-bottom:10px;
}
.question_list li.active a {
    background-color: #03a7ee;
    color: #fff;
}
.question_list a {
    display: block;
    width: 90px;
    line-height: 32px;
    border-radius: 15px;
    background-color: #e6eaec;
    font-size: 13px;
    font-weight: 700;
    color: #aaaaaa;
    margin-right: 10px;
    text-align: center;
}
@media (max-width: 700px){
	.question_list {
		flex-wrap: wrap;
	}
	.question_list li{
		margin-top:10px;
	}
}

</style>
<!-- container -->
<div id="container">
	<!-- #include file = './include/gnb.asp' -->
	<!-- content -->
	<div class="content">

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

				<!-- board_wrap -->
				<div class="board_wrap">
					<!-- board list -->
					<div style="width:100%;overflow:hidden;display:<%If Not(Left(iBType,5) = "B0106") Then%>none;<%End If%>">
						<ul class="question_list">
							<li<%If iBType = "B0106" Then%> class="active"<%End If%>>
								<a href="?bType=B0106">
									전체
								</a>
							</li>
							<li<%If iBType = "B010601" Then%> class="active"<%End If%>>						
								<a href="?bType=B010601">
									제니티 서비스
								</a>
							</li>
							<li<%If iBType = "B010602" Then%> class="active"<%End If%>>
								<a href="?bType=B010602">
									기부활동
								</a>
							</li>
							<li<%If iBType = "B010603" Then%> class="active"<%End If%>>
								<a href="?bType=B010603">
									지원활동
								</a>
							</li>
							<li<%If iBType = "B010604" Then%> class="active"<%End If%>>
								<a href="?bType=B010604">
									기타
								</a>
							</li>
						</ul>

					</div>	
					<div class="board_table board_list">
						<table>
							<thead>
								<tr>
									<th class="num">번호</th>
									<th>제목</th>
									<th class="view">파일</th>
									<th class="data">등록일</th>									
								</tr>
							</thead>
							<tbody>

<%
	If IsArray(arrList) Then
		For i = 0 To UBound(arrList,2)
			If Not(arrList(4, i) = "" Or IsNull(arrList(4, i))) Then
				TitleImg = "<div class=""preView"" data-url="""&arrList(4, i)&"""><img src=""/image/sub/add_file.png""></a>"
			Else
				TitleImg = ""
			End If
			If iBType = "B0103" Then
				If arrList(3,i) = "1" Then
					Cols_SubTitle = "[공지사항] "
				ElseIf arrList(3,i) = "2" Then
					Cols_SubTitle = "[이벤트] "
				ElseIf arrList(3,i) = "9" Then
					Cols_SubTitle = "[기타] "
				Else	
					Cols_SubTitle = ""
				End If
			Else
				Cols_SubTitle = ""
			End If
			If iBType = "B0104" OR iBType = "B0105" Then
				If arrList(9,i) = "0" Then
					Cols_Share = "<div class=""share"" data-Open="""&arrList(9,i)&""" data-Code="""&arrList(0, i)&"""><img src=""/image/sub/share_icon_on.png"">&nbsp;&nbsp;</div>"
				Else
					Cols_Share = "<div class=""share"" data-Open="""&arrList(9,i)&""" data-Code="""&arrList(0, i)&"""><img src=""/image/sub/share_icon.png"">&nbsp;&nbsp;</div>"
				End If
			Else
				Cols_Share = ""
			End If
			If Not(arrList(12, i) = "" Or IsNull(arrList(12, i))) Then
				Cols_GroupName = " - [" & arrList(12, i) & "] "
			Else
				Cols_GroupName = ""
			End If 


%>
								<tr >
									<td><%=arrList(11, i)%></td>
									<td class="tit"><%=Cols_Share%><div onclick="location.href='board_view.asp?bCode=<%=arrList(0, i)%>&page=<%=iPage%><%=sParameter%>'"><%=Cols_SubTitle%><%=arrList(2, i)%></div></td>
									<td><%=TitleImg%></td>
									<td><%=fnDateFormat(arrList(8, i),6)%></td>									
								</tr>
<%
		Next
	Else
%>
								<tr>
									<td colspan="4" class="no-ct">
										<p>등록된 게시물이 없습니다.</p>
									</td>
								</tr>
<%
	End If
%>										 

							</tbody>
						</table>
					</div><!-- END board list -->

					<div class="clearfix mt20">
						<div class="float-r">
							<div class="btn s-small"><a href="board_write.asp?page=<%=iPage%><%=sParameter%>">글쓰기</a></div>
						</div>
					</div>

					<!-- 페이징 -->
					<div class="board-pager">
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
							.Navigation_Admin()
						End With
						Set objPN = Nothing
	End If
%>			 
					</div>
					<!-- END 페이징 -->

					<!-- 검색 -->
					<div class="board-search">
						<select class="board-search-select" name="schType" id="schType">
							<option value="all">전체</option>
							<option value="title"<%If iSchType = "title" Then%> selected<%End If%>>제목</option>
							<option value="content"<%If iSchType = "content" Then%> selected<%End If%>>내용</option>
						</select>
						<input type="text" class="board-search-field" name="schText" id="schText" value="<%=iSchText%>">
						<input type="button" value="검색" class="board-search-btn">
						<input type="hidden" id="bType" value="<%=iBType%>">
					</div>
					<!-- END 검색 -->

				</div>
				<!-- END board_wrap -->

			</div>

		</div>

	</div>	
	<!-- END content -->

</div>
<!-- END container -->
<script>
		var xOffset = 0;
        var yOffset = 30;
		//마우스 오버시 preview 생성
        $(document).on("mouseover",".preView",function(e){
            var image_data = $(this).data("url");
            var ext = image_data.split('.').pop().toLowerCase();			
			if($.inArray(ext, ['jpg','jpeg','gif','png'])>=0){
				$("body").append("<p id='preview'><img src='"+ $(this).attr("data-url") +"' width='400px' /></p>");
				$("#preview")
				.css("top",(e.pageY - xOffset) + "px")
				.css("left",(e.pageX + yOffset) + "px")
				.fadeIn("fast");
			}
        });
		$(document).on("mouseout",".preView",function(){
            $("#preview").remove();
        });
		$(document).ready(function () {
			//검색
			$(".board-search-btn").click(function(){
				location.href="?bType="+$("#bType").val()+"&schText="+$("#schText").val()+"&schType="+$("#schType").val();
			});
			//검색 엔터 실행
			$("#schText").keydown(function(key) {
				if( key.keyCode == 13 ){
					$(".board-search-btn").trigger("click");
				}
			});
			//리스트 공유 설정 변경
			$(".share").click(function(){
				if($(this).attr("data-Open") == "0"){
					bOpen = 1;					
				}else{
					bOpen = 0;					
				}
				if (confirm("공유설정 변경하시겠습니까?")) {
					$img = $(this).find("img");
					$.ajax({
						url : "/common/json/board/board.share.json.asp",
						type : "post",
						data : {bCode:$(this).attr("data-Code"), bOpen : bOpen},
						dataType : 'json',
						success : function(result){
							if(result.RESULT == "SUCCESS"){						 
								location.reload();
							}else{
								alert("변경 실패하였습니다.");
								location.reload();
							}
						},
						error : function(){
							alert("서버요청실패");
							location.reload();
						}
					});
				}
				
				 
			});
		});
		
</script>

<!-- #include file = './include/footer.asp' -->
  