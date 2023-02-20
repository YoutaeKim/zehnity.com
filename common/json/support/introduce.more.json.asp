<!--#include virtual="/common/fun/fncSetup.asp"-->
<!--#include virtual="/common/inc/inc_clsInit.asp"-->
<!--#include virtual="/common/class/clsBoard.asp"-->
<!--#include virtual="/common/class/clsCommon.asp"-->
<%

'########## // Request Paramas ##########
Dim iSgCode     : iSgCode		= fnSqlChk(Request("sgCode"), 0, 0)
Dim iPcode      : iPcode        = fnSqlChk(Request("pCode"), 0, 0)		: iPcode	= NullValue(iPcode,0)
Dim iPage       : iPage         = fnSqlChk(Request("page"), 0, 0)		: iPage		= NullValue(iPage,1)
Dim iPageSize   : iPageSize     = fnSqlChk(Request("pageSize"), 0, 0)   : iPageSize = NullValue(iPageSize,10)
Dim iBcType		: iBcType		= fnSqlChk(Request("bcType"), 0, 0)
'########## Request Paramas // ##########

Dim bRet : bRet = 1
Dim Cols_MSG : Cols_MSG = "잘못된 접근"
Dim arrBoardList, DataList, DataModal

If iBcType = "B0104" Or iBcType = "B0105" Then
	If Not( iSgCode = "" Or IsNull(iSgCode) Or iBcType = "" Or IsNull(iBcType) ) Then
		Set objBoard = New clsBoard
		arrBoardList = objBoard.GetBoardCommonList("", "", iBcType, iSgCode, iPcode, 3, iPage, iPageSize)
		Set objBoard = Nothing
	End If
End If
If iBcType = "D0100" Then
	Set objCommon = New clsCommon
	arrBoardList  = objCommon.GetProjectSupportList(iSgCode, iPcode, iPage, iPageSize)	
	Set objCommon = Nothing	
End If


