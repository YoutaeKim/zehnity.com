<!-- #include file = './include/head.asp' -->
<%
  Language="KO"
  PageName = ""
  SubName = ""
%>

<!-- #include file = './include/header.asp' -->



<!-- container -->
<div id="container">

	<!-- #include file = './include/gnb.asp' -->

	<!-- content -->
	<div class="content">

		<div class="path_wrap">
			<div class="inner">	
				<ul class="path inline_wrap">
					<li class="home"><a href=""><img src="/admin/image/common/home.png"></a></li>
					<li><a href="">집계내역</a></li>
					<li><a href="">리스트</a></li>
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
								<div class="tit">결제모듈</div>
								<div class="sub">
									<select>
										<option>전체조회</option>
										<option>다날</option>
										<option>다우데이타</option>
										<option>페이레터</option>
										<option>코나카드</option>
										<option>피앤링크</option>
									</select>
								</div>
							</div>
							<div class="wrap">
								<div class="tit">업체ID</div>
								<div class="sub">
									<select>
										<option>전체조회</option>
										<option>A0001922 ((주)위페이_웹툰)</option>
										<option>A0001922 ((주)위페이_웹툰)</option>
										<option>A0001922 ((주)위페이_웹툰)</option>
									</select>
								</div>
							</div>
						</li>
						<li class="">
							<div class="wrap">
								<div class="tit">조회기간</div>
								<div class="sub">
									<input type="text" id="datepicker1" class="middle datepicker"><span class="ml5 mr5">~</span><input type="text" id="datepicker2" class="middle datepicker">
								</div>
							</div>
						</li>
					</ul>
					<div class="btn"><a href="">조회하기</a></div>

					<div class="mt20">
						<div class="gray9 fw500"><img src="/admin/image/sub/info.png" height="16" class="img-mid"> 정산수수료 및 부과세가 <span class="dh_red">미포함</span>된 금액입니다.</div>
						
					</div>	
				</div>
			</div>
			<!-- END 검색 옵션 -->

			<div class="white_box">

				<div class="board_table">
					<table class="no_link box_list">
						<thead>
							<tr>
								<th>날짜</th>
								<th>업체명</th>
								<th>S_ID(서비스명)</th>
								<th>총 승인금액</th>
								<th>총 취소금액</th>
								<th>순 매출금액</th>
							</tr>
						</thead>
						<tbody>
							<!-- <tr>
								<td colspan="6" class="no-ct br0">
									<p>검색조건 설정후 "조회하기"버튼을 클릭해주세요</p>
								</td>
							</tr> --> 
							<tr>
								<td>2021-11</td>
								<td>(주)포스트에코존</td>
								<td>
									 90587937 <br>	
									 (에코무비_OCB_1천이벤트)
								</td>
								<td>1,065,377.00(35건)</td>
								<td>0.00(0건)</td>
								<td>1,065,377.00원</td>
							</tr>
							<tr>
								<td>2021-11</td>
								<td>(주)포스트에코존</td>
								<td>
									 90587937 <br>	
									 (에코무비_OCB_1천이벤트)
								</td>
								<td>1,065,377.00(35건)</td>
								<td>0.00(0건)</td>
								<td>1,065,377.00원</td>
							</tr>
							<tr>
								<td>2021-11</td>
								<td>(주)포스트에코존</td>
								<td>
									 90587937 <br>	
									 (에코무비_OCB_1천이벤트)
								</td>
								<td>1,065,377.00(35건)</td>
								<td>0.00(0건)</td>
								<td>1,065,377.00원</td>
							</tr>
							<tr>
								<td>2021-11</td>
								<td>(주)포스트에코존</td>
								<td>
									 90587937 <br>	
									 (에코무비_OCB_1천이벤트)
								</td>
								<td>1,065,377.00(35건)</td>
								<td>0.00(0건)</td>
								<td>1,065,377.00원</td>
							</tr>
							<tr>
								<td>2021-11</td>
								<td>(주)포스트에코존</td>
								<td>
									 90587937 <br>	
									 (에코무비_OCB_1천이벤트)
								</td>
								<td>1,065,377.00(35건)</td>
								<td>0.00(0건)</td>
								<td>1,065,377.00원</td>
							</tr>
							<tr>
								<td>2021-11</td>
								<td>(주)포스트에코존</td>
								<td>
									 90587937 <br>	
									 (에코무비_OCB_1천이벤트)
								</td>
								<td>1,065,377.00(35건)</td>
								<td>0.00(0건)</td>
								<td>1,065,377.00원</td>
							</tr>
							<tr>
								<td>2021-11</td>
								<td>(주)포스트에코존</td>
								<td>
									 90587937 <br>	
									 (에코무비_OCB_1천이벤트)
								</td>
								<td>1,065,377.00(35건)</td>
								<td>0.00(0건)</td>
								<td>1,065,377.00원</td>
							</tr>
							<tr>
								<td>2021-11</td>
								<td>(주)포스트에코존</td>
								<td>
									 90587937 <br>	
									 (에코무비_OCB_1천이벤트)
								</td>
								<td>1,065,377.00(35건)</td>
								<td>0.00(0건)</td>
								<td>1,065,377.00원</td>
							</tr>
							<tr>
								<td>2021-11</td>
								<td>(주)포스트에코존</td>
								<td>
									 90587937 <br>	
									 (에코무비_OCB_1천이벤트)
								</td>
								<td>1,065,377.00(35건)</td>
								<td>0.00(0건)</td>
								<td>1,065,377.00원</td>
							</tr>
							<tr class="total">
								<td>합계</td>
								<td colspan="2"></td>
								<td>25,052,827.00(13,484건)</td>
								<td>958,220.00(59건)</td>
								<td>21,065,377.00원</td>
							</tr>
						</tbody>
					</table> 
				</div>

				<div class="clearfix mt20">
					<div class="float-r">
						<div class="excel_btn"><a href=""><img src="/admin/image/sub/excel.png" class="mr5 img-mid" alt="">엑셀다운로드</a></div>
					</div>
				</div>

			</div>

		</div>
		<!-- END inner -->


	</div>
	<!-- END content -->

</div>
<!-- END container -->

<!-- #include file = './include/footer.asp' -->
  