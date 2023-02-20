<!--#include virtual="/common/fun/fncSetup.asp"-->
<!--#include virtual="/common/inc/inc_clsInit.asp"-->
<!--#include virtual="/common/class/clsMember.asp"-->
<%
  Language="KO"
  PageName = ""
  SubName = ""

'########## // Request Paramas ##########
Dim iPage       : iPage         = fnSqlChk(Request("page"), 0, 0)  
Dim iSchText	: iSchText		= fnSqlChk(Request("schText"), 0, 0)
Dim iSchType	: iSchType		= fnSqlChk(Request("schType"), 0, 0)
Dim iCode		: iCode			= fnSqlChk(Request("mCode"), 0, 0) : iCode = NullValue(iCode,0)
'########## Request Paramas // ##########

If iCode > 0 Then
	Set objMember = New clsMember
	Dim arrInfo : arrInfo = objMember.GetMemberInfo(iCode)
	Set objMember = Nothing
	If IsArray(arrInfo) Then 
		Cols_Name		= arrInfo(0,0)
		Cols_Email		= arrInfo(1,0)
		Cols_Phone		= arrInfo(2,0)
		Cols_Pwd		= arrInfo(3,0)
		Cols_JoinType	= arrInfo(4,0)	

	End If
End If

%>
<!-- #include file = './include/head.asp' -->
<!-- #include file = './include/header.asp' -->
<!-- container -->
<div id="container">
	<!-- #include file = './include/gnb.asp' -->
	<!-- content -->
	<div class="content">

		<div class="path_wrap">
			<div class="inner">	
				<ul class="path inline_wrap">
					<li class="home"><a href="/admin"><img src="/admin/image/common/home.png"></a></li>
					<li><a href="javascript:$('.gnb_wrap').toggleClass('on_m'); $('.content').toggleClass('on_m');$('.gnb > li').eq(2).addClass('select');">회원관리</a></li>
					<li><a href="member_list.asp">회원리스트</a></li>
				</ul>
			</div>
		</div>
		
		<div class="inner">	

			<div class="white_box">
				<!-- info write -->
				<div class="info-write">
					<div class="search_wrap mb20">
						<ul>
							<li class="col02">
								<div class="wrap">
									<div class="tit">아이디</div>
									<div class="sub">
										<input type="text" id="write-title" class="large id">										
									</div>
								</div>
								<div class="wrap">
									<div class="tit">비밀번호</div>
									<div class="sub txt">
										<input type="password" id="" class="large">
										<span class="gray9 ml10">자동으로 생성됩니다.</span>
									</div>
								</div>
							</li>
							<li class="col02">
								<div class="wrap">
									<div class="tit">업체명</div>
									<div class="sub txt">
										<input type="text" id="" class="large">
										<span class="gray9 ml10">사업자등록증상의 법인명 또는 상호</span>
									</div>
								</div>
								<div class="wrap">
									<div class="tit">사업자등록번호</div>
									<div class="sub txt">
										<input type="text" id="" class="large">
										<span class="gray9 ml10">사업자등록증상의 등록번호</span>
									</div>
								</div>
							</li>
							<li>
								<div class="wrap">
									<div class="tit">사업형태</div>
									<div class="sub">
										<span>
											<input type="radio" name="bs" id="bs01"> <label for="bs01">법인사업자</label>
										</span>
										<span>
											<input type="radio" name="bs" id="bs02"> <label for="bs02">개인사업자</label>
										</span>	
										<span>
											<input type="radio" name="bs" id="bs03"> <label for="bs03">면세사업자</label>
										</span>	
									</div>
								</div>
							</li>
							<li class="col02">
								<div class="wrap">
									<div class="tit">업태</div>
									<div class="sub">
										<input type="text" id="" class="large">
									</div>
								</div>
								<div class="wrap">
									<div class="tit">업종</div>
									<div class="sub">
										<input type="text" id="" class="large">
									</div>
								</div>
							</li>
							<li>
								<div class="wrap">
									<div class="tit">대표자명</div>
									<div class="sub">
										<input type="text" name="" class="large">
									</div>
								</div>
							</li>
							<li>
								<div class="wrap">
									<div class="tit">사업자주소</div>
									<div class="sub adr">
										<div>
											<input type="text" name="" class="middle num"> - <input type="text" name="" class="middle num">
										</div><div class="mt10"><input type="text" name="" class="img-w100"></div>
										<div class="mt10"><input type="text" name="" class="img-w100"></div>
									</div>
								</div>
							</li>
							<li class="col02">
								<div class="wrap">
									<div class="tit">대표전화</div>
									<div class="sub">
										<input type="text" id="" class="large">
									</div>
								</div>
								<div class="wrap">
									<div class="tit">FAX번호</div>
									<div class="sub">
										<input type="text" id="" class="large">
									</div>
								</div>
							</li>
							<li class="col02">
								<div class="wrap">
									<div class="tit">분류</div>
									<div class="sub">
										<select class="large">
											<option>승인전</option>
											<option>정상</option>
											<option>차단</option>
											<option>탈퇴</option>
										</select>
									</div>
								</div>
								<div class="wrap">
									<div class="tit">영업담당자</div>
									<div class="sub">
										<select class="large">
											<option>담당자선택</option>
											<option>박신영(영업,제휴)</option>
										</select>
									</div>
								</div>
							</li>
							<li>
								<div class="wrap">
									<div class="tit">등급</div>
									<div class="sub">
										<select class="large">
											<option>MCP</option>
											<option>CP</option>
										</select>
									</div>
								</div>
							</li>
						</ul>
					</div>
					<!-- Buttons -->
					<div class="align-c mt30 btn">
						<a href="javascript:fn_save();">저장</a>
						<a href="member_list.asp?page=<%=iPage%>&schText=<%=iSchText%>&schType=<%=iSchType%>" class="bor ml10">취소</a>
					</div><!-- END Buttons -->

					 

				</div><!-- END info write -->

			</div>

		</div>

	</div>	
	<!-- END content -->

</div>
<!-- END container -->

<!-- #include file = './include/footer.asp' -->
  