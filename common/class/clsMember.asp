<%
Class clsMember

	Private objDBHelper

	'생성자
	Private Sub Class_Initialize()
		Set objDBHelper	= New clsDBHelper		
	End Sub


	'이메일 중복 조회
	Public Function EamilCheck(Email)
		'On Error Resume Next
		Dim paramInfo(0)
		paramInfo(0) = objDBHelper.MakeParam("@I_Email",		adVarchar, adParamInput, 100, Email)
		EamilCheck = objDBHelper.ExecSPReturnRsRow("usp_EamilCheck", paramInfo, Nothing)
		
		Call ErrorCheck()
	End Function

	'이메일 로그인
	Public Function LoginCheck(Email,Pwd)
		'On Error Resume Next
		Dim paramInfo(1)
		paramInfo(0) = objDBHelper.MakeParam("@I_Email",	adVarchar, adParamInput, 100, Email)
		paramInfo(1) = objDBHelper.MakeParam("@I_Pwd",		adVarchar, adParamInput, 50, Pwd)
		LoginCheck = objDBHelper.ExecSPReturnRsRow("usp_LoginCheck", paramInfo, Nothing)
		
		Call ErrorCheck()
	End Function


	'회원가입
	Public Function setMemberJoin(Email, UserName, UserPhone, UserPwd, JoinType, Auth, JoinIp)
		'On Error Resume Next		 
		Dim paramInfo(7)
		paramInfo(0) = objDBHelper.MakeParam("@I_Email",	adVarchar,	adParamInput, 100,	Email)
		paramInfo(1) = objDBHelper.MakeParam("@I_Name",		adVarchar,	adParamInput, 50,	UserName)
		paramInfo(2) = objDBHelper.MakeParam("@I_Phone",	adVarchar,	adParamInput, 20,	UserPhone)
		paramInfo(3) = objDBHelper.MakeParam("@I_Pwd",		adVarchar,	adParamInput, 50,	UserPwd)
		paramInfo(4) = objDBHelper.MakeParam("@I_JoinType",	adTinyInt,	adParamInput,  0,	JoinType)	
		paramInfo(5) = objDBHelper.MakeParam("@I_Auth",		adVarchar,	adParamInput, 200,	Auth)
		paramInfo(6) = objDBHelper.MakeParam("@I_JoinIp",	adVarchar,	adParamInput, 20,	JoinIp)
		paramInfo(7) = objDBHelper.MakeParam("@I_RETURN",	adInteger,	adParamOutput, 0,	0)

		objDBHelper.ExecSP "usp_MemberJoin", paramInfo, Nothing
		setMemberJoin = objDBHelper.GetValue(paramInfo,"@I_RETURN")

		Call ErrorCheck()
	End Function

	'비밀번호변경
	Public Function setMemberPwdChange(Email, UserPwd)
		'On Error Resume Next		 
		Dim paramInfo(2)
		paramInfo(0) = objDBHelper.MakeParam("@I_Email",	adVarchar,	adParamInput, 100,	Email)
		paramInfo(1) = objDBHelper.MakeParam("@I_Pwd",		adVarchar,	adParamInput, 50,	UserPwd)
		paramInfo(2) = objDBHelper.MakeParam("@I_RETURN",	adInteger,	adParamOutput, 0,	0)
		objDBHelper.ExecSP "usp_MemberPwdChange", paramInfo, Nothing
		setMemberPwdChange = objDBHelper.GetValue(paramInfo,"@I_RETURN")

		Call ErrorCheck()
	End Function

	'진행중인프로젝트 갯수, 후원금 합계
	Public Function getMypageInfo(code)
		'On Error Resume Next		 
		Dim paramInfo(0)
		paramInfo(0) = objDBHelper.MakeParam("@I_Code",	adInteger,	adParamInput, 0,	code)
		getMypageInfo = objDBHelper.ExecSPReturnRsRow("usp_MypageInfo", paramInfo, Nothing)
		
		Call ErrorCheck()
	End Function

	'마이페이지 비번변경
	Public Function setMypagePwdChange(Code, BeforePwd, NewPwd)
		'On Error Resume Next		 
		Dim paramInfo(3)
		paramInfo(0) = objDBHelper.MakeParam("@I_Code",		adInteger,	adParamInput, 0,	Code)
		paramInfo(1) = objDBHelper.MakeParam("@I_BeforePwd",adVarchar,	adParamInput, 50,	BeforePwd)
		paramInfo(2) = objDBHelper.MakeParam("@I_NewPwd",	adVarchar,	adParamInput, 50,	NewPwd)
		paramInfo(3) = objDBHelper.MakeParam("@I_RETURN",	adInteger,	adParamOutput, 0,	0)
		objDBHelper.ExecSP "usp_MypageInfoPwdChange", paramInfo, Nothing
		setMypagePwdChange = objDBHelper.GetValue(paramInfo,"@I_RETURN")

		Call ErrorCheck()
	End Function

	'마이페이지 회원탈퇴
	Public Function setMemberOut(Code)
		'On Error Resume Next		 
		Dim paramInfo(1)
		paramInfo(0) = objDBHelper.MakeParam("@I_Code",		adInteger,	adParamInput, 0,	Code)
		paramInfo(1) = objDBHelper.MakeParam("@I_RETURN",	adInteger,	adParamOutput, 0,	0)
		objDBHelper.ExecSP "usp_MemberOut", paramInfo, Nothing
		setMemberOut = objDBHelper.GetValue(paramInfo,"@I_RETURN")

		Call ErrorCheck()
	End Function

	'전체 회원 리스트
	Public Function GetAllMemberList(SearchType, SearchText, Page, PageSize)
		'On Error Resume Next
		Dim paramInfo(3)
		paramInfo(0) = objDBHelper.MakeParam("@I_SearchType",	adVarchar,	adParamInput, 10,	SearchType)
		paramInfo(1) = objDBHelper.MakeParam("@I_SearchText",	adVarchar,	adParamInput, 100,	SearchText)
		paramInfo(2) = objDBHelper.MakeParam("@I_Page",			adInteger,	adParamInput, 0,	Page)
		paramInfo(3) = objDBHelper.MakeParam("@I_PageSize",		adInteger,	adParamInput, 0,	PageSize)
		GetAllMemberList = objDBHelper.ExecSPReturnRsRow("usp_AllMemberList", paramInfo, Nothing)
		
		Call ErrorCheck()
	End Function

	'회원 정보조회
	Public Function GetMemberInfo(mCode)
		'On Error Resume Next		 
		Dim paramInfo(0)
		paramInfo(0) = objDBHelper.MakeParam("@I_mCode",		adInteger,	adParamInput, 0,	mCode)
		GetMemberInfo = objDBHelper.ExecSPReturnRsRow("usp_MemberInfo", paramInfo, Nothing)
		
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
