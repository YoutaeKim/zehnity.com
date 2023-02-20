<!--#include virtual="/common/fun/fncSetup.asp"-->
<!--#include virtual="/common/inc/inc_clsInit.asp"-->
<!--#include virtual="/common/class/clsMember.asp"-->
<%
If CKMemberCode = "" Or IsNull(CKMemberCode) Then
	Response.end
End If

Dim bRet : bRet = 1
Dim Cols_MSG : Cols_MSG = "에러 발생 관리자 문의"
 
	Set objMember = New clsMember
	bRet = objMember.setMemberOut(CKMemberCode)
	Set objMember = Nothing
	If bRet = "2" Then
		Cols_MSG = "정상 회원이 아닙니다."
	End If
 

 

Set objJson = jsObject()
If bRet ="0" Then
	objJson("RESULT")	= "SUCCESS"
	objJson("MSG")		= "탈퇴 성공"
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