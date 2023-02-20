<!--#include virtual="/common/fun/fncSetup.asp"-->
<!--#include virtual="/common/inc/inc_clsInit.asp"-->
<!--#include virtual="/common/class/clsCommon.asp"-->
<%

'########## // Request Paramas ##########
Dim SID : SID = fnSqlChk(Request("SID"), 0, 0)'고객사코드/서비스아이디
Dim USERID : USERID = fnSqlChk(Request("USERID"), 0, 0)'고객사 회원 ID
Dim USERIP : USERIP = fnSqlChk(Request("USERIP"), 0, 0)'아이피
Dim AMOUNT : AMOUNT = fnSqlChk(Request("AMOUNT"), 0, 0)'결제금액
Dim MCTTRNO : MCTTRNO = fnSqlChk(Request("MCTTRNO"), 0, 0)'거래번호
Dim ORDERID : ORDERID = fnSqlChk(Request("ORDERID"), 0, 0)'주문번호
'########## Request Paramas // ##########



%>