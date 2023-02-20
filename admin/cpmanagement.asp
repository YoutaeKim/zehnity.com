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
					<li><a href="">가맹점관리</a></li>
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
								<div class="tit">상태</div>
								<div class="sub">
									<select>
										<option>상태조회</option>
										<option>상태조회</option>
										<option>상태조회</option>
									</select>
								</div>
							</div>
							<div class="wrap">
								<div class="tit">항목선택</div>
								<div class="sub m_wid">
									<select>
										<option>전체조회</option>
									</select>
									<input type="text" name="" class="middle ml10">
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

				<div class="cp_top flex">
					<div class="">
						<img src="/admin/image/sub/check.png" class="img-mid" alt="" height="13">  
						조회건수 <b>172</b>회
					</div>
					<div class="">
						<div class="btn small">
							<a href="cpmanagement_write.asp">업체등록하기</a>
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
  