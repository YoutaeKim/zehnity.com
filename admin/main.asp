<!--#include virtual="/common/fun/fncSetup.asp"-->
<!--#include virtual="/common/inc/inc_clsInit.asp"-->
<!--#include virtual="/common/class/clsBoard.asp"-->
<%
  Language="KO"
  PageName = ""
  SubName = ""
If CkAdminCode = "" Or IsNull(CkAdminCode) Then
	Response.Redirect "/admin/login.asp"		
End If

'##공지사항
Set objBoard = New clsBoard
Dim arrNoticeList : arrNoticeList = objBoard.GetBoardCommonList( "", "", "B0102", 0, 0, 3, 1, 5)
Set objBoard = Nothing
%>
<!-- #include file = './include/head.asp' -->
<!-- #include file = './include/header.asp' -->
<!-- container -->
<div id="container">
	<!-- #include file = './include/gnb.asp' -->
	<script type="">
		$(function(){
			$('.view_type li').click(function(){
				$('.view_type li').removeClass('on');
				$(this).addClass('on');
				var num = $(this).index();				
				$(".cal_wrap").hide();
				$(".cal_wrap").eq(num).show();

			});
		});
	</script>

	<!-- content -->
	<div class="content main_content">

		<!-- inner -->
		<div class="inner">

			<ul class="tab inline_wrap">
				<li class="on"><a href="">공지사항</a></li>
				<li><a href="">News Room</a></li>
				<!-- <li><a href="">불편사항 신고</a></li>
				<li><a href="">문의사항</a></li> -->
			</ul>

			<div class="white_box">
				<div class="board_table board_list">
					<table>
						<thead>
							<tr>
								<th class="num">번호</th>
								<th>제목</th>
								<th class="data">등록일</th>
								
							</tr>
						</thead>
						<tbody>
<%
	If IsArray(arrNoticeList) Then
		For i = 0 To UBound(arrNoticeList,2)
%>

							<tr onclick="location.href='board_view.asp?bType=B0102&bCode=<%=arrNoticeList(0, i)%>'">
								<td><%=arrNoticeList(11, i)%></td>
								<td class="tit"><div><%=arrNoticeList(2, i)%></div></td>
								<td><%=fnDateFormat(arrNoticeList(8, i),6)%></td>
							</tr>
<%
		Next
	Else
%>
							<tr>
								<td colspan="3" class="no-ct">
									<p>등록된 게시물이 없습니다.</p>
								</td>
							</tr>
