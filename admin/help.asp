<!-- #include file = './include/head.asp' -->
<%
  Language="KO"
  PageName = "K01"
  SubName = ""
%>

<!-- #include file = './include/header.asp' -->

<!-- container -->
<div id="container">

	<!-- #include file = './include/gnb.asp' -->

	<script type="">
		$(function(){
			$('.info_tab li').click(function(){
				$('.info_tab li').removeClass('on');
				$(this).addClass('on');

				var num = $(this).index();
				num = parseInt(num)+1;

				$(".info_wrap").hide();
				$("#info"+num).show();

			});
		});
	</script>

	<!-- content -->
	<div class="content">

		<div class="path_wrap">
			<div class="inner">	
				<ul class="path inline_wrap">
					<li class="home"><a href=""><img src="/admin/image/common/home.png"></a></li>
					<li><a href="">도움말</a></li>
					<li><a href="">다날</a></li>
				</ul>
			</div>
		</div>

		<!-- inner -->
		<div class="inner">

			<ul class="tab inline_wrap info_tab">
				<li class="on"><a href="javascript:">휴대폰</a></li>
				<li><a href="javascript:">일반카드</a></li>
				<li><a href="javascript:">간편카드</a></li>
				<li><a href="javascript:">계좌이체</a></li>
				<li><a href="javascript:">문화상품권</a></li>
				<li><a href="javascript:">도서상품권</a></li>  
				<li><a href="javascript:">해피머니상품권</a></li>
				<li><a href="javascript:">틴캐시</a></li>
			</ul>



			<!-- 휴대폰 -->
			<div class="info_wrap" id="info1">

				<div class="info_cont white_box">	
					<div class="info_tit">다날 휴대폰결제(일반) GATEWAY(공통)</div>

					<div class="info_sub"><img src="/admin/image/sub/blue_one.png"> 알아 두셔야 할 사항</div>
					<ul>
						<li>1) SID는 영업팀에 문의 바랍니다.</li>
						<li>2) CharSet : Request = utf-8, Response = utf-8</li>
						<li>3) 위페이 서버IP : 222.239.176.180, 181 (방화벽 사용시 IP 허용)</li>
					</ul>

					<div class="info_sub"><img src="/admin/image/sub/blue_one.png"> 다날 휴대폰 GATEWAY 연동방법</div>
					<div class="info_sub_small">1. 결제 요청 - POPUP</div>
					<ul class="sub_txt">
						<li>1) URL : https://pg.wepay.co.kr/api/danal/phone/Start.asp</li>
						<li>2) 방식 : POST</li>
						<li>
							3) 파라미터 : <span class="dh_red">* 필수 항목</span>
							<p class="mt5">- <span class="dh_red">*</span> SID : 고객사코드/서비스아이디</p>
					    <p>- <span class="dh_red">*</span> USERID : 고객사 회원 ID</p>
					    <p>- USEREMAIL : 고객사 회원 이메일주소</p>
					    <p>- <span class="dh_red">*</span> AMOUNT : 상품금액</p>
					    <p>- <span class="dh_red">*</span> ORDERID : 주문번호</p>
					    <p>- <span class="dh_red">*</span> ITEMNAME : 상품명</p>
					    <p>- <span class="dh_red">*</span> ITEMCODE : 결제용 아이템 코드 (위페이에서 제공)</p>
					    <p>- <span class="dh_red">*</span> RETURNURL : 결제 성공 DB처리URL (비동기 통신)</p>
					    <p>- <span class="dh_red">*</span> USERURL : 결제 성공시 고객사 회원 브라우저 전송 url</p>
					    <p>- <span class="dh_red">*</span> USERATTRI : 'USERURL' 리턴 속성 (self, opener, parent, top)</p>
						</li>
						<li>
							4) 결과 'RETURNURL' 파라미터 정보(POST,비동기 통신,고객사 결과 insert용 )
							<p class="mt5">- SID : 고객사코드/서비스아이디</p>
							<p>- USERID : 고객사 회원 ID</p>
							<p>- USERIP : 아이피</p>
							<p>- AMOUNT : 결제금액</p>
							<p>- MCTTRNO : 거래번호</p>
							<p>- ORDERID : 주문번호</p>
						</li>
						<li>
							5) 결과 'USERURL' 파라미터 정보(GET,사용자 결과 처리용)
							<p>- SID : 고객사코드/서비스아이디</p>
							<p>- USERID : 고객사 회원 ID</p>
							<p>- USERIP : 아이피</p>
							<p>- AMOUNT : 결제금액</p>
							<p>- ORDERID : 거래번호</p>
						</li>
					</ul> 

					<div class="info_sub_small">2. 취소 요청 - API</div>
					<ul class="sub_txt">
						<li>1) URL : https://pg.wepay.co.kr/api/danal/phone/Cancel.asp</li>
						<li>2) 방식 : POST</li>
						<li>
							3) 파라미터 : <span class="dh_red">* 필수 항목</span>
							<p class="mt5">- <span class="dh_red">*</span> SID : 고객사코드/서비스아이디</p>
							<p>- <span class="dh_red">*</span> TRANSACTIONID : 거래번호</p>
						</li>
						<li>
							4) 취소 결과 (JSON 형태)
							<p>- 성공 ==> {"ReplyCode":"000000","ReplyMessage":"성공"}</p>
							<p>- 실패 ==> {"ReplyCode":"8001","ReplyMessage":"취소오류.."}<br>
					       * '000000' 이외 모두 실패
					    </p>
						</li>
					</ul> 
				</div>

				<div class="info_form white_box">

					<div class="test_form">	
					 	<div class="test_tit">
					 		<div class="tit">[결제요청] TEST FORM</div>
					 		<div class="dh_red">* 필수 항목</div>
					 	</div>
					 	<ul>
					 		<li class="full">
					 			<div>
					 				<label>Action</label>
						 			<div class="input">https://pg.wepay.co.kr/api/danal/phone/Start.asp</div>
					 			</div>
					 		</li>
					 		<li>
					 			<div>
					 				<label>SID <span class="dh_red">*</span></label>
						 			<div class="input"><input type="text" name="" placeholder="고객사코드/서비스아이디"></div>
					 			</div>
					 			<div>
					 				<label>User ID <span class="dh_red">*</span></label>
						 			<div class="input"><input type="text" name="" placeholder="고객사 회원 ID"></div>
					 			</div>
					 		</li>
					 		<li>
					 			<div>
					 				<label>User Mail</label>
						 			<div class="input"><input type="text" name="" placeholder="고객사 회원 이메일주소"></div>
					 			</div>
					 			<div>
					 				<label>Amount <span class="dh_red">*</span></label>
						 			<div class="input"><input type="text" name="" placeholder="상품금액"></div>
					 			</div>
					 		</li>
					 		<li class="full">
					 			<div>
					 				<label>Order ID</label>
						 			<div class="input"><input type="text" name="" placeholder="주문번호"></div>
					 			</div>
					 		</li>
					 		<li class="full">
					 			<div>
					 				<label>Item Name <span class="dh_red">*</span></label>
						 			<div class="input"><input type="text" name="" placeholder="상품명"></div>
					 			</div>
					 		</li>
					 		<li class="full">
					 			<div>
					 				<label>Item Code <span class="dh_red">*</span></label>
						 			<div class="input"><input type="text" name="" placeholder="결제용 아이템 코드"></div>
					 			</div>
					 		</li>
					 		<li class="full">
					 			<div>
					 				<label>Return url <span class="dh_red">*</span></label>
						 			<div class="input"><input type="text" name="" placeholder="결제 성공 DB처리URL"></div>
					 			</div>
					 		</li>
					 		<li class="full">
					 			<div>
					 				<label>User url <span class="dh_red">*</span></label>
						 			<div class="input"><input type="text" name="" placeholder="결제 성공시 고객사 회원 브라우저 전송 url"></div>
					 			</div>
					 		</li>
					 		<li class="full">
					 			<div>
					 				<label>User Attri <span class="dh_red">*</span></label>
						 			<div class="input"><input type="text" name="" placeholder="'User url' 리턴 속성 (self, opener, parent, top)"></div>
					 			</div>
					 		</li>
					 	</ul>

					 	<div class="btn small mt30">
					 		<a href="" class="bor mr5">미리보기</a>
					 		<a href="">전송</a>
					 	</div>
					</div>
					<!-- END 결제요청 -->

					<div class="test_form">
					 	<div class="test_tit">[결과] Result Form[고객사 page]</div>
					 	<ul>
					 		<li class="full">
					 			<div>
					 				<label>Form Name</label>
						 			<div class="input">Result Form</div>
					 			</div>
					 		</li>
					 		<li>
					 			<div>
					 				<label>SID</label>
						 			<div class="input"><input type="text" name=""></div>
					 			</div>
					 			<div>
					 				<label>User ID</label>
						 			<div class="input"><input type="text" name=""></div>
					 			</div>
					 		</li>
					 		<li class="full">
					 			<div>
					 				<label>User IP</label>
						 			<div class="input"><input type="text" name=""></div>
					 			</div>
					 		</li>
					 		<li class="full">
					 			<div>
					 				<label>Mcttrno</label>
						 			<div class="input"><input type="text" name=""></div>
					 			</div>
					 		</li>
					 		<li class="full">
					 			<div>
					 				<label>Order ID</label>
						 			<div class="input"><input type="text" name=""></div>
					 			</div>
					 		</li>
					 	</ul>
					  
					</div>
					<!-- END 결과 -->

					<div class="test_form">
					 	<div class="test_tit">[취소] 결제 취소 TEST FORM[고객사 page]</div>
					 	<ul>
					 		<li class="full">
					 			<div>
					 				<label>Action</label>
						 			<div class="input">https://pg.wepay.co.kr/api/danal/card2/Cancel.asp</div>
					 			</div>
					 		</li>
					 		<li>
					 			<div>
					 				<label>SID</label>
						 			<div class="input"><input type="text" name=""></div>
					 			</div>
					 			<div>
					 				<label>Transaction ID</label>
						 			<div class="input"><input type="text" name=""></div>
					 			</div>
					 		</li>
					 	</ul>

					 	<div class="btn small mt30">
					 		<a href="">전송</a>
					 	</div>
					  
					</div>
					<!-- END 취소 -->

				</div>

			</div>
			<!-- END 휴대폰 -->

			<!-- 일반카드 -->
			<div class="info_wrap" id="info2" style="display: none;">

				<div class="info_cont white_box">	
					<div class="info_tit">다날 수기결제 GATEWAY(공통)</div>

				</div>

				<div class="info_form white_box">

				</div>

			</div>
			<!-- END 일반카드 -->

			<!-- 간편카드 -->
			<div class="info_wrap" id="info3" style="display: none;">

				<div class="info_cont white_box">	
					<div class="info_tit">다날 일반카드 GATEWAY(공통)</div>

				</div>

				<div class="info_form white_box">

				</div>

			</div>
			<!-- END 간편카드 -->

			

		</div>
		<!-- END inner -->


	</div>
	<!-- END content -->

</div>
<!-- END container -->

<!-- #include file = './include/footer.asp' -->
  