<!--#include virtual="/common/fun/fncSetup.asp"-->
<!--#include virtual="/common/inc/inc_clsInit.asp"-->
<!--#include virtual="/common/class/clsCommon.asp"-->
<!--#include virtual="/common/class/clsBoard.asp"-->
<%
'########## // Request Paramas ##########
Dim sgCode		: sgCode		= fnSqlChk(Request("sgCode"), 0, 0)
Dim pCode		: pCode			= fnSqlChk(Request("pCode"), 0, 0)  : pCode = NullValue(pCode,0)
'########## // Request Paramas ##########
Dim arrProjectInfo, arrProjectSupportList
Set objCommon = New clsCommon
Dim arrSupportInfo : arrSupportInfo = objCommon.GetSupportMainInfo(sgCode)
If pCode > 0 Then
	arrProjectInfo = objCommon.GetProjectInfo(pCode)
	arrProjectSupportList =  objCommon.GetProjectSupportList(sgCode, pCode, 1, 10)
End If
Set objCommon = Nothing

Set objBoard = New clsBoard
Dim arrPhotoList : arrPhotoList = objBoard.GetBoardCommonList("", "", "B0104", sgCode, pCode, 3, 1, 10)
Dim arrVodList : arrVodList = objBoard.GetBoardCommonList("", "", "B0105", sgCode, pCode, 3, 1, 3)
Set objBoard = Nothing

Dim PhotoTotalPage : PhotoTotalPage = 1
If IsArray(arrPhotoList) Then 
	PhotoTotalPage = arrPhotoList(17, 0)
End If
Dim VodTotalPage : VodTotalPage = 1
If IsArray(arrVodList) Then 
	VodTotalPage = arrVodList(17, 0)
End If
Dim SupportTotalPage : SupportTotalPage = 1
If IsArray(arrProjectSupportList) Then 
	SupportTotalPage = arrProjectSupportList(6, 0)
End If


If IsArray(arrSupportInfo) Then 
	Cols_GroupName			= arrSupportInfo(0,0) 
	Cols_GroupType			= arrSupportInfo(1,0) 
	Cols_Homepage			= arrSupportInfo(2,0) 
	Cols_WorkerName			= arrSupportInfo(3,0) 
	Cols_Tel				= arrSupportInfo(4,0) 
	Cols_Email				= arrSupportInfo(5,0) 
	'Cols_PayMethod			= arrSupportInfo(6,0) 
	Cols_LogoImg			= arrSupportInfo(7,0) 
	Cols_Addr				= arrSupportInfo(8,0) 
	Cols_Description		= arrSupportInfo(9,0) 		
	Cols_Template			= arrSupportInfo(10,0) 
	Cols_TitleImg1			= arrSupportInfo(11,0) 
	Cols_TitleImg2			= arrSupportInfo(12,0) 
	Cols_TitleImg3			= arrSupportInfo(13,0) 
	Cols_TitleName			= arrSupportInfo(14,0) 
	Cols_TitleDescription	= arrSupportInfo(15,0) 
	Cols_IntroImg1			= arrSupportInfo(16,0) 
	Cols_IntroImg2			= arrSupportInfo(17,0) 
	Cols_IntroImg3			= arrSupportInfo(18,0) 
	Cols_IntroTitle			= arrSupportInfo(19,0) 
	Cols_IntroDescription	= arrSupportInfo(20,0) 
	Cols_MapX				= arrSupportInfo(21,0) 
	Cols_MapY				= arrSupportInfo(22,0) 
Else
	Response.redirect "/"
