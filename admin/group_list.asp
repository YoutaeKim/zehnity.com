<!--#include virtual="/common/fun/fncSetup.asp"-->
<!--#include virtual="/common/inc/inc_clsInit.asp"-->
<!--#include virtual="/common/class/clsCommon.asp"-->
<%
  Language="KO"
  PageName = ""
  SubName = ""
  
'########## // Request Paramas ##########
Dim iPage       : iPage         = fnSqlChk(Request("page"), 0, 0)   : iPage = NullValue(iPage,1)
Dim iSchText	: iSchText		= fnSqlChk(Request("schText"), 0, 0)
Dim iSchType	: iSchType		= fnSqlChk(Request("schType"), 0, 0)	: iSchType = NullValue(iSchType,"all")
'########## Request Paramas // ##########
Dim iPageSize   : iPageSize     = 15
Dim iTotalRecord: iTotalRecord  = 0
Dim iTotalPage  : iTotalPage    = 0
' iBType  'BOARD 구분 BOARD - B0103 , PHOTO - B0104, VOD - B0105
sParameter = "&schText="&iSchText&"&schType="&iSchType
If isNumeric(iPage) = False Then '페이지 숫자 체크
	Response.redirect sysThisUrl
End If
If iPage = 0 Then '페이지 0 에러 예외처리
	Response.redirect sysThisUrl
End If

 


Set objCommon = New clsCommon
Dim arrList : arrList = objCommon.GetAllSupportGroupList( iSchType, iSchText, iPage, iPageSize)
Set objCommon = Nothing
If IsArray(arrList) Then 
	iTotalRecord = arrList(9, 0)  : iTotalPage = arrList(10, 0)
Else
	If iPage > 1 Then
		Response.redirect sysThisUrl
	End If
End If
%>
<!-- #include file = './include/head.asp' -->
<!-- #include file = './include/header.asp' -->
<!-- container -->
<div id="container">
	<!-- #include file = './include/gnb.asp' -->
	<!-- content -->
	<div class="content">
		<div class="path_wrap">
			<div class="inner">	
				<ul class="path inline_wrap">
					<li class="home"><a href="/admin"><img src="/admin/image/common/home.png"></a></li>
					<li><a href="javascript:$('.gnb_wrap').toggleClass('on_m'); $('.content').toggleClass('on_m');$('.gnb > li').eq(2).addClass('select');">회원관리</a></li>
					<li><a href="group_list.asp">후원단체리스트</a></li>
				</ul>
			</div>
		</div>

		<!-- inner -->
		<div class="inner">

			<!-- 검색 옵션 -->
			<div class="white_box">
				<div class="search_wrap">
					<ul>	
						<li class="col02">	
							<div class="wrap">
								<div class="tit">조건</div>
								<div class="sub">
									<select name="schType" id="schType">
										<option value="all">전체</option>
										<option value="title"<%If iSchType = "title" Then%> selected<%End If%>>단체명</option>
										<option value="content"<%If iSchType = "content" Then%> selected<%End If%>>설명</option>
									</select>
								</div>
							</div>
							<div class="wrap">
								<div class="tit">검색어</div>
								<div class="sub">
									<input type="text" name="schText" id="schText" value="<%=iSchText%>">
								</div>
							</div>
						</li>
						<!-- <li class="">
							<div class="wrap">
								<div class="tit">가입기간</div>
								<div class="sub">
									<input type="text" id="datepicker1" class="middle datepicker"><span class="ml5 mr5">~</span><input type="text" id="datepicker2" class="middle datepicker">
								</div>
							</div>
						</li> -->
					</ul>
					<div class="btn"><a href="javascript:fn_search();">조회하기</a></div>

					 
				</div>
			</div>
			<!-- END 검색 옵션 -->

			<div class="white_box">

				<div class="board_table">
					<table class="no_link box_list">
						<thead>
							<tr>
								<th>번호</th>
								<th>그룹타입</th>	
								<th>그룹명</th>
								<th>진행중인프로젝트</th>
								<th>총기부금액($)</th>
							</tr>
						</thead>
						<tbody>

<%
	If IsArray(arrList) Then
		For i = 0 To UBound(arrList,2)
			 If arrList(1, i) = "0" Then
				Cols_GroupType = "교회"
			 ElseIf arrList(1, i) = "1" Then
				Cols_GroupType = "학교"
			 ElseIf arrList(1, i) = "9" Then
				Cols_GroupType = "기타"
			 End If


%>
							<tr onclick="location.href='group_write.asp?mCode=<%=arrList(0, i)%>&page=<%=iPage%><%=sParameter%>';">
								<td><%=arrList(8, i)%></td>
								<td><%=Cols_GroupType%></td>	
								<td><%=arrList(2, i)%></td>
								<td><%=arrList(5, i)%></td>
								<td><%=arrList(6, i)%></td>
								 
							</tr>
<%
		Next
	Else
%>
							<tr>
								<td colspan="5" class="no-ct br0">
									<p>검색된 데이터가 없습니다.</p>
								</td>
							</tr>
<%
	End If
%>
							
							 
							 
						</tbody>
					</table> 
				</div>

				<div class="clearfix mt20">
					<div class="float-r">
						<div class="excel_btn"><a href="group_write.asp">등록하기</a></div>
					</div>
				</div>
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

			</div>

		</div>
		<!-- END inner -->


	</div>
	<!-- END content -->

</div>
<!-- END container -->
<script>
	function fn_search(){
		location.href="?schText="+$("#schText").val()+"&schType="+$("#schType").val();
	}
	$(document).ready(function () {
		//검색 엔터 실행
		$("#schText").keydown(function(key) {
			if( key.keyCode == 13 ){
				fn_search();
			}
		});	
	});
</script>
<!-- #include file = './include/footer.asp' -->
  