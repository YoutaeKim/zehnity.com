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
					<li><a href="">OCB간편등록</a></li>
				</ul>
			</div>
		</div>

		<!-- inner -->
		<div class="inner">

			<!-- 검색 옵션 -->
			<div class="white_box">
				<div class="search_wrap ocb_search">
					<ul>	
						<li>	
							<div class="wrap">
								<div class="tit">검색설정</div>
								<div class="sub m_wid">
									<select class="mr10">
										<option>마스터ID</option>
									</select>
									<select class="mr10">
										<option>상태</option>
									</select>
									<select class="mr10">
										<option>구분</option>
									</select>
									<select class="mr10">
										<option>검색조건</option>
									</select>
									<input type="text" name="" class="middle">
								</div>
							</div>
						</li>
					</ul>
					<div class="btn"><a href="">검색</a></div>

				</div>
			</div>
			<!-- END 검색 옵션 -->

			<div class="white_box">

				<div class="cp_top flex">
					<div class="">
						<img src="/admin/image/sub/check.png" class="img-mid" alt="" height="13">  
						총 <b>172</b>건
					</div>
					<div class="right gray6">
						<div class="btn small">
							<a href="">등록</a>
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
									<th>아이디</th>
									<th>비밀번호</th>
									<th>상호</th>
									<th>상태</th>
									<th>분류</th>
									<th>MCP</th>
									<th>영업담당자</th>
									<th>등록일</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>172</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
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

<!-- #include file = './include/footer.asp' -->
  