<%
Class clsCommon

	Private objDBHelper

	'생성자
	Private Sub Class_Initialize()
		Set objDBHelper	= New clsDBHelper		
	End Sub

	'후원시스템 신청
	Public Function SetSystemReg(Code, GroupName, GroupType, Homepage, WorkerName, Tel, Email, PayMethod, Attachfiles, Addr, Description)
		'On Error Resume Next
		Dim paramInfo(11)
		paramInfo(0) = objDBHelper.MakeParam("@I_Code",			adInteger,	adParamInput, 0,	Code)
		paramInfo(1) = objDBHelper.MakeParam("@I_GroupName",	adVarchar,	adParamInput, 200,	GroupName)
		paramInfo(2) = objDBHelper.MakeParam("@I_GroupType",	adTinyInt,	adParamInput, 0,	GroupType)
		paramInfo(3) = objDBHelper.MakeParam("@I_Homepage",		adVarchar,	adParamInput, 200,	Homepage)
		paramInfo(4) = objDBHelper.MakeParam("@I_WorkerName",	adVarchar,	adParamInput, 100,	WorkerName)
		paramInfo(5) = objDBHelper.MakeParam("@I_Tel",			adVarchar,	adParamInput, 20,	Tel)
		paramInfo(6) = objDBHelper.MakeParam("@I_Email",		adVarchar,	adParamInput, 100,	Email)
		paramInfo(7) = objDBHelper.MakeParam("@I_PayMethod",	adVarchar,	adParamInput, 50,	PayMethod)
		paramInfo(8) = objDBHelper.MakeParam("@I_Attachfiles",	adVarchar,	adParamInput, 100,	Attachfiles)
		paramInfo(9) = objDBHelper.MakeParam("@I_Addr",			adVarchar,	adParamInput, 200,	Addr)
		paramInfo(10) = objDBHelper.MakeParam("@I_Description",	adVarchar,	adParamInput, 4000,	Description)
		paramInfo(11) = objDBHelper.MakeParam("@I_RETURN",	adInteger,	adParamOutput, 0,	0)

		objDBHelper.ExecSP "usp_SystemReg", paramInfo, Nothing
		SetSystemReg = objDBHelper.GetValue(paramInfo,"@I_RETURN")

		Call ErrorCheck()
	End Function

	'후원단체 정보관리 정보- 회원정보코드로 조회
	Public Function GetSupportGroupInfo(Code)
		'On Error Resume Next
		Dim paramInfo(0)
		paramInfo(0) = objDBHelper.MakeParam("@I_Code",			adInteger,	adParamInput, 0,	Code)
		GetSupportGroupInfo = objDBHelper.ExecSPReturnRsRow("usp_SupportGroupInfo", paramInfo, Nothing)
		
		Call ErrorCheck()
	End Function

	'후원단체 정보변경
	Public Function SetSystemUpdate(mCode, sgCode , GroupName, GroupType, Homepage, WorkerName, Tel, Email, PayMethod, LogoImg, Addr, Description, Template)
		'On Error Resume Next
		Dim paramInfo(13)
		paramInfo(0) = objDBHelper.MakeParam("@I_Code",			adInteger,	adParamInput, 0,	mCode)
		paramInfo(1) = objDBHelper.MakeParam("@I_sgCode",		adInteger,	adParamInput, 0,	sgCode)
		paramInfo(2) = objDBHelper.MakeParam("@I_GroupName",	adVarchar,	adParamInput, 200,	GroupName)
		paramInfo(3) = objDBHelper.MakeParam("@I_GroupType",	adTinyInt,	adParamInput, 0,	GroupType)
		paramInfo(4) = objDBHelper.MakeParam("@I_Homepage",		adVarchar,	adParamInput, 200,	Homepage)
		paramInfo(5) = objDBHelper.MakeParam("@I_WorkerName",	adVarchar,	adParamInput, 100,	WorkerName)
		paramInfo(6) = objDBHelper.MakeParam("@I_Tel",			adVarchar,	adParamInput, 20,	Tel)
		paramInfo(7) = objDBHelper.MakeParam("@I_Email",		adVarchar,	adParamInput, 100,	Email)
		paramInfo(8) = objDBHelper.MakeParam("@I_PayMethod",	adVarchar,	adParamInput, 50,	PayMethod)
		paramInfo(9) = objDBHelper.MakeParam("@I_LogoImg",		adVarchar,	adParamInput, 100,	LogoImg)
		paramInfo(10) = objDBHelper.MakeParam("@I_Addr",		adVarchar,	adParamInput, 200,	Addr)
		paramInfo(11) = objDBHelper.MakeParam("@I_Description",	adVarchar,	adParamInput, 255,	Description)
		paramInfo(12) = objDBHelper.MakeParam("@I_Template",	adVarchar,	adParamInput, 200,	Template)
		paramInfo(13) = objDBHelper.MakeParam("@I_RETURN",		adInteger,	adParamOutput, 0,	0)

		objDBHelper.ExecSP "usp_SystemUpdate", paramInfo, Nothing
		SetSystemUpdate = objDBHelper.GetValue(paramInfo,"@I_RETURN")

		Call ErrorCheck()
	End Function

	'후원단체 추가 정보 변경
	Public Function SetSupportGroupAddUpdate(sgCode, TitleImg1, TitleImg2, TitleImg3, TitleName, TitleDesc, IntroImg1, IntroImg2, IntroImg3, IntroTitle, IntroDesc, MapX, MapY )
		'On Error Resume Next
		Dim paramInfo(13)
		paramInfo(0) = objDBHelper.MakeParam("@I_sgCode",			adInteger,	adParamInput, 0,	sgCode)
		paramInfo(1) = objDBHelper.MakeParam("@I_TitleImg1",		adVarchar,	adParamInput, 100,	TitleImg1)
		paramInfo(2) = objDBHelper.MakeParam("@I_TitleImg2",		adVarchar,	adParamInput, 100,	TitleImg2)
		paramInfo(3) = objDBHelper.MakeParam("@I_TitleImg3",		adVarchar,	adParamInput, 100,	TitleImg3)
		paramInfo(4) = objDBHelper.MakeParam("@I_TitleName",		adVarchar,	adParamInput, 4000,	TitleName)
		paramInfo(5) = objDBHelper.MakeParam("@I_TitleDescription",	adVarchar,	adParamInput, 4000,	TitleDesc)
		paramInfo(6) = objDBHelper.MakeParam("@I_IntroImg1",		adVarchar,	adParamInput, 100,	IntroImg1)
		paramInfo(7) = objDBHelper.MakeParam("@I_IntroImg2",		adVarchar,	adParamInput, 100,	IntroImg2)
		paramInfo(8) = objDBHelper.MakeParam("@I_IntroImg3",		adVarchar,	adParamInput, 100,	IntroImg3)
		paramInfo(9) = objDBHelper.MakeParam("@I_IntroTitle",		adVarchar,	adParamInput, 4000,	IntroTitle)
		paramInfo(10) = objDBHelper.MakeParam("@I_IntroDescription",adVarchar,	adParamInput, 4000,	IntroDesc)
		paramInfo(11) = objDBHelper.MakeParam("@I_MapX",			adVarchar,	adParamInput, 30,	MapX)
		paramInfo(12) = objDBHelper.MakeParam("@I_MapY",			adVarchar,	adParamInput, 30,	MapY)
		paramInfo(13) = objDBHelper.MakeParam("@I_RETURN",		adInteger,	adParamOutput, 0,	0)


		objDBHelper.ExecSP "usp_SupportGroupAddUpdate", paramInfo, Nothing
		SetSupportGroupAddUpdate = objDBHelper.GetValue(paramInfo,"@I_RETURN")

		Call ErrorCheck()
	End Function

	'프로젝트 리스트 
	Public Function GetProjectList(Code, Page, PageSize)
		'On Error Resume Next
		Dim paramInfo(2)
		paramInfo(0) = objDBHelper.MakeParam("@I_Code",		adInteger,	adParamInput, 0,	Code)
		paramInfo(1) = objDBHelper.MakeParam("@I_Page",		adInteger,	adParamInput, 0,	Page)
		paramInfo(2) = objDBHelper.MakeParam("@I_PageSize",	adInteger,	adParamInput, 0,	PageSize)
		GetProjectList = objDBHelper.ExecSPReturnRsRow("usp_ProjectList", paramInfo, Nothing)
		
		Call ErrorCheck()
	End Function

	'전체 후원그룹 리스트 
	Public Function GetAllSupportGroupList(SearchType, SearchText, Page, PageSize)
		'On Error Resume Next
		Dim paramInfo(3)
		paramInfo(0) = objDBHelper.MakeParam("@I_SearchType",	adVarchar,	adParamInput, 10,	SearchType)
		paramInfo(1) = objDBHelper.MakeParam("@I_SearchText",	adVarchar,	adParamInput, 100,	SearchText)
		paramInfo(2) = objDBHelper.MakeParam("@I_Page",			adInteger,	adParamInput, 0,	Page)
		paramInfo(3) = objDBHelper.MakeParam("@I_PageSize",		adInteger,	adParamInput, 0,	PageSize)
		GetAllSupportGroupList = objDBHelper.ExecSPReturnRsRow("usp_AllSupportGroupList", paramInfo, Nothing)
		
		Call ErrorCheck()
	End Function

	'전체 프로젝트 리스트 
	Public Function GetAllProjectList(SearchType, SearchText, Ptype,  Page, PageSize)
		'On Error Resume Next
		Dim paramInfo(4)
		paramInfo(0) = objDBHelper.MakeParam("@I_SearchType",	adVarchar,	adParamInput, 10,	SearchType)
		paramInfo(1) = objDBHelper.MakeParam("@I_SearchText",	adVarchar,	adParamInput, 100,	SearchText)
		paramInfo(2) = objDBHelper.MakeParam("@I_ProjectType",	adTinyInt,	adParamInput, 0,	Ptype)
		paramInfo(3) = objDBHelper.MakeParam("@I_Page",			adInteger,	adParamInput, 0,	Page)
		paramInfo(4) = objDBHelper.MakeParam("@I_PageSize",		adInteger,	adParamInput, 0,	PageSize)
		GetAllProjectList = objDBHelper.ExecSPReturnRsRow("usp_AllProjectList", paramInfo, Nothing)
		
		Call ErrorCheck()
	End Function


	'프로젝트 정보 조회
	Public Function GetProjectInfo(pCode)
		'On Error Resume Next
		Dim paramInfo(0)
		paramInfo(0) = objDBHelper.MakeParam("@I_pCode",			adInteger,	adParamInput, 0,	pCode)
		GetProjectInfo = objDBHelper.ExecSPReturnRsRow("usp_ProjectInfo", paramInfo, Nothing)
		
		Call ErrorCheck()
	End Function
	
	'프로젝트 정보 변경
	Public Function SetProjectUpdate(pCode, sgCode, mCode, Template, ProjectImg, ProjectName, TargetMoney, PayMothod, Tel, Email, StartDate, EndDate, Menu, Description)
		'On Error Resume Next
		Dim paramInfo(14)
		paramInfo(0) = objDBHelper.MakeParam("@I_pCode",			adInteger,	adParamInput, 0,	pCode)
		paramInfo(1) = objDBHelper.MakeParam("@I_sgCode",			adInteger,	adParamInput, 0,	sgCode)
		paramInfo(2) = objDBHelper.MakeParam("@I_mCode",			adInteger,	adParamInput, 0,	mCode)
		paramInfo(3) = objDBHelper.MakeParam("@I_Template",			adVarchar,	adParamInput, 1,	Template)
		paramInfo(4) = objDBHelper.MakeParam("@I_ProjectImg",		adVarchar,	adParamInput, 100,	ProjectImg)
		paramInfo(5) = objDBHelper.MakeParam("@I_ProjectName",		adVarchar,	adParamInput, 200,	ProjectName)
		paramInfo(6) = objDBHelper.MakeParam("@I_TargetMoney",		adInteger,	adParamInput, 0,	TargetMoney)
		paramInfo(7) = objDBHelper.MakeParam("@I_PayMothod",		adVarchar,	adParamInput, 10,	PayMothod)
		paramInfo(8) = objDBHelper.MakeParam("@I_Tel",				adVarchar,	adParamInput, 20,	Tel)
		paramInfo(9) = objDBHelper.MakeParam("@I_Email",			adVarchar,	adParamInput, 100,	Email)
		paramInfo(10) = objDBHelper.MakeParam("@I_StartDate",		adVarchar,	adParamInput, 10,	StartDate)
		paramInfo(11) = objDBHelper.MakeParam("@I_EndDate",			adVarchar,	adParamInput, 10,	EndDate)
		paramInfo(12) = objDBHelper.MakeParam("@I_Menu",			adVarchar,	adParamInput, 100,	Menu)
		paramInfo(13) = objDBHelper.MakeParam("@I_Description",		adVarchar,	adParamInput, 4000,	Description)
		paramInfo(14) = objDBHelper.MakeParam("@I_RETURN",		adInteger,	adParamOutput, 0,	0)
		objDBHelper.ExecSP "usp_ProjectUpdate", paramInfo, Nothing
		SetProjectUpdate = objDBHelper.GetValue(paramInfo,"@I_RETURN")

		Call ErrorCheck()
	End Function

	'후원단체 메인 정보
	Public Function GetSupportMainInfo(sgCode)
		'On Error Resume Next
		Dim paramInfo(0)
		paramInfo(0) = objDBHelper.MakeParam("@I_sgCode",			adInteger,	adParamInput, 0,	sgCode)
		GetSupportMainInfo = objDBHelper.ExecSPReturnRsRow("usp_SupportMainInfo", paramInfo, Nothing)
		
		Call ErrorCheck()
	End Function	

	'후원단체 프로젝트 리스트
	Public Function GetSupportProjectList(sgCode, ingYn)
		'On Error Resume Next
		Dim paramInfo(1)
		paramInfo(0) = objDBHelper.MakeParam("@I_sgCode",		adInteger,	adParamInput, 0,	sgCode)
		paramInfo(1) = objDBHelper.MakeParam("@I_Ing",			adTinyInt,	adParamInput, 0,	ingYn)		
		GetSupportProjectList = objDBHelper.ExecSPReturnRsRow("usp_SupportProjectList", paramInfo, Nothing)

		Call ErrorCheck()
	End Function	

	'이메일 수집 업데이트
	Public Function SetSubscribeEmailUpdate(sgCode, email)
		'On Error Resume Next
		Dim paramInfo(2)
		paramInfo(0) = objDBHelper.MakeParam("@I_sgCode",			adInteger,	adParamInput, 0,	sgCode)
		paramInfo(1) = objDBHelper.MakeParam("@I_Email",			adVarchar,	adParamInput, 100,	email)
		paramInfo(2) = objDBHelper.MakeParam("@I_RETURN",		adInteger,	adParamOutput, 0,	0)
		objDBHelper.ExecSP "usp_SubscribeEmailUpdate", paramInfo, Nothing
		SetSubscribeEmailUpdate = objDBHelper.GetValue(paramInfo,"@I_RETURN")

		Call ErrorCheck()
	End Function

	'프로젝트 후원하기
	Public Function SetProjectSupportUpdate(sgCode, pCode, spName, spMoney, spNameSecret, spMoneySecret, payMethod, spContents, pgUsed, pgAuth)
		'On Error Resume Next
		Dim paramInfo(10)
		paramInfo(0) = objDBHelper.MakeParam("@I_sgCode",			adInteger,	adParamInput, 0,	sgCode)
		paramInfo(1) = objDBHelper.MakeParam("@I_pCode",			adInteger,	adParamInput, 0,	pCode)
		paramInfo(2) = objDBHelper.MakeParam("@I_SpName",			adVarchar,	adParamInput, 100,	spName)
		paramInfo(3) = objDBHelper.MakeParam("@I_SpMoney",			adInteger,	adParamInput, 0,	spMoney)
		paramInfo(4) = objDBHelper.MakeParam("@I_SpNameSecret",		adTinyInt,	adParamInput, 0,	spNameSecret)
		paramInfo(5) = objDBHelper.MakeParam("@I_SpMoneySecret",	adTinyInt,	adParamInput, 0,	spMoneySecret)
		paramInfo(6) = objDBHelper.MakeParam("@I_PayMethod",		adVarchar,	adParamInput, 10,	payMethod)
		paramInfo(7) = objDBHelper.MakeParam("@I_SpContents",		adVarchar,	adParamInput, 4000,	spContents)
		paramInfo(8) = objDBHelper.MakeParam("@I_PGused",			adTinyInt,	adParamInput, 0,	pgUsed)
		paramInfo(9) = objDBHelper.MakeParam("@I_PGauth",			adVarchar,	adParamInput, 100,	pgAuth)
		paramInfo(10) = objDBHelper.MakeParam("@I_RETURN",		adInteger,	adParamOutput, 0,	0)
		objDBHelper.ExecSP "usp_ProjectSupportUpdate", paramInfo, Nothing
		SetProjectSupportUpdate = objDBHelper.GetValue(paramInfo,"@I_RETURN")

		Call ErrorCheck()
	End Function
		
	'프로젝트 후원리스트
	Public Function GetProjectSupportList(sgCode, pCode, page, pageSize)
		'On Error Resume Next
		Dim paramInfo(3)
		paramInfo(0) = objDBHelper.MakeParam("@I_sgCode",		adInteger,	adParamInput, 0,	sgCode)
		paramInfo(1) = objDBHelper.MakeParam("@I_pCode",		adInteger,	adParamInput, 0,	pCode)
		paramInfo(2) = objDBHelper.MakeParam("@I_Page",			adInteger,	adParamInput, 0,	Page)
		paramInfo(3) = objDBHelper.MakeParam("@I_PageSize",		adInteger,	adParamInput, 0,	PageSize)
		GetProjectSupportList = objDBHelper.ExecSPReturnRsRow("usp_ProjectSupportList", paramInfo, Nothing)
		
		Call ErrorCheck()
	End Function

	'헌금 리스트 성경말씀 랜덤가져오기
	Public Function GetDonationList()
		'On Error Resume Next
		GetDonationList = objDBHelper.ExecSPReturnRsRow("usp_DonationList", Nothing, Nothing)
		
		Call ErrorCheck()
	End Function

	'헌금 하기
	Public Function SetDonationReg(sgCode, dType, dMoney, userName, payMethod, prayerTitle, pgUsed, pgAuth)	
		'On Error Resume Next
		Dim paramInfo(8)
		paramInfo(0) = objDBHelper.MakeParam("@I_sgCode",		adInteger,	adParamInput, 0,	sgCode)
		paramInfo(1) = objDBHelper.MakeParam("@I_type",			adVarchar,	adParamInput, 6,	dType)
		paramInfo(2) = objDBHelper.MakeParam("@I_money",		adInteger,	adParamInput, 0,	dMoney)
		paramInfo(3) = objDBHelper.MakeParam("@I_userName",		adVarchar,	adParamInput, 100,	userName)
		paramInfo(4) = objDBHelper.MakeParam("@I_payMethod",	adVarchar,	adParamInput, 10,	payMethod)
		paramInfo(5) = objDBHelper.MakeParam("@I_prayerTitle",	adVarchar,	adParamInput, 4000,	prayerTitle)	
		paramInfo(6) = objDBHelper.MakeParam("@I_pgUsed",		adTinyInt,	adParamInput, 0,	pgUsed)
		paramInfo(7) = objDBHelper.MakeParam("@I_pgAuth",		adVarchar,	adParamInput, 100,	pgAuth)
		paramInfo(8) = objDBHelper.MakeParam("@I_RETURN",		adInteger,	adParamOutput, 0,	0)
		objDBHelper.ExecSP "usp_DonationReg", paramInfo, Nothing
		SetDonationReg = objDBHelper.GetValue(paramInfo,"@I_RETURN")

		Call ErrorCheck()
	End Function

	'메인 프로젝트 갯수, 금액, 후원단체 수치 가져오기
	Public Function GetMainInfo()
		'On Error Resume Next
		GetMainInfo = objDBHelper.ExecSPReturnRsRow("usp_MainInfo", Nothing, Nothing)
		
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