If IsArray(arrBoardList) Then
	For i = 0 To UBound(arrBoardList,2)
		If iBcType = "B0104" Then
			DataModal = DataModal & "<div class=""swiper-slide item"">"
			DataModal = DataModal & "<button type=""button"" class=""esc_btn"" onclick=""photo_modalClose();""></button>"
			DataModal = DataModal & "<div class=""img_wrap"">"
			DataModal = DataModal & "<img src="""&arrBoardList(4, i) &""" alt=""" & arrBoardList(2, i) &""">"
			DataModal = DataModal & "</div>"
			DataModal = DataModal & "<div class=""modal_tit"">" & arrBoardList(2, i) &"</div>"
			DataModal = DataModal & "<div class=""modal_sub_tit"">" & arrBoardList(5, i) & "</div>"
			DataModal = DataModal & "</div>"


			DataList = DataList & "<li class=""box"" data-num="""&arrBoardList(10, i)&""">"
			DataList = DataList & "<div class=""img_box"">"
			DataList = DataList & "<img src=""" & arrBoardList(4, i) & """ alt=""" & arrBoardList(2, i) & """>"
			DataList = DataList & "</div>"
			DataList = DataList & "<div class=""tit"">" & arrBoardList(2, i) & "</div>"
			DataList = DataList & "<div class=""date"">" & fnDateFormat(arrBoardList(8,i),6) & "</div>"
			DataList = DataList & "</li>"
		End If
		If iBcType = "B0105" Then
			If Not(arrBoardList(15, i) = "" Or isNull(arrBoardList(15, i))) Then
				If Instr(arrBoardList(15, i),"v=") > 0 Then
					Cols_YoutubeUrl = Replace(arrBoardList(15, i), "/watch?v=", "/embed/")
				End If
				If Instr(arrBoardList(15, i),"https://youtu.be/") > 0 Then
					Cols_YoutubeUrl = Replace(arrBoardList(15, i), "https://youtu.be/", "https://www.youtube.com/embed/")
				End If
			Else
				Cols_YoutubeUrl = ""
			End If

			DataModal = DataModal & "<div class=""swiper-slide item"">"
			DataModal = DataModal & "<button type=""button"" class=""esc_btn"" onclick=""vod_modalClose();""></button>"
			DataModal = DataModal & "<div class=""img_wrap"">"
			DataModal = DataModal & "<div class=""embed-container"">"
			DataModal = DataModal & "<iframe src=""" & Cols_YoutubeUrl & """ frameborder=""0"" allowfullscreen></iframe>"
			DataModal = DataModal & "</div>"
			DataModal = DataModal & "</div>"
			DataModal = DataModal & "<div class=""modal_tit"">" & arrBoardList(2, i)& "</div>"
			DataModal = DataModal & "<div class=""modal_sub_tit"">" & arrBoardList(5, i)& "</div>"
			DataModal = DataModal & "</div>"

			DataList = DataList & "<div class=""box"" data-num="""&arrBoardList(10, i)&""">"
			DataList = DataList & "<div class=""vod_left vod"">"
			DataList = DataList & "<div class=""bg_box""><button type=""button"" class=""play_btn""></button></div>"
			DataList = DataList & "<img src=""" & arrBoardList(4, i) & """ alt=""" & arrBoardList(2, i)& """></div>"
			DataList = DataList & "<div class=""vod_right vod"">"
			DataList = DataList & "<div class=""tit text_ov"">" & arrBoardList(2, i) & "</div>"
			DataList = DataList & "<div class=""alt text_ov3"">" & RemoveHTML(arrBoardList(5, i))& "</div>"
			DataList = DataList & "<div class=""date"">"&fnDateFormat(arrBoardList(8,i),6)&"</div>"
			DataList = DataList & "</div></div>"
		End If
		If iBcType = "D0100" Then
			If arrBoardList(2,i) = "0" Then
				Cols_Name = arrBoardList(0,i)
				Cols_NameCss = ""
			Else
				Cols_Name = "비공개"
				Cols_NameCss = " color"
			End If
			If arrBoardList(3,i) = "0" Then
				Cols_price = FormatNumber(arrBoardList(1,i),0)
				Cols_priceCss = ""
			Else
				Cols_price = "비공개"
				Cols_priceCss = " color"
			End If
			Cols_Level = "base"
			If arrBoardList(1,i) >= 1000 Then
				Cols_Level = "green"
			End If
			If arrBoardList(1,i) >= 2000 Then
				Cols_Level = "crown"
			End If

			DataList = DataList & "<li class=""box " & Cols_Level & """>"
			DataList = DataList & "<div class=""sub_box"">"
			DataList = DataList & "<div class=""top_box"">"
			DataList = DataList & "<div class=""img_wrap"">"
			DataList = DataList & "<img src=""/support/image/sub/join_icon.png"">"
			DataList = DataList & "</div>"
			DataList = DataList & "<div class=""right_box"">"
			DataList = DataList & "<div class=""alt" & Cols_NameCss & """>" & Cols_Name & "</div>"
			DataList = DataList & "<div class=""date"">" & fnDateFormat(arrBoardList(4,i),6) & "</div>"
			DataList = DataList & "</div>"
			DataList = DataList & "</div>"
			DataList = DataList & "<div class=""btm_box"">"
			DataList = DataList & "<div class=""won" & Cols_priceCss& """><span>$ </span> " & Cols_price & "</div>"
			DataList = DataList & "</div>"
			DataList = DataList & "</div>"
			DataList = DataList & "</li>"
		End If							

	Next
	bRet = 0
End If


Set objJson = jsObject()
If bRet ="0" Then
	objJson("RESULT")		= "SUCCESS"
	objJson("MSG")			= "성공"
	objJson("DATA")			= bRet
	objJson("DATALIST")		= DataList
	objJson("DATAMODAL")	= DataModal
	Set arrJson				= Nothing
	 
Else
	objJson("RESULT")		= "FAIL"
	objJson("MSG")			= Cols_MSG
	objJson("DATA")			= bRet
	objJson("DATALIST")		= ""
	objJson("DATAMODAL")	= ""
End If

Response.Write toJson(objJson)
Set objJson = Nothing

%>