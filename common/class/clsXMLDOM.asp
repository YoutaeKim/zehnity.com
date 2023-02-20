<%
Class clsXMLDOM
	
	Private m_DOM 'XMLDOM 객체

	'생성자
	Private Sub Class_Initialize()
		
		Set m_DOM = Server.CreateObject("Microsoft.XMLDOM")

	End Sub

	Public Property Get TagText(tagName, index)
		Dim Nodes

		Set Nodes	= m_DOM.getElementsByTagName(tagName)
		TagText 	= Nodes(index).Text
		Set Nodes	= Nothing
	End Property

	Public Property Get Nodes(tagName)

		Set Nodes	= m_DOM.getElementsByTagName(tagName)

	End Property

	Public Property Get SelectNodes(tagName)
		
		Set SelectNodes = m_DOM.SelectNodes(tagName)

	End Property

	Public Property Get SelectSingNodes(tagName)

		Set SelectSingNodes = m_DOM.SelectSingleNode(tagName)

	End Property


	Public Function LoadHTTP(url)
		With m_DOM
			.Async = False
			.setProperty "ServerHTTPRequest", True

			LoadHTTP = .Load(url)
		End With
	End Function

	Public Function Load(file)
		With m_DOM
			.Async = False

			Load = .Load(Server.MapPath(file))
		End With
	End Function

	'소멸자
	Private Sub Class_Terminate()
		
		Set m_DOM = Nothing

	End Sub
End Class
%>