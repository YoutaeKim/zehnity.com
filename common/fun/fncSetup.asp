<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %> 
<%
Response.codepage	= 65001 
Response.ContentType= "text/html; charset=utf-8" 

'Response.AddHeader "Set-Cookie", "cookie_name=cookie_value;SameSite=None;"
With Request
	Dim sysServerHost   : sysServerHost = .ServerVariables("HTTP_HOST")
	Dim sysUserRefer	: sysUserRefer	= .ServerVariables("HTTP_REFERER")
	Dim sysUserIP		: sysUserIP		= .ServerVariables("HTTP_X_FORWARDED_FOR") 
	If sysUserIP = "" Or IsNull(sysUserIP) Then
		sysUserIP		= .ServerVariables("REMOTE_ADDR")
	End If
	Dim sysClientIp		: sysClientIp	= .ServerVariables("HTTP_CLIENT_IP")
	Dim sysThisUrl		: sysThisUrl	= .ServerVariables("URL")

	'유저
	Dim CKMemberCode	: CKMemberCode	= .Cookies("user")("MemberCode")
	Dim CKEmail			: CKEmail		= .Cookies("user")("Email")
	Dim CKUserName		: CKUserName	= .Cookies("user")("UserName")
	Dim CKLanguage		: CKLanguage	= .Cookies("user")("Language")
	Dim CKJoinType		: CKJoinType	= .Cookies("user")("JoinType")
	

	'관리자
	Dim CkAdminCode		: CkAdminCode	= .Cookies("admin")("AdminCode")
	Dim CkAdminName		: CkAdminName	= .Cookies("admin")("AdminName")
	Dim CkAdminId		: CkAdminId		= .Cookies("admin")("AdminId")

End With

Dim arrServerHost	: arrServerHost = Split(sysServerHost, ".")
Dim sysDomain		: sysDomain		= "172.16.20.81"


'Response.Write "<br>sysServerHost : " & sysServerHost
'Response.Write "<br>sysDomain : " & sysDomain
'Response.Write "<br>sysUserRefer : " & sysUserRefer
'Response.Write "<br>sysUserIP : " & sysUserIP
'Response.Write "<br>sysClientIp : " & sysClientIp

%>
<!--#include virtual="/common/fun/fncCommon.asp"-->

