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
					<li><a href="">업체정보관리</a></li>
					<li><a href="">SID관리</a></li>
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
								<div class="tit">파트너</div>
								<div class="sub">
									<select>
										<option>전체조회</option>
										<option>상태조회</option>
										<option>상태조회</option>
									</select>
								</div>
							</div>
							<div class="wrap">
								<div class="tit">결제종류</div>
								<div class="sub m_wid">
									<select>
										<option>전체조회</option>
									</select>
									<input type="text" name="" class="middle ml10">
								</div>
							</div>
						</li>
						<li class="col03">	
							<div class="wrap">
								<div class="tit">AID</div>
								<div class="sub">
									<select>
										<option>전체조회</option>
										<option>상태조회</option>
										<option>상태조회</option>
									</select>
								</div>
							</div>
							<div class="wrap">
								<div class="tit">SID</div>
								<div class="sub">
									<select>
										<option>전체조회</option>
									</select>
								</div>
							</div>
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
						</li>
					</ul>
					<div class="btn"><a href="">조회하기</a></div>

				</div>
			</div>
			<!-- END 검색 옵션 -->

			<div class="white_box">

				<div class="cp_top flex">
					<div class="">
						<img src="/admin/image/sub/check.png" class="img-mid" alt="" height="13">  
						조회건수 <b>172</b>회
					</div>
					<div class="">
						<div class="btn small">
							<a href="sidmanagement_write.asp">SID 등록하기</a>
						</div>
					</div>
				</div>

				<!-- board_wrap -->
				<div class="board_wrap">
					<div class="board_table">
						<table class="no_link box_list">
							<thead>
								<tr>
									<th>NO</th>
									<th>업체명</th>
									<th>MID/SID</th>
									<th>서비스명</th>
									<th>분류</th>
									<th>상태</th>
									<th>수수료</th>
									<th>부가세</th>
									<th>유보</th>
									<th>유보율</th>
									<th>영업담당자</th>
									<th>등록일</th>
									<th>파트너</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td rowspan="4"><a href="" title="업체수정">A0002085</a></td>
									<td rowspan="4">케이에이치 인테리어</td>
									<td><a href="" title="SID수정">90590686</a></td>
									<td>케이에이치_OCB</td>
									<td>OK캐쉬백</td>
									<td><span class="dh_blue">가능</span></td>
									<td>8.00</td>
									<td><span class="dh_blue">미포함</span></td>
									<td><span class="dh_red">미사용</span></td>
									<td>0%</td>
									<td>박신영</td>
									<td>2021-10-12</td>
									<td>okcashbag</td>
								</tr>
								<tr>	
									<td><a href="" title="SID수정">90590686</a></td>
									<td>케이에이치_OCB</td>
									<td>OK캐쉬백</td>
									<td><span class="dh_blue">가능</span></td>
									<td>8.00</td>
									<td><span class="dh_blue">미포함</span></td>
									<td><span class="dh_red">미사용</span></td>
									<td>0%</td>
									<td>박신영</td>
									<td>2021-10-12</td>
									<td>okcashbag</td>
								</tr>
								<tr>	
									<td><a href="" title="SID수정">90590686</a></td>
									<td>케이에이치_OCB</td>
									<td>OK캐쉬백</td>
									<td><span class="dh_blue">가능</span></td>
									<td>8.00</td>
									<td><span class="dh_red">포함</span></td>
									<td><span class="dh_red">미사용</span></td>
									<td>0%</td>
									<td>박신영</td>
									<td>2021-10-12</td>
									<td>okcashbag</td>
								</tr>
								<tr>	
									<td><a href="" title="SID수정">90590686</a></td>
									<td>케이에이치_OCB</td>
									<td>OK캐쉬백</td>
									<td><span class="dh_blue">가능</span></td>
									<td>8.00</td>
									<td><span class="dh_blue">미포함</span></td>
									<td><span class="dh_red">미사용</span></td>
									<td>0%</td>
									<td>박신영</td>
									<td>2021-10-12</td>
									<td>okcashbag</td>
								</tr>
							</tbody>
						</table> 
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

<!-- #include file = '../include/footer.asp' -->
  