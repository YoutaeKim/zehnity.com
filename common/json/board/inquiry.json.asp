<!--#include virtual="/common/fun/fncSetup.asp"-->
<!--#include virtual="/common/inc/inc_clsInit.asp"-->
<!--#include virtual="/common/class/clsBoard.asp"-->
<%
'########## // Request Paramas ##########
Dim Email			: Email		= fnSqlChk(Trim(Request("Email")), 0, 0)
Dim UserName		: UserName	= fnSqlChk(Trim(Request("UserName")), 0, 0)
Dim WriteCode		: WriteCode	= fnSqlChk(Trim(Request("WriteCode")), 0, 0)
Dim GroupName		: GroupName	= fnSqlChk(Trim(Request("GroupName")), 0, 0)
Dim Tel				: Tel = fnSqlChk(Trim(Request("Tel")), 0, 0)
Dim GroupType		: GroupType	= fnSqlChk(Trim(Request("GroupType")), 0, 0)
Dim Contents		: Contents	= fnSqlChk(Trim(Request("Contents")), 0, 0)
'########## // Request Paramas ########## 
 

Dim bRet 
bRet = 1

If Not(Email = "" Or IsNull(Email)) Then
	Set objBoard = New clsBoard
	bRet = objBoard.SetBoardQnAReg(WriteCode, GroupName, GroupType, UserName, Tel, Email, Contents)
	Set objBoard = Nothing
Else
	If Email = "" Or IsNull(Email) Then
		bRet = 5 
		ColsMsg = "이메일 미입력"
	End If
	

End If




Set objJson = jsObject()
If bRet = "0" Then
	objJson("RESULT")	= "SUCCESS"
	objJson("MSG")		= "등록 성공"
	objJson("DATA")		= bRet
	Set arrJson			= Nothing
Else
	objJson("RESULT")	= "FAIL"
	objJson("MSG")		= ColsMsg
	objJson("DATA")		= bRet
End If

Response.Write toJson(objJson)
Set objJson = Nothing
%>
