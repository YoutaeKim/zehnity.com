<!--#include virtual="/common/fun/fncSetup.asp"-->
<!--#include virtual="/common/inc/inc_clsInit.asp"-->
<!--#include virtual="/common/class/clsCommon.asp"-->
<%
'########## // Request Paramas ##########
Dim sgMode			: sgMode			= fnSqlChk(Trim(Request("sgMode")), 0, 0)
Dim sgCode			: sgCode			= fnSqlChk(Trim(Request("sgCode")), 0, 0)

Dim sgTemplate		: sgTemplate		= fnSqlChk(Trim(Request("sgTemplate")), 0, 0)
Dim sgLogoImg		: sgLogoImg			= fnSqlChk(Trim(Request("sgLogoImg")), 0, 0)
Dim	groupType		: groupType			= fnSqlChk(Trim(Request("groupType")), 0, 0)
Dim	payMethod		: payMethod			= fnSqlChk(Trim(Request("payMethod")), 0, 0)
Dim groupName		: groupName			= fnSqlChk(Trim(Request("groupName")), 0, 0)
Dim tell			: tell				= fnSqlChk(Trim(Request("tell")), 0, 0)
Dim email			: email				= fnSqlChk(Trim(Request("email")), 0, 0)
Dim homePage		: homePage			= fnSqlChk(Trim(Request("homePage")), 0, 0)
Dim address			: address			= fnSqlChk(Trim(Request("address")), 0, 0)
Dim description		: description		= fnSqlChk(Trim(Request("description")), 0, 0) 
Dim workerName		: workerName		= fnSqlChk(Trim(Request("workerName")), 0, 0) 

Dim titleImg1		: titleImg1			= fnSqlChk(Trim(Request("titleImg1")), 0, 0) 
Dim titleImg2		: titleImg2			= fnSqlChk(Trim(Request("titleImg2")), 0, 0) 
Dim titleImg3		: titleImg3			= fnSqlChk(Trim(Request("titleImg3")), 0, 0) 
Dim titleName		: titleName			= fnSqlChk(Trim(Request("titleName")), 0, 0) 
Dim titleDesc		: titleDesc			= fnSqlChk(Trim(Request("titleDesc")), 0, 0) 
Dim introImg1		: introImg1			= fnSqlChk(Trim(Request("introImg1")), 0, 0) 
Dim introImg2		: introImg2			= fnSqlChk(Trim(Request("introImg2")), 0, 0) 
Dim introImg3		: introImg3			= fnSqlChk(Trim(Request("introImg3")), 0, 0) 
Dim introTitle		: introTitle		= fnSqlChk(Trim(Request("introTitle")), 0, 0) 
Dim introDesc		: introDesc			= fnSqlChk(Trim(Request("introDesc")), 0, 0) 
Dim mapX			: mapX				= fnSqlChk(Trim(Request("mapX")), 0, 0)
Dim mapY			: mapY				= fnSqlChk(Trim(Request("mapY")), 0, 0) 

'########## Request Paramas // ##########
If sgMode = "" Or IsNull(sgMode) Then
	Response.end
End If


 
If CKMemberCode = "" Or IsNull(CKMemberCode) Then
	Response.end
End If
'Response.Write "<br>description=" & description
'Response.Write "<br>len=" & Len(description)
'Response.end

Dim bRet : bRet = 1
Dim Cols_MSG : Cols_MSG = "미입력"

If Not( sgCode = "" Or IsNull(sgCode) Or sgMode = "" Or IsNull(sgMode) ) Then
	Set objCommon = New clsCommon
'	If sgMode = "default" Then		
		bRet = objCommon.SetSystemUpdate(CKMemberCode, sgCode , groupName, groupType, homePage, workerName, tell, email, payMethod, sgLogoImg, address, description, sgTemplate)		
'	Else
		If bRet ="0" Then
			bRet = objCommon.SetSupportGroupAddUpdate(sgCode, titleImg1, titleImg2, titleImg3, titleName, titleDesc, introImg1, introImg2, introImg3, introTitle, introDesc, mapX, mapY )
		End If
'	End If
	Set objCommon = Nothing

Else
	bRet = 3
	Cols_MSG = "잘못된 접근입니다."
End If

 

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