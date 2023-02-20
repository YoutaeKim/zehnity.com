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
					<li><a href="">기타</a></li>
					<li><a href="">암호화폐 관리</a></li>
				</ul>
			</div>
		</div>

		<!-- inner -->
		<div class="inner">

			<div class="white_box">

				<div class="approval_top flex">
					<div class="">
						<img src="/admin/image/sub/check.png" class="img-mid" alt="" height="13">  
						조회건수 <b>9</b>회
					</div>
				</div>

				<!-- board_wrap -->
				<div class="board_wrap">
					<div class="board_table">
						<table class="no_link box_list">
							<thead>
								<tr>
									<th class="num">NO</th>
									<th>코인명</th>
									<th>코드</th>
									<th>이미지</th>
									<th>컬러</th>
									<th>상태</th>
									<th>순서</th>
									<th class="data">관리</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>9</td>
									<td>ETH (이더리움)</td>
									<td>eth</td>
									<td><img src="" alt="이미지"></td>
									<td><span style="color: #8c8c8c;">#8c8c8c</span></td>
									<td>
										<div class="tbbox">
											<span><input type="radio" name="LIST_state" checked> 가능</span>
											<span class="ml10"><input type="radio" name="LIST_state"> 불가능</span>
										</div>
									</td>
									<td>1</td>
									<td><div class="btn s-small"><a href="">수정</a></div></td>
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
  