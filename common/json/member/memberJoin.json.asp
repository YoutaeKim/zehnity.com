<!--#include virtual="/common/fun/fncSetup.asp"-->
<!--#include virtual="/common/inc/inc_clsInit.asp"-->
<!--#include virtual="/common/class/clsMember.asp"-->
<%
'########## // Request Paramas ##########
Dim Email			: Email		= fnSqlChk(Trim(Request("email")), 0, 0)
Dim UserName		: UserName	= fnSqlChk(Trim(Request("userName")), 0, 0)
Dim UserPwd			: UserPwd	= fnSqlChk(Trim(Request("upw")), 0, 0)
Dim UserPwdRe		: UserPwdRe	= fnSqlChk(Trim(Request("upwRe")), 0, 0)
Dim UserPhone		: UserPhone = fnSqlChk(Trim(Request("userPhone")), 0, 0)
Dim Emailchk		: Emailchk	= fnSqlChk(Trim(Request("emailchk")), 0, 0)
Dim JoinType : JoinType = 0
Dim Auth : Auth = ""

Dim bRet 
bRet = 1

If Not(Email = "" Or IsNull(Email) Or UserPwd = "" Or IsNull(UserPwd)) Then
	Set objMember = New clsMember
	bRet = objMember.setMemberJoin(Email, UserName, UserPhone, UserPwd, JoinType, Auth, sysUserIP)
	Set objMember = Nothing
Else
	If Email = "" Or IsNull(Email) Then
		bRet = 5 
		ColsMsg = "이메일 미입력"
	End If
	If UserPwd = "" Or IsNull(UserPwd) Then
		bRet = 6 
		ColsMsg = "비밀번호 미입력"
	End If

End If


Set objJson = jsObject()
If bRet = "0" Then
	objJson("RESULT")	= "SUCCESS"
	objJson("MSG")		= "가입성공 성공"
	objJson("DATA")		= bRet
	Set arrJson			= Nothing
Else
	objJson("RESULT")	= "FAIL"
	objJson("MSG")		= ColsMsg
	objJson("DATA")		= bRet
End If

Response.Write toJson(objJson)
Set objJson = Nothing
%>
