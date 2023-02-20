<!--#include virtual="/common/fun/fncSetup.asp"-->
<!--#include virtual="/common/inc/inc_clsInit.asp"-->
<!--#include virtual="/common/class/clsCommon.asp"-->
<%
'########## // Request Paramas ##########
Dim sgCode			: sgCode		= fnSqlChk(Request("sgCode"), 0, 0)
Dim pCode			: pCode			= fnSqlChk(Request("pCode"), 0, 0)
Dim spName			: spName		= fnSqlChk(Trim(Request("spName")), 0, 0) 
Dim spMoney			: spMoney		= fnSqlChk(Request("spMoney"), 0, 0)
Dim spNameSecret	: spNameSecret	= fnSqlChk(Request("spNameSecret"), 0, 0)
Dim spMoneySecret	: spMoneySecret = fnSqlChk(Request("spMoneySecret"), 0, 0)
Dim payMethod		: payMethod		= fnSqlChk(Request("payMethod"), 0, 0)
Dim spContents		: spContents	= fnSqlChk(Trim(Request("spContents")), 0, 0) 
Dim pgUsed			: pgUsed		= fnSqlChk(Request("pgUsed"), 0, 0)
Dim pgAuth			: pgAuth		= fnSqlChk(Trim(Request("pgAuth")), 0, 0) 
'########## Request Paramas // ##########
'임시로
'pgUsed = 0
pgAuth = ""
Dim bRet : bRet = 1
Dim Cols_MSG : Cols_MSG = "잘못된 접근"


If Not( sgCode = "" Or IsNull(sgCode) Or pCode = "" Or IsNull(pCode) ) Then 
	Set objCommon = New clsCommon	
	bRet = objCommon.SetProjectSupportUpdate(sgCode, pCode, spName, spMoney, spNameSecret, spMoneySecret, payMethod, spContents, pgUsed, pgAuth)
	Set objCommon = Nothing
End If



Set objJson = jsObject()
If bRet <> "0" Then
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