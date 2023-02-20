<!--#include virtual="/common/fun/fncSetup.asp"-->
<!--#include virtual="/common/inc/inc_clsInit.asp"-->
<!--#include virtual="/common/class/clsCommon.asp"-->
<%
'########## // Request Paramas ##########
Dim iGsCode		: iGsCode		= fnSqlChk(Request("gsCode"), 0, 0)		: iGsCode = NullValue(iGsCode,0)
'########## Request Paramas // ##########
Set objCommon = New clsCommon
Dim arrList : arrList = objCommon.GetSupportProjectList(iGsCode, 0)
Set objCommon = Nothing
Response.Write "<option value=""0"">프로젝트 선택</option>"
If IsArray(arrList) Then		
	For i = 0 To UBound(arrList,2)
		Response.Write "<option value="""&arrList(0,i)&""">"&arrList(2,i)&"</option>"
	Next
End If
%>