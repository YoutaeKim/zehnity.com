<!--#include virtual="/common/fun/fncSetup.asp"-->
<!--#include virtual="/common/inc/inc_clsInit.asp"-->
<!--#include virtual="/common/class/clsCommon.asp"-->
<%
'########## // Request Paramas ##########
Dim sgCode			: sgCode    = fnSqlChk(Request("sgCode"), 0, 0)
Dim Email			: Email		= fnSqlChk(Trim(Request("email")), 0, 0)
Dim userName		: userName	= fnSqlChk(Trim(Request("userName")), 0, 0)
Dim groupName		: groupName = fnSqlChk(Trim(Request("groupName")), 0, 0)
Dim tell			: tell		= fnSqlChk(Trim(Request("tell")), 0, 0)
Dim contents		: contents	= fnSqlChk(Trim(Request("contents")), 0, 0)
'########## Request Paramas // ##########

Dim bRet : bRet = 1
Dim Cols_MSG : Cols_MSG = "잘못된 접근"

Set objCommon = New clsCommon
Dim arrSupportInfo : arrSupportInfo = objCommon.GetSupportMainInfo(sgCode)
Set objCommon = Nothing
If IsArray(arrSupportInfo) Then 
	 
	Cols_Email				= arrSupportInfo(5,0) 
	bRet = 0 
Else
	Cols_MSG = "후원단체 데이터 없음"
	bRet = 2 
End If

 

Dim email_subject, email_body, email_sto

email_subject="(zehnity)1:1 문의"
email_body =  "고객님의 문의 입니다."
email_body =  email_body & "<br><br>이름 : " & userName
email_body =  email_body & "<br><br>단체명 : "& groupName
email_body =  email_body & "<br><br>연락처 : "& tell
email_body =  email_body & "<br><br>이메일 : "& Email
email_body =  email_body & "<br><br>문의내용 : "& contents

email_sto = "dbxo@arongroup.co.kr"
 
 
'Response.write rndNum(6)

'
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


Set objJson = jsObject()
If bRet ="0" Then
	objJson("RESULT")	= "SUCCESS"
	objJson("MSG")		= "문의 메일 발송 성공"
	objJson("DATA")		= bRet
	Set arrJson			= Nothing
	Call sendemail(email_subject,email_body,Cols_Email)
Else
	objJson("RESULT")	= "FAIL"
	objJson("MSG")		= Cols_MSG
	objJson("DATA")		= bRet
End If

Response.Write toJson(objJson)
Set objJson = Nothing

%>