End If
If IsArray(arrProjectInfo) Then
	Cols_Template		= arrProjectInfo(2,0)
	Cols_ProjectImg		= arrProjectInfo(3,0)
	Cols_ProjectName	= arrProjectInfo(4,0)
	Cols_TargetMoney	= arrProjectInfo(5,0)
	Cols_TotlaMoney		= arrProjectInfo(6,0)
	Cols_ApplyCnt		= arrProjectInfo(7,0)
	Cols_PayMethod		= arrProjectInfo(8,0)
	Cols_Tel			= arrProjectInfo(9,0)
	Cols_Email			= arrProjectInfo(10,0)
	Cols_StartDate		= arrProjectInfo(11,0)
	Cols_EndDate		= arrProjectInfo(12,0)
	Cols_Menu			= arrProjectInfo(13,0)
	Cols_Description	= arrProjectInfo(14,0)

	Cols_Dday = DateDiff("D" , Now(), Cols_EndDate )
	If Cols_Dday < 0 Then
		Cols_Dday = 0
	End If

End If
If Cols_TotlaMoney = 0 Then
	Cols_Rate = 0
Else
	Cols_Rate = Cols_TotlaMoney / Cols_TargetMoney * 100
End If

  Language="KO"
  PageName = "sub06"
  detail = "sub"
  SubName = "ko"
%>
<!-- #include virtual = '/support/include/head.asp' -->
<!-- #include virtual = '/support/include/header.asp' -->
<!-- #include virtual = '/support/include/sub_title.asp' -->
<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
<style>
.introduce{
	max-width: 100%;
	height: auto !important;
}
.embed-container{
	position:relative;
	padding-bottom:56.25%;
	height:0;
	overflow:hidden;
	max-width:100%;
}
.embed-container iframe, .embed-container object, .embed-container embed{
	position:absolute;
	top:0;
	left:0;
	width:100%;
	height:100%;
}
.edit_photo_box .box .img_box img {border-radius: 10px;}
</style>
<input type="hidden" id="pCode" value="<%=pCode%>">
<input type="hidden" id="sgCode" value="<%=sgCode%>">
<input type="hidden" id="photoPage" value="1">
<input type="hidden" id="photoTotalPage" value="<%=PhotoTotalPage%>">
<input type="hidden" id="vodPage" value="1">
<input type="hidden" id="vodTotalPage" value="<%=VodTotalPage%>">
<input type="hidden" id="supportPage" value="1">
<input type="hidden" id="supportTotalPage" value="<%=SupportTotalPage%>">
<!-- modal -->
<!-- photo -->
<div class="photo_modal">
    <div class="modal">
        <div class="common_modal_box photo_modal_box">
            <div class="common_slide_arw right"></div>
            <div class="common_slide_arw left"></div>
            <div class="swiper mySwiper modal_slide_01 common_modal_slide">
                <div class="swiper-wrapper">
<%
	If IsArray(arrPhotoList) Then
		For i = 0 To UBound(arrPhotoList,2)
%>	                    
					<div class="swiper-slide item">
                        <button type="button" class="esc_btn" onclick="photo_modalClose();"></button>
                        <div class="img_wrap">
                            <img src="<%=arrPhotoList(4, i)%>" alt="<%=arrPhotoList(2, i)%>">
                        </div>
                        <div class="modal_tit">
                            <%=arrPhotoList(2, i)%>
                        </div>
                        <div class="modal_sub_tit">
                            <%=arrPhotoList(5, i)%>
                        </div>
                    </div>
<%
		Next
	End If
%>
                    
                </div>
            </div>
        </div>
    </div>
</div>
<!-- END photo -->
<!-- vod -->
<div class="vod_modal">
    <div class="modal">
        <div class="common_modal_box vod_modal_box">
            <div class="common_slide_arw right"></div>
            <div class="common_slide_arw left"></div>
            <div class="swiper mySwiper modal_slide_02 common_modal_slide">
                <div class="swiper-wrapper">
