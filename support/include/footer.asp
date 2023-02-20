<style>
.common_select{
	height: 50px;
	line-height: 50px;
}
</style>
<% If SubName = "ko" Then%>
<% If footer = "add" Then

Set objCommon = New clsCommon
Dim arrDonation : arrDonation = objCommon.GetDonationList()
Set objCommon = Nothing


%>


<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
<!-- 
<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script> -->
<!-- cash -->
<div class="cash_modal">
    <div class="modal ">
        <div class="common_modal_box cash_modal_box">
            <div class="common_slide_arw right"></div>
            <div class="common_slide_arw left"></div>
            <div class="swiper mySwiper modal_slide_03 common_modal_slide">
                <div class="swiper-wrapper">
<%
	If IsArray(arrDonation) Then
		For i = 0 To UBound(arrDonation,2)
%>                    
					<div class="swiper-slide item">
                        <button type="button" class="esc_btn" onclick="cash_modalClose();"></button>
                        <div class="text_box">
                            <div class="bg_box">
                                <img src="/support/image/main/con6_img_0<%=arrDonation(0,i)%>.png" alt="">
                            </div>
                            <div class="tit"><%=arrDonation(2,i)%></div>
                            <div class="sub_tit">
                                <%=arrDonation(3,i)%>
                            </div>
                        </div>
                        <div class="btm_box">
                            <div class="sub_box">
                                <div class="left_box">
                                    <label for="dMoney<%=i%>" class="common_input_box">
                                        금액
                                        <div class="won_box">
                                            <input type="text" class="common_input cash" id="dMoney<%=i%>"
                                                placeholder="금액을 입력해주세요" onlyNumber>
                                        </div>
                                    </label>
                                    <label for="userName<%=i%>" class="common_input_box">
                                        이름
                                        <input type="text" class="common_input" id="userName<%=i%>" placeholder="이름을 입력해주세요">
                                    </label>
                                    <label for="payMethod<%=i%>" class="common_input_box">
                                        결제방식
                                        <select class="common_select" id="payMethod<%=i%>">
											<%If Instr(Cols_PayMethod,"card") > 0 Then%>
                                            <option value="card">신용카드</option>
											<%End If%>
											<%If Instr(Cols_PayMethod,"bank") > 0 Then%>
											<option value="bank">무통장입금</option>
											<%End If%>
                                        </select>
                                    </label>
                                </div>
                                <label for="prayerTitle<%=i%>" class="common_input_box right_box">
                                    기도제목
                                    <textarea id="prayerTitle<%=i%>" class="common_textarea_box"
                                        placeholder="기도제목을 간략하게 입력해주세요."></textarea>
                                </label>
                            </div>
                            <div class="btn_box">
                                <a href="javascript:;" class="ok_modal_btn donation" data-code="<%=arrDonation(1,i)%>" data-idx="<%=i%>">헌금하기</a>
                            </div>
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
<!-- END cash -->

<!-- con6 -->
<div class="con con6">
    <div class="top_bg"></div>
    <div class="con6_slide_wrap">
        <div class="left_box">
            <div class="common_con_tit">온라인 헌금<span>.</span></div>
            <div class="common_con_sub_tit">
                교회 모든 헌금은 인터넷뱅킹, <br class="hide-900" />
                무통장 입금, 폰뱅킹 등을 통해서 <br class="hide-900" />
                헌금하실 수 있습니다.
            </div>
            <div class="arw_box">
                <div class="left"></div>
                <div class="right"></div>
            </div>
        </div>
        <div class="con6_slide_box">
            <div class="swiper mySwiper con6_slide">
                <div class="swiper-wrapper">
<%
	If IsArray(arrDonation) Then
		For i = 0 To UBound(arrDonation,2)
%>
	
					<div class="swiper-slide item" data-idx="<%=i%>">
                        <div class="img_box">
                            <img src="/support/image/main/con6_img_0<%=arrDonation(0,i)%>.png" alt="">
                        </div>
                        <div class="btm_box">
                            <div class="name"><%=arrDonation(2,i)%></div>
                            <div class="alt">
                                <%=arrDonation(3,i)%>
                            </div>
                            <div class="b_arw"></div>
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
<!-- END con6 -->
<% End If %>
<!--Footer-->
<div id="footer">
    <div class="footer_inner">
        <div class="f_logo" STYLE="background: url(<%=Cols_LogoImg%>) no-repeat center / contain;" onclick="location.href='/support/main.asp?sgCode=<%=sgCode%>';"></div>
        <div class="f_info_box">
            <div class="box">
                <div class="tit">EAST LAKE MACQUARIE ANGLICAN</div>
                <div class="alt">
                    Parish Priest: Peter Tinney (0451 677 701) <br />
                    Ministry Days: Sunday to Thursday <br />
                    Associate Priest (p/t): Alison Wooden (0418 630 856)
                </div>
            </div>

            <div class="box">
                <div class="tit">General Contact details</div>
                <div class="alt">
                    PO BOX 116, Belmont 2280
                    <div class="sub_box">
                        <div class="icon"></div>
                        02. 4945. 0575
                    </div>
                    <div class="sub_box">
                        <div class="icon"></div>
                        sendmail@anglican.com
                    </div>
                </div>
            </div>

            <div class="box">
                <div class="tit">SUBSCRIBE TO NEWS & UPDATES</div>
                <div class="send_box">
                    <input type="text" class="send_input" id="subEmail">
                    <button type="button" class="send_btn common_h_btn">SEND</button>
                </div>
                <div class="alt">
                    Enter your email address to receive news <br />
                    If you no longer receive an email, please re-enter your email address.
                </div>
            </div>
        </div>
    </div>
    <div class="copy">COPYRIGHT©2022 Macquarie Anglican Church.<br class="hide-default show-900" /> All Rights Reserved.
    </div>
