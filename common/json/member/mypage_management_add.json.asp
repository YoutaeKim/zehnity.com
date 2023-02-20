<!--#include virtual="/common/fun/fncSetup.asp"-->
<!--#include virtual="/common/inc/inc_clsInit.asp"-->
<!--#include virtual="/common/class/clsCommon.asp"-->
<%
'########## // Request Paramas ##########
Dim pCode			: pCode			= fnSqlChk(Trim(Request("pCode")), 0, 0)
Dim sgCode			: sgCode		= fnSqlChk(Trim(Request("sgCode")), 0, 0)
Dim template		: template		= fnSqlChk(Trim(Request("template")), 0, 0)
Dim projectImg		: projectImg	= fnSqlChk(Trim(Request("projectImg")), 0, 0)
Dim projectName		: projectName	= fnSqlChk(Trim(Request("projectName")), 0, 0)
Dim targetMoney		: targetMoney	= fnSqlChk(Trim(Request("targetMoney")), 0, 0)
Dim payMothod		: payMothod		= fnSqlChk(Trim(Request("payMothod")), 0, 0)
Dim tel				: tel			= fnSqlChk(Trim(Request("tel")), 0, 0)
Dim email			: email			= fnSqlChk(Trim(Request("email")), 0, 0)
Dim startDate		: startDate		= fnSqlChk(Trim(Request("startDate")), 0, 0)
Dim endDate			: endDate		= fnSqlChk(Trim(Request("endDate")), 0, 0)
Dim menu			: menu			= fnSqlChk(Trim(Request("menu")), 0, 0)
Dim description		: description	= fnSqlChk(Trim(Request("description")), 0, 0)

targetMoney = NullValue(targetMoney, 0) 

If CKMemberCode = "" Or IsNull(CKMemberCode) Then
	Response.end
End If


Dim bRet : bRet = 1
Dim Cols_MSG : Cols_MSG = "미입력"
Set objCommon = New clsCommon
bRet = objCommon.SetProjectUpdate(pCode, sgCode, CKMemberCode, template, projectImg, ProjectName, targetMoney, PayMothod, tel, email, startDate, endDate, menu, description)
 


Set objJson = jsObject()
If bRet ="0" Then
	objJson("RESULT")	= "SUCCESS"
	objJson("MSG")		= "변경 성공"
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