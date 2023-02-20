<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %> 
<%
Response.codepage    = 65001 
Response.ContentType = "text/html; charset=utf-8"

Dim funcNum	: funcNum = Request("funcNum")
Dim fileUrl	: fileUrl = Request("fileUrl")
Dim message	: message = Request("message")
%>
 <script type="text/javascript">	
     // 가장 중요한 부분인것 같군요
    // ckeditor의 순번과 유효한 파일 경로만 넘기면 자동으로 이미지나 플래쉬 속성 변경 탭으로 이동합니다.
    window.parent.CKEDITOR.tools.callFunction(<%=funcNum %>, '<%=fileUrl %>', '<%=message %>');
     //history.go(-1);
 </script>