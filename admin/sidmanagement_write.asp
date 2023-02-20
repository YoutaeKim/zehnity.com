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
		
		<div class="inner">	

			<div class="white_box">
				<!-- info write -->
				<div class="info-write">
					<div class="search_wrap mb20">
						<ul>
							<li>
								<div class="wrap">
									<div class="tit">결제모듈</div>
									<div class="sub">
										<select class="large">
											<option>선택</option>
											<option>선택</option>
										</select>
									</div>
								</div>
							</li>
							<li class="col02">
								<div class="wrap">
									<div class="tit">AID</div>
									<div class="sub">
										<input type="text" id="write-title" class="large id">
										<em class="id_btn"><a href="">아이디생성</a></em>
									</div>
								</div>
								<div class="wrap">
									<div class="tit">SID</div>
									<div class="sub txt">
										<input type="text" id="" class="large">
									</div>
								</div>
							</li>
							<li class="col02">
								<div class="wrap">
									<div class="tit">서비스명</div>
									<div class="sub txt">
										<input type="text" id="" class="large">
									</div>
								</div>
								<div class="wrap">
									<div class="tit">상담원연락처</div>
									<div class="sub txt">
										<input type="text" id="" class="large">
									</div>
								</div>
							</li>
							<li class="col02">
								<div class="wrap">
									<div class="tit">도메인</div>
									<div class="sub">
										<input type="text" name="" class="large">
									</div>
								</div>
								<div class="wrap">
									<div class="tit">은행명</div>
									<div class="sub txt">
										<input type="text" id="" class="large">
									</div>
								</div>
							</li>
							<li class="col02">
								<div class="wrap">
									<div class="tit">계좌번호</div>
									<div class="sub txt">
										<input type="text" id="" class="large">
									</div>
								</div>
								<div class="wrap">
									<div class="tit">예금주</div>
									<div class="sub">
										<input type="text" name="" class="large">
									</div>
								</div>
							</li>
							<li class="col02">
								<div class="wrap">
									<div class="tit">계약담당이름</div>
									<div class="sub txt">
										<input type="text" id="" class="large">
									</div>
								</div>
								<div class="wrap">
									<div class="tit">계약담당휴대폰</div>
									<div class="sub txt">
										<input type="text" id="" class="large">
									</div>
								</div>
							</li>
							<li class="col02">
								<div class="wrap">
									<div class="tit">계약담당전화번호</div>
									<div class="sub txt">
										<input type="text" id="" class="large">
									</div>
								</div>
								<div class="wrap">
									<div class="tit">계약담당이메일</div>
									<div class="sub txt">
										<input type="text" id="" class="large">
									</div>
								</div>
							</li>
							<li class="col02">
								<div class="wrap">
									<div class="tit">정산유형</div>
									<div class="sub txt">
										<select class="large">	
											<option>선택하세요</option>
											<option>주</option>
											<option>월</option>
											<option>수납정산</option>
											<option>익월말정산</option>
											<option>일정산</option>
										</select>
									</div>
								</div>
								<div class="wrap">
									<div class="tit">정산수수료</div>
									<div class="sub txt">
										<input type="text" id="" class="large">
									</div>
								</div>
							</li>
							<li class="col02">
								<div class="wrap">
									<div class="tit">정산타입</div>
									<div class="sub">
										<select class="large">	
											<option>일~토</option>
										</select>
									</div>
								</div>
								<div class="wrap">
									<div class="tit">부가세종류</div>
									<div class="sub">
										<select class="large">	
											<option>미포함</option>
											<option>포함</option>
										</select>
									</div>
								</div>
							</li>
							<li class="col02">
								<div class="wrap">
									<div class="tit">유보유무</div>
									<div class="sub">
										<select class="large">	
											<option>미포함</option>
											<option>포함</option>
										</select>
									</div>
								</div>
								<div class="wrap">
									<div class="tit">결제종류</div>
									<div class="sub">
										<select class="large">	
											<option>선택</option>
										</select>
									</div>
								</div>
							</li>
							<li class="col02">
								<div class="wrap">
									<div class="tit">유보개월</div>
									<div class="sub">
										<select class="large">	
											<option>선택</option>
										</select>
									</div>
								</div>
								<div class="wrap">
									<div class="tit">유보율</div>
									<div class="sub">
										<input type="text" name="" class="large">
									</div>
								</div>
							</li>
							<li>
								<div class="wrap">
									<div class="tit">DB처리URL</div>
									<div class="sub">
										<input type="text" name="" class="img-w100">
									</div>
								</div>
							</li>
							<li>
								<div class="wrap">
									<div class="tit">완료이동URL</div>
									<div class="sub">
										<input type="text" name="" class="img-w100">
									</div>
								</div>
							</li>
							<li>
								<div class="wrap">
									<div class="tit">취소URL</div>
									<div class="sub">
										<input type="text" name="" class="img-w100">
									</div>
								</div>
							</li>
							<li class="col03">
								<div class="wrap">
									<div class="tit">분류</div>
									<div class="sub">
										<select class="large">	
											<option>승인전</option>
										</select>
									</div>
								</div>
								<div class="wrap">
									<div class="tit">웹/모바일</div>
									<div class="sub">
										<select class="large">	
											<option>웹</option>
										</select>
									</div>
								</div>
								<div class="wrap">
									<div class="tit">OCB_MePs</div>
									<div class="sub">
										<select class="large">	
											<option>미사용</option>
										</select>
									</div>
								</div>
							</li>
							<li>
								<div class="wrap">
									<div class="tit">KEY MXPASSKEY</div>
									<div class="sub txt">
										<input type="text" name="" class="large">
										<span class="dh_red ml10">입력하셔야 결제취소가 가능합니다.</span>
									</div>
								</div>
							</li>
							<li>
								<div class="wrap">
									<div class="tit">IV 암복호화키</div>
									<div class="sub txt">
										<input type="text" name="" class="large">
										<span class="dh_red ml10">입력하셔야 결제취소가 가능합니다.</span>
									</div>
								</div>
							</li>
						</ul>
					</div>
					
					<!-- Buttons -->
					<div class="align-c mt30 btn">
						<a href="">등록하기</a>
					</div><!-- END Buttons -->

				</div><!-- END info write -->

			</div>

		</div>

	</div>	
	<!-- END content -->

</div>
<!-- END container -->

<!-- #include file = './include/footer.asp' -->
  