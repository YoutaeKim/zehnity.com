<%
'@@ Messsage##################################################################################################
'@01 메세지 출력
Sub Msg(msg1)
With Response
	.Write "<script type='text/javascript'>" & vbCrlf
	.Write "	alert('"& msg1 &"');" & vbCrlf
	.Write "	return;" & vbCrlf
	.Write "</script>" & vbCrlf
	.End
End With
End Sub

'@02 메세지 출력후 이전 페이지로 이동
Sub MsgBack(msg)
With Response
	.Write "<script type='text/javascript'>" & vbCrlf
	.Write "	alert('"& msg &"');" & vbCrlf
	.Write "	history.go(-1);" & vbCrlf
	.Write "</script>" & vbCrlf
	.End
End With
End Sub

'@03 페이지 이동
Sub Move(url)
With Response
	.Write "<script type='text/javascript'>" & vbCrlf
	.Write "	document.location.href = '"& url &"';" & vbCrlf
	.Write "</script>" & vbCrlf
	.End
End With
End Sub

Sub MoveTop(url)
With Response
	.Write "<script type='text/javascript'>" & vbCrlf
	.Write "	top.location.href = '"& url &"';" & vbCrlf
	.Write "</script>" & vbCrlf
	.End
End With
End Sub

'@04 메세지 출력후 페이지 이동
Sub MoveMsg(msg, url)
With Response
	.Write "<script type='text/javascript'>" & vbCrlf
	.Write "	alert('"& msg &"');" & vbCrlf
	.Write "	document.location.href = '"& url &"';" & vbCrlf
	.Write "</script>" & vbCrlf
	.End
End With
End Sub

'@05 메세지 출력 후 팝업 창 닫기
Sub MsgClose(msg)
With Response
	.Write "<script type='text/javascript'>" & vbCrlf
	.Write "	alert('"& msg &"');" & vbCrlf
	.Write "	self.close();" & vbCrlf
	.Write "</script>" & vbCrlf
	.End
End With
End Sub

'@06 메세지 출력, 오프너 페이지 이동, 팝업창 닫기
Sub SendMsgClose(msg,url)
With Response
	.Write "<script type='text/javascript'>" & vbCrlf
	If msg <> "" Then 
		.Write "	alert('"& msg &"');" & vbCrlf
	End If 
	.Write "	opener.location.href = '"& url &"';" & vbCrlf
	.Write "	self.close();" & vbCrlf
	.Write "</script>" & vbCrlf
	.End
End With
End Sub

'@07 메세지 출력, 오프너 페이지 reload, 팝업창 닫기
Sub MsgRefClose(msg)
With Response
	.Write "<script type='text/javascript'>" & vbCrlf
	.Write "	alert('"& msg &"');" & vbCrlf
	.Write "	opener.document.location.reload();" & vbCrlf
	.Write "	self.close();" & vbCrlf
	.Write "</script>" & vbCrlf
	.End
End With
End Sub


'@@ HTML TAG##################################################################################################
'@01 Select Box
Sub SetHtmlSBox(sData, sVal)
'// sData: 출력될 데이터 배열
'// sVal : selected 값
With Response
	If IsArray(sData) Then
		For z = 0 To Ubound(sData, 2)
			.Write "<option value='"& sData(0, z) &"' "
			If CStr(sData(0, z)) = CStr(sVal) Then
				.Write "selected"
			End If
			.Write ">"& sData(1, z) &"</option>" & vbCrlf
		Next			
	End If
End With
End Sub

'@02 Radio, Check
Sub SetHtmlInput(sData, sVal, sName, sType)
'// sData: 출력될 데이터 배열
'// sVal : selected 값
'// sName: input tag elements name
'// sType: input type radio, checkbox)
With Response
	If IsArray(sData) Then
		
		Dim arrVal : arrVal = Split(Trim(sVal) & "", ",")

		For z = 0 To Ubound(sData, 2)
			.Write "<input type='"& sType &"' name='"& sName &"' value='"& sData(0, z) &"' "

			If IsArray(arrVal) Then
				For y = 0 To Ubound(arrVal)
					If CStr(sData(0, z)) = CStr(arrVal(y)) Then
						.Write "checked"
					End If
				Next
			End If
			.Write "> " & sData(1, z)
		Next
	End If