<%
	If IsArray(arrVodList) Then
		For i = 0 To UBound(arrVodList,2)
			If Not(arrVodList(15, i) = "" Or isNull(arrVodList(15, i))) Then
				If Instr(arrVodList(15, i),"v=") > 0 Then
					Cols_YoutubeUrl = Replace(arrVodList(15, i), "/watch?v=", "/embed/")
				End If
				If Instr(arrVodList(15, i),"https://youtu.be/") > 0 Then
					Cols_YoutubeUrl = Replace(arrVodList(15, i), "https://youtu.be/", "https://www.youtube.com/embed/")
				End If
			Else
				Cols_YoutubeUrl = ""
			End If
%>	                    
					<div class="swiper-slide item">
                        <button type="button" class="esc_btn" onclick="vod_modalClose();"></button>
                        <div class="img_wrap">
                            <div class="embed-container">
								<iframe src="<%=Cols_YoutubeUrl%>" frameborder="0" allowfullscreen></iframe>
							</div>
                        </div>
                        <div class="modal_tit">
                            <%=arrVodList(2, i)%>
                        </div>
                        <div class="modal_sub_tit">
                            <%=arrVodList(5, i)%>
                        </div>
                    </div>
<%
		Next
	End If
%>
                    
                </div>
            </div>
        </div>
    </div>
</div>
<!-- END vod -->
<!-- app_down -->
<div class="app_modal">
    <div class="modal">
        <div class="common_modal_box app_modal_box">
            <div class="common_modal_slide">
                <div class="item">
                    <button type="button" class="esc_btn" onclick="app_modalClose();"></button>
                    <div class="modal_tit">앱 다운로드</div>
                    <div class="modal_sub_tit">QR 코드를 스캔하시면 앱 다운로드 페이지로 이동합니다.</div>
                    <div class="qr_box">
                        <a href="javascript:;" class="box">
                            <div class="name">
                                <div class="icon">
                                    <img src="/support/image/sub/google_icon.png" alt="">
                                </div>
                                Google Play
                            </div>
                            <div class="qr_img">
                                <img src="/support/image/sub/qr_img.png" alt="">
                            </div>
                        </a>
                        <a href="javascript:;" class="box">
                            <div class="name">
                                <div class="icon">
                                    <img src="/support/image/sub/apple_icon.png" alt="">
                                </div>
                                App Store
                            </div>
                            <div class="qr_img">
                                <img src="/support/image/sub/qr_img.png" alt="">
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- END app_down -->


<div class="cash_modal">
    <div class="modal ">
        <div class="common_modal_box cash_modal_box">
			<div class="swiper mySwiper modal_slide_03 common_modal_slide">
                <div class="swiper-wrapper">
                    <div class="swiper-slide item">
                        <button type="button" class="esc_btn" onclick="cash_modalClose();"></button>
                        <div class="text_box">
                            <div class="bg_box">
                                <img src="/support/image/main/con6_img_01.png" alt="">
                            </div>
                            <div class="tit"><%=Cols_ProjectName%> 후원하기</div>
                            <div class="sub_tit">
                                민군의 여호와가 이르노라 혼전한 십일조를 창고에 들어 나의 집에 양식이 있게 하고 그것으로 나를 시험하게 하며 <br />
                                내가 하늘 문을 열고 너희에게 복을 쌓을 곳이 없도록 붓지 아니하나 보라! <br />
                                (말3:10)
                            </div>
                        </div>
                        <div class="btm_box">
                            <div class="sub_box">
                                <div class="left_box">
                                    <label for="spMoney" class="common_input_box">
                                        금액 (<label for="spMoneySecret"> <input type="checkbox" name="spMoneySecret" id="spMoneySecret">비공개</label>)
                                        <div class="won_box">
                                            <input type="text" class="common_input cash" id="spMoney"
                                                placeholder="금액을 입력해주세요" onlyNumber>
                                        </div>
                                    </label>
									
                                    <label for="spName" class="common_input_box">
                                        이름 (<label for="spNameSecret"> <input type="checkbox" name="spNameSecret" id="spNameSecret">비공개</label>) 
                                        <input type="text" class="common_input" id="spName" placeholder="이름을 입력해주세요">
                                    </label>
									
                                    <label for="payMethod" class="common_input_box">
                                        결제방식
                                        <select class="common_select" id="payMethod">
											<%If Instr(Cols_PayMethod,"card") > 0 Then%>
                                            <option value="card">신용카드</option>
											<%End If%>
											<%If Instr(Cols_PayMethod,"bank") > 0 Then%>
											<option value="bank">무통장입금</option>
											<%End If%>
                                        </select>
                                    </label>
                                </div>
                                <label for="spContents" class="common_input_box right_box">
                                    기도제목
                                    <textarea id="spContents" class="common_textarea_box"
                                        placeholder="기도제목을 간략하게 입력해주세요."></textarea>										
                                </label>
                            </div>
                            <div class="btn_box">
                                <a href="javascript:;" class="ok_modal_btn projectsupport">후원하기</a>
                            </div>
                        </div>
                    </div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- END modal -->

