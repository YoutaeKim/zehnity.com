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
					<li><a href="">거래내역</a></li>
					<li><a href="">승인내역 | OCB두툼</a></li>
				</ul>
			</div>
		</div>

		<!-- inner -->
		<div class="inner">

			<!-- 검색 옵션 -->
			<div class="white_box">
				<div class="search_wrap">
					<ul>	
						<li class="col03">	
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
								<div class="tit">결제종류</div>
								<div class="sub">
									<select>
										<option>다날(휴대폰)</option>
										<option>다날(휴대폰)</option>
										<option>다날(휴대폰)</option>
									</select>
								</div>
							</div>
							<div class="wrap">
								<div class="tit">통신사</div>
								<div class="sub">
									<select>
										<option>전체조회</option>
										<option>KT</option>
										<option>SKT</option>
									</select>
								</div>
							</div>
						</li>
						<li class="col03">	
							<div class="wrap">
								<div class="tit">AID</div>
								<div class="sub">
									<select>
										<option>전체조회</option>
										<option>전체조회</option>
									</select>
								</div>
							</div>
							<div class="wrap">
								<div class="tit">SID</div>
								<div class="sub">
									<select>
										<option>전체조회</option>
										<option>전체조회</option>
									</select>
								</div>
							</div>
							<div class="wrap">
								<div class="tit">상태</div>
								<div class="sub">
									<select>
										<option>전체조회</option>
										<option>전체조회</option>
									</select>
								</div>
							</div>
						</li>
						<li class="col02">	
							<div class="wrap">
								<div class="tit">항목선택</div>
								<div class="sub m_wid">
									<select>
										<option>전체조회</option>
										<option>전체조회</option>
									</select>
									<input type="text" name="" class="middle ml10">
								</div>
							</div>
							<div class="wrap">
								<div class="tit">조회기간</div>
								<div class="sub">
									<input type="text" id="datepicker1" class="middle datepicker"><span class="ml5 mr5">~</span><input type="text" id="datepicker2" class="middle datepicker">
								</div>
							</div>
						</li>
					</ul>
					<div class="btn"><a href="">조회하기</a></div>
				</div>
			</div>
			<!-- END 검색 옵션 -->

			<div class="white_box">
				
				<div class="approval_top flex">
					<div class="cancel_txt">취소사유 <input type="text" name="" placeholder="30byte 이내로 적어주세요." class="ml5"></div>
					<div class="right gray6">
						<span><img src="/admin/image/sub/check.png" class="img-mid" alt="" height="13"> 전체건수 <b class="dh_black">172</b>회</span>
						<span><img src="/admin/image/sub/check.png" class="img-mid" alt="" height="13"> 일반건수 <b class="dh_black">172</b>회</span>
						<span><img src="/admin/image/sub/check.png" class="img-mid" alt="" height="13"> 일반P <b class="dh_black">172,122</b>원</span>
						<span><img src="/admin/image/sub/check.png" class="img-mid" alt="" height="13"> 두툼건수 <b class="dh_black">0</b>회</span>
						<span><img src="/admin/image/sub/check.png" class="img-mid" alt="" height="13"> 두툼P <b class="dh_black">0</b>원</span>
					</div>
				</div>

				<!-- board_wrap -->
				<div class="board_wrap">
					<div class="board_table">
						<table class="no_link box_list">
							<thead>
								<tr>
									<th rowspan="2">
										<div class="checkbox">
											<input type="checkbox" id="" name="" title="전체선택">
										 </div>
									</th>
									<th rowspan="2">결제일시</th>
									<th>거래번호</th>
									<th>SID</th>
									<th>사용자ID</th>
									<th>통신사</th>
									<th rowspan="2">결제금액</th>
									<th rowspan="2">취소일시</th>
									<th rowspan="2">결제상태</th>
									<th rowspan="2">결제구분</th>
									<th rowspan="2">상품명</th>
									<th rowspan="2">결제사</th>
								</tr>
								<tr>
									<th>주문번호</th>
									<th>서비스명</th>
									<th>고객명</th>
									<th>전화번호</th>
								</tr>
							</thead>
							<tbody>
								<!-- <tr>
									<td colspan="12" class="no-ct br0">
										<p>검색조건 설정후 "조회하기"버튼을 클릭해주세요</p>
									</td>
								</tr> --> 
								<tr>
									<td rowspan="2">
										<div class="checkbox">
											<input type="checkbox" id="" name="" title="선택">
										 </div>
									</td>
									<td rowspan="2">
										2121-11-24 <br>
										오전 10:02:47
									</td>
									<td>99920211124402225296</td>
									<td>90544</td>
									<td>test</td>
									<td>0013456789</td>
									<td rowspan="2">100</td>
									<td rowspan="2">-</td>
									<td rowspan="2"><span class="dh_blue">정상</span></td>
									<td rowspan="2">OK캐쉬백</td>
									<td rowspan="2">fb_gjspjw</td>
									<td rowspan="2">okcashbag</td>
								</tr>
								<tr>
									<td>99920211124402225296</td>
									<td>ondisk_OCB</td>
									<td>eetst</td>
									<td>0101264845</td>
								</tr>
								<tr>
									<td rowspan="2">
										<div class="checkbox">
											<input type="checkbox" id="" name="" title="선택">
										 </div>
									</td>
									<td rowspan="2">
										2121-11-24 <br>
										오전 10:02:47
									</td>
									<td>99920211124402225296</td>
									<td>90544</td>
									<td>test</td>
									<td>0013456789</td>
									<td rowspan="2">100</td>
									<td rowspan="2">-</td>
									<td rowspan="2"><span class="dh_blue">정상</span></td>
									<td rowspan="2">OK캐쉬백</td>
									<td rowspan="2">fb_gjspjw</td>
									<td rowspan="2">okcashbag</td>
								</tr>
								<tr>
									<td>99920211124402225296</td>
									<td>ondisk_OCB</td>
									<td>eetst</td>
									<td>0101264845</td>
								</tr>
								<tr>
									<td rowspan="2">
										<div class="checkbox">
											<input type="checkbox" id="" name="" title="선택">
										 </div>
									</td>
									<td rowspan="2">
										2121-11-24 <br>
										오전 10:02:47
									</td>
									<td>99920211124402225296</td>
									<td>90544</td>
									<td>test</td>
									<td>0013456789</td>
									<td rowspan="2">100</td>
									<td rowspan="2">-</td>
									<td rowspan="2"><span class="dh_blue">정상</span></td>
									<td rowspan="2">OK캐쉬백</td>
									<td rowspan="2">fb_gjspjw</td>
									<td rowspan="2">okcashbag</td>
								</tr>
								<tr>
									<td>99920211124402225296</td>
									<td>ondisk_OCB</td>
									<td>eetst</td>
									<td>0101264845</td>
								</tr>
								<tr>
									<td rowspan="2">
										<div class="checkbox">
											<input type="checkbox" id="" name="" title="선택">
										 </div>
									</td>
									<td rowspan="2">
										2121-11-24 <br>
										오전 10:02:47
									</td>
									<td>99920211124402225296</td>
									<td>90544</td>
									<td>test</td>
									<td>0013456789</td>
									<td rowspan="2">100</td>
									<td rowspan="2">-</td>
									<td rowspan="2"><span class="dh_blue">정상</span></td>
									<td rowspan="2">OK캐쉬백</td>
									<td rowspan="2">fb_gjspjw</td>
									<td rowspan="2">okcashbag</td>
								</tr>
								<tr>
									<td>99920211124402225296</td>
									<td>ondisk_OCB</td>
									<td>eetst</td>
									<td>0101264845</td>
								</tr>
								<tr>
									<td rowspan="2">
										<div class="checkbox">
											<input type="checkbox" id="" name="" title="선택">
										 </div>
									</td>
									<td rowspan="2">
										2121-11-24 <br>
										오전 10:02:47
									</td>
									<td>99920211124402225296</td>
									<td>90544</td>
									<td>test</td>
									<td>0013456789</td>
									<td rowspan="2">100</td>
									<td rowspan="2">-</td>
									<td rowspan="2"><span class="dh_red">비정상</span></td>
									<td rowspan="2">OK캐쉬백</td>
									<td rowspan="2">fb_gjspjw</td>
									<td rowspan="2">okcashbag</td>
								</tr>
								<tr>
									<td>99920211124402225296</td>
									<td>ondisk_OCB</td>
									<td>eetst</td>
									<td>0101264845</td>
								</tr>
								<tr>
									<td rowspan="2">
										<div class="checkbox">
											<input type="checkbox" id="" name="" title="선택">
										 </div>
									</td>
									<td rowspan="2">
										2121-11-24 <br>
										오전 10:02:47
									</td>
									<td>99920211124402225296</td>
									<td>90544</td>
									<td>test</td>
									<td>0013456789</td>
									<td rowspan="2">100</td>
									<td rowspan="2">-</td>
									<td rowspan="2"><span class="dh_blue">정상</span></td>
									<td rowspan="2">OK캐쉬백</td>
									<td rowspan="2">fb_gjspjw</td>
									<td rowspan="2">okcashbag</td>
								</tr>
								<tr>
									<td>99920211124402225296</td>
									<td>ondisk_OCB</td>
									<td>eetst</td>
									<td>0101264845</td>
								</tr>
								<tr>
									<td rowspan="2">
										<div class="checkbox">
											<input type="checkbox" id="" name="" title="선택">
										 </div>
									</td>
									<td rowspan="2">
										2121-11-24 <br>
										오전 10:02:47
									</td>
									<td>99920211124402225296</td>
									<td>90544</td>
									<td>test</td>
									<td>0013456789</td>
									<td rowspan="2">100</td>
									<td rowspan="2">-</td>
									<td rowspan="2"><span class="dh_blue">정상</span></td>
									<td rowspan="2">OK캐쉬백</td>
									<td rowspan="2">fb_gjspjw</td>
									<td rowspan="2">okcashbag</td>
								</tr>
								<tr>
									<td>99920211124402225296</td>
									<td>ondisk_OCB</td>
									<td>eetst</td>
									<td>0101264845</td>
								</tr>
								<tr>
									<td rowspan="2">
										<div class="checkbox">
											<input type="checkbox" id="" name="" title="선택">
										 </div>
									</td>
									<td rowspan="2">
										2121-11-24 <br>
										오전 10:02:47
									</td>
									<td>99920211124402225296</td>
									<td>90544</td>
									<td>test</td>
									<td>0013456789</td>
									<td rowspan="2">100</td>
									<td rowspan="2">-</td>
									<td rowspan="2"><span class="dh_blue">정상</span></td>
									<td rowspan="2">OK캐쉬백</td>
									<td rowspan="2">fb_gjspjw</td>
									<td rowspan="2">okcashbag</td>
								</tr>
								<tr>
									<td>99920211124402225296</td>
									<td>ondisk_OCB</td>
									<td>eetst</td>
									<td>0101264845</td>
								</tr> 
							</tbody>
						</table> 
					</div>

					<div class="clearfix mt20">
						<div class="float-l">
							<div class="btn gray">
								<a href="">선택취소</a>
								<a href="">DB취소</a>
							</div>
						</div>	
						<div class="float-r">
							<div class="excel_btn"><a href=""><img src="/admin/image/sub/excel.png" class="mr5 img-mid" alt="">엑셀다운로드</a></div>
						</div>
					</div>

					<!-- 페이징 -->
					<div class="board-pager">        
						<button type="button" class="prev"><img src="/admin/image/sub/arrow_l.gif" alt="이전"></button>
						<a href="#" class="on">1</a>
						<a href="#">2</a>
						<a href="#">3</a>
						<a href="#">4</a>
						<a href="#">5</a>
						<button type="button" class="next"><img src="/admin/image/sub/arrow_r.gif" alt="다음"></button>
					</div>
					<!-- END 페이징 -->
				</div>
				<!-- END board_wrap -->

			</div>

		</div>
		<!-- END inner -->


	</div>
	<!-- END content -->

</div>
<!-- END container -->

<!-- #include file = './include/footer.asp' -->
  