<%	End If%>
						</tbody>
					</table>
				</div>
			</div><!-- END 공지사항 -->

			<div class="white_box">

				<div class="search_wrap">
					<ul>	
						<li class="col02">	
							<div class="wrap">
								<div class="tit">결제모듈</div>
								<div class="sub">
									<select>
										<option>전체</option>
										<option>다날</option>
										<option>다우데이타</option>
										<option>페이레터</option>
										<option>코나카드</option>
										<option>피앤링크</option>
									</select>
								</div>
							</div>
							<div class="wrap">
								<div class="tit">조회기간</div>
								<div class="sub">
									<input type="text" name="" class="small"> <span class="ml5">년</span>
									<input type="text" name="" class="small">  <span class="ml5">월</span>
								</div>
							</div>
						</li>
					</ul>

					<div class="btn"><a href="">조회하기</a></div>
				</div>

				<div class="pay_search">
					<div class="pay_top">
						<div class="left">	
							<div class="name"><b class="dh_blue">A000024</b> 님의 2021년 11월 매출현황</div>
							<div class="money">	
								<span><img src="/admin/image/main/won.png"> 월 매출 : <b>68,517,581.00</b></span>
								<span><img src="/admin/image/main/won.png"> 취소 : <b>1,603,877.00</b></span>
							</div> 
						</div>
						<div class="right">
							<ul class="view_type inline_wrap">
								<li><a href="javascript:">리스트</a></li>
								<li class="on"><a href="javascript:">캘린더</a></li>
							</ul>	
						</div>
					</div>
					
					<div class="cal_wrap" id="cal1" style="display: none;">
						<div class="board_table">
							<table class="no_link">
								<thead>
									<tr>
										<th>날짜</th>
										<th>승인건수</th>
										<th>승인금액</th>
										<th>취소건수</th>
										<th>취소금액</th>
										<th>합계건수</th>
										<th>합계금액</th>
									</tr>
								</thead>
								<tbody>
									<tr >
										<td>2021-11-01</td>
										<td>1,036건</td>
										<td>21,733,712.00원</td>
										<td>5건</td>
										<td>183,500.00원</td>
										<td>1,656건</td>
										<td>21,590,211.00원</td>
									</tr>
									<tr >
										<td>2021-11-01</td>
										<td>1,036건</td>
										<td>21,733,712.00원</td>
										<td>5건</td>
										<td>183,500.00원</td>
										<td>1,656건</td>
										<td>21,590,211.00원</td>
									</tr>
									<tr >
										<td>2021-11-01</td>
										<td>1,036건</td>
										<td>21,733,712.00원</td>
										<td>5건</td>
										<td>183,500.00원</td>
										<td>1,656건</td>
										<td>21,590,211.00원</td>
									</tr>
									<tr >
										<td>2021-11-01</td>
										<td>1,036건</td>
										<td>21,733,712.00원</td>
										<td>5건</td>
										<td>183,500.00원</td>
										<td>1,656건</td>
										<td>21,590,211.00원</td>
									</tr>
									<tr >
										<td>2021-11-01</td>
										<td>1,036건</td>
										<td>21,733,712.00원</td>
										<td>5건</td>
										<td>183,500.00원</td>
										<td>1,656건</td>
										<td>21,590,211.00원</td>
									</tr>
									<tr >
										<td>2021-11-01</td>
										<td>1,036건</td>
										<td>21,733,712.00원</td>
										<td>5건</td>
										<td>183,500.00원</td>
										<td>1,656건</td>
										<td>21,590,211.00원</td>
									</tr>
								</tbody>
							</table>
						</div>

					</div>

					<div class="cal_wrap" id="cal2">
						<div class="diary_num">2021. 11</div>
						<div class="calendar_table">	
							<table class="diary_calendar">
								<tbody>
									<tr>
										<th>SUN</th>
										<th>MON</th>
										<th>TUE</th>
										<th>WED</th>
										<th>THU</th>
										<th>FRI</th>
										<th>SAT</th>
									</tr>
									<tr>
										<td></td>
										<td>
											<span>1</span>
											<div class="calendar_meno">
												<div class="ok"><em>승인</em> 21,733,212.00</div>
												<div class="chk"><em>취소</em> 188,212.00</div>
											</div>
										</td>
										<td>
											<span>2</span>
											<div class="calendar_meno">
												<div class="ok"><em>승인</em> 21,733,212.00</div>
												<div class="chk"><em>취소</em> 188,212.00</div>
											</div>
										</td>
										<td>
											<span>3</span>
											<div class="calendar_meno">
												<div class="ok"><em>승인</em> 21,733,212.00</div>
												<div class="chk"><em>취소</em> 188,212.00</div>
											</div>
										</td>
										<td>
											<span>4</span>
											<div class="calendar_meno">
												<div class="ok"><em>승인</em> 21,733,212.00</div>
												<div class="chk"><em>취소</em> 188,212.00</div>
											</div>
										</td>
										<td>
											<span>5</span>
											<div class="calendar_meno">
												<div class="ok"><em>승인</em> 21,733,212.00</div>
												<div class="chk"><em>취소</em> 188,212.00</div>
											</div>
										</td>
										<td>
											<span>6</span>
											<div class="calendar_meno">
												<div class="ok"><em>승인</em> 21,733,212.00</div>
												<div class="chk"><em>취소</em> 188,212.00</div>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<span>7</span>
											<div class="calendar_meno">
												<div class="ok"><em>승인</em> 21,733,212.00</div>
												<div class="chk"><em>취소</em> 188,212.00</div>
											</div>
										</td>
										<td>
											<span>8</span>
											<div class="calendar_meno">
												<div class="ok"><em>승인</em> 21,733,212.00</div>
												<div class="chk"><em>취소</em> 188,212.00</div>
											</div>
										</td>
										<td>
											<span>9</span>
											<div class="calendar_meno">
												<div class="ok"><em>승인</em> 21,733,212.00</div>
												<div class="chk"><em>취소</em> 188,212.00</div>
											</div>
										</td>
										<td>
											<span>10</span>
										</td>
										<td>
											<span>11</span>
										</td>
										<td>
											<span>12</span>
										</td>
										<td>
											<span>13</span>
										</td>
									</tr>
									<tr>
										<td>
											<span>14</span>
										</td>
										<td>
											<span>15</span>
										</td>
										<td>
											<span>16</span>
										</td>
										<td>
											<span>17</span>
										</td>
										<td>
											<span>18</span>
										</td>
										<td>
											<span>19</span>
										</td>
										<td>
											<span>20</span>
										</td>
									</tr>
									<tr>
										<td>
											<span>21</span>
										</td>
										<td>
											<span>22</span>
										</td>
										<td>
											<span>23</span>
										</td>
										<td>
											<span>24</span>
										</td>
										<td>
											<span>25</span>
										</td>
										<td>
											<span>26</span>
										</td>
										<td>
											<span>27</span>
										</td>
									</tr>
									<tr>
										<td>
											<span>28</span>
										</td>
										<td>
											<span>29</span>
										</td>
										<td>
											<span>30</span>
										</td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>

				</div>	
				
			</div><!-- END 결제모듈 조회 -->

		</div>
		<!-- END inner -->


	</div>
	<!-- END content -->

</div>
<!-- END container -->

<!-- #include file = './include/footer.asp' -->
  