<!-- container -->
<div id="container" class="">
    <div class="common_sub_wrap sub">
        <div class="inner sub_common_inner">
            <div class="left_box">
                <ul class="common_sub_ul">
                    <li class="on">모금함 소개</li>
					<%If Instr(Cols_Menu,"photo") > 0 Then%>
                    <li class="photo_li">PHOTO</li>
					<%End If%>
					<%If Instr(Cols_Menu,"video") > 0 Then%>
                    <li>VOD</li>
					<%End If%>
                    <li class="jn_li">참여내역</li>
                </ul>
                <div class="edit_content_box">
                    <!-- introduce -->
                    <div class="edit_content introduce">
                        <%=Cols_Description%>
                    </div>
                    <!-- END introduce -->
<%If Instr(Cols_Menu,"photo") > 0 Then%>
                    <!-- edit_photo -->
                    <div class="edit_content photo">
                        <div class="edit_photo_box">
                            <ul class="photo_left">
<%
	If IsArray(arrPhotoList) Then
		For i = 0 To UBound(arrPhotoList,2)
%>	
                                
								<li class="box" data-num="<%=arrPhotoList(10, i)%>">
                                    <div class="img_box">
                                        <img src="<%=arrPhotoList(4, i)%>" alt="<%=arrPhotoList(2, i)%>">
                                    </div>
                                    <div class="tit">
                                        <%=arrPhotoList(2, i)%>
                                    </div>
                                    <div class="date">
                                        <%=fnDateFormat(arrPhotoList(8,i),6)%>
                                    </div>
                                </li>
<%
		Next
	End If
%>
                            </ul>
                        </div>
						<%If PhotoTotalPage > 1 Then%>
						<div style="width:50%;margin-left:25%;position:relative;">
							<button type="button" class="photo_more join_btn">더보기</button>
						</div>
						<%End If%>
                    </div>
                    <!-- END edit_photo -->
<%End If%>
<%If Instr(Cols_Menu,"video") > 0 Then%>
                    <!-- edit_vod -->
                    <div class="edit_content vod">
                        <div class="edit_vod_box">
<%
	If IsArray(arrVodList) Then
		For i = 0 To UBound(arrVodList,2)
			 
%>                          
							<div class="box" data-num="<%=arrVodList(10, i)%>">
                                <div class="vod_left vod">
                                    <div class="bg_box">
                                        <button type="button" class="play_btn"></button>
                                    </div>
                                    <img src="<%=arrVodList(4, i)%>" alt="<%=arrVodList(2, i)%>">
									 
                                </div>
                                <div class="vod_right vod">
                                    <div class="tit text_ov"><%=arrVodList(2, i)%></div>
                                    <div class="alt text_ov3">
                                        <%=RemoveHTML(arrVodList(5, i))%>
                                    </div>
                                    <div class="date"><%=fnDateFormat(arrVodList(8,i),6)%></div>
                                </div>
                            </div>
<%
		Next
	End If
