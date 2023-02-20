<!--#include virtual="/common/fun/fncSetup.asp"-->
<!--#include virtual="/common/inc/inc_clsInit.asp"-->
<!--#include virtual="/common/class/clsMember.asp"-->
<%
'########## // Request Paramas ##########
Dim NewPwd			: NewPwd		= fnSqlChk(Trim(Request("NewPwd")), 0, 0)
Dim BeforePwd		: BeforePwd		= fnSqlChk(Trim(Request("BeforePwd")), 0, 0)

'########## Request Paramas // ##########

If CKMemberCode = "" Or IsNull(CKMemberCode) Then
	Response.end
End If

Dim bRet : bRet = 1
Dim Cols_MSG : Cols_MSG = "비밀번호 미입력"

If Not( NewPwd = "" Or IsNull(NewPwd) Or BeforePwd = "" Or IsNull(BeforePwd) ) Then
	Set objMember = New clsMember
	bRet = objMember.setMypagePwdChange(CKMemberCode, BeforePwd, NewPwd)
	Set objMember = Nothing
	If bRet = "2" Then
		Cols_MSG = "기존 비밀번호가 다릅니다."
	End If
Else
	bRet = 3
	Cols_MSG = "비밀번호 미입력"
End If

 

Set objJson = jsObject()
If bRet ="0" Then
	objJson("RESULT")	= "SUCCESS"
	objJson("MSG")		= "비밀번호 변경 성공"
	objJson("DATA")		= bRet
	Set arrJson			= Nothing	 
Else
	objJson("RESULT")	= "FAIL"
	objJson("MSG")		= Cols_MSG
	objJson("DATA")		= bRet
End If

Response.Write toJson(objJson)
Set objJson = Nothing

%>