<%
Class clsAdmin

	Private objDBHelper

	'생성자
	Private Sub Class_Initialize()
		Set objDBHelper	= New clsDBHelper		
	End Sub

	'관리자 로그인
	Public Function AdminLoginCheck(UserId,Pwd)
		'On Error Resume Next
		Dim paramInfo(1)
		paramInfo(0) = objDBHelper.MakeParam("@I_UserId",	adVarchar, adParamInput, 20, UserId)
		paramInfo(1) = objDBHelper.MakeParam("@I_Pwd",		adVarchar, adParamInput, 100, Pwd)
		AdminLoginCheck = objDBHelper.ExecSPReturnRsRow("usp_AdminLoginCheck", paramInfo, Nothing)
		
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