%>
                            
                        </div>
						<%If VodTotalPage > 1 Then%>
						<div style="width:50%;margin-left:25%;position:relative;">
							<button type="button" class="vod_more join_btn">더보기</button>
						</div>
						<%End If%>
                    </div>
                    <!-- END edit_vod -->
<%End If%>
                    <!-- join -->
                    <div class="edit_content join">
                        <div class="edit_join_box">
                            <div class="top_ment">
                                현재 <span><%=Cols_ApplyCnt%></span>명이 후원에 참여하였습니다.
                            </div>
                            <div class="box_wrap">
                                <ul class="join_box">
<%
	If IsArray(arrProjectSupportList) Then
		For i = 0 To UBound(arrProjectSupportList,2)
			If arrProjectSupportList(2,i) = "0" Then
				Cols_Name = arrProjectSupportList(0,i)
				Cols_NameCss = ""
			Else
				Cols_Name = "비공개"
				Cols_NameCss = " color"
			End If
			If arrProjectSupportList(3,i) = "0" Then
				Cols_price = FormatNumber(arrProjectSupportList(1,i),0)
				Cols_priceCss = ""
			Else
				Cols_price = "비공개"
				Cols_priceCss = " color"
			End If
			Cols_Level = "base"
			If arrProjectSupportList(1,i) >= 1000 Then
				Cols_Level = "green"
			End If
			If arrProjectSupportList(1,i) >= 2000 Then
				Cols_Level = "crown"
			End If


%>        

                                    <li class="box <%=Cols_Level%>">
                                        <div class="sub_box">
                                            <div class="top_box">
                                                <div class="img_wrap">
                                                    <img src="/support/image/sub/join_icon.png" alt="">
                                                </div>
                                                <div class="right_box">
                                                    <div class="alt<%=Cols_NameCss%>">
                                                        <%=Cols_Name%>
                                                    </div>
                                                    <div class="date"><%=fnDateFormat(arrProjectSupportList(4,i),6)%></div>
                                                </div>
                                            </div>
                                            <div class="btm_box">
                                                <div class="won<%=Cols_priceCss%>">
                                                    <span>$ </span>
                                                    <%=Cols_price%>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
<%
		Next
	End If
%>
                                      

                                </ul>

                            </div>
							<%If SupportTotalPage > 1 Then%>
							<div style="width:50%;margin-left:25%;position:relative;">
								<button type="button" class="support_more join_btn">더보기</button>
							</div>
							<%End If%>
                        </div>
                    </div>
                    <!-- END join -->
                </div>
            </div>
            <div class="scroll_big_box">
                <div class="right_box scroll">
                    <div class="donate_con">
                        <div class="top_box">
                            <div class="date"><%=fnDateFormat(Cols_EndDate,10)%>까지</div>
                            <div class="d_day">D-<%=Cols_Dday%></div>
                        </div>
                        <div class="common_gage_box">
                            <div class="ment"><span class="num"><%=FormatNumber(Cols_Rate,0)%></span><span class="color">%</span>달성</div>
                            <div class="bar_box">
                                <div class="bar" style="width:<%=Cols_Rate%>%">
                                </div>
                            </div>
                        </div>
                        <div class="goal">
                            <div class="num">
                                <span>$</span>
                                <%=FormatNumber(Cols_TotlaMoney,0)%>
                            </div>
                            달성
                        </div>
                        <div class="goal last">
                            <div class="num">
                                <%=Cols_ApplyCnt%>
                            </div>
                            명 후원참여
                        </div>
                        <div class="goal_icon_box">
                            <div class="goal_icon fir">
                                <div class="img_box">
                                    <img src="/support/image/sub/won_icon.png" alt="">
                                </div>
                                <div class="name">목표금액</div>
                                <div class="num fir"><span>$</span> <%=FormatNumber(Cols_TargetMoney,0)%></div>
                            </div>
                            <div class="goal_icon">
                                <div class="img_box">
                                    <img src="/support/image/sub/day_icon.png" alt="">
                                </div>
                                <div class="name">후원기간</div>
                                <div class="num"><%=fnDateFormat(Cols_StartDate,6)%> ~ <%=fnDateFormat(Cols_EndDate,6)%></div>
                            </div>
                        </div>
                        <button type="button" class="common_h_btn join_btn">후원 참여하기</button>
                    </div>
                    <div class="qr_box" onclick="app_modalOpen();"></div>
                    <div class="share_box">
                        <div class="share"></div>
                        프로젝트 공유하기
                        <div class="icon who"></div>
                        <div class="icon fb"></div>
                        <div class="icon ka"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<!-- END container -->