End With
End Sub


'@@ Date ####################################################################################################
'@01 날짜 길이 체크
Function fnDateLenChk(dtVal)
	
	Dim temp : temp = Trim(dtVal) & ""

	If temp < 10 Then
		fnDateLenChk = "0" & temp
	Else
		fnDateLenChk = temp
	End If
End Function

'@02 Date Format
Function fnDateFormat(dt, dType)
	If Len(Trim(dt)) > 0 Then
		Select Case dType
			Case 1	'06/03/30
				fnDateFormat = mid(dt,3,2)&"/"&mid(dt,6,2)&"/"&mid(dt,9,2)
			Case 2	'2006-03-30
				fnDateFormat = formatdatetime(dt,2)
			Case 3  '2006.03.27 16:09
				fnDateFormat = replace(formatdatetime(dt,2),"-",".")&" "&formatdatetime(dt,4)
			Case 4	'06.03.30
				fnDateFormat = mid(dt,3,2)&"."&mid(dt,6,2)&"."&mid(dt,9,2)
			Case 5 '06/06/21 22:45
				fnDateFormat = mid(dt,3,2)&"/"&mid(dt,6,2)&"/"&mid(dt,9,2)&" "&formatdatetime(dt,4)
			Case 6  '2006.03.27
				fnDateFormat = replace(formatdatetime(dt,2),"-",".")
			Case 7 	'11-22 오전 10:38:34
				fnDateFormat = mid(dt,6,2)&"-"&mid(dt,9,2)&" "&formatdatetime(dt,3)
			Case 8 	'2008.01.22 (16:41)
				fnDateFormat = replace(formatdatetime(dt,2),"-",".")&" ("&formatdatetime(dt,4)&")"
			Case 9 	'2008-01-22 16:09
				fnDateFormat = formatdatetime(dt,2)&" "&formatdatetime(dt,4)
			Case 10	'2006년 03월 30일
				fnDateFormat = "<span>"&mid(dt,1,4)&"</span>년 <span>"&mid(dt,6,2)&"</span>월 <span>"&mid(dt,9,2)&"</span>일"
			Case 11	'06.30(월)
				fnDateFormat = Right(replace(formatdatetime(dt,2),"-","."),5) &" ("& fnGetWeekDay(dt,"s") &")"
			Case 12	'060330
				fnDateFormat = mid(dt,3,2) & mid(dt,6,2) & mid(dt,9,2)
			Case 13	'20060330
				fnDateFormat = mid(dt,1,4) & mid(dt,6,2) & mid(dt,9,2)
			Case 14 '2006.03.27 10:38:34
				fnDateFormat = replace(formatdatetime(dt,2),"-",".")&" "&formatdatetime(dt,4) &":"& Right(dt,2)
		End Select
	Else
		fnDateFormat = dt
	End If
End Function

'@03 해당 월 마지막 일 구하기
Function fnGetLastDay(yVal, mVal)
	Dim tmp

	tmpDate = DateSerial(yVal, mVal, 1)
	If IsDate(tmpDate) Then
		tmpDate = DateAdd("m", 1, tmpDate)
		tmpDate = DateAdd("d", -1, tmpDate)

		fnGetLastDay = Day(tmpDate)
	Else
		fnGetLastDay = ""
	End If

End Function

'@04 요일 구하기
Function fnGetWeekDay(dVal, rType)
	Dim tmpName
	If IsDate(dVal) Then
		Select Case WeekDay(dVal)
			Case 1 : tmpName = "일요일"
			Case 2 : tmpName = "월요일"
			Case 3 : tmpName = "화요일"
			Case 4 : tmpName = "수요일"
			Case 5 : tmpName = "목요일"
			Case 6 : tmpName = "금요일"
			Case 7 : tmpName = "토요일"
		End Select

		If rType = "S" Then
			fnGetWeekDay = tmpName
		ElseIf rType = "s" Then 
			fnGetWeekDay = Left(tmpName,1)
		Else
			fnGetWeekDay = WeekDay(dVal)
		End If
	Else
		fnGetWeekName = ""
	End if
End Function

