<!--#include virtual="/common/fun/fncSetup.asp"-->
<!--#include virtual="/common/inc/inc_clsInit.asp"-->
<!--#include virtual="/common/class/clsMember.asp"-->
<%
'########## // Request Paramas ##########
Dim uid			: uid		= fnSqlChk(Trim(Request("email")), 0, 0)
'########## Request Paramas // ##########

Dim bRet : bRet = False
Dim Cols_Data : Cols_Data = 9



 
If Not(uid = "" Or IsNull(uid)) Then
	Set objMember = New clsMember
	Dim arrData : arrData = objMember.EamilCheck(uid)
	Set objMember = Nothing

	Dim Cols_mCode

	If IsArray(arrData) Then
		Cols_Data	= arrData(0,0)
		bRet = True 		
	Else
		Cols_MSG = "해당 이메일은 가입된 정보가 없습니다."
		Cols_Data = 9
	End If
Else
	Cols_MSG = "이메일정보가 없습니다."
	Cols_Data = 9
End If


Set objJson = jsObject()
If bRet Then
	objJson("RESULT")	= "SUCCESS"
	objJson("MSG")		= "조회 성공"
	objJson("DATA")		= Cols_Data
	Set arrJson			= Nothing
Else
	objJson("RESULT")	= "FAIL"
	objJson("MSG")		= Cols_MSG
	objJson("DATA")		= Cols_Data
End If

Response.Write toJson(objJson)
Set objJson = Nothing

%>