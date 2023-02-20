<!--#include virtual="/common/fun/fncSetup.asp"-->
<!--#include virtual="/common/inc/inc_clsInit.asp"-->
<!--#include virtual="/common/lib/freeASPUpload.asp" -->
<!--#include virtual="/common/class/clsCommon.asp"-->
<%
'	Response.Expires = -1
'	Server.ScriptTimeout = 600
'	Session.CodePage  = 65001

	 

	Dim saveType		: saveType = "system"	
	Dim strUrlPath		: strUrlPath  = "/attachfiles/" & saveType & "/"
	Dim folderPath		: folderPath  = Server.MapPath(strUrlPath)

	

	Dim Upload, fileName, fileSize, fileExt, ks, fileUrl
	Set Upload = New FreeASPUpload
	Dim upload_filename
	Dim fileInfo
	
	
	fileInfo = Upload.SaveFile_Info(folderPath)
	 
	If Not(fileInfo = "" Or IsNull(fileInfo)) Then
		fileSize	= Split(fileInfo,"/")(0)
		fileExt		= Split(fileInfo,"/")(1)
		fileSize	= NullValue(fileSize, 0) 

		If fileSize = 0 Then
			upload_filename = ""	
			message = "업로드 파일이 존재하지 않습니다."
		ElseIf UCase(fileExt) = "JPG" Or UCase(fileExt) = "GIF" Or UCase(fileExt) = "PNG" Or UCase(fileExt) = "PDF" Or UCase(fileExt) = "ZIP" Or UCase(fileExt) = "XLS" Or UCase(fileExt) = "XLSX" Or UCase(fileExt) = "TXT"  Then
			upload_filename = Upload.DocumentSaveFile(folderPath)
			message = ""
		Else
			upload_filename = ""	
			message = "정상적인 파일을 올려주세요."
		End If 	
		
		fileUrl = strUrlPath & upload_filename
	End If

	'########## // Request Paramas ##########
	Dim GroupName		: GroupName		= fnSqlChk(Trim(Upload.Form("GroupName")), 0, 0)
	Dim GroupType		: GroupType		= fnSqlChk(Trim(Upload.Form("GroupType")), 0, 0)
	Dim Homepage		: Homepage		= fnSqlChk(Trim(Upload.Form("Homepage")), 0, 0)
	Dim WorkerName		: WorkerName	= fnSqlChk(Trim(Upload.Form("WorkerName")), 0, 0)
	Dim Tel				: Tel			= fnSqlChk(Trim(Upload.Form("Tel")), 0, 0)
	Dim Email			: Email			= fnSqlChk(Trim(Upload.Form("Email")), 0, 0)
	Dim PayMethod		: PayMethod		= fnSqlChk(Trim(Upload.Form("PayMethod")), 0, 0)
	Dim Addr			: Addr			= fnSqlChk(Trim(Upload.Form("Addr")), 0, 0)
	Dim Description		: Description	= fnSqlChk(Trim(Upload.Form("Description")), 0, 0)
	'########## // Request Paramas ########## 
	GroupType = 9 
	Description = " "
 
	'GroupName = "테스트"
	'Response.Write "<br>GroupName="&GroupName
	Set Upload = Nothing

	If CKMemberCode = "" Or IsNull(CKMemberCode) Then
		CKMemberCode = 0
	End If

	Dim bRet : bRet = 1

	'Response.Write "<br>fileUrl="&fileUrl
	If fileUrl = "" Or IsNull(fileUrl) Then
		fileUrl = ""
	End If

 

	If Not(GroupName = "" Or IsNull(GroupName)) Then
		Set objCommon = New clsCommon
		bRet = objCommon.SetSystemReg(CKMemberCode, GroupName, GroupType, Homepage, WorkerName, Tel, Email, PayMethod, fileUrl, Addr, Description)
		Set objCommon = Nothing
	Else
		If GroupName = "" Or IsNull(GroupName) Then
			bRet = 5 
			ColsMsg = "기관/단체명  미입력"
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

	
	  