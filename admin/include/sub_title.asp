<!-- 각 메인/서브 메뉴 타이틀명 -->

<%
	
	Dim input ' 입력값 변수



   Select Case (input)

      Case "1"

         Response.Write "입력값은 1 입니다"

      Case "2"

         Response.Write "입력값은 2 입니다"

      Case Else :

         Response.Write "입력값은 1과 2가 아닙니다"
   End Select

%>