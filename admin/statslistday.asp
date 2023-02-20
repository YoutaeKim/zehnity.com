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
					<li><a href="">집계매출(일별)</a></li>
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
								<div class="tit">AID</div>
								<div class="sub">
									<select>
										<option>전체조회</option>
										<option>A0001922 ((주)위페이_웹툰)</option>
										<option>A0001922 ((주)위페이_웹툰)</option>
										<option>A0001922 ((주)위페이_웹툰)</option>
										<option>A0001922 ((주)위페이_웹툰)</option>
									</select>
								</div>
							</div>
							<div class="wrap">
								<div class="tit">SID</div>
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
						<div class="gray9 fw500"><img src="/admin/image/sub/info.png" height="16" class="img-mid"> 일별 매출현황입니다.</div>
						
					</div>	
				</div>
			</div>
			<!-- END 검색 옵션 -->

			<div class="white_box">

				<div class="table_scroll">스크롤하여 확인 가능 <img src="/admin/image/sub/scroll_arr.jpg" class="img-mid ml5"></div>
				<div class="board_table">
					<table class="no_link box_list">
						<thead>
							<tr>
								<th>날짜</th>
								<th>다날(휴대폰)</th>
								<th>다날(일반카드)</th>
								<th>다날(간편카드)</th>
								<th>다날(계좌이체)</th>
								<th>다날(문화상품권)</th>
								<th>다날(도서상품권)</th>
								<th>다날(해피머니상품권)</th>
								<th>다날(틴캐시)</th>
								<th>다날(틴캐시)</th>
								<th>다날(틴캐시)</th>
								<th>다날(틴캐시)</th>
								<th>다날(틴캐시)</th>
								<th>다날(틴캐시)</th>
								<th>다날(틴캐시)</th>
								<th>다날(틴캐시)</th>
								<th>다날(틴캐시)</th>
								<th>다날(틴캐시)</th>
								<th>다날(틴캐시)</th>
								<th>다날(틴캐시)</th>
								<th>다날(틴캐시)</th>
								<th>다날(틴캐시)</th>
								<th>다날(틴캐시)</th>
								<th>다날(틴캐시)</th>
								<th>다날(틴캐시)</th>
								<th>다날(틴캐시)</th>
								<th>다날(틴캐시)</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>2021-11-01</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
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
  