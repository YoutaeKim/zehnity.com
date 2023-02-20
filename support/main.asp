<!--#include virtual="/common/fun/fncSetup.asp"-->
<!--#include virtual="/common/inc/inc_clsInit.asp"-->
<!--#include virtual="/common/class/clsCommon.asp"-->
<!--#include virtual="/common/class/clsBoard.asp"-->
<%
  Language="KO"
  PageName = ""
  SubName = "ko"
  footer = "add"


'########## // Request Paramas ##########
Dim sgCode       : sgCode         = fnSqlChk(Request("sgCode"), 0, 0)
'########## Request Paramas // ##########

Set objCommon = New clsCommon
Dim arrSupportInfo : arrSupportInfo = objCommon.GetSupportMainInfo(sgCode)
Dim arrProjectList : arrProjectList = objCommon.GetSupportProjectList(sgCode,1)
Set objCommon = Nothing
If IsArray(arrSupportInfo) Then 
	Cols_GroupName			= arrSupportInfo(0,0) 
	Cols_GroupType			= arrSupportInfo(1,0) 
	Cols_Homepage			= arrSupportInfo(2,0) 
	Cols_WorkerName			= arrSupportInfo(3,0) 
	Cols_Tel				= arrSupportInfo(4,0) 
	Cols_Email				= arrSupportInfo(5,0) 
	Cols_PayMethod			= arrSupportInfo(6,0) 
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
	Cols_MapX				= Trim(arrSupportInfo(21,0))
	Cols_MapY				= Trim(arrSupportInfo(22,0))
	Cols_mCode				= arrSupportInfo(23,0)
Else
	Response.redirect "/"
End If

Set objBoard = New clsBoard
Dim arrPhotoList : arrPhotoList = objBoard.GetBoardCommonList("", "", "B0104", sgCode, 0, 3, 1, 3)
Dim arrVodList : arrVodList = objBoard.GetBoardCommonList("", "", "B0105", sgCode, 0, 3, 1, 3)
Dim arrBoardList : arrBoardList = objBoard.GetBoardCommonList("", "", "B0103", sgCode, 0, 3, 1, 3)
Set objBoard = Nothing
 


 
%>
<!-- #include virtual = '/support/include/head.asp' -->
<!-- #include virtual = '/support/include/header.asp' --> 

<style>
.map_box{display:none;}
.sub_tit{max-width:512px;}
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
.con5 .map_info_box {top:80%;margin-left:80px;}
@media all and (max-width:900px) {
	.con5 .map_info_box {
		margin-left:0px;
		top: 80%;
		bottom:20px;
	}
}

</style>
<!-- modal -->

<!-- photo -->
<div class="photo_modal">
    <div class="modal">
        <div class="common_modal_box photo_modal_box">
            <div class="common_slide_arw right"></div>
            <div class="common_slide_arw left"></div>
            <div class="swiper mySwiper modal_slide_01 common_modal_slide">
                <div class="swiper-wrapper"><%
				If IsArray(arrPhotoList) Then
					For i = 0 To UBound(arrPhotoList,2)	
				%>
					<div class="swiper-slide item">
                        <button type="button" class="esc_btn" onclick="photo_modalClose();"></button>
                        <div class="img_wrap">
                            <img src="<%=arrPhotoList(4,i)%>" alt="">
                        </div>
                        <div class="modal_tit">
                            <%=arrPhotoList(2,i)%>
                        </div>
                        <div class="modal_sub_tit">
                            <%=arrPhotoList(5,i)%>
                        </div>
                        <div class="btn_box">
                            <a href="introduce.asp?sgCode=<%=sgCode%>&pCode=<%=arrPhotoList(7,i)%>" target="_blank" class="ok_modal_btn">후원 프로젝트 바로가기</a>
                        </div>
                    </div>
				<%
					Next
				End If%>	

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
                <div class="swiper-wrapper"><%
				If IsArray(arrVodList) Then
					For i = 0 To UBound(arrVodList,2)
						Cols_YoutubeUrl = ""
						If Not(arrVodList(15,i) = "" Or IsNull(arrVodList(15,i))) Then
							If Instr(arrVodList(15,i),"v=") > 0 Then
								Cols_YoutubeUrl = Replace(arrVodList(15,i), "/watch?v=", "/embed/")
							End If
							If Instr(arrVodList(15,i),"https://youtu.be/") > 0 Then
								Cols_YoutubeUrl = Replace(arrVodList(15,i), "https://youtu.be/", "https://www.youtube.com/embed/")
							End If
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
                            <%=arrVodList(2,i)%>
                        </div>
                        <div class="modal_sub_tit">
                            <%=arrVodList(5,i)%>
                        </div>
                        <div class="btn_box">
                            <a href="introduce.asp?sgCode=<%=sgCode%>&pCode=<%=arrVodList(7,i)%>" target="_blank" class="ok_modal_btn">후원 프로젝트 바로가기</a>
                        </div>
                    </div>
				<%
					Next
				End If%>	
                     
                </div>
            </div>
        </div>
    </div>