</div>
<!--END Footer-->
<% End If %>

<% If SubName = "en" then %>
<!--Footer-->

<!--END Footer-->
<% End If %>

</div>
<!--END Wrap-->

<script>
    $(document).ready(function () {
        // con6_slide
        var swiper4 = new Swiper(".con6_slide", {
            loop: true,
            slidesPerView: 'auto',
            spaceBetween: 20,            
            navigation: {
                nextEl: ".con6 .right",
                prevEl: ".con6 .left",
            },
            breakpoints: {
                900: {
                    slidesPerView: 'auto',
                    spaceBetween: 50,
                },
            },
        });
        // END con6_slide

        // cash_modal
        var swiper7 = new Swiper(".modal_slide_03", {
			//allowTouchMove: false,
            navigation: {
                nextEl: ".cash_modal_box .right",
                prevEl: ".cash_modal_box .left",
            },
        });


        $('.con6 .con6_slide .item').on('click', function () {
            $(".cash_modal .modal").fadeIn();
            $('body, html').addClass('on');
			$(".common_textarea_box").val('');
			$(".common_input").val('');
			var Num = $(this).attr("data-idx")			
			swiper7.slideTo(Num, 10, false);
        });
        // END cash_modal
		$('.send_btn.common_h_btn').on('click', function () {
			if($("#subEmail").val()==""){
				alert("이메일을 입력해주세요.");
				$("#subEmail").focus();
				return false;
			}
			var regExp = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.[a-zA-Z]{2,4}$/;
			if(!regExp.test($("#subEmail").val())){
				alert("이메일 형식이 아닙니다.");
				$("#subEmail").focus();
				return false;
			}
			$.ajax({
				url : "/common/json/support/subscribe.json.asp",
				type : "post",
				data : {sgCode:"<%=sgCode%>", email:$("#subEmail").val()},
				dataType : 'json',
				success : function(result){
					if(result.DATA =="0"){
						alert("등록 완료 되었습니다.");						
					}else{
						alert("등록 실패 하였습니다.\n관리자에게 문의 해주세요.");
					}
					$("#subEmail").val('');
				},
				error : function(){
					alert("서버요청실패");
					$("#subEmail").val('');
				}
			});
		});

		//헌금하기 클릭시
		$(".ok_modal_btn.donation").on('click', function () {

			var idx = $(this).attr("data-idx");
			var dType = $(this).attr("data-code");
			if( $("#dMoney"+idx).val()==""){
				alert("금액을 입력해주세요.");
				$("#dMoney"+idx).focus();
				return false;
			}
			if( $("#userName"+idx).val()==""){
				alert("이름을 입력해주세요.");
				$("#userName"+idx).focus();
				return false;
			}
			$.ajax({
				url : "/common/json/support/donation.pay.json.asp",
				type : "post",
				data : {sgCode:<%=sgCode%>, dType:dType, userName:$("#userName"+idx).val(), dMoney:$("#dMoney"+idx).val() ,payMethod:$("#payMethod"+idx).val(), prayerTitle:$("#prayerTitle"+idx).val(), pgUsed:0, pgAuth:""},
				dataType : 'json',
				success : function(result){
					console.log(result);
					if(result.RESULT =="SUCCESS"){
						alert("등록 완료 되었습니다.");
						cash_modalClose();
						//location.reload();						
					}else{
						alert("등록 실패 하였습니다.\n관리자에게 문의 해주세요.");
					}
					
				},
				error : function(){
					alert("서버요청실패");
					 
				}
			});

	    });
		//숫자만 입력
		$('input[onlyNumber]').on('keyup', function () {
			$(this).val($(this).val().replace(/[^0-9]/g, ""));
		});
    });
    // cash
    function cash_modalOpen() {
        $(".cash_modal .modal").fadeIn();
        $('body, html').addClass('on');
    }

    function cash_modalClose() {
        $(".cash_modal .modal").fadeOut();
        $('body, html').removeClass('on');
    }
    // END cash

    // 하단
    function scrollDown() {
        $("html, body").animate({
            scrollTop: $('.con6').offset().top - 130
        }, 500);
    }
    // END 하단
</script>

</body>


</html>