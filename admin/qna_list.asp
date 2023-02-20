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
'########## Request Paramas // ##########
Dim iPageSize   : iPageSize     = 10
Dim iTotalRecord: iTotalRecord  = 0
Dim iTotalPage  : iTotalPage    = 0

sParameter = "&schText="&iSchText&"&schType="&iSchType
If isNumeric(iPage) = False Then '페이지 숫자 체크
	Response.redirect sysThisUrl
End If
If iPage = 0 Then '페이지 0 에러 예외처리
	Response.redirect sysThisUrl
End If

Set objBoard = New clsBoard
Dim arrList : arrList = objBoard.GetAllBoradQnAList(iSchType, iSchText, iPage, iPageSize)
Set objBoard = Nothing
If IsArray(arrList) Then 
	iTotalRecord = arrList(14, 0)  : iTotalPage = arrList(15, 0)
Else
	If iPage > 1 Then
		Response.redirect sysThisUrl
	End If
End If 

%>
<!-- #include file = './include/head.asp' -->
<!-- #include file = './include/header.asp' -->
<style>
.mode {
    color: #fff;
    padding: 5px;
    border-radius: 3px;
    background-color: #a4aeb0;
    line-height: 1;
}
.mode.on {
    background-color: #03a7ee;
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
					<li class="home"><a href="javascript:$('.gnb_wrap').toggleClass('on_m'); $('.content').toggleClass('on_m');$('.gnb > li').eq(3).addClass('select');"><img src="/admin/image/common/home.png"></a></li>
					<li><a href="javascript:$('.gnb_wrap').toggleClass('on_m'); $('.content').toggleClass('on_m');$('.gnb > li').eq(3).addClass('select');">게시판</a></li>
					<li><a href="qna_list.asp">1:1문의</a></li>
				</ul>
			</div>
		</div>
		
		<div class="inner">	

			<div class="white_box">

				<!-- board_wrap -->
				<div class="board_wrap">
					<!-- board list -->
					<div class="board_table board_list">
						<table>
							<thead>
								<tr>
									<th class="num">번호</th>
									<th>문의내용</th>
									<th class="data">등록일</th>
									<th class="view">답변여부</th>
								</tr>
							</thead>
							<tbody>
<%
	If IsArray(arrList) Then
		For i = 0 To UBound(arrList,2)
%>
								<tr onclick="location.href='qna_view.asp?qCode=<%=arrList(0, i)%>&page=<%=iPage%><%=sParameter%>'">
									<td><%=arrList(13, i)%></td>
									<td class="tit"><div><%=arrList(7, i)%></div></td>
									<td><%=fnDateFormat(arrList(11, i),6)%></td>
									<td>
									<%If arrList(8, i) = "" Or IsNull(arrList(8, i)) Then%><div class="mode">답변대기</div><%Else%><div class="mode on">답변완료</div><%End If%>
									</td>
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
							<option value="groupname"<%If iSchType = "groupname" Then%> selected<%End If%>>그룹명</option>
							<option value="content"<%If iSchType = "content" Then%> selected<%End If%>>내용</option>
						</select>
						<input type="text" class="board-search-field" name="schText" id="schText" value="<%=iSchText%>">
						<input type="button" value="검색" class="board-search-btn">
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
	$(document).ready(function () {
		//검색
		$(".board-search-btn").click(function(){
			location.href="?schText="+$("#schText").val()+"&schType="+$("#schType").val();
		});
		//검색 엔터 실행
		$("#schText").keydown(function(key) {
			if( key.keyCode == 13 ){
				$(".board-search-btn").trigger("click");
			}
		});	
	});
</script>
<!-- #include file = './include/footer.asp' -->
  