<!--#include virtual="/common/fun/fncSetup.asp"-->
<!--#include virtual="/common/inc/inc_clsInit.asp"-->
<!--#include virtual="/common/class/clsCommon.asp"-->
<%
'########## // Request Paramas ##########
Dim sgCode			: sgCode		= fnSqlChk(Request("sgCode"), 0, 0)
Dim dType			: dType			= fnSqlChk(Request("dType"), 0, 0)
Dim userName		: userName		= fnSqlChk(Trim(Request("userName")), 0, 0) 
Dim dMoney			: dMoney		= fnSqlChk(Request("dMoney"), 0, 0)
Dim payMethod		: payMethod		= fnSqlChk(Request("payMethod"), 0, 0)
Dim prayerTitle		: prayerTitle	= fnSqlChk(Trim(Request("prayerTitle")), 0, 0) 
Dim pgUsed			: pgUsed		= fnSqlChk(Request("pgUsed"), 0, 0)
Dim pgAuth			: pgAuth		= fnSqlChk(Trim(Request("pgAuth")), 0, 0) 
'########## Request Paramas // ##########
'임시로
'pgUsed = 0
pgAuth = ""
Dim bRet : bRet = 0
Dim Cols_MSG : Cols_MSG = "잘못된 접근"


If Not( sgCode = "" Or IsNull(sgCode) Or dType = "" Or IsNull(dType) ) Then 
	Set objCommon = New clsCommon	
	bRet = objCommon.SetDonationReg(sgCode, dType, dMoney, userName, payMethod, prayerTitle, pgUsed, pgAuth)	
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