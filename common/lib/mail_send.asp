<!--#include virtual="/common/fun/fncSetup.asp"--><%




Dim email_subject, email_body, email_sto

email_subject="임시 비밀번호발송(zehnity)"
email_body =  "임시 비밀번호는 1234 입니다.<br><br>로그인후 비밀 번호 변경을 하시기 바랍니다."
email_sto = "dbxo@arongroup.co.kr"

Function rndNum(lenNum)
    num = ""
    For i = 1 to lenNum
        Randomize                '//랜덤을 초기화 한다.
        num = num & CInt(Rnd*9)    '//랜덤 숫자를 만든다. 
    Next
    rndNum = num
End Function
 
Response.write rndNum(6)

'Call sendemail(email_subject,email_body,email_sto)
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