<form method="post" action="https://api.aronhub.com/api/danal/card1/Start.asp" name="paydanal"target="_blank">
<input type="hidden" name="SID" maxlength=20  value=""><!-- 고객사코드/서비스아이디 -->
<input type="hidden" name="USERID" maxlength=50  value=""><!-- 고객사 회원 ID -->
<input type="hidden" name="AMOUNT" maxlength=10  value=""><!-- 상품금액 -->
<input type="hidden" name="ORDERID" maxlength=50  value=""><!-- 주문번호 -->
<input type="hidden" name="ITEMNAME" maxlength=50  value=""><!-- 상품명 (50byte 이내) -->
<input type="hidden" name="RETURNURL"  size=50 maxlength=500 value=""><!-- 결제 성공 DB처리URL (비동기 통신) -->
<input type="hidden" name="USERURL" value=""><!-- 결제 성공시 고객사 회원 브라우저 전송 URL -->
<input type="hidden" name="CANCELURL" value=""><!-- 에러 발생 및 취소 시 이동 할 페이지의 URL -->
</FORM>
<script src="https://unpkg.com/isotope-layout@3/dist/isotope.pkgd.min.js"></script>
<script type="text/javascript" src="./js/imagesloaded.pkgd.min.js"></script>

<script>
    $(document).ready(function () {
		
        // 탭기능
        $(".edit_content_box .edit_content").hide();

        $(".edit_content_box .edit_content").first().show();
        $(".common_sub_ul li").first().addClass("on");

        $(".common_sub_ul li").on("click", function () {

            var active = $(this).index();
            $(".edit_content_box .edit_content").hide();
            $(".edit_content_box .edit_content").eq(active).show();
            $(".common_sub_ul li").removeClass("on");
            $(this).addClass("on");
        });
        //END 탭기능


        // scroll event 우측 메뉴 위치 고정
        if (window.innerWidth > 1400) {
            $(window).scroll(function () {
                var winTop = $(window).scrollTop() + 80;
                var startPoint = $(".sub_common_inner .left_box").offset().top;
                var plus = $('.right_box.scroll').height();
                var endPoint = $('#footer').offset().top - plus - 200;

                //console.log(winTop,startPoint);

                if (winTop > startPoint) {
                    $(".right_box.scroll").addClass('fix');
                    $(".right_box.scroll").removeClass('clear');
                }

                if (winTop > endPoint) {
                    $(".right_box.scroll").removeClass('fix');
                    $(".right_box.scroll").addClass('clear');
                } else if (winTop < startPoint) {
                    $(".right_box.scroll").removeClass('fix');
                    $(".right_box.scroll").removeClass('clear');
                }
            });
        }
        // END       

        // photo 탭 메뉴 클릭시
        $('.photo_li').on('click', function () {
            var $grid = $(".photo_left").isotope({
				itemSelector: 'li',
				layoutMode: 'masonry'
			});
			$grid.imagesLoaded(function () {
				$grid.isotope('layout');
			});
        });

		//참여내역 탭 메뉴 클릭시
        $('.jn_li').on('click', function () {
            var $grid2 = $(".join_box").isotope({
				itemSelector: 'li',
				layoutMode: 'masonry'
			});

			$grid2.imagesLoaded(function () {
				$grid2.isotope('layout');
			});
        });
        // END photo
		 
		fn_imgRate();
		// photo_modal
        var swiper5 = new Swiper(".modal_slide_01", {
            navigation: {
                nextEl: ".photo_modal_box .right",
                prevEl: ".photo_modal_box .left",
            },
        });
		$('.edit_photo_box .box').css({"cursor":"pointer"});
		$('.edit_vod_box .box').css({"cursor":"pointer"});
        $(document).on("click", ".edit_photo_box .box", function(){		
            $(".photo_modal .modal").fadeIn();
            $('body, html').addClass('on');
			Num = $(this).attr("data-num");
			swiper5.slideTo(Num-1, 10, false);
        });
		// vod_modal
        var swiper6 = new Swiper(".modal_slide_02", {
            navigation: {
                nextEl: ".vod_modal_box .right",
                prevEl: ".vod_modal_box .left",
            },
        });
        $(document).on("click", ".edit_vod_box .box", function(){		
            $(".vod_modal .modal").fadeIn();
            $('body, html').addClass('on');
			Num = $(this).attr("data-num");
			swiper6.slideTo(Num-1, 10, false);
        });
		//후원 더보기
		$(".support_more").on("click", function () {
			var NextPage = Number($("#supportPage").val()) + 1;
			if( NextPage > Number($("#supportTotalPage").val()) ){
				$(".support_more").hide();
				return false;
			}
			$("#supportPage").val(NextPage);
			$.ajax({
				url : "/common/json/support/introduce.more.json.asp",
				type : "post",
				data : {page:NextPage, pageSize:10, sgCode:$("#sgCode").val(), pCode:$("#pCode").val() ,bcType:"D0100" },
				dataType : 'json',
				success : function(result){					
					if(result.RESULT == "SUCCESS"){
						var $items = $.parseHTML(result.DATALIST);
						$(".join_box").append($items).isotope('appended', $items);						
						$(".join_box").imagesLoaded(function () {
							$(".join_box").isotope('layout');
						});
					}else{
						console.log('error:' + result);
					}
					if( NextPage == Number($("#supportTotalPage").val()) ){
						$(".support_more").hide();
					}
				},
				error : function(){
					alert("서버요청실패");
				}
			});
		});
		//포토 더보기
		$(".photo_more").on("click", function () {
			var NextPage = Number($("#photoPage").val()) + 1;
			if( NextPage > Number($("#photoTotalPage").val()) ){
				$(".photo_more").hide();
				return false;
			}
			$("#photoPage").val(NextPage);
			$.ajax({
				url : "/common/json/support/introduce.more.json.asp",
				type : "post",
				data : {page:NextPage, pageSize:10, sgCode:$("#sgCode").val(), pCode:$("#pCode").val() ,bcType:"B0104" },
				dataType : 'json',
				success : function(result){
					if(result.RESULT == "SUCCESS"){
						$(".modal_slide_01 .swiper-wrapper").append(result.DATAMODAL);						
						var $items = $.parseHTML(result.DATALIST);
						$(".photo_left").append($items).isotope('appended', $items);						
						$(".photo_left").imagesLoaded(function () {
							$(".photo_left").isotope('layout');
						});

					}else{
						console.log('error:' + result);
					}

					if( NextPage == Number($("#photoTotalPage").val()) ){
						$(".photo_more").hide();
					}
					
				},
				error : function(){
					alert("서버요청실패");
				}
			});
		});
		//VOD 더보기
		$(".vod_more").on("click", function () {
			var NextPage = Number($("#vodPage").val()) + 1;
			if( NextPage > Number($("#vodTotalPage").val()) ){
				$(".vod_more").hide();
				return false;
			}
			$("#vodPage").val(NextPage);
			$.ajax({
				url : "/common/json/support/introduce.more.json.asp",
				type : "post",
				data : {page:NextPage, pageSize:3, sgCode:$("#sgCode").val(), pCode:$("#pCode").val() ,bcType:"B0105" },
				dataType : 'json',
				success : function(result){					
					if(result.RESULT == "SUCCESS"){
						 $(".modal_slide_02 .swiper-wrapper").append(result.DATAMODAL);
						 $(".edit_vod_box").append(result.DATALIST);
					}else{
						console.log('error:' + result);
					}					
					if( NextPage == Number($("#vodTotalPage").val()) ){
						$(".vod_more").hide();
					}					
				},
				error : function(){
					alert("서버요청실패");
				}
			});

		});
		//후원참여하기
		$(".common_h_btn.join_btn").on("click", function () {
			//console.log("후원참여하기");
			$(".cash_modal .modal").fadeIn();
			$('body, html').addClass('on');
		});

		//후원하기 버튼 클릭
		$(".projectsupport").on("click", function () {
			if( $("#spMoney").val()==""){
				alert("후원한 금액을 입력해주세요.");
				$("#spMoney").focus();
				return false;
			}
			if( $("#spName").val()==""){
				alert("이름을 입력해주세요.");
				$("#spName").focus();
				return false;
			}
			var NameSecret = 0;
			var MoneySecret = 0;
			if($("#spMoneySecret").is(":checked") == true){ 
				MoneySecret = 1;
			}
			if($("#spNameSecret").is(":checked") == true){ 
				NameSecret = 1;
			}

			//결제 완료- pgUsed:0, 대기-pgUsed:1
			$.ajax({
				url : "/common/json/support/introduce.pay.json.asp",
				type : "post",
				data : {sgCode:$("#sgCode").val(), pCode:$("#pCode").val(), spName:$("#spName").val(), spMoney:$("#spMoney").val() ,payMethod:$("#payMethod").val(), Contents:$("#t_area").val(), spMoneySecret:MoneySecret, spNameSecret:NameSecret, spContents:$("#spContents").val(), pgUsed:0},
				dataType : 'json',
				success : function(result){
					console.log(result);
					if(result.RESULT =="SUCCESS"){
						alert("등록 완료 되었습니다.");
						location.reload();						
					}else{
						alert("등록 실패 하였습니다.\n관리자에게 문의 해주세요.");
					}
					
				},
				error : function(){
					alert("서버요청실패");
					 
				}
			});
		 

			/*
			$(".cash_modal .modal").fadeOut();
			$('body, html').removeClass('on');
			*/
		});
		//숫자만 입력
		$('input[onlyNumber]').on('keyup', function () {
			$(this).val($(this).val().replace(/[^0-9]/g, ""));
		});
		$(window).scroll(function () { 			
			if ($(window).scrollTop() >= $(document).height() - $(window).height() - $("#footer").height()) {
				//console.log("nextPage");
				if( $(".edit_content.join").css("display") == "block" ){
					$(".support_more").trigger("click");
				}
				if( $(".edit_content.photo").css("display") == "block" ){
					$(".photo_more").trigger("click");
				}
				if( $(".edit_content.vod").css("display") == "block" ){
					$(".vod_more").trigger("click");
				}
			}

			
		});
    });

    
 
 

    // app_down
    function app_modalOpen() {
        $(".app_modal .modal").fadeIn();
        $('body, html').addClass('on');
    }

    function app_modalClose() {
        $(".app_modal .modal").fadeOut();
        $('body, html').removeClass('on');
    }
    // END app_down
	function photo_modalClose() {
        $(".photo_modal .modal").fadeOut();
        $('body, html').removeClass('on');
    }
	function vod_modalClose() {
        $(".vod_modal .modal").fadeOut();
        $('body, html').removeClass('on');
    }
	function fn_imgRate(){
		$('.introduce img').each(function() {
			$(this).css({"height":"auto"});
		});
	}
	$(window).resize(function(){
		fn_imgRate();
	});
</script>

<!-- #include virtual = '/support/include/footer.asp' -->