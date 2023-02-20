<!--#include virtual="/common/fun/fncSetup.asp"-->
<!--#include virtual="/common/inc/inc_clsInit.asp"-->
<!--#include virtual="/common/class/clsCommon.asp"-->
<!--#include virtual="/common/class/clsBoard.asp"-->
<%
'########## // Request Paramas ##########
Dim sgCode       : sgCode         = fnSqlChk(Request("sgCode"), 0, 0)
'########## Request Paramas // ##########

Set objCommon = New clsCommon
Dim arrSupportInfo : arrSupportInfo = objCommon.GetSupportMainInfo(sgCode)
Dim arrProjectList : arrProjectList = objCommon.GetSupportProjectList(sgCode,0)
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
	Cols_MapX				= arrSupportInfo(21,0) 
	Cols_MapY				= arrSupportInfo(22,0) 
Else
	Response.redirect "/"
End If

  Language="KO"
  PageName = "sub01"
  SubName = "ko"
  footer = "add"

   

%>
<!-- #include virtual = '/support/include/head.asp' -->
<!-- #include virtual = '/support/include/header.asp' -->
<!-- #include virtual = '/support/include/sub_title.asp' -->

<!-- modal -->

<!-- END modal -->

<!-- container -->
<div id="container" class="">
    <div class="common_sub_wrap project_wrap">
        <div class="inner sub_inner">
            <div class="project_box_wrap">
<%	
	If IsArray(arrSupportInfo) Then 
		For i = 0 To UBound(arrProjectList,2)
			Cols_Dday = arrProjectList(9,i)
			If arrProjectList(4,i) > 0 Then
				Cols_Rate = arrProjectList(4,i) / arrProjectList(3,i) * 100
			Else
				Cols_Rate = 0
			End If
%>
				<div class="project_box<%If Cols_Dday < 0 Then%> end<%End If%>">
                    <div class="top_box">
                        <div class="left_box">
                            <div class="img_box">
                                <div class="state"><%If Cols_Dday < 0 Then%>종료<%Else%>진행중<%End If%></div>
                                <img src="<%=arrProjectList(1,i)%>" alt="">
                            </div>
                        </div>
                        <div class="alt_box">
                            <div class="tit text_ov2">
                                <%=arrProjectList(2,i)%>
                            </div>
                            <div class="sub_tit text_ov3">
                                <%=RemoveHTML(arrProjectList(8,i))%>
                            </div>
                            <div class="alt_state">
                                <div class="won">
                                    <div class="name">
                                        누적금액
                                    </div>
                                    <div class="num">
                                        <span>$</span>
                                        <%=FormatNumber(arrProjectList(4,i),0)%>
                                    </div>
                                </div>
                                <div class="won">
                                    <div class="name">
                                        목표금액
                                    </div>
                                    <div class="num">
                                        <span>$</span>
                                        <%=FormatNumber(arrProjectList(3,i),0)%>
                                    </div>
                                </div>
                                <div class="won">
                                    <div class="name">
                                        참여인원
                                    </div>
                                    <div class="num">
                                        <%=FormatNumber(arrProjectList(5,i),0)%>
                                    </div>
                                </div>
                            </div>
                            <div class="common_gage_box">
                                <div class="bar_box">
                                    <div class="bar" style="width:<%=FormatNumber(Cols_Rate,0)%>%">
                                        <div class="percent"><span><%=FormatNumber(Cols_Rate,0)%></span>%</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="btm_box">
                        <div class="date_box">
                            <div class="d_day">D-<%If Cols_Dday < 0 Then%>0<%Else%><%=Cols_Dday%><%End If%></div>
                            <div class="day"><%=fnDateFormat(arrProjectList(6,i),6)%> ~ <%=fnDateFormat(arrProjectList(7,i),6)%> 까지</div>
                        </div>
						<%If Cols_Dday < 0 Then%>
						<button class="common_h_btn donate_btn">후원 마감</button>
						<%Else%>
                        <a href="introduce.asp?sgCode=<%=sgCode%>&pCode=<%=arrProjectList(0,i)%>" target="_blank" class="common_h_btn donate_btn d">후원하기</a>
						<%End If%>
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
<!-- END container -->

<script>

    $(document).ready(function () {
        $('.common_gage_box .percent span').each(function (i,v) {
            var num = $(this).text();
            $(this).parent().parent().css('width', num + '%');
        });
    });

</script>

<!-- #include virtual = '/support/include/footer.asp' -->