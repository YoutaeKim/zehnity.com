<!--#include virtual="/common/fun/fncSetup.asp"-->
<!--#include virtual="/common/inc/inc_clsInit.asp"-->
<%
Response.Expires	= -1
Response.AddHeader "cache-control", "no-store"


'// 쿠키 삭제
With Response
	.Cookies("user")("MemberCode")		= ""
	.Cookies("user")("Email")			= ""
	.Cookies("user")("UserName")		= ""
	.Cookies("user")("JoinType")		= ""

	.Cookies("user")					= ""
	.Cookies("user").domain				= sysDomain
	.Cookies("user").expires			= Date() - 1
	.Cookies("user").path				= "/"
End With

Session.Abandon()

Call MoveTop("/en/main.asp")

%>