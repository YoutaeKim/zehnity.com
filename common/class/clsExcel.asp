<%
Class clsExcel

	'생성자
	Private Sub Class_Initialize()
		Response.Write "<?xml version=""1.0"" encoding=""UTF-8""?>"
		Response.Write "<Workbook xmlns=""urn:schemas-microsoft-com:office:spreadsheet"" xmlns:o=""urn:schemas-microsoft-com:office:office"" xmlns:x=""urn:schemas-microsoft-com:office:excel"" xmlns:ss=""urn:schemas-microsoft-com:office:spreadsheet"" xmlns:html=""http://www.w3.org/TR/REC-html40"">"
	
		With Response
			.Write "<Styles>"
			.Write "  <Style ss:ID=""Default"" ss:Name=""Normal"">"
			.Write "    <Alignment ss:Vertical=""Center""/>"
			.Write "    <Font ss:FontName=""맑은 고딕"" x:CharSet=""129"" x:Family=""Modern"" ss:Size=""10"" ss:Color=""#000000""/>"
			.Write "  </Style>"
			.Write "  <Style ss:ID=""tit"">"
			.Write "    <Alignment ss:Horizontal=""Center"" ss:Vertical=""Center""/>"
			.Write "    <Borders>"
			.Write "      <Border ss:Position=""Bottom"" ss:LineStyle=""Continuous"" ss:Weight=""1""/>"
			.Write "      <Border ss:Position=""Left"" ss:LineStyle=""Continuous"" ss:Weight=""1""/>"
			.Write "      <Border ss:Position=""Right"" ss:LineStyle=""Continuous"" ss:Weight=""1""/>"
			.Write "      <Border ss:Position=""Top"" ss:LineStyle=""Continuous"" ss:Weight=""1""/>"
			.Write "    </Borders>"
			.Write "    <Font ss:FontName=""맑은 고딕"" x:CharSet=""129"" x:Family=""Modern"" ss:Size=""10"" />"
			.Write "    <Interior ss:Color=""#EEEEEE"" ss:Pattern=""Solid""/>"			
			.Write "  </Style>"
			.Write "  <Style ss:ID=""str"">"
			.Write "    <Borders>"
			.Write "      <Border ss:Position=""Bottom"" ss:LineStyle=""Continuous"" ss:Weight=""1""/>"
			.Write "      <Border ss:Position=""Left"" ss:LineStyle=""Continuous"" ss:Weight=""1""/>"
			.Write "      <Border ss:Position=""Right"" ss:LineStyle=""Continuous"" ss:Weight=""1""/>"
			.Write "      <Border ss:Position=""Top"" ss:LineStyle=""Continuous"" ss:Weight=""1""/>"
			.Write "    </Borders>"
			.Write "  </Style>"
			.Write "  <Style ss:ID=""str1"">"
			.Write "    <Borders>"
			.Write "      <Border ss:Position=""Bottom"" ss:LineStyle=""Continuous"" ss:Weight=""1""/>"
			.Write "      <Border ss:Position=""Left"" ss:LineStyle=""Continuous"" ss:Weight=""1""/>"
			.Write "      <Border ss:Position=""Right"" ss:LineStyle=""Continuous"" ss:Weight=""1""/>"
			.Write "      <Border ss:Position=""Top"" ss:LineStyle=""Continuous"" ss:Weight=""1""/>"
			.Write "    </Borders>"
			.Write "    <Font ss:FontName=""맑은 고딕"" x:CharSet=""129"" x:Family=""Modern"" ss:Size=""10"" />"
			.Write "    <NumberFormat ss:Format=""#,##0""/>"
			.Write "  </Style>"
			.Write "  <Style ss:ID=""num"">"
			.Write "    <Borders>"
			.Write "      <Border ss:Position=""Bottom"" ss:LineStyle=""Continuous"" ss:Weight=""1""/>"
			.Write "      <Border ss:Position=""Left"" ss:LineStyle=""Continuous"" ss:Weight=""1""/>"
			.Write "      <Border ss:Position=""Right"" ss:LineStyle=""Continuous"" ss:Weight=""1""/>"
			.Write "      <Border ss:Position=""Top"" ss:LineStyle=""Continuous"" ss:Weight=""1""/>"
			.Write "    </Borders>"
			.Write "    <NumberFormat ss:Format=""#,##0""/>"
			.Write "  </Style>"
			.Write "  <Style ss:ID=""num2"">"
			.Write "    <Borders>"
			.Write "      <Border ss:Position=""Bottom"" ss:LineStyle=""Continuous"" ss:Weight=""1""/>"
			.Write "      <Border ss:Position=""Left"" ss:LineStyle=""Continuous"" ss:Weight=""1""/>"
			.Write "      <Border ss:Position=""Right"" ss:LineStyle=""Continuous"" ss:Weight=""1""/>"
			.Write "      <Border ss:Position=""Top"" ss:LineStyle=""Continuous"" ss:Weight=""1""/>"
			.Write "    </Borders>"
			.Write "    <NumberFormat ss:Format=""#,##0""/>"
			.Write "    <Font ss:FontName=""맑은 고딕"" x:CharSet=""129"" x:Family=""Modern"" ss:Size=""10"" />"
			.Write "  </Style>"
			.Write "  <Style ss:ID=""rate"">"
			.Write "    <Borders>"
			.Write "      <Border ss:Position=""Bottom"" ss:LineStyle=""Continuous"" ss:Weight=""1""/>"
			.Write "      <Border ss:Position=""Left"" ss:LineStyle=""Continuous"" ss:Weight=""1""/>"
			.Write "      <Border ss:Position=""Right"" ss:LineStyle=""Continuous"" ss:Weight=""1""/>"
			.Write "      <Border ss:Position=""Top"" ss:LineStyle=""Continuous"" ss:Weight=""1""/>"
			.Write "    </Borders>"
			.Write "    <NumberFormat ss:Format=""Percent""/>"
			.Write "  </Style>"
			.Write "  <Style ss:ID=""sum"">"
			.Write "    <Borders>"
			.Write "      <Border ss:Position=""Bottom"" ss:LineStyle=""Continuous"" ss:Weight=""1""/>"
			.Write "      <Border ss:Position=""Left"" ss:LineStyle=""Continuous"" ss:Weight=""1""/>"
			.Write "      <Border ss:Position=""Right"" ss:LineStyle=""Continuous"" ss:Weight=""1""/>"
			.Write "      <Border ss:Position=""Top"" ss:LineStyle=""Continuous"" ss:Weight=""1""/>"
			.Write "    </Borders>"
			.Write "    <Font ss:FontName=""맑은 고딕"" x:CharSet=""129"" x:Family=""Modern"" ss:Size=""10"" />"
			.Write "    <Interior ss:Color=""#F4E9E1"" ss:Pattern=""Solid""/>"
			.Write "    <NumberFormat ss:Format=""#,##0""/>"
			.Write "  </Style>"
			.Write "  <Style ss:ID=""sum1"">"
			.Write "    <Borders>"
			.Write "      <Border ss:Position=""Bottom"" ss:LineStyle=""Continuous"" ss:Weight=""1""/>"
			.Write "      <Border ss:Position=""Left"" ss:LineStyle=""Continuous"" ss:Weight=""1""/>"
			.Write "      <Border ss:Position=""Right"" ss:LineStyle=""Continuous"" ss:Weight=""1""/>"
			.Write "      <Border ss:Position=""Top"" ss:LineStyle=""Continuous"" ss:Weight=""1""/>"
			.Write "    </Borders>"
			.Write "    <Font ss:FontName=""맑은 고딕"" x:CharSet=""129"" x:Family=""Modern"" ss:Size=""10"" />"
			.Write "    <Interior ss:Color=""#F4E9E1"" ss:Pattern=""Solid""/>"
			.Write "    <NumberFormat ss:Format=""Percent""/>"
			.Write "  </Style>"
			.Write "  <Style ss:ID=""sum2"">"
			.Write "    <Borders>"
			.Write "      <Border ss:Position=""Bottom"" ss:LineStyle=""Continuous"" ss:Weight=""1""/>"
			.Write "      <Border ss:Position=""Left"" ss:LineStyle=""Continuous"" ss:Weight=""1""/>"
			.Write "      <Border ss:Position=""Right"" ss:LineStyle=""Continuous"" ss:Weight=""1""/>"
			.Write "      <Border ss:Position=""Top"" ss:LineStyle=""Continuous"" ss:Weight=""1""/>"
			.Write "    </Borders>"
			.Write "    <Font ss:FontName=""맑은 고딕"" x:CharSet=""129"" x:Family=""Modern"" ss:Size=""10"" />"
			.Write "    <Interior ss:Color=""#ECECEC"" ss:Pattern=""Solid""/>"
			.Write "    <NumberFormat ss:Format=""#,##0""/>"
			.Write "  </Style>"
			.Write "  <Style ss:ID=""sum3"">"
			.Write "    <Borders>"
			.Write "      <Border ss:Position=""Bottom"" ss:LineStyle=""Continuous"" ss:Weight=""1""/>"
			.Write "      <Border ss:Position=""Left"" ss:LineStyle=""Continuous"" ss:Weight=""1""/>"
			.Write "      <Border ss:Position=""Right"" ss:LineStyle=""Continuous"" ss:Weight=""1""/>"
			.Write "      <Border ss:Position=""Top"" ss:LineStyle=""Continuous"" ss:Weight=""1""/>"
			.Write "    </Borders>"
			.Write "    <Font ss:FontName=""맑은 고딕"" x:CharSet=""129"" x:Family=""Modern"" ss:Size=""10"" />"
			.Write "    <Interior ss:Color=""#ECECEC"" ss:Pattern=""Solid""/>"
			.Write "    <NumberFormat ss:Format=""Percent""/>"
			.Write "  </Style>"
			.Write "  <Style ss:ID=""tot"">"
			.Write "    <Borders>"
			.Write "      <Border ss:Position=""Bottom"" ss:LineStyle=""Continuous"" ss:Weight=""1""/>"
			.Write "      <Border ss:Position=""Left"" ss:LineStyle=""Continuous"" ss:Weight=""1""/>"
			.Write "      <Border ss:Position=""Right"" ss:LineStyle=""Continuous"" ss:Weight=""1""/>"
			.Write "      <Border ss:Position=""Top"" ss:LineStyle=""Continuous"" ss:Weight=""1""/>"
			.Write "    </Borders>"
			.Write "    <Font ss:FontName=""맑은 고딕"" x:CharSet=""129"" x:Family=""Modern"" ss:Size=""10"" />"
			.Write "    <Interior ss:Color=""#EEF3F9"" ss:Pattern=""Solid""/>"
			.Write "    <NumberFormat ss:Format=""#,##0""/>"
			.Write "  </Style>"
			.Write "  <Style ss:ID=""tot1"">"
			.Write "    <Borders>"
			.Write "      <Border ss:Position=""Bottom"" ss:LineStyle=""Continuous"" ss:Weight=""1""/>"
			.Write "      <Border ss:Position=""Left"" ss:LineStyle=""Continuous"" ss:Weight=""1""/>"
			.Write "      <Border ss:Position=""Right"" ss:LineStyle=""Continuous"" ss:Weight=""1""/>"
			.Write "      <Border ss:Position=""Top"" ss:LineStyle=""Continuous"" ss:Weight=""1""/>"
			.Write "    </Borders>"
			.Write "    <Font ss:FontName=""맑은 고딕"" x:CharSet=""129"" x:Family=""Modern"" ss:Size=""10"" />"
			.Write "    <Interior ss:Color=""#EEF3F9"" ss:Pattern=""Solid""/>"
			.Write "    <NumberFormat ss:Format=""Percent""/>"
			.Write "  </Style>"
			.Write "</Styles>"
		End With
	End Sub	
	
	Public Sub CreateSheet(sName)
		Response.Write "<Worksheet ss:Name="""& sName &""">"
		Response.Write "<Table>"
	End Sub
	
	Public Sub CloseSheet()
		Response.Write "</Table>"
		Response.Write "</Worksheet>"
	End Sub


	'소멸자
	Private Sub Class_Terminate()	
		Response.Write "</Workbook>"
	End Sub

End Class

Function setFileDownload(sName)
	'Response.Buffer     = FALSE
	Response.ContentType = "application/x-msexcel"
	Response.CacheControl = "public"
	Response.AddHeader "Content-Disposition","attachment; filename=" & server.URLPathEncode(sName)
End Function
%>