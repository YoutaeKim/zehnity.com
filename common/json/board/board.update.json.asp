<!--#include virtual="/common/fun/fncSetup.asp"-->
<!--#include virtual="/common/inc/inc_clsInit.asp"-->
<!--#include virtual="/common/class/clsBoard.asp"-->
<%
'########## // Request Paramas ##########
'bCode,bType, mCode, writeName, title, subTitle, titleImg, fileName, youtubeUrl, contents, open, sgCode, pCode
Dim bCode			: bCode		= fnSqlChk(Trim(Request("bCode")), 0, 0) 
Dim bType			: bType		= fnSqlChk(Trim(Request("bType")), 0, 0) 
Dim mCode			: mCode		= fnSqlChk(Trim(Request("mCode")), 0, 0) 
Dim writeName		: writeName	= fnSqlChk(Trim(Request("writeName")), 0, 0) 
Dim title			: title		= fnSqlChk(Trim(Request("title")), 0, 0) 
Dim subTitle		: subTitle	= fnSqlChk(Trim(Request("subTitle")), 0, 0) 
Dim titleImg		: titleImg	= fnSqlChk(Trim(Request("titleImg")), 0, 0) 
Dim fileName		: fileName	= fnSqlChk(Trim(Request("fileName")), 0, 0) 
Dim youtubeUrl		: youtubeUrl= fnSqlChk(Trim(Request("youtubeUrl")), 0, 0) 
Dim contents		: contents	= fnSqlChk(Trim(Request("contents")), 0, 0) 
Dim open			: open		= fnSqlChk(Trim(Request("open")), 0, 0) 
Dim sgCode			: sgCode	= fnSqlChk(Trim(Request("sgCode")), 0, 0) 
Dim pCode			: pCode		= fnSqlChk(Trim(Request("pCode")), 0, 0) 
'########## // Request Paramas ########## 

subTitle = NullValue(subTitle, 0)
sgCode = NullValue(sgCode, 0)
pCode = NullValue(pCode, 0)
If CKMemberCode = "" Or IsNull(CKMemberCode) Then
	If CkAdminCode = "" Or IsNull(CkAdminCode) Then
		Response.End
	End If
End If

Dim bRet , ArrUrl
bRet = 1
If bType = "B0105" And Instr(youtubeUrl,"v=") > 0 Then 'VOD 이미지 추출
	ArrUrl = Split(Trim(youtubeUrl),"v=")
	titleImg = " https://img.youtube.com/vi/" & ArrUrl(1) & "/mqdefault.jpg"
End If
If bType = "B0105" And Instr(youtubeUrl,"https://youtu.be/") > 0 Then 'VOD 이미지 추출
	ArrUrl = Split(Trim(youtubeUrl),".be/")
	titleImg = " https://img.youtube.com/vi/" & ArrUrl(1) & "/mqdefault.jpg"
End If



If Not(bCode = "" Or IsNull(bCode)) Then
	Set objBoard = New clsBoard
	bRet = objBoard.SetBoardCommonUpdate(bCode, bType, mCode, writeName, title, subTitle, titleImg, fileName, youtubeUrl, contents, Open, sgCode, pCode)
	Set objBoard = Nothing
Else	
	bRet = 1 
	ColsMsg = "게시판 고유코드 미입력"
End If 

Set objJson = jsObject()
If bRet = "0" Then
	objJson("RESULT")	= "SUCCESS"
	objJson("MSG")		= "저장 성공"
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