'@05 날짜 및 시간 자리수 체크 반환
Function fnGetDateLenCheck(iVal)
	Dim tmpVal : tmpVal = iVal
	If IsNumeric(Trim(iVal)) Then
		If iVal < 10 Then
			tmpVal = "0" & iVal
		End If
	End If
	fnGetDateLenCheck = tmpVal
End Function

'@06 달력 함수-일요일시작
Function fnCalendar(yyyy, mm, row)
'row : 해당 달이 6주있을때 5줄로 표현할지 설정
'row : 5일때 6번째주 날짜가 1줄 맨앞에 표시됨, 입력값은 5 Or 6으로 사용
	Dim dd, ww, LastDay, i, j
	dd = DateSerial(yyyy, mm, 1)
	LastDay = fnGetLastDay(yyyy, mm) '해당 월의 마지막 날
	ww = DatePart("ww", DateSerial(yyyy,mm,LastDay)) - DatePart("ww", dd) '한달의 주차 개수 0도 포함

	Dim arr
	ReDim arr(ww, 6)

	If ww = 5 And row = 5 Then
		ReDim arr(4, 6)
	End If

	For i = 0 To ww
		For j = DatePart("w", dd) - 1 To 6		
			If DatePart("m", dd) = CInt(mm) Then				
				If ww = 5 And row = 5 And i = 5 Then '한달에 6주로 되어 있을경우 5줄로 표시하려고 할대 첫 번째 줄에 6번째주 날짜 표시
					arr(0, j) = DatePart("d", dd)
				Else
					arr(i, j) = DatePart("d", dd)
				End If
			Else
			End If
			
			dd = dd + 1

		Next
	Next

	fnCalendar = arr

End Function

'@06-1 달력 함수-월요일시작
Function fnCalendar2(yyyy, mm, row)
'row : 해당 달이 6주있을때 5줄로 표현할지 설정
'row : 5일때 6번째주 날짜가 1줄 맨앞에 표시됨, 입력값은 5 Or 6으로 사용
	Dim dd, ww, LastDay, i, j , t
	dd = DateSerial(yyyy, mm, 1)
	LastDay = fnGetLastDay(yyyy, mm) '해당 월의 마지막 날
	ww = DatePart("ww", DateSerial(yyyy,mm,LastDay)) - DatePart("ww", dd) '한달의 주차 개수 0도 포함

	Dim arr
	ReDim arr(ww, 6)

	If ww = 5 And row = 5 Then
		ReDim arr(4, 6)
	End If
	
	If DatePart("w", dd) = 1 Then
       ww = ww+1
	   ReDim arr(5, 6)
	End If
	
	For i = 0 To ww
	    If i=0 And DatePart("w", dd) = 1 Then
	        arr(i, 6) = DatePart("d", dd)
			dd = dd + 1
		Else
			For j = DatePart("w", dd) -2 To 6	
				If DatePart("m", dd) = CInt(mm) Then				
					If ww = 5 And row = 5 And i = 5 Then '한달에 6주로 되어 있을경우 5줄로 표시하려고 할대 첫 번째 줄에 6번째주 날짜 표시
						arr(0, j) = DatePart("d", dd)
					Else
						arr(i, j) = DatePart("d", dd)
					End If
				Else
				End If
				
				dd = dd + 1

			Next
		End if
	Next

	fnCalendar2 = arr

End Function

'@@ JSON Query     ##########################################################################################
Function QueryToJSON(dbc, sql)
	Dim rs, jsa
	Set rs = dbc.Execute(sql)
	Set jsa = jsArray()
	While Not (rs.EOF Or rs.BOF)
			Set jsa(Null) = jsObject()
			For Each col In rs.Fields
					jsa(Null)(col.Name) = col.Value
			Next
	rs.MoveNext
	Wend
	Set QueryToJSON = jsa
End Function

'@@ SQL INJECTION ############################################################################################
Function fnSqlChk(strVal, nMaxLen, isNum)
'// Request로 전송된 변수를 처리
'// strVal	: 넘겨받은 변수(string)
'// nMaxlen	: 최대 길이 (number), 최대 길이를 검사하지 않은 경우 : 0
'// isNum	: 숫자인지 여부 (1 : only number, 0 : 숫자판별 안함)
	
	Dim temp
	Dim nErr
	temp = Trim(strVal) & ""

	If isNum = 1 Then '숫자 체크
		If IsEmpty(temp) = False And temp <> "" Then
			If IsNumeric(temp) = False Then
				temp = 0
			End If
		End If
	End If

	If nMaxLen > 0 Then '최대길이 체크
		If Len(temp) > nMaxLen Then
			temp = Left(temp, nMaxLen)
		End If
	End If 

	'// Injection 관련 키워드 제거(항목 추가 가능)
	temp = Replace(temp, "'",				"")
	temp = Replace(temp, "--",				"")
	temp = Replace(temp, "--, #",			" ")
	temp = Replace(temp, "/* */",			" ")
	temp = Replace(temp, "' or 1=1--",		" ")
	temp = Replace(temp, "union",			" ")
	temp = Replace(temp, "select",			" ")
	temp = Replace(temp, "delete",			" ")
	temp = Replace(temp, "insert",			" ")
	temp = Replace(temp, "update",			" ")
	temp = Replace(temp, "drop",			" ")
	temp = Replace(temp, "on error resume", " ")
	temp = Replace(temp, "execute",			" ")
	temp = Replace(temp, "windows",			" ")
	temp = Replace(temp, "boot",			" ")
	temp = Replace(temp, "-1 or",			" ")
	temp = Replace(temp, "-1' or",			" ")
	temp = Replace(temp, "../",				" ")
	temp = Replace(temp, "unexisting",		" ")
	temp = Replace(temp, "win.ini",			" ")

	fnSqlChk = temp

End Function


'@@ Error Log ###############################################################################################
'@01 Error 로그 기록
Function fnErrorLog(num, desc)
	
	Dim objFso	: Set objFso= Server.CreateObject("Scripting.FileSystemObject")
	Dim filePath: filePath	= "D:\LogFiles\zehnity.com\" 

	'//LogFiles 폴더가 없을 경우 LogFiles 폴더를 생성 권한 여부 확인
	If objFso.FolderExists(filePath) = False Then
		objFso.CreateFolder(filePath)
	End If

	'//오늘 날짜의 파일을 작성
	Dim filename : filename = Year(now) & fnDateLenChk(Month(now)) & fnDateLenChk(Day(now)) & ".txt"

	If Not objFso.FileExists(filePath & "\" & filename) Then
		objFso.CreatetextFile(filePath & "\" & filename)
	End If

	'// 텍스트 파일에 기록
	'// 시간 / 아이디 / url / 에러정보
	Dim strError : strError = ""

	strError = "===================================================================================================================================" & vbCrlf
	strError = strError & now & " - [Error] : " & num							& vbCrlf
	strError = strError & "[Description]	: "	& Desc							& vbCrlf

	strError = strError & "[Use User]		: " & CKMemberCode					& vbCrlf
	strError = strError & "[Admin User]		: " & CkAdminCode					& vbCrlf
	strError = strError & "[RequestUrl]		: " & Request.ServerVariables("URL")& vbCrlf

	Dim objFile : Set objFile = objFso.OpenTextFile(filePath & "\" & filename, 8, False)
	objFile.WriteLine strError
	objFile.Close
	Set objFile = Nothing	:	Set objFso = Nothing
End Function

'@02 Error 로그 기록
Function fnErrorLog2(errnum, desc)
	
	Dim objFso	: Set objFso= Server.CreateObject("Scripting.FileSystemObject")
	Dim filePath: filePath	= "D:\LogFiles\zehnity.com\"  

	'//LogFiles 폴더가 없을 경우 LogFiles 폴더를 생성 권한 여부 확인
	If objFso.FolderExists(filePath) = False Then
		objFso.CreateFolder(filePath)
	End If

	'//오늘 날짜의 파일을 작성
	Dim filename : filename = Year(now) & fnDateLenChk(Month(now)) & fnDateLenChk(Day(now)) & ".txt"

	If Not objFso.FileExists(filePath & "\" & filename) Then
		objFso.CreatetextFile(filePath & "\" & filename)
	End If

	'// 텍스트 파일에 기록
	'// 시간 / 아이디 / url / 에러정보
	Dim strError : strError = ""

	strError = "===================================================================================================================================" & vbCrlf
	strError = strError & now & " - [ERROR : "& errnum &"]" & vbCrlf
	strError = strError & Desc & vbCrlf

	Dim objFile : Set objFile = objFso.OpenTextFile(filePath & "\" & filename, 8, False)
	objFile.WriteLine strError
	objFile.Close
	Set objFile = Nothing	:	Set objFso = Nothing
End Function

'@03 Request Parameter Debug
Sub TraceRequestParmas()
	
	'On Error Resume Next

	Dim pContentType : pContentType = LTrim(Request.ServerVariables("CONTENT_TYPE"))   

	If ( InStr(pContentType, "multipart/form-data") > 0 ) Then
		Exit Sub   
	End If   

	'If ( Not IsObject(fnErrorLog) ) Then      
	'	Exit Sub   
	'End If   
	
	Dim z   
	Dim pKeyName   

	'// Request 로 전송된 파라미터 정보 디버깅

	fnErrorLog 0, "Debug : =========================================================================================================================================="
	For z = 1 To Request.Form.Count      
		pKeyName = Request.Form.Key(z)      
		fnErrorLog 0, "Debug --- Dim " & pKeyName & " : " & pKeyName & " = RequestForm(""" & pKeyName & """)"   
	Next   
	
	For z = 1 To Request.Form.Count      
		fnErrorLog 0, "Debug --- " & Request.Form.Key(z) & " : " & Request.Form(z)   
	Next   
	
	For z = 1 To Request.QueryString.Count     
		pKeyName = Request.QueryString.Key(z)      
		fnErrorLog 0, "Debug --- Dim " & pKeyName & " : " & pKeyName & " = RequestQuery(""" & pKeyName & """)"   
	Next   
	
	For z = 1 To Request.QueryString.Count	
		fnErrorLog 0, "Debug --- " & Request.QueryString.Key(z) & " : " & Request.QueryString(z)   
	Next      
	
	fnErrorLog 0, "Debug : ==========================================================================================================================================" 
	
	Err.Clear

	On Error GoTo 0

End Sub

'@04 Error Check
Sub ErrorCheck()
	If Err.Number <> 0 Then
		fnErrorLog Err.Number, Err.Description
		Err.Clear
	End If
End Sub

Public Function NullValue(CheckValue,ReturnValue)
	If IsNull(CheckValue) Or IsEmpty(CheckValue) Or CheckValue = "" Then 
		NullValue = ReturnValue
	Else
		NullValue = CheckValue
	End If 
End Function 

' =========================================================================
'	Function name	: isSelected(ByVal arg1, ByVal arg2)
'	Parameter		: arg1 = 비교값 1
'					  arg2 = 비교값 2
'	Return			: String
'	Description		: 값 비교후 selected
' =========================================================================
	Function isSelected(ByVal arg1, ByVal arg2)
		isSelected = ""
		If arg1 = arg2 Then isSelected = " selected='selected'"
	End Function
' =========================================================================

' =========================================================================
'	Function name	: isChecked
'	Parameter		: arg1 = 비교값 1
'					  arg2 = 비교값 2
'	Return			: String
'	Description		: 값 비교후 checked
' =========================================================================
	Function isChecked(ByVal arg1, ByVal arg2)
		isChecked = ""
		If arg1 = arg2 Then isChecked = " checked='checked'"
	End Function

	Function isChecked2(ByVal arg1, ByVal arg2)
		isChecked2 = ""
		If arg1 = arg2 Or InStr(arg1,arg2) > 0 Then isChecked2 = " checked='checked'"
	End Function
' =========================================================================

'********************************************************************
' 신규작성 게시글 아이콘 표시
'********************************************************************
Function NewData(RegDate,IcoType)
	If IsDate(RegDate) Then 
		If DateDiff("D",RegDate,Date()) < 7 Then
			If IcoType = "0" Then 
				Response.Write "<img src=""/images/icon/icon_new_s.gif"" width=""8"" height=""8"" class=""ico_new"">"
			Else
				Response.Write "<img src=""/images/icon/icon_new.gif"" width=""36"" height=""14"" class=""ico_new"">"
			End If 
		End If
	End If 
End Function

'////////// 문자열 자르기 함수 //////////
Public Function CutString(str, strlen)
	Dim rValue:
	Dim nLength:
	Dim tmpLen,tmpStr,f

	nLength = 0.00:
	rValue = "":

	for f = 1 to Len(str)
		tmpStr = MID(str,f,1):
		tmpLen = ASC(tmpStr):	

		'if(tmpLen < 0) then		'EUC-KR
		if(tmpStr >= "ㄱ" and tmpStr <= "힣") then	'UTF-8일 경우 ASC값이 정확하기 않기때문에 꼼수
			'//한글
			nLength = nLength + 1.4: '//한글일때 길이값 설정
			rValue = rValue & tmpStr:
		elseif(tmpLen >= 97 and tmpLen <= 122) then
			'//영문 소문자
			nLength = nLength + 0.75: '//영문소문자 길이값 설정
			rValue = rValue & tmpStr:
		elseif(tmpLen >= 65 and tmpLen <= 90) then 
			'//영문 대문자
			nLength = nLength + 1: '//영문대문자 길이값 설정
			rValue = rValue & tmpStr:
		else
			'//그외 키값
			nLength = nLength + 0.6: '//특수문자 기호값...
			rValue = rValue & tmpStr:
		end if

		if(nLength > strlen) then
			rValue = rValue & "...":
			exit for:
		end if
	next 
	cutString = rValue:
End Function

Function FnDivide(str1, str2)
	'str2가 0이면 그냥 0 반환
	If str2 = 0 Then 
		FnDivide = 0
	Else
		FnDivide = str1/str2
	End If
End Function

Function Text2Tag(value)
	If value <> "" Then
		value = Replace(value, "&#39;",	"'")
		value = Replace(value, "&quot;","""")
		value = Replace(value, "&gt;",	">")
		value = Replace(value, "&lt;",	"<")
		value = Replace(value, "&amp;",	"&")
		value = Replace(value, Chr(13)&Chr(10),	"<br>")
	end if
	Text2Tag = value
End Function

Function Tag2Text(value)
	If value <> "" Then
		value = Replace(value, "&",	"&amp;")
		value = Replace(value, "'",	"&#39;")
		value = Replace(value, """","&quot;")
		value = Replace(value, ">",	"&gt;")
		value = Replace(value, "<",	"&lt;")		
	end if
	Tag2Text = value
End Function

Function Tag2Text_V2(value)
	If value <> "" Then
		value = Replace(value, "&",	"&amp;")
		value = Replace(value, "'",	"&#39;")
		value = Replace(value, """","&quot;")
		value = Replace(value, ">",	"&gt;")
		value = Replace(value, "<",	"&lt;")
		value = Replace(value, Chr(13)&Chr(10),	"<br>")
	end if
	Tag2Text_V2 = value
End Function
Function stripHTML(strHTML)
  Dim objRegExp, strOutput, tempStr
  Set objRegExp = New Regexp
  objRegExp.IgnoreCase = True
  objRegExp.Global = True
  objRegExp.Pattern = "<(.|n)+?>"
  'Replace all HTML tag matches with the empty string
  strOutput = objRegExp.Replace(strHTML, "")
  'Replace all < and > with &lt; and &gt;
  strOutput = Replace(strOutput, "<", "&lt;")
  strOutput = Replace(strOutput, ">", "&gt;")
  strOutput = Replace(strOutput, "&nbsp;", " ")
  strOutput = Replace(strOutput, "&lt;","")
  strOutput = Replace(strOutput, "&gt;","")
  strOutput = Replace(strOutput, chr(13)," ")
  strOutput = Replace(strOutput, chr(10)," ")
  strOutput = Replace(strOutput, "&#8203;","")
  
  stripHTML = strOutput    'Return the value of strOutput
  Set objRegExp = Nothing
END Function
 
Function isItMobile()
    Dim chk
    chk = False    
    mob = "iPod|iPhone|Android|BlackBerry|SymbianOS|SCH-M\d+|Opera Mini|Windows CE|Nokia|SonyEricsson|webOS|PalmOS"
    splitmo = split(mob,"|")
    agent = Request.ServerVariables("HTTP_USER_AGENT")
    For i = 0 to UBound(splitmo )
        If InStr(agent,splitmo (i)) > 0 Then
            chk = True 
            Exit For 
        End If
    Next
    
    isItMobile = chk
End Function

Function RemoveHTML( strText )
    Dim TAGLIST
    TAGLIST = ";!--;!DOCTYPE;A;ACRONYM;ADDRESS;APPLET;AREA;B;BASE;BASEFONT;" &_
              "BGSOUND;BIG;BLOCKQUOTE;BODY;BR;BUTTON;CAPTION;CENTER;CITE;CODE;" &_
              "COL;COLGROUP;COMMENT;DD;DEL;DFN;DIR;DIV;DL;DT;EM;EMBED;FIELDSET;" &_
              "FONT;FORM;FRAME;FRAMESET;HEAD;H1;H2;H3;H4;H5;H6;HR;HTML;I;IFRAME;IMG;" &_
              "INPUT;INS;ISINDEX;KBD;LABEL;LAYER;LAGEND;LI;LINK;LISTING;MAP;MARQUEE;" &_
              "MENU;META;NOBR;NOFRAMES;NOSCRIPT;OBJECT;OL;OPTION;P;PARAM;PLAINTEXT;" &_
              "PRE;Q;S;SAMP;SCRIPT;SELECT;SMALL;SPAN;STRIKE;STRONG;STYLE;SUB;SUP;" &_
              "TABLE;TBODY;TD;TEXTAREA;TFOOT;TH;THEAD;TITLE;TR;TT;U;UL;VAR;WBR;XMP;"

    Const BLOCKTAGLIST = ";APPLET;EMBED;FRAMESET;HEAD;NOFRAMES;NOSCRIPT;OBJECT;SCRIPT;STYLE;"
    
    Dim nPos1
    Dim nPos2
    Dim nPos3
    Dim strResult
    Dim strTagName
    Dim bRemove
    Dim bSearchForBlock
    
    nPos1 = InStr(strText, "<")
    Do While nPos1 > 0
        nPos2 = InStr(nPos1 + 1, strText, ">")
        If nPos2 > 0 Then
            strTagName = Mid(strText, nPos1 + 1, nPos2 - nPos1 - 1)
	    strTagName = Replace(Replace(strTagName, vbCr, " "), vbLf, " ")

            nPos3 = InStr(strTagName, " ")
            If nPos3 > 0 Then
                strTagName = Left(strTagName, nPos3 - 1)
            End If
            
            If Left(strTagName, 1) = "/" Then
                strTagName = Mid(strTagName, 2)
                bSearchForBlock = False
            Else
                bSearchForBlock = True
            End If
            
            If InStr(1, TAGLIST, ";" & strTagName & ";", vbTextCompare) > 0 Then
                bRemove = True
                If bSearchForBlock Then
                    If InStr(1, BLOCKTAGLIST, ";" & strTagName & ";", vbTextCompare) > 0 Then
                        nPos2 = Len(strText)
                        nPos3 = InStr(nPos1 + 1, strText, "</" & strTagName, vbTextCompare)
                        If nPos3 > 0 Then
                            nPos3 = InStr(nPos3 + 1, strText, ">")
                        End If
                        
                        If nPos3 > 0 Then
                            nPos2 = nPos3
                        End If
                    End If
                End If
            Else
                bRemove = False
            End If
            
            If bRemove Then
                strResult = strResult & Left(strText, nPos1 - 1)
                strText = Mid(strText, nPos2 + 1)
            Else
                strResult = strResult & Left(strText, nPos1)
                strText = Mid(strText, nPos1 + 1)
            End If
        Else
            strResult = strResult & strText
            strText = ""
        End If
        
        nPos1 = InStr(strText, "<")
    Loop
    strResult = strResult & strText
    
    RemoveHTML = strResult
End Function

'게시판 타이틀 가져오기
Function BoardTitleName( strCode )
	Dim BoardTitle
	If strCode = "B0101" Then
		BoardTitle = "News"
	ElseIf strCode = "B0102" Then
		BoardTitle = "공지사항"
	ElseIf strCode = "B0103" Then
		BoardTitle = "Board"
	ElseIf strCode = "B0104" Then
		BoardTitle = "Photo"
	ElseIf strCode = "B0105" Then
		BoardTitle = "Video"
	ElseIf Left(strCode,5) = "B0106" Then
		BoardTitle = "자주묻는질문"

	End If
	BoardTitleName = BoardTitle

End Function
%>