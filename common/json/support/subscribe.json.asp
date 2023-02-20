<!--#include virtual="/common/fun/fncSetup.asp"-->
<!--#include virtual="/common/inc/inc_clsInit.asp"-->
<!--#include virtual="/common/class/clsCommon.asp"-->
<%
'########## // Request Paramas ##########
Dim sgCode			: sgCode    = fnSqlChk(Request("sgCode"), 0, 0)
Dim Email			: Email		= fnSqlChk(Trim(Request("email")), 0, 0) 
'########## Request Paramas // ##########

Dim bRet : bRet = 1
Dim Cols_MSG : Cols_MSG = "잘못된 접근"


If Not( sgCode = "" Or IsNull(sgCode) Or Email = "" Or IsNull(Email) ) Then 
	Set objCommon = New clsCommon	
	bRet = objCommon.SetSubscribeEmailUpdate(sgCode, Email)
	Set objCommon = Nothing
End If



Set objJson = jsObject()
If bRet ="0" Then
	objJson("RESULT")	= "SUCCESS"
	objJson("MSG")		= "업데이트 성공"
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