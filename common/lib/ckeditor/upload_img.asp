<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %> 
<% 
'Option explicit

Response.Expires = -1
Server.ScriptTimeout = 600
Session.CodePage  = 65001
Response.codepage	= 65001 
Response.ContentType= "text/html; charset=utf-8"
%>
<!--#include virtual="/common/lib/freeASPUpload.asp" -->
<%
	
	Dim sysServerHost   : sysServerHost = Request.ServerVariables("HTTP_HOST") 
	saveType = Request("type")
	saveType = NullValue(saveType, "common")
  
	'Dim strFilePath		: strFilePath = "/attachfiles/" & saveType & "/"
	Dim strUrlPath		: strUrlPath  = "/attachfiles/" & saveType & "/"
	Dim folderPath		: folderPath  = Server.MapPath(strUrlPath)


	Dim funcNum			: funcNum = Request("CKEditorFuncNum")
	Dim CKEditor		: CKEditor = Request("CKEditor")
	Dim langCode		: langCode = Request("langCode")
	
	
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

	Dim Upload, fileName, fileSize, fileExt, ks
	Set Upload = New FreeASPUpload
	Dim upload_filename
	Dim fileInfo
	
	fileInfo = Upload.SaveFile_Info(folderPath)
	
	fileSize	= Split(fileInfo,"/")(0)
	fileExt		= Split(fileInfo,"/")(1)
	fileSize	= NullValue(fileSize, 0) 

	If fileSize = 0 Then
		upload_filename = ""	
		message = "업로드 파일이 존재하지 않습니다."
	ElseIf UCase(fileExt) = "JPG" Or UCase(fileExt) = "GIF" Or UCase(fileExt) = "PNG"  Then
		upload_filename = Upload.DocumentSaveFile(folderPath)
		message = ""
	Else
		upload_filename = ""	
		message = "이미지 파일을 올려주세요."
	End If 	
	Set Upload = Nothing

 

	Public Function NullValue(CheckValue,ReturnValue)
		If IsNull(CheckValue) Or IsEmpty(CheckValue) Or CheckValue = "" Then 
			NullValue = ReturnValue
		Else
			NullValue = CheckValue
		End If 
	End Function 
	fileUrl = strUrlPath & upload_filename

%>
 <script type="text/javascript">
     // 가장 중요한 부분인것 같군요
    // ckeditor의 순번과 유효한 파일 경로만 넘기면 자동으로 이미지나 플래쉬 속성 변경 탭으로 이동합니다.
     window.parent.CKEDITOR.tools.callFunction(<%=funcNum %>, '<%=fileUrl %>', '<%=message %>');
     //history.go(-1);
 </script>