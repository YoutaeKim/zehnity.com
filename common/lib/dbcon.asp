<%
'	Dim dbConnect, db '변수 선언'
    ' DB 연결 접속 정보 변수 저장
    'dbConnect = "Provider=SQLOLEDB; Data Source=localhost\SQLEXPRESS;Initial Catalog=zehnity; User id=zehnity_user;password=wpslxl#1"
'    dbConnect = "Provider=SQLOLEDB.1;Password=wpslxl#1;Persist Security Info=True;User ID=zehnity_user;Initial Catalog=zehnity;Data Source=localhost\sqlexpress,1433"
	'Provider=SQLOLEDB.1;Password=wpslxl#1;Persist Security Info=True;User ID=zehnity_user;Initial Catalog=zehnity;Data Source=localhost\sqlexpress,1433
    ' 연결 객체 생성
'    Set db = server.createObject("ADODB.Connection")
    ' 데이터베이스 접속
'    db.open dbConnect

'	Set Rs  = CreateObject("ADODB.RecordSet")
'	SQL = "EXEC usp_LoginCheck '"&uid&"','"&upw&"' "
'	Rs.Open SQL, db
'	If rs.Bof Then

'	Else
'		Do Until Rs.eof
'			Response.write "<br>+"& Rs("m_Name")
'		Rs.moveNext
'		Loop
'	End If
%>