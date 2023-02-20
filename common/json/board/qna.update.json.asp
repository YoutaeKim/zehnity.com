<!--#include virtual="/common/fun/fncSetup.asp"-->
<!--#include virtual="/common/inc/inc_clsInit.asp"-->
<!--#include virtual="/common/class/clsBoard.asp"-->
<%
'########## // Request Paramas ##########
Dim qCode			: qCode			= fnSqlChk(Trim(Request("qCode")), 0, 0) 
Dim aCode			: aCode			= fnSqlChk(Trim(Request("aCode")), 0, 0)
Dim isDel			: isDel			= fnSqlChk(Trim(Request("isDel")), 0, 0)
Dim replay			: replay		= fnSqlChk(Trim(Request("replay")), 0, 0)
Dim email			: email			= fnSqlChk(Trim(Request("email")), 0, 0)
Dim emailCheck		: emailCheck	= fnSqlChk(Trim(Request("emailCheck")), 0, 0)
'########## // Request Paramas ########## 
isDel = NullValue(isDel,0)

If CkAdminCode = "" Or IsNull(CkAdminCode) Then
	Response.End
End If


Dim bRet 
bRet = 1

If Not(qCode = "" Or IsNull(qCode)) Then
	Set objBoard = New clsBoard
	bRet = objBoard.SetBoardQnAUpdate(qCode, aCode, isDel, replay)
	Set objBoard = Nothing
Else	
	bRet = 1 
	ColsMsg = "게시판 고유코드 미입력"
End If 

Set objJson = jsObject()
If bRet = "0" Then
	objJson("RESULT")	= "SUCCESS"
	objJson("MSG")		= "변경 성공"
	objJson("DATA")		= bRet
	Set arrJson			= Nothing
	If isDel = "0" AND emailCheck = "0" Then
		subject = "(zehnity)1:1 문의 답변입니다."
		body	= replay
		sto		= email
		Call sendemail(subject,body,sto)
	End If
Else
	objJson("RESULT")	= "FAIL"
	objJson("MSG")		= ColsMsg
	objJson("DATA")		= bRet
End If

Response.Write toJson(objJson)
Set objJson = Nothing

Sub sendemail(subject,body,sto)
	Set objMessage = CreateObject("CDO.Message") 
	objMessage.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
	objMessage.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserver")="smtp.gmail.com"
	objMessage.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1
	objMessage.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusername") = "arondbxo@gmail.com"
	objMessage.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendpassword") = "kijlopqrahxhrzeo" ' change thus
	objMessage.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 465
	objMessage.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpusessl") = 1
	objMessage.Configuration.Fields.Update
	objMessage.Subject = subject
	objMessage.Sender = "arondbxo@gmail.com" 
	objMessage.bcc = "arondbxo@gmail.com"
	objMessage.BodyPart.Charset="utf-8"
	objMessage.HtmlBody = body
	objMessage.HTMLBodyPart.Charset="utf-8" 
	objMessage.To = sto

	objMessage.Send
	Set objMessage = Nothing 
End Sub


%>
