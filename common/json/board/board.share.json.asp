<!--#include virtual="/common/fun/fncSetup.asp"-->
<!--#include virtual="/common/inc/inc_clsInit.asp"-->
<!--#include virtual="/common/class/clsBoard.asp"-->
<%
'########## // Request Paramas ##########
Dim bCode			: bCode		= fnSqlChk(Trim(Request("bCode")), 0, 0) 
Dim bOpen			: bOpen		= fnSqlChk(Trim(Request("bOpen")), 0, 0) 
'########## // Request Paramas ########## 
  
If CKMemberCode = "" Or IsNull(CKMemberCode) Then
	If CkAdminCode = "" Or IsNull(CkAdminCode) Then
		Response.End
	End If
End If

Dim bRet 
bRet = 1

If Not(bCode = "" Or IsNull(bCode)) Then
	Set objBoard = New clsBoard
	bRet = objBoard.SetBoardCommonShare(bCode, bOpen)
	Set objBoard = Nothing
Else	
	bRet = 1 
	ColsMsg = "게시판 고유코드 미입력"
End If 

Set objJson = jsObject()
If bRet = "0" Then
	objJson("RESULT")	= "SUCCESS"
	objJson("MSG")		= "업데이트 성공"
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
