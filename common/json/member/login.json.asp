<!--#include virtual="/common/fun/fncSetup.asp"-->
<!--#include virtual="/common/inc/inc_clsInit.asp"-->
<!--#include virtual="/common/class/clsMember.asp"-->
<%
'########## // Request Paramas ##########
Dim uid			: uid		= fnSqlChk(Trim(Request("email")), 0, 0)
Dim upw			: upw		= fnSqlChk(Trim(Request("upw")), 0, 0)
Dim uckSave		: uckSave	= fnSqlChk(Trim(Request("ucksave")), 1, 0)
 
'########## Request Paramas // ##########

Dim bRet : bRet = False
Dim Cols_Data : Cols_Data = 9




If Not(uid = "" Or IsNull(uid)) Then
	Set objMember = New clsMember
	Dim arrData : arrData = objMember.LoginCheck(uid,upw)
	Set objMember = Nothing

	Dim Cols_mCode

	If IsArray(arrData) Then
		Cols_mCode		= arrData(0,0)
		Cols_mName		= arrData(1,0)
		Cols_mPwd		= arrData(2,0)
		Cols_Data		= arrData(3,0)
		Cols_JoinType	= arrData(4,0)
		Cols_sgCode		= arrData(5,0)
		If upw = Cols_mPwd And Cols_Data = "0" Then
			bRet = True
			Cols_Data = 0
			With Response
				.Cookies("user")("MemberCode")		= Cols_mCode
				.Cookies("user")("Email")			= uid
				.Cookies("user")("UserName")		= Cols_mName
				.Cookies("user")("JoinType")		= Cols_JoinType
				.Cookies("user")("sgCode")			= Cols_sgCode
				.Cookies("user").domain				= sysDomain
				.Cookies("user").expires			= DateAdd("d", 1, Date)
				.Cookies("user").path				= "/"

				If uckSave = "1" Then					 
					.Cookies("LoginInfo")("LoginID")		= uid
					.Cookies("LoginInfo")("LoginPW")		= upw
					.Cookies("LoginInfo")("uckSave")		= "1"
					.Cookies("LoginInfo").Expires			= DateAdd("d", 30, Date)
				Else
					.Cookies("LoginInfo")("LoginID")		= ""
					.Cookies("LoginInfo")("LoginPW")		= ""
					.Cookies("LoginInfo")("uckSave")		= ""
					.Cookies("LoginInfo")					= ""
					.Cookies("LoginInfo").Expires			= DateAdd("yyyy", -1, Date)
				End If
				.Cookies("LoginInfo").Domain				= sysDomain

			End With
		Else
			If Cols_Data = "9" Then
				Cols_MSG = "탈퇴한 아이디입니다."
			ElseIf Cols_Data = "2" Then
				Cols_MSG = "승인중인 아이디입니다."
			Else
				Cols_MSG = "비밀번호가 다릅니다."
				Cols_Data = 3
			End If
		End If
	Else
		Cols_MSG = "해당 이메일은 가입된 정보가 없습니다."
		Cols_Data = 4
	End If
Else
	Cols_MSG = "이메일정보가 없습니다."
	Cols_Data = 9
End If


Set objJson = jsObject()
If bRet Then
	objJson("RESULT")	= "SUCCESS"
	objJson("MSG")		= "로그인 성공"
	objJson("DATA")		= Cols_Data
	Set arrJson			= Nothing
Else
	objJson("RESULT")	= "FAIL"
	objJson("MSG")		= Cols_MSG
	objJson("DATA")		= Cols_Data
End If

Response.Write toJson(objJson)
Set objJson = Nothing
 

%>