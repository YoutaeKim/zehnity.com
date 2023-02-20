<!--#include virtual="/common/fun/fncSetup.asp"-->
<!--#include virtual="/common/inc/inc_clsInit.asp"-->
<!--#include virtual="/common/class/clsMember.asp"-->
<%
'########## // Request Paramas ##########
Dim Email			: Email		= fnSqlChk(Trim(Request("email")), 0, 0)
'########## Request Paramas // ##########

Dim bRet : bRet = 1
Dim NewPwd : NewPwd = rndNum(6)
Dim Cols_MSG : Cols_MSG = "이메일 미입력"

If Not(Email = "" Or IsNull(Email)) Then
	Set objMember = New clsMember
	bRet = objMember.setMemberPwdChange(Email, NewPwd)
	Set objMember = Nothing
	If bRet = "2" Then
		Cols_MSG = "해당 정보가 없습니다."
	End If
End If



Dim email_subject, email_body, email_sto

email_subject="임시 비밀번호발송(zehnity)"
email_body =  "임시 비밀번호는 "&NewPwd&" 입니다.<br><br>로그인후 비밀 번호 변경을 하시기 바랍니다."
email_sto = "dbxo@arongroup.co.kr"

Function rndNum(lenNum)
    num = ""
    For i = 1 to lenNum
        Randomize                '//랜덤을 초기화 한다.
        num = num & CInt(Rnd*9)    '//랜덤 숫자를 만든다. 
    Next
    rndNum = num
End Function
 
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
	objJson("MSG")		= "비빌번호 변경 성공"
	objJson("DATA")		= bRet
	Set arrJson			= Nothing
	Call sendemail(email_subject,email_body,email_sto)
Else
	objJson("RESULT")	= "FAIL"
	objJson("MSG")		= Cols_MSG
	objJson("DATA")		= bRet
End If

Response.Write toJson(objJson)
Set objJson = Nothing

%>