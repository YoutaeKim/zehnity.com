<%' @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %> 
<%
'Response.codepage	= 65001 
'Response.ContentType= "text/html; charset=utf-8" 

Set Bcrypt = Server.CreateObject("ClassicASP.Bcrypt")

' Generate a hash with a default work factor of 10
'Bcrypt.Hash("myPassword")

' Generate a hash with a custom work factor
'Bcrypt.Hash("myPassword",12) ' >=4 <=31

' Verify a hash
'Bcrypt.Verify("myPassword","$2a$10$s9THkLgv6bJU9Qio8Id2N.FpB79P5w4zdsHvzMAxHK/ht3KxQnsca") ' True / False
'애플리케이션 ID   4w5qbLdb2DdiDew7pUI3ZR
'애플리케이션 시크릿   $2a$04$aoHIHS7QnCS47kSlLLFIee
Dim pwd
'pwd = Bcrypt.Hash("myPassword",12)
Response.Write "<br>pwd="&pwd

'Response.Write Now()
v_datetime = Now()

v_timestamp = getTimestamp(v_datetime)
Response.Write "<br>v_timestamp=" & v_timestamp

Dim clientId  : clientId = "4w5qbLdb2DdiDew7pUI3ZR"
Dim clientSecret  : clientSecret = "$2a$04$aoHIHS7QnCS47kSlLLFIee"
Dim clientSecretLen : clientSecretLen = Len(clientSecret)

Dim password :password = clientId & "_" & getTimestamp(Now())
Response.Write "<br>password=" & password
Dim hashed
hashed  = Bcrypt.Hash(password, clientSecret)
Response.Write "<br>hashed=" & hashed
Function getTimestamp(ByVal p_date)
	If LCase(typename(p_date)) = "string" Then
		p_date = CDate(p_date)
	End If
	getTimestamp = DateDiff("s", "1970-01-01 00:00:00", p_date)
End Function
Function convertTimestampDatetime(ByVal p_timestamp)
	convertTimestampDatetime = DateAdd("s", p_timestamp, "1970-01-01 00:00:00")
End Function
%>