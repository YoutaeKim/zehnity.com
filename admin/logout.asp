<!--#include virtual="/common/fun/fncSetup.asp"-->
<!--#include virtual="/common/inc/inc_clsInit.asp"-->
<%
Response.Expires	= -1
Response.AddHeader "cache-control", "no-store"


'// 쿠키 삭제
With Response
	.Cookies("admin")("AdminCode")		= ""
	.Cookies("admin")("AdminName")		= "" 
	.Cookies("admin")("AdminLevel")		= ""
	.Cookies("admin")("AdminId")		= ""
	.Cookies("admin")					= ""
	.Cookies("admin").domain			= sysDomain
	.Cookies("admin").expires			= Date() - 1
	.Cookies("admin").path				= "/"
End With

Session.Abandon()

Call MoveTop("/admin")

%>