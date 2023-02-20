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
					<li><a href="">월별그래프</a></li>
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
								<div class="tit">SID</div>
								<div class="sub">
									<select>
										<option>SID를 선택해 주세요</option>
										<option>SID를 선택해 주세요</option>
									</select>
								</div>
							</div>
							<div class="wrap">
								<div class="tit">조회기간</div>
								<div class="sub">
									<input type="text" name="" class="small"> <span class="ml5">년</span>
								</div>
							</div>
						</li>
					</ul>
					<div class="btn"><a href="">조회하기</a></div>

					<div class="mt20">
						<div class="gray9 fw500"><img src="/admin/image/sub/info.png" height="16" class="img-mid"> 통계내역 입니다.</div>
						
					</div>	
				</div>
			</div>
			<!-- END 검색 옵션 -->

			<div class="white_box">

				

			</div>

		</div>
		<!-- END inner -->


	</div>
	<!-- END content -->

</div>
<!-- END container -->

<!-- #include file = './include/footer.asp' -->
  