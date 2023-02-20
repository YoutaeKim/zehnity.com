<!--#include virtual="/fnc/fncSetup.asp"-->
<!--#include virtual="/fnc/fncCommon.asp"-->
<%
Dim saveType
Dim funcNum
Dim CKEditor
Dim langCode
Dim fileUrl
Dim message

saveType = Request("type")
saveType = NullValue(saveType, "common")

Dim strFilePath		: strFilePath = "/attachfiles/" & saveType & "/"

Dim strUrlPath		: strUrlPath  = "http://"& sysServerHost &"/attachfiles/" & saveType & "/"

Dim folderPath		: folderPath  = Server.MapPath(strFilePath)

 ' 변수들은 위에서 말한 개발자 가이드 문서에서 뽑았습니다.
 ' Required: anonymous function number as explained above.
 funcNum = Request("CKEditorFuncNum")
 'Optional: instance name (might be used to load specific configuration file or anything else)
 CKEditor = Request("CKEditor")
 ' Optional: might be used to provide localized messages
 langCode = Request("langCode")
 ' Check the $_FILES array and save the file. Assign the correct path to some variable ($url).
 'fileUrl = ""
 ' Usually you will assign here something only if file could not be uploaded.
 'message = "성공적으로 파일 업로드"

Set Upload = Server.CreateObject("DEXT.FileUpload")
Upload.AutoMakeFolder  = True
Upload.DefaultPath = Server.MapPath (strFilePath)
 
Upload_FileName = Upload("upload").Filename
Upload_FileExt	= Upload("upload").FileExtension
Upload_FileSize	= Upload("upload").FileLen

If IsNull(Upload("upload")) Or Upload_FileSize <= 0 then
	upload_filename = ""	
	message = "업로드 파일이 존재하지 않습니다."	
ElseIf Upload_FileSize > 3*1024*1024 Then 
	upload_filename = ""	
	message = "3MByte 이하의 파일만 업로드 가능합니다."
ElseIf Not Upload("upload").IsImageItem() Then 
	upload_filename = ""	
	message = "이미지 파일만 업로드 가능합니다."	
Else
	Upload_FileName = MakeUniqueFileName(saveType) & "." & GetFileExt(upload_filename)
	Upload("upload").SaveAs folderPath & "\" & Upload_FileName
    message = "정상적으로 파일을 업로드했습니다."
End If 

fileUrl = strUrlPath & upload_filename
%>
 <script type="text/javascript">
     // 가장 중요한 부분인것 같군요
    // ckeditor의 순번과 유효한 파일 경로만 넘기면 자동으로 이미지나 플래쉬 속성 변경 탭으로 이동합니다.
     window.parent.CKEDITOR.tools.callFunction(<%=funcNum %>, '<%=fileUrl %>', '<%=message %>');
     //history.go(-1);
 </script>
<%
     ' 파일 중복을 제거 하기 위해 고정 사이트 만큼 특정 문자를 채워 주는 함수
    Public Function LeftFillString ( strValue, fillChar, makeLength )
         Dim strRet
         Dim strLen, diff, i
         
         strRet  = ""
         strLen  = Len(strValue)
         diff    = CInt(makeLength) - strLen
         
         if diff > 0 then
             for i=1 to diff
                 strRet = strRet & CStr(fillChar)
             next
         end if
         
         LeftFillString = strRet & CStr(strValue)
     End Function

  '유니크한 파일명 만들기
 Public Function MakeUniqueFileName( strPrename )
   Dim strFilename
   Dim dtNow
   dtNow = now()
   Randomize()
   strFilename = strPrename
   strFilename = strFilename & Year(dtNow)
   strFilename = strFilename & LeftFillString( Month(dtNow),   "0", 2 )
   strFilename = strFilename & LeftFillString( Day(dtNow),     "0", 2 )
   strFilename = strFilename & "_"
   strFilename = strFilename & LeftFillString( Hour(dtNow),    "0", 2 )
   strFilename = strFilename & LeftFillString( Minute(dtNow),  "0", 2 )
   strFilename = strFilename & LeftFillString( Second(dtNow),  "0", 2 )
   strFilename = strFilename & "_"  
   strFilename = strFilename & LeftFillString ( Int(Rnd * 1000000), "0", 7 )
   MakeUniqueFileName = strFilename
  End Function

  ' 파일 확장자 추출
 Function GetFileExt( strFilename )
   Dim strExt
   Dim nPos
   nPos = InStrRev( strFilename, ".", -1, 1 ) '// Text Compare
   if nPos > 0 then
    strExt = Mid( strFilename, nPos+1 )
   end if
   GetFileExt = strExt
  End Function
%>