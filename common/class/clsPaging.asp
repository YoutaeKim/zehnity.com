<%

Class PageNavigation

	'현재 페이지명
	Private strCurrentPageName

	'다음, 이전 버튼등의 이미지 폴더
	Private strImagePath

	'게시판 코드, 기본 값 default
	Private strBoardCode

	'현재 페이지 번호
	Private intCurrentPage

	'DP될 페이지 사이즈, 기본 값 10
	Private intNavigationSize

	'레코드 전체 페이지 수, 계산된 값
	Private intTotalPage

	'총 레코드 수
	Private intTotalRecord

	'페이지 출력될 게시물 수, 기본 값 20
	Private intListSize

	'페이지 이동간 전송 파라미터
	Private strQueryString

	'페이지 번호 간격 구분자, 기본 |
	Private strDelimiter

	'위 인스턴스 변수에 대한 기본 값들을 아래 생성자 함수에 정의
	Private Sub Class_Initialize()
		
		'생성자
		strCurrentPageName	= Request.ServerVariables("URL")
		If(Request("Page") = "") Then intCurrentPage = 1 Else intCurrentPage = Request("Page") End If

		strQueryString		= "&searchPart="& Request("SearchPart") &"&searchword="& Server.UrlEncode(Request("SearchWord"))

		intNavigationSize	= 10

		intListSize			= 20

		strImagePath		= "/images/button/"

		strDelimiter		= "|"

		strBoardCode		= "default"

	End Sub

	'현재 페이지 get, set
	Public Property Get CurrentPageName()
		
		CurrentPageName = strCurrentPageName

	End Property

	Public Property Let CurrentPageName(strParam)

		'strCurrentPageName = strParam
		
	End Property

	'이지미 경로 get, set
	Public Property Get ImagePath()

		ImagePath = strImagePath

	End Property

	Public Property Let ImagePath(strParam)

		strImagePath = strParam

	End Property

	'게시판 코드 get, set
	Public Property Get BoardCode()

		BoardCode = strBoardCode

	End Property

	Public Property Let BoardCode(strParam)

		strBoardCode = BoardCode

	End Property

	'현재 페이지 get, set
	Public Property Get CurrentPage()
		
		CurrentPage = intCurrentPage

	End Property

	Public Property Let CurrentPage(intParam)

		If Len(Trim(intParam)) = 0 Then
			intCurrentPage = 1
		Else
			If Not IsNumeric(intParam) Then
				intCurrentPage = 1
			Else
				intCurrentPage = intParam
			End If
		End If

	End Property

	'페이지 사이즈 get, set
	Public Property Get NavigationSize()

		NavigationSize = intNavigationSize
		
	End Property

	Public Property Let NavigationSize(intParam)

		intNavigationSize = intParam
	
	End Property

	'총 페이지 수 get, set
	Public Property Get TotalPage()

		TotalPage = intTotalPage

	End Property

	Public Property Let TotalPage(intParam)

		intTotalPage = intParam

	End Property

	'총 레코드 수 get, set
	Public Property Get TotalRecord() 

        TotalRecord = intTotalRecord 

    End Property 

    Public Property Let TotalRecord(intParam) 

        intTotalRecord = intParam 

    End Property 

	'게시물 출력 수  get, set
    Public Property Get ListSize() 

        ListSize = intListSize 

    End Property 

    Public Property Let ListSize(intParam) 

        intListSize = intParam 

    End Property 

	'페이지 이동간 전송 파라미터  get, set
    Public Property Get QueryString() 

        QueryString = strQueryString 

    End Property 

    Public Property Let QueryString(strParam) 

        strQueryString = strParam 

    End Property 

	'페이지 번호 간격 구분자  get, set
    Public Property Get Delimiter() 

        Delimiter = strDelimiter 

    End Property 

    Public Property Let Delimiter(strParam) 

        strDelimiter = Delimiter 

    End Property

	'
	Public Function SetTotalPage()
		
		If intTotalRecord Mod intListSize <> 0 Then SetTotalPage = intTotalPage + 1 Else SetTotalPage = intTotalPage End If

	End Function

	'해당 페이지 별 레코드 순번
	Public Function BoardNumber()
		
		' 각 페이지별로 레코드마다 순번을 매길때 사용 
        ' 전체 레코드의 수가 1000개이고 게시물 리스트의  수가 20이라면 라면 
        ' 첫번째 페이지(page=1)는 1000부터 981까지
        ' 두번째 페이지(page=2)는 980부터 961까지
		If intCurrentPage = 1 Then
			BoardNumber = intTotalRecord
		Else
			BoardNumber = intTotalRecord - (intListSize * (intCurrentPage - 1))
		End If

	End Function

	'페이징 구현
	Public Sub Navigation()
		Dim intLoop
		Dim intCurrentPageSize

		intCurrentPageSize = Int(intCurrentPage/intNavigationSize)+1  

        If (intCurrentPage Mod intNavigationSize=0) Then intCurrentPageSize = intCurrentPageSize-1 

        intCurrentPageSize = (intCurrentPageSize-1) * intNavigationSize+1

		intCurrentPage = CInt(intCurrentPage)

		With Response

		If (intTotalPage > intNavigationSize) Then

			If (intCurrentPageSize > 1) Then
				.Write "<a href='"& strCurrentPageName &"?page="& intCurrentPageSize - intNavigationSize & strQueryString &"' class='box left'></a>"
			Else
				
			End If

			If(intCurrentPage > 1) Then
				.Write "<a href='"& strCurrentPageName &"?page="& intCurrentPage - 1 & strQueryString &"' class='box left0'></a>"
			Else
				.Write "<a href='javascript:;' class='box left0'></a>"
			End If

			For intLoop = intCurrentPageSize To intCurrentPageSize + intNavigationSize - 1
				'If (intLoop = intCurrentPage) Then
				'	Exit For
				'Else
					If (intLoop > intTotalPage) Then
					   Exit For 
					End if
					If (intLoop = intCurrentPage) Then
						.Write "<a href='javascript:;' class='box num active'>"& intLoop &"</a>" & strDelimeter & ""
					Else
						.Write "<a href='"& strCurrentPageName &"?page="& intLoop & strQueryString &"' class='box num'>"& intLoop &"</a>" & strDelimeter & ""
					End If
				'End If 
			Next

			If(intCurrentPage < intTotalPage) Then
				.Write "<a href='"& strCurrentPageName &"?page="& intCurrentPage + 1 & strQueryString &"' class='box right0'></a>" 
			Else
				.Write "<a href='javascript:;' class='box right0'></a>" 
			End If

			If (intCurrentPageSize + intNavigationSize > intTotalPage) Then
			Else
				.Write "<a href='"& strCurrentPageName &"?page="& intCurrentPageSize + intNavigationSize & strQueryString &"' class='box right'></a>"
			End If

		Else
			If(intCurrentPage > 1) Then
				.Write "<a href='"& strCurrentPageName &"?page="& intCurrentPage - 1 & strQueryString &"' class='box left0'></a>"
			Else
				.Write "<a href='javascript:;' class='box left0'></a>"
			End If

			For intLoop = intCurrentPageSize To intTotalPage
				If (intLoop = intCurrentPage) Then
					If intLoop = intTotalPage Then
						.Write "<a href='"& strCurrentPageName &"?page="& intLoop & strQueryString &"' class='box num active'>"& intLoop &"</a>" & ""
					Else
						.Write "<a href='javascript:;' class='box num active'>"& intLoop &"</a>" & strDelimeter & ""
					End If					
				Else
					.Write "<a href='"& strCurrentPageName &"?page="& intLoop & strQueryString &"' class='box num'>"& intLoop &"</a>" & ""
				End If
			Next

			If(intCurrentPage < intTotalPage) Then
				.Write "<a href='"& strCurrentPageName &"?page="& intCurrentPage + 1 & strQueryString &"' class='box right0'></a>"
			Else
				.Write "<a href='javascript:;' class='box right0'></a>"	
			End If

		End If
		End With

	End Sub


	'페이징 구현
	Public Sub Navigation2()
		 
		Dim intLoop
		Dim intCurrentPageSize

		intCurrentPageSize = Int(intCurrentPage/intNavigationSize)+1  

        If (intCurrentPage Mod intNavigationSize=0) Then intCurrentPageSize = intCurrentPageSize-1 

        intCurrentPageSize = (intCurrentPageSize-1) * intNavigationSize+1

		intCurrentPage = CInt(intCurrentPage)
		
		With Response

		If (intTotalPage > intNavigationSize) Then

			If (intCurrentPageSize > 1) Then
				'.Write "<a href='"& strCurrentPageName &"?page="& intCurrentPageSize - intNavigationSize & strQueryString &"' class='box left'></a>"
			Else
				
			End If

			If(intCurrentPage > 1) Then
				'.Write "<a href='"& strCurrentPageName &"?page="& intCurrentPage - 1 & strQueryString &"' class='box left0'></a>"
			Else
				'.Write "<a href='javascript:;' class='box left0'></a>"
			End If

			For intLoop = intCurrentPageSize To intCurrentPageSize + intNavigationSize - 1
				'If (intLoop = intCurrentPage) Then
				'	Exit For
				'Else
					If (intLoop > intTotalPage) Then
					   Exit For 
					End if
					If (intLoop = intCurrentPage) Then
						.Write "<a href='javascript:;' class='box num active'>"& intLoop &"</a>" & strDelimeter & ""
					Else
						.Write "<a href='"& strCurrentPageName &"?page="& intLoop & strQueryString &"' class='box num'>"& intLoop &"</a>" & strDelimeter & ""
					End If
				'End If 
			Next

			If(intCurrentPage < intTotalPage) Then
			'	.Write "<a href='"& strCurrentPageName &"?page="& intCurrentPage + 1 & strQueryString &"' class='box right0'></a>" 
			Else
			'	.Write "<a href='javascript:;' class='box right0'></a>" 
			End If

			If (intCurrentPageSize + intNavigationSize > intTotalPage) Then
			Else
			'	.Write "<a href='"& strCurrentPageName &"?page="& intCurrentPageSize + intNavigationSize & strQueryString &"' class='box right'></a>"
			End If

		Else
			
			If(intCurrentPage > 1) Then
			'	.Write "<a href='"& strCurrentPageName &"?page="& intCurrentPage - 1 & strQueryString &"' class='box left0'></a>"
			Else
			'	.Write "<a href='javascript:;' class='box left0'></a>"
			End If

			For intLoop = intCurrentPageSize To intTotalPage
				If (intLoop = intCurrentPage) Then
					If intLoop = intTotalPage Then
						.Write "<a href='"& strCurrentPageName &"?page="& intLoop & strQueryString &"' class='box num active'>"& intLoop &"</a>" & ""
					Else
						.Write "<a href='javascript:;' class='box num active'>"& intLoop &"</a>" & strDelimeter & ""
					End If					
				Else
					.Write "<a href='"& strCurrentPageName &"?page="& intLoop & strQueryString &"' class='box num'>"& intLoop &"</a>" & ""
				End If
			Next

			If(intCurrentPage < intTotalPage) Then
			'	.Write "<a href='"& strCurrentPageName &"?page="& intCurrentPage + 1 & strQueryString &"' class='box right0'></a>"
			Else
			'	.Write "<a href='javascript:;' class='box right0'></a>"	
			End If

		End If
		End With

	End Sub

	'관리자 페이징 구현
	Public Sub Navigation_Admin()
		 
		Dim intLoop
		Dim intCurrentPageSize

		intCurrentPageSize = Int(intCurrentPage/intNavigationSize)+1  

        If (intCurrentPage Mod intNavigationSize=0) Then intCurrentPageSize = intCurrentPageSize-1 

        intCurrentPageSize = (intCurrentPageSize-1) * intNavigationSize+1

		intCurrentPage = CInt(intCurrentPage)
		
		With Response

		If (intTotalPage > intNavigationSize) Then

			If (intCurrentPageSize > 1) Then
				'.Write "<a href='"& strCurrentPageName &"?page="& intCurrentPageSize - intNavigationSize & strQueryString &"' class='box left'></a>"

			Else
				
			End If

			If(intCurrentPage > 1) Then
				
				.Write "<button type=""button"" class=""prev"" onclick=""location.href='"& strCurrentPageName &"?page="& intCurrentPage - 1 & strQueryString &"';""><img src=""/admin/image/sub/arrow_l.gif"" alt=""이전""></button>"
			Else
				.Write "<button type=""button"" class=""prev"" ><img src=""/admin/image/sub/arrow_l.gif"" alt=""이전""></button>"
				
			End If

			For intLoop = intCurrentPageSize To intCurrentPageSize + intNavigationSize - 1
				'If (intLoop = intCurrentPage) Then
				'	Exit For
				'Else
					If (intLoop > intTotalPage) Then
					   Exit For 
					End if
					If (intLoop = intCurrentPage) Then
						.Write "<a href='javascript:;' class='on'>"& intLoop &"</a>" & strDelimeter & ""
					Else
						.Write "<a href='"& strCurrentPageName &"?page="& intLoop & strQueryString &"'>"& intLoop &"</a>" & strDelimeter & ""
					End If
				'End If 
			Next

			If(intCurrentPage < intTotalPage) Then
			'	.Write "<a href='"& strCurrentPageName &"?page="& intCurrentPage + 1 & strQueryString &"' class='box right0'></a>" 

			Else
			'	.Write "<a href='javascript:;' class='box right0'></a>"
				.Write "<button type=""button"" class=""next"" ><img src=""/admin/image/sub/arrow_r.gif"" alt=""다음""></button>"
			End If

			If (intCurrentPageSize + intNavigationSize > intTotalPage) Then
			Else
			'	.Write "<a href='"& strCurrentPageName &"?page="& intCurrentPageSize + intNavigationSize & strQueryString &"' class='box right'></a>"
			End If

		Else
			
			If(intCurrentPage > 1) Then
			
				.Write "<button type=""button"" class=""prev"" onclick=""location.href='"& strCurrentPageName &"?page="& intCurrentPage - 1 & strQueryString &"';""><img src=""/admin/image/sub/arrow_l.gif"" alt=""이전""></button>"
			Else
			
				.Write "<button type=""button"" class=""prev"" ><img src=""/admin/image/sub/arrow_l.gif"" alt=""이전""></button>"
			End If

			For intLoop = intCurrentPageSize To intTotalPage
				If (intLoop = intCurrentPage) Then
					If intLoop = intTotalPage Then
						.Write "<a href='"& strCurrentPageName &"?page="& intLoop & strQueryString &"' class='on'>"& intLoop &"</a>" & ""
					Else
						.Write "<a href='javascript:;' class='on'>"& intLoop &"</a>" & strDelimeter & ""
					End If					
				Else
					.Write "<a href='"& strCurrentPageName &"?page="& intLoop & strQueryString &"' >"& intLoop &"</a>" & ""
				End If
			Next

			If(intCurrentPage < intTotalPage) Then
			
				.Write "<button type=""button"" class=""next"" onclick=""location.href='"& strCurrentPageName &"?page="& intCurrentPage + 1 & strQueryString &"';""><img src=""/admin/image/sub/arrow_r.gif"" alt=""다음""></button>"
			Else
			
				.Write "<button type=""button"" class=""next"" ><img src=""/admin/image/sub/arrow_r.gif"" alt=""다음""></button>"
			End If

		End If
		End With

	End Sub


	'페이징 구현 버전s20
	Public Sub Navigation_S20()
		Dim intLoop
		Dim intCurrentPageSize 

		'intNavigationSize 블럭사이즈 기본값 10 (10개 페이지 표시)
		'intCurrentPageSize 블럭사이즈 페이징값 1~10까지는 1, 11~20까지는 2
		intCurrentPageSize = Int(intCurrentPage/intNavigationSize)+1  
		If (intCurrentPage Mod intNavigationSize=0) Then intCurrentPageSize = intCurrentPageSize-1 

		intCurrentPageSize = (intCurrentPageSize-1) * intNavigationSize+1
		intCurrentPage = CInt(intCurrentPage)

		With Response
			.Write "<ul class='s20-pagination'>"

			'11페이지 이하라면 
			If (intCurrentPageSize = 1) Then 
				cls_dl = "disabled" 
				link_dl  = ""
			Else 
				cls_dl = ""
				link_dl  = "href='" & strCurrentPageName &"?page="& intCurrentPageSize - intNavigationSize & strQueryString & "'"
			End If

			.Write "<li class='" & cls_dl & "'><a "& link_dl &"><i class='fas fa-angle-double-left'></i></a></li>"


			'2페이지라면 
			If (intCurrentPage = 1) Then 
				cls_l = "disabled" 
				link_l  = ""
			Else 
				cls_l = ""
				link_l  = "href='" & strCurrentPageName &"?page="& intCurrentPage - 1 & strQueryString & "'"
			End If
			
			.Write "<li class='" & cls_l & "'><a "& link_l &"><i class='fas fa-angle-left'></i></a></li>"

			For intLoop = intCurrentPageSize To intCurrentPageSize + intNavigationSize - 1
					If (intLoop > intTotalPage) Then
					   Exit For 
					End if
					If (intLoop = intCurrentPage) Then
						.Write "<li class='active'><a>" & intLoop & strDelimeter & " </a></li>"
					Else
						.Write "<li><a href='"& strCurrentPageName &"?page="& intLoop & strQueryString &"'>"& intLoop &"</a></li>" & strDelimeter
					End If
			Next

			'다음 페이지
			If(intCurrentPage < intTotalPage) Then
				cls_r = ""
				link_r  = "href='" & strCurrentPageName &"?page="& intCurrentPage + 1 & strQueryString & "'"
			Else 
				cls_r = "disabled" 
				link_r  = ""
			End If
			.Write "<li class='" & cls_r & "'><a " & link_r & "><i class='fas fa-angle-right'></i></a></li>" 

			'다음 10개 (전체 페이지수가 10보다 크고, 마지막이 아닐때
			If ((intTotalPage > intNavigationSize) AND (intCurrentPageSize + intNavigationSize <= intTotalPage)) Then
				cls_dr = ""
				link_dr  = "href='" & strCurrentPageName &"?page="& intCurrentPageSize + intNavigationSize & strQueryString & "'"
			Else
				cls_dr = "disabled" 
				link_dr  = ""
			End If
			.Write "<li class='" & cls_dr & "'><a " & link_dr &"><i class='fas fa-angle-double-right'></i></a></li>"
			.Write "</ul>"
		End With
	End Sub


	'페이징 구현 버전s20
	Public Sub Navigation_S21(pageurl)
		Dim intLoop
		Dim intCurrentPageSize 

		'intNavigationSize 블럭사이즈 기본값 10 (10개 페이지 표시)
		'intCurrentPageSize 블럭사이즈 페이징값 1~10까지는 1, 11~20까지는 2
		intCurrentPageSize = Int(intCurrentPage/intNavigationSize)+1  
		If (intCurrentPage Mod intNavigationSize=0) Then intCurrentPageSize = intCurrentPageSize-1 

		intCurrentPageSize = (intCurrentPageSize-1) * intNavigationSize+1
		intCurrentPage = CInt(intCurrentPage)

		'페이지값이 있다면 넘어오는 값으로 대체
		If LEN(pageurl) > 0 THEN strCurrentPageName = pageurl

		With Response
			.Write "<ul class='s20-pagination'>"

			'11페이지 이하라면 
			If (intCurrentPageSize = 1) Then 
				cls_dl = "disabled" 
				link_dl  = ""
			Else 
				cls_dl = ""
				link_dl  = "href='" & strCurrentPageName &"?page="& intCurrentPageSize - intNavigationSize & strQueryString & "'"
			End If

			.Write "<li class='" & cls_dl & "'><a "& link_dl &"><i class='fas fa-angle-double-left'></i></a></li>"


			'2페이지라면 
			If (intCurrentPage = 1) Then 
				cls_l = "disabled" 
				link_l  = ""
			Else 
				cls_l = ""
				link_l  = "href='" & strCurrentPageName &"?page="& intCurrentPage - 1 & strQueryString & "'"
			End If
			
			.Write "<li class='" & cls_l & "'><a "& link_l &"><i class='fas fa-angle-left'></i></a></li>"

			For intLoop = intCurrentPageSize To intCurrentPageSize + intNavigationSize - 1
					If (intLoop > intTotalPage) Then
					   Exit For 
					End if
					If (intLoop = intCurrentPage) Then
						.Write "<li class='active'><a>" & intLoop & strDelimeter & " </a></li>"
					Else
						.Write "<li><a href='"& strCurrentPageName &"?page="& intLoop & strQueryString &"'>"& intLoop &"</a></li>" & strDelimeter
					End If
			Next

			'다음 페이지
			If(intCurrentPage < intTotalPage) Then
				cls_r = ""
				link_r  = "href='" & strCurrentPageName &"?page="& intCurrentPage + 1 & strQueryString & "'"
			Else 
				cls_r = "disabled" 
				link_r  = ""
			End If
			.Write "<li class='" & cls_r & "'><a " & link_r & "><i class='fas fa-angle-right'></i></a></li>" 

			'다음 10개 (전체 페이지수가 10보다 크고, 마지막이 아닐때
			If ((intTotalPage > intNavigationSize) AND (intCurrentPageSize + intNavigationSize <= intTotalPage)) Then
				cls_dr = ""
				link_dr  = "href='" & strCurrentPageName &"?page="& intCurrentPageSize + intNavigationSize & strQueryString & "'"
			Else
				cls_dr = "disabled" 
				link_dr  = ""
			End If
			.Write "<li class='" & cls_dr & "'><a " & link_dr &"><i class='fas fa-angle-double-right'></i></a></li>"
			.Write "</ul>"
		End With
	End Sub





	'소멸
	Public Sub Class_Terminate()
	End Sub

End Class
%>