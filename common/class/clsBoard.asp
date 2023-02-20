<%
Class clsBoard

	Private objDBHelper

	'생성자
	Private Sub Class_Initialize()
		Set objDBHelper	= New clsDBHelper		
	End Sub

	'1:1문의 등록 
	Public Function SetBoardQnAReg(WriteCode, GroupName, GroupType, UserName, Tel, Email, Contents)
		'On Error Resume Next
		Dim paramInfo(7)
		paramInfo(0) = objDBHelper.MakeParam("@I_WriteCode",	adInteger,	adParamInput, 0,	WriteCode)
		paramInfo(1) = objDBHelper.MakeParam("@I_GroupName",	adVarchar,	adParamInput, 200,	GroupName)
		paramInfo(2) = objDBHelper.MakeParam("@I_GroupType",	adInteger,	adParamInput, 0,	GroupType)
		paramInfo(3) = objDBHelper.MakeParam("@I_UserName",		adVarchar,	adParamInput, 100,	UserName)
		paramInfo(4) = objDBHelper.MakeParam("@I_Tel",			adVarchar,	adParamInput, 20,	Tel)
		paramInfo(5) = objDBHelper.MakeParam("@I_Email",		adVarchar,	adParamInput, 100,	Email)
		paramInfo(6) = objDBHelper.MakeParam("@I_Contents",		adVarchar,	adParamInput, LEN(Trim(Contents)),	Contents)
		paramInfo(7) = objDBHelper.MakeParam("@I_RETURN",		adInteger,	adParamOutput, 0,	0)
		objDBHelper.ExecSP "usp_BoardQnAReg", paramInfo, Nothing
		SetBoardQnAReg = objDBHelper.GetValue(paramInfo,"@I_RETURN")

		Call ErrorCheck()
	End Function

	'1:1문의 리스트 
	Public Function GetBoardQnAList(Code, Page, PageSize)
		'On Error Resume Next
		Dim paramInfo(2)
		paramInfo(0) = objDBHelper.MakeParam("@I_Code",		adInteger,	adParamInput, 0,	Code)
		paramInfo(1) = objDBHelper.MakeParam("@I_Page",		adInteger,	adParamInput, 0,	Page)
		paramInfo(2) = objDBHelper.MakeParam("@I_PageSize",	adInteger,	adParamInput, 0,	PageSize)
		GetBoardQnAList = objDBHelper.ExecSPReturnRsRow("usp_BoardQnAList", paramInfo, Nothing)
		
		Call ErrorCheck()
	End Function
	
	'게시판 공통 리스트	
	Public Function GetBoardCommonList(SearchType, SearchText,  bcType, sgCode, pCode, Open, Page, PageSize)
		'On Error Resume Next
		Dim paramInfo(7)
		paramInfo(0) = objDBHelper.MakeParam("@I_SearchType",	adVarchar,	adParamInput, 10,	SearchType)
		paramInfo(1) = objDBHelper.MakeParam("@I_SearchText",	adVarchar,	adParamInput, 100,	SearchText)
		paramInfo(2) = objDBHelper.MakeParam("@I_bcType",		adVarchar,	adParamInput, 10,	bcType)
		paramInfo(3) = objDBHelper.MakeParam("@I_sgCode",		adInteger,	adParamInput, 0,	sgCode)
		paramInfo(4) = objDBHelper.MakeParam("@I_pCode",		adInteger,	adParamInput, 0,	pCode)
		paramInfo(5) = objDBHelper.MakeParam("@I_Open",			adTinyInt,	adParamInput, 0,	Open)'--공개여부 0-노출, 1-미노출, 3-전체
		paramInfo(6) = objDBHelper.MakeParam("@I_Page",			adInteger,	adParamInput, 0,	Page)
		paramInfo(7) = objDBHelper.MakeParam("@I_PageSize",		adInteger,	adParamInput, 0,	PageSize)
		GetBoardCommonList = objDBHelper.ExecSPReturnRsRow("usp_BoardCommonList", paramInfo, Nothing)
		
		Call ErrorCheck()
	End Function

	'게시판 공통 정보조회
	Public Function GetBoardCommonInfo(bCode)
		'On Error Resume Next
		Dim paramInfo(0)
		paramInfo(0) = objDBHelper.MakeParam("@I_bCode",		adInteger,	adParamInput, 0,	bCode)
		GetBoardCommonInfo = objDBHelper.ExecSPReturnRsRow("usp_BoardCommonInfo", paramInfo, Nothing)
		
		Call ErrorCheck()
	End Function
	
	'게시판 공통 게시글 삭제
	Public Function SetBoardCommonDel(bCode)
		'On Error Resume Next
		Dim paramInfo(1)
		paramInfo(0) = objDBHelper.MakeParam("@I_bCode",		adInteger,	adParamInput, 0,	bCode)
		paramInfo(1) = objDBHelper.MakeParam("@I_RETURN",		adInteger,	adParamOutput, 0,	0)
		objDBHelper.ExecSP "usp_BoardCommonDel", paramInfo, Nothing
		SetBoardCommonDel = objDBHelper.GetValue(paramInfo,"@I_RETURN") 
		
		Call ErrorCheck()
	End Function
	
	'게시판 공통 게시글 공유설정
	Public Function SetBoardCommonShare(bCode, Open)
		'On Error Resume Next
		Dim paramInfo(2)
		paramInfo(0) = objDBHelper.MakeParam("@I_bCode",		adInteger,	adParamInput, 0,	bCode)
		paramInfo(1) = objDBHelper.MakeParam("@I_Open",			adTinyInt,	adParamInput, 0,	Open)'--공개여부 0-노출, 1-미노출
		paramInfo(2) = objDBHelper.MakeParam("@I_RETURN",		adInteger,	adParamOutput, 0,	0)
		objDBHelper.ExecSP "usp_BoardCommonShare", paramInfo, Nothing
		SetBoardCommonShare = objDBHelper.GetValue(paramInfo,"@I_RETURN") 
		
		Call ErrorCheck()
	End Function

	'게시판 공통 게시글 등록/ 수정
	Public Function SetBoardCommonUpdate(bCode, bType, mCode, WriteName, Title, SubTitle, TitleImg, FileName, YoutubeUrl, Contents, Open, sgCode, pCode)
		'On Error Resume Next
		Dim paramInfo(13)
		paramInfo(0) = objDBHelper.MakeParam("@I_bCode",		adInteger,	adParamInput, 0,	bCode)
		paramInfo(1) = objDBHelper.MakeParam("@I_bType",		adVarchar,	adParamInput, 10,	bType)
		paramInfo(2) = objDBHelper.MakeParam("@I_mCode",		adInteger,	adParamInput, 0,	mCode)
		paramInfo(3) = objDBHelper.MakeParam("@I_WriteName",	adVarchar,	adParamInput, 100,	WriteName)
		paramInfo(4) = objDBHelper.MakeParam("@I_Title",		adVarchar,	adParamInput, 255,	Title)
		paramInfo(5) = objDBHelper.MakeParam("@I_SubTitle",		adTinyInt,	adParamInput, 0,	SubTitle)'--서브 타이틀 말머리(1-공지사항, 2-이벤트, 9-기타)
		paramInfo(6) = objDBHelper.MakeParam("@I_TitleImg",		adVarchar,	adParamInput, 100,	TitleImg)
		paramInfo(7) = objDBHelper.MakeParam("@I_FileName",		adVarchar,	adParamInput, 100,	FileName)
		paramInfo(8) = objDBHelper.MakeParam("@I_YoutubeUrl",	adVarchar,	adParamInput, 100,	YoutubeUrl)
		paramInfo(9) = objDBHelper.MakeParam("@I_Contents",		adVarchar,	adParamInput, 4000,	Contents)
		paramInfo(10) = objDBHelper.MakeParam("@I_Open",		adTinyInt,	adParamInput, 0,	Open)
		paramInfo(11) = objDBHelper.MakeParam("@I_sgCode",		adInteger,	adParamInput, 0,	sgCode)
		paramInfo(12) = objDBHelper.MakeParam("@I_pCode",		adInteger,	adParamInput, 0,	pCode)
		paramInfo(13) = objDBHelper.MakeParam("@I_RETURN",		adInteger,	adParamOutput, 0,	0)
		objDBHelper.ExecSP "usp_BoardCommonUpdate", paramInfo, Nothing
		SetBoardCommonUpdate = objDBHelper.GetValue(paramInfo,"@I_RETURN") 
		
		Call ErrorCheck()
	End Function

	'1:1 문의 QnA 전체 조회
	Public Function GetAllBoradQnAList(SearchType, SearchText, Page, PageSize)
		'On Error Resume Next
		Dim paramInfo(3)
		paramInfo(0) = objDBHelper.MakeParam("@I_SearchType",	adVarchar,	adParamInput, 10,	SearchType)
		paramInfo(1) = objDBHelper.MakeParam("@I_SearchText",	adVarchar,	adParamInput, 100,	SearchText)
		paramInfo(2) = objDBHelper.MakeParam("@I_Page",			adInteger,	adParamInput, 0,	Page)
		paramInfo(3) = objDBHelper.MakeParam("@I_PageSize",		adInteger,	adParamInput, 0,	PageSize)
		GetAllBoradQnAList = objDBHelper.ExecSPReturnRsRow("usp_AllBoradQnAList", paramInfo, Nothing)
		
		Call ErrorCheck()
	End Function

	'1:1 문의 정보조회
	Public Function GetBoardQnAInfo(bCode)
		'On Error Resume Next
		Dim paramInfo(0)
		paramInfo(0) = objDBHelper.MakeParam("@I_bCode",		adInteger,	adParamInput, 0,	bCode)
		GetBoardQnAInfo = objDBHelper.ExecSPReturnRsRow("usp_BoardQnAInfo", paramInfo, Nothing)
		
		Call ErrorCheck()
	End Function

 
	'1:1 문의  수정
	Public Function SetBoardQnAUpdate(qCode, aCode, isDel, Replay)
		'On Error Resume Next
		Dim paramInfo(4)
		paramInfo(0) = objDBHelper.MakeParam("@I_qCode",		adInteger,	adParamInput, 0,	qCode)
		paramInfo(1) = objDBHelper.MakeParam("@I_aCode",		adInteger,	adParamInput, 0,	aCode)
		paramInfo(2) = objDBHelper.MakeParam("@I_isDel",		adTinyInt,	adParamInput, 0,	isDel)
		paramInfo(3) = objDBHelper.MakeParam("@I_Replay",		adVarchar,	adParamInput, 4000,	Replay) 
		paramInfo(4) = objDBHelper.MakeParam("@I_RETURN",		adInteger,	adParamOutput, 0,	0)
		objDBHelper.ExecSP "usp_BoardQnAUpdate", paramInfo, Nothing
		SetBoardQnAUpdate = objDBHelper.GetValue(paramInfo,"@I_RETURN") 
		
		Call ErrorCheck()
	End Function

	'소멸자
	Private Sub Class_Terminate()
		If Not objDBHelper Is Nothing Then
			objDBHelper.Dispose	:	Set objDBHelper = Nothing
		End If
	End Sub

End Class
%>
