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
					<li><a href="">사이트관리</a></li>
					<li><a href="">DOWNLOAD 자료관리</a></li>
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
									<th>상태</th>
									<th>파일</th>
									<th>내용</th>
								</tr>
							</thead>
							<tbody>
								<tr onclick="$('.upload_p').fadeIn();">
									<td>1</td>
									<td><span class="dh_blue">VIEW</span></td>
									<td>모두의 후원.pdf</td>
									<td>모두의 후원 제안서</td>
								</tr>
							</tbody>
						</table>
					</div><!-- END board list -->

					<!-- 자료업로드 팝업 -->
					<div class="down_popup upload_p">
						<div class="mask" onclick="$('.upload_p').fadeOut();"></div>
						<div class="popup">
							<a href="javascript:" onclick="$('.upload_p').fadeOut();" class="esc"><img src="/admin/image/sub/esc.png"></a>
							<div class="tit">DOWNLOAD 자료 등록</div>

							<div class="board-write">
								<table>
									<tr>
										<th>파일</th>
										<td>
											<input type="file" id="w-file">
										</td>
									</tr>
									<tr>
										<th>제목</th>
										<td>
											<input type="text" id="" class="img-w100" value="모두의 후원 제안서">
										</td>
									</tr>
									<tr>
										<th>진열</th>
										<td>
											<select>
												<option>진열</option>
											</select>
										</td>
									</tr>
								</table>
								
								<div class="align-c mt30 btn">
									<a href="">입력</a>
								</div>

							</div>

						</div>	
					</div>
					<!-- END 자료업로드 팝업 -->

					<!-- 자료등록 팝업 -->
					<div class="down_popup download_p">
						<div class="mask" onclick="$('.download_p').fadeOut();"></div>
						<div class="popup">
							<a href="javascript:" onclick="$('.download_p').fadeOut();" class="esc"><img src="/admin/image/sub/esc.png"></a>
							<div class="tit">DOWNLOAD 자료 등록</div>

							<div class="board-write">
								<table>
									<tr>
										<th>파일</th>
										<td>
											<input type="file" id="w-file">
										</td>
									</tr>
									<tr>
										<th>제목</th>
										<td>
											<input type="text" id="" class="img-w100">
										</td>
									</tr>
								</table>
								
								<div class="align-c mt30 btn">
									<a href="">입력</a>
								</div>

							</div>

						</div>	
					</div>	
					<!-- END 자료등록 팝업 -->

					<div class="clearfix mt20">
						<div class="float-r">
							<div class="btn small"><a href="javascript:" onclick="$('.download_p').fadeIn();">자료 등록</a></div>
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

	</div>	
	<!-- END content -->

</div>
<!-- END container -->

<!-- #include file = './include/footer.asp' -->
  