</div>
<!-- END vod -->

<!-- END modal -->

<!-- container -->
<div id="container" class="">
    <!-- mv -->
    <div class="mv">
        <div class="swiper mySwiper mv_slide_wrap">
            <div class="swiper-wrapper">
                <%If Not(Cols_TitleImg1 = "" Or IsNull(Cols_TitleImg1)) Then%>
				<div class="swiper-slide item">
                    <div class="bg_box" style="background: url('<%=Cols_TitleImg1%>') no-repeat center / cover;">
                    </div>
                    <div class="text_box">
                        <div class="tit"><%=Cols_TitleName%></div>
                        <div class="sub_tit">
                            <%=Cols_TitleDescription%>
                        </div>
                    </div>
                </div>
				<%End If%>
                <%If Not(Cols_TitleImg2 = "" Or IsNull(Cols_TitleImg2)) Then%>
				<div class="swiper-slide item">
                    <div class="bg_box" style="background: url('<%=Cols_TitleImg2%>') no-repeat center / cover;">
                    </div>
                    <div class="text_box">
                        <div class="tit"><%=Cols_TitleName%></div>
                        <div class="sub_tit">
                            <%=Cols_TitleDescription%>
                        </div>
                    </div>
                </div>
				<%End If%>
				<%If Not(Cols_TitleImg3 = "" Or IsNull(Cols_TitleImg3)) Then%>
				<div class="swiper-slide item">
                    <div class="bg_box" style="background: url('<%=Cols_TitleImg3%>') no-repeat center / cover;">
                    </div>
                    <div class="text_box">
                        <div class="tit"><%=Cols_TitleName%></div>
                        <div class="sub_tit">
                            <%=Cols_TitleDescription%>
                        </div>
                    </div>
                </div>
				<%End If%>
            </div>
            <div class="common_slide_arw left"></div>
            <div class="common_slide_arw right"></div>
        </div>
    </div>
    <!-- END mv -->

    <!-- con1 -->
    <div class="con con1">
        <div class="con_inner inner">
            <div class="con1_box">
                <div class="swiper mySwiper con1_slide_wrap">
                    <div class="swiper-wrapper">
					<%If Not(Cols_IntroImg1 = "" Or IsNull(Cols_IntroImg1)) Then%>
                        <div class="swiper-slide item">
                            <div class="img_box">
                                <img src="<%=Cols_IntroImg1%>" alt="">
                            </div>                            
                        </div>
					<%End If%>
					<%If Not(Cols_IntroImg2 = "" Or IsNull(Cols_IntroImg2)) Then%>
                        <div class="swiper-slide item">
                            <div class="img_box">
                                <img src="<%=Cols_IntroImg2%>" alt="">
                            </div>                            
                        </div>
					<%End If%>
					<%If Not(Cols_IntroImg3 = "" Or IsNull(Cols_IntroImg3)) Then%>
                        <div class="swiper-slide item">
                            <div class="img_box">
                                <img src="<%=Cols_IntroImg3%>" alt="">
                            </div>                            
                        </div>
					<%End If%>
                    </div>
                    <div class="swiper-pagination"></div>
                </div>
                <div class="text_box">
                    <div class="alt">
                        <div class="tit"><%=Cols_IntroTitle%></div>
                        <div class="sub_alt">
                            <%=Cols_IntroDescription%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- END con1 -->
	<%If IsArray(arrProjectList) Then%>
    <!-- con2 -->
    <div class="con2 con">
        <div class="con_inner inner">
            <div class="common_slide_arw left"></div>
            <div class="common_slide_arw right"></div>
            <div class="swiper mySwiper con2_slide_wrap">
                <div class="swiper-wrapper">
				<%For i = 0 To UBound(arrProjectList,2)
					If arrProjectList(4,i) > 0 Then
						Cols_rate = arrProjectList(4,i) / arrProjectList(3,i) * 100
						Cols_rateCss = Fix(Cols_rate) '소스점 버리기
					Else
						Cols_rate = 0
						Cols_rateCss = 1
					End If 

				%>
					<div class="swiper-slide item">
                        <div class="left_box">
                            <div class="tit"><%=arrProjectList(2,i)%> </div>
                            <div class="sub_tit">
                                <%=CutString(RemoveHTML(arrProjectList(8,i)),25)%> 
                            </div>
                            <div class="date_box">
                                <div class="d_day">D-<%=arrProjectList(9,i)%></div>
                                <div class="date"><%=fnDateFormat(arrProjectList(7,i),6)%> 까지</div>
                            </div>
                            <div class="common_gage_box">
                                <div class="ment">Donated</div>
                                <div class="bar_box">
                                    <div class="bar" style="width:<%=Cols_rateCss%>%">
                                        <div class="percent"><span><%=FormatNumber(Cols_rate,0)%></span>%</div>
                                    </div>
                                </div>
                            </div>
                            <div class="btm_box">
                                <div class="box">
                                    <div class="name">누적금액</div>
                                    <div class="won">$ <span><%=formatNumber(arrProjectList(4,i),0)%></span></div>
                                </div>
                                <div class="box last">
                                    <div class="name">목표금액</div>
                                    <div class="won">$ <span><%=formatNumber(arrProjectList(3,i),0)%></span></div>
                                </div>
                                <a href="introduce.asp?sgCode=<%=sgCode%>&pCode=<%=arrProjectList(0,i)%>" target="_blank" class="common_h_btn donate_btn">후원하기</a>
                            </div>
                        </div>
                        <div class="right_box">
                            <img src="<%=arrProjectList(1,i)%>" alt="">
                        </div>
                    </div>
				<%Next%>	
                     

                </div>
            </div>
        </div>
    </div>
    <!-- END con2 -->
	<%End If%>
	<% If IsArray(arrPhotoList) Then%>
    <!-- con3 -->
    <div class="con con3">
        <div class="con_inner inner">
            <div class="common_con_tit">PHOTO<span>.</span></div>
            <div class="common_con_sub_tit">프로젝트를 통해 진행중 활동을 보실 수 있습니다.</div>

            <div class="photo_box">
                <%For i = 0 To UBound(arrPhotoList,2)%>
				<div class="box" data-pCode="<%=arrPhotoList(7,i)%>" data-title="<%=arrPhotoList(2,i)%>" data-contents="<%=RemoveHTML(arrPhotoList(5,i))%>" data-img="<%=arrPhotoList(4,i)%>" data-Row="<%=arrPhotoList(10,i)%>">
                    <div class="img_box">
                        <img src="<%=arrPhotoList(4,i)%>" alt="">
                    </div>
                    <div class="btm_box text_ov">
                        <div class="name text_ov"><%=arrPhotoList(2,i)%></div>
                        <button type="button" class="common_h_btn p_btn">Read More</button>
                    </div>
                </div>
                <%Next%>
            </div>
        </div>
    </div>
    <!-- END con3 -->
	<%End If%>
	<%If IsArray(arrVodList) Then%>
    <!-- con4 -->
    <div class="con con4">
        <div class="round_wrap">
            <div class="ani_circle"></div>
        </div>
        <div class="con_inner inner">
            <div class="common_con_tit">VOD<span>.</span></div>
            <div class="video_box">
                <div class="left_box">
                    <img src="<%=arrVodList(4,0)%>" alt="">
                    <button type="button" class="play_btn"></button>
                </div>
                <div class="right_box">
                    <div class="name"><%=arrVodList(2,0)%></div>
                    <div class="alt text_ov3">
                        <%=arrVodList(5,0)%>
                    </div>
                    <div class="btn_box">
                        <button type="button" class="plus_btn" onclick="location.href='vod.asp?sgCode=<%=sgCode%>';"></button>
                        <div class="line"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<%End If%>
    <!-- END con4 -->
	
    <!-- con5 -->
    <div class="con5 con">
        <%If IsArray(arrBoardList) Then%>	
		<div class="inner con_inner">
            <div class="common_con_tit">BOARD<span>.</span></div>
            <div class="board_box">
            <%For i = 0 To UBound(arrBoardList,2)
				If arrBoardList(3,i) = "1" Then
					Cols_SubTitle = "공지사항"
				ElseIf arrBoardList(3,i) = "2" Then
					Cols_SubTitle = "이벤트"
				ElseIf arrBoardList(3,i) = "9" Then
					Cols_SubTitle = "기타"
				Else	
					Cols_SubTitle = ""
				End If%> 
				<div class="box">
                    <div class="tit"><%=Cols_SubTitle%></div>
                    <div class="alt text_ov3">
                        <%=arrBoardList(2,i)%>
                    </div>
                    <div class="btm_box">
                        <span class="date"><%=fnDateFormat(arrBoardList(8,i),6)%></span>
                        <button type="button" class="b_btn" onclick="location.href='board_view.asp?sgCode=<%=sgCode%>&bCode=<%=arrBoardList(0,i)%>';"></button>
                    </div>
                </div>

			<%Next%>     
            </div>
        </div>
		<%End If%>

        <!-- map -->
        <div class="map_box">
            <div class="common_con_tit">후원단체 위치안내<span>.</span></div>
            <div id="map"></div>
			<div class="map_info_box">
				<div class="tit_box">
					<div class="tit"><%=Cols_GroupName%></div>
					<div class="sub_alt"><%=Cols_Addr%></div>
				</div>
				<div class="btm_alt">
					<div class="box">
						<div class="name">Tel</div>
						<span><%=Cols_Tel%></span>
					</div>
					<div class="box">
						<div class="name">Email</div>
						<span><%=Cols_Email%></span>
					</div>
				</div>
			</div>
        </div>
        <!-- END map -->
    </div>
    <!-- END con5 -->
    
</div> 
<!-- END container -->
<%If Not(Cols_MapX = "" or isNull(Cols_MapX)) Then%>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBvnnHgaQdVLIfcsXWOlI0bcoMh3gqmF6Y&callback=initMap"></script>
<script>
	function initMap(){		
		var myLatlng = {lat:<%=NullValue(Cols_MapX,"37.4856641")%>, lng:<%=NullValue(Cols_MapY,"126.8955021")%>};
		var map = new google.maps.Map(document.getElementById('map'), {
			zoom: 18,
			center: myLatlng,
			panControl: false,
			zoomControl: false,
			scaleControl: true,
			mapTypeControl:false,
			overviewMapControl:false,
			draggable: false
		});
		var marker = new google.maps.Marker({
			position: myLatlng,
			map: map 
		});
		var infowindow = new google.maps.InfoWindow({
			content: '<div><img src="<%=Cols_LogoImg%>" style="width:60px;"></div>',
			maxWidth: 300
		});
		infowindow.open(map, marker);		
		$(".map_box").show();
	}
</script>
<%End If%>
<script>
    $(document).ready(function () {
		
        // mv_slide
        var swiper = new Swiper(".mv_slide_wrap", {
            loop: true,
            navigation: {
                nextEl: ".mv_slide_wrap .right",
                prevEl: ".mv_slide_wrap .left",
            },
        });
        // END mv_slide

        // con1_slide
        var swiper2 = new Swiper(".con1_slide_wrap", {
            spaceBetween: 30,
            loop: true,
            // autoplay: {
            //     delay: 2500,
            //     disableOnInteraction: false,
            // },
            pagination: {
                el: ".con1_slide_wrap .swiper-pagination",
                clickable: true,
            },
        });
        // END con1_slide

        // con2_slide
        var swiper3 = new Swiper(".con2_slide_wrap", {
            loop: true,
            spaceBetween: 30,
            navigation: {
                nextEl: ".con2 .right",
                prevEl: ".con2 .left",
            },
        });
        // END con2_slide       

        // photo_modal
        var swiper5 = new Swiper(".modal_slide_01", {
            navigation: {
                nextEl: ".photo_modal_box .right",
                prevEl: ".photo_modal_box .left",
            }//,
			//touchRatio: 0//드래그 금지
        });

        $('.con3 .photo_box .box').on('click', function () {
            $(".photo_modal .modal").fadeIn();
            $('body, html').addClass('on'); 
			var Num = $(this).attr("data-Row");
			swiper5.slideTo(Num-1, 10, false);
        });
        // END photo_modal

        // vod_modal
        var swiper6 = new Swiper(".modal_slide_02", {
            navigation: {
                nextEl: ".vod_modal_box .right",
                prevEl: ".vod_modal_box .left",
            }
        });


        $('.con4 .video_box .left_box').on('click', function () {
            $(".vod_modal .modal").fadeIn();
            $('body, html').addClass('on');
			swiper6.slideTo(0, 10, false);
        });
        // END vod_modal 
 
 
		

    });
    // modal
    // photo
    function photo_modalOpen() {
        $(".photo_modal .modal").fadeIn();
        $('body, html').addClass('on');
    }

    function photo_modalClose() {
        $(".photo_modal .modal").fadeOut();
        $('body, html').removeClass('on');
    }
    // END photo

    // vod
    function vod_modalOpen() {
        $(".vod_modal .modal").fadeIn();
        $('body, html').addClass('on');
    }

    function vod_modalClose() {
        $(".vod_modal .modal").fadeOut();
        $('body, html').removeClass('on');
    }
    // END vod
    
    // END modal

  
</script>

<!-- #include virtual = '/support/include/footer.asp' -->