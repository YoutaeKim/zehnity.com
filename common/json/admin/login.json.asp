<!--#include virtual="/common/fun/fncSetup.asp"-->
<!--#include virtual="/common/inc/inc_clsInit.asp"-->
<!--#include virtual="/common/class/clsAdmin.asp"-->
<%
'########## // Request Paramas ##########
Dim uid			: uid		= fnSqlChk(Trim(Request("userid")), 0, 0)
Dim upw			: upw		= fnSqlChk(Trim(Request("upw")), 0, 0)
Dim uckSave		: uckSave	= fnSqlChk(Trim(Request("ucksave")), 1, 0)
 
'########## Request Paramas // ##########

Dim bRet : bRet = False
Dim Cols_Data : Cols_Data = 9


If Not(uid = "" Or IsNull(uid)) Then
	Set objAdmin = New clsAdmin
	Dim arrData : arrData = objAdmin.AdminLoginCheck(uid,upw)
	Set objAdmin = Nothing
	If IsArray(arrData) Then
		Cols_aCode		= arrData(0,0)
		Cols_aName		= arrData(1,0)
		Cols_aPwd		= arrData(2,0)
		Cols_Data		= arrData(5,0)

		If upw = Cols_aPwd And Cols_Data = "0" Then
			bRet = True
			
			With Response
				.Cookies("admin")("AdminCode")		= Cols_aCode 
				.Cookies("admin")("AdminId")		= uid 
				.Cookies("admin")("AdminName")		= Cols_aName
				.Cookies("admin")("AdminLevel")		= Cols_Data
				.Cookies("admin").domain			= sysDomain
				.Cookies("admin").expires			= DateAdd("d", 1, Date)
				.Cookies("admin").path				= "/"
				If uckSave = "1" Then					 
					.Cookies("AdminLoginInfo")("LoginID")		= uid
					.Cookies("AdminLoginInfo")("LoginPW")		= upw
					.Cookies("AdminLoginInfo")("uckSave")		= "1"
					.Cookies("AdminLoginInfo").Expires			= DateAdd("d", 30, Date)
				Else
					.Cookies("AdminLoginInfo")("LoginID")		= ""
					.Cookies("AdminLoginInfo")("LoginPW")		= ""
					.Cookies("AdminLoginInfo")("uckSave")		= ""
					.Cookies("AdminLoginInfo")					= ""
					.Cookies("AdminLoginInfo").Expires			= DateAdd("yyyy", -1, Date)
				End If
				.Cookies("AdminLoginInfo").Domain				= sysDomain


			End With
		Else
			If Cols_Data = "9" Then
				Cols_MSG = "탈퇴한 아이디입니다."			
			Else
				Cols_MSG = "비밀번호가 다릅니다."
				Cols_Data = 3
			End If
		End If

	Else
		Cols_MSG = "해당 아이디는 가입된 정보가 없습니다."
		Cols_Data = 4
	End If

Else
	Cols_MSG = "아이디가 없습니다."
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