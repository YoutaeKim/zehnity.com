<!--#include virtual="/common/fun/fncSetup.asp"-->
<!--#include virtual="/common/inc/inc_clsInit.asp"-->
<!--#include virtual="/common/lib/freeASPUpload.asp" --><%

	Dim saveType		: saveType		= fnSqlChk(Trim(Request("saveType")), 0, 0)
	Dim strUrlPath		: strUrlPath	= "/attachfiles/" & saveType & "/"
	Dim folderPath		: folderPath	= Server.MapPath(strUrlPath)

	strUrlPath = strUrlPath & Year(Now()) &"/"
	folderPath	= Server.MapPath(strUrlPath)
	'년도 월 폴더 생성
	Set fso = Server.CreateObject("Scripting.FileSystemObject")
		If Not fso.FolderExists(folderPath) Then
			 fso.CreateFolder(folderPath)			
		End If
		strUrlPath = strUrlPath & Right("0"&Month(Now()),2) &"/"
		folderPath	= Server.MapPath(strUrlPath)
		If Not fso.FolderExists(folderPath) Then
			fso.CreateFolder(folderPath)			
		End If
	Set fso = Nothing


	Dim Upload, fileName, fileSize, fileExt, ks, fileUrl
	Set Upload = New FreeASPUpload
	Dim upload_filename
	Dim fileInfo
	Dim bRet : bRet = -1
	
	fileInfo = Upload.SaveFile_Info(folderPath)
	 
	If Not(fileInfo = "" Or IsNull(fileInfo)) Then
		fileSize	= Split(fileInfo,"/")(0)
		fileExt		= Split(fileInfo,"/")(1)
		fileSize	= NullValue(fileSize, 0)
		fileName	= Split(fileInfo,"/")(2)

		If fileSize = 0 Then
			fileUrl = ""	
			message = "업로드 파일이 존재하지 않습니다."
			bRet = 1
		ElseIf UCase(fileExt) = "JPG" Or UCase(fileExt) = "GIF" Or UCase(fileExt) = "PNG" Then
			upload_filename = Upload.DocumentSaveFile(folderPath)
			fileUrl = strUrlPath & upload_filename
			message = ""
			bRet = 0
		Else
			fileUrl = ""	
			message = "이미지 파일을 올려주세요."
			bRet = 2
		End If 	
	Else
		fileUrl = ""	
		message = "이미지 파일을 올려주세요."
		bRet = 3
		
	End If

	Set objJson = jsObject()
	If bRet = "0" Then
		objJson("RESULT")	= "SUCCESS"
		objJson("MSG")		= "등록 성공"
		objJson("DATA")		= bRet
		objJson("DATAIMG")	= fileUrl
		objJson("IMGNAME")	= fileName
		Set arrJson			= Nothing
	Else
		objJson("RESULT")	= "FAIL"
		objJson("MSG")		= message
		objJson("DATA")		= bRet
		objJson("DATAIMG")	= ""
		objJson("IMGNAME")	= ""
	End If

	Response.Write toJson(objJson)
	Set objJson = Nothing
%>