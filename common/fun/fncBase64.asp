<%
'=================================================
' 암호화 코드(Base64방식)
'=================================================
Dim sBASE_64_CHARACTERS, sBASE_64_CHARACTERSansi
sBASE_64_CHARACTERS	= "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
sBASE_64_CHARACTERSansi	= strUnicode2Ansi(sBASE_64_CHARACTERS)

Function strUnicodeLen(asContents)
	Dim asContents1 : asContents1 ="a" & asContents
	Dim Len1 : Len1 = Len(asContents1)
	Dim K : K = 0
	Dim I, Asc1
	
	for I=1 to Len1
		Asc1	= asc(mid(asContents1,I,1))
		if Asc1 < 0 then Asc1	= 65536 + Asc1
		if Asc1 > 255 then
			K	= K + 2
		else
			K	= K + 1
		end if
	next
	
	strUnicodeLen = K - 1
End Function

Function strUnicode2Ansi(asContents)
	Dim Len1 : Len1 = Len(asContents)
	Dim I, VarCHAR, VarASC, VarHEX, VarLOW, VarHIGH

	strUnicode2Ansi	= ""
	
	for I = 1 to Len1
		VarCHAR	= Mid(asContents,I,1)
		VarASC	= Asc(VarCHAR)
		if VarASC < 0 then VarASC = VarASC + 65536
		if VarASC > 255 then
			VarHEX = Hex(VarASC)
			VarLOW = Left(VarHEX,2)
			VarHIGH = Right(VarHEX,2)
			strUnicode2Ansi = strUnicode2Ansi & ChrB("&H" & VarLOW ) & ChrB ("&H" & VarHIGH )
		else
			strUnicode2Ansi = strUnicode2Ansi & ChrB(VarASC)
		end if
	next
End Function

Function strAnsi2Unicode(asContents)
	Dim Len1 : Len1 = LenB(asContents)
	Dim VarCHAR, VarASC, I

	strAnsi2Unicode	= ""
	
	if Len1=0 then Exit Function
	
	for I=1 to Len1
		VarCHAR	= MidB(asContents,I,1)
		VarASC	= AscB(VarCHAR)
		if VarASC > 127 then
			strAnsi2Unicode	= strAnsi2Unicode & Chr(AscW(MidB(asContents, I+1,1) & VarCHAR))
			I = I + 1
		else
			strAnsi2Unicode	= strAnsi2Unicode & Chr(VarASC)
		end if
	Next	
End function

' 암호화 인코딩
Function Base64encode(asContents)
	Dim lnPosition
	Dim lsResult
	Dim Char1
	Dim Char2
	Dim Char3
	Dim Char4
	Dim Byte1
	Dim Byte2
	Dim Byte3
	Dim SaveBits1
	Dim SaveBits2
	Dim lsGroupBinary
	Dim lsGroup64
	Dim M3, M4, Len1, Len2

	Len1	 = LenB(asContents)
	
	if Len1 < 1 then
		Base64encode	= ""
		Exit Function
	end if

	M3 = Len1 Mod 3
	
	if M3 > 0 then asContents = asContents & String(3 - M3, ChrB(0))

	if m3 > 0 then
		Len1	= Len1 + (3 - M3)
		Len2	= Len1 - 3
	else
		Len2	= Len1
	end if

	lsResult	= ""

	for lnPosition = 1 to Len2 Step 3
		lsGroup64 = ""
		lsGroupBinary = MidB(asContents, lnPosition, 3)

		Byte1 = AscB(MidB(lsGroupBinary, 1, 1)) : SaveBits1 = Byte1 and 3
		Byte2 = AscB(MidB(lsGroupBinary, 2, 1)) : SaveBits2 = Byte2 and 15
		Byte3 = AscB(MidB(lsGroupBinary, 3, 1))

		Char1 = MidB(sBASE_64_CHARACTERSansi, ((Byte1 and 252) \ 4) + 1, 1)
		Char2 = MidB(sBASE_64_CHARACTERSansi, (((Byte2 and 240) \ 16) or (SaveBits1 * 16) and &HFF) + 1, 1)
		Char3 = MidB(sBASE_64_CHARACTERSansi, (((Byte3 and 192) \ 64) or (SaveBits2 * 4) and &HFF) + 1, 1)
		Char4 = MidB(sBASE_64_CHARACTERSansi, (Byte3 and 63) + 1, 1)
		lsGroup64 = Char1 & Char2 & Char3 & Char4

		lsResult = lsResult & lsGroup64
	next

	if M3 > 0 then
		lsGroup64 = ""
		lsGroupBinary = MidB(asContents, Len2 + 1, 3)

		Byte1 = AscB(MidB(lsGroupBinary, 1, 1)) : SaveBits1 = Byte1 and 3
		Byte2 = AscB(MidB(lsGroupBinary, 2, 1)) : SaveBits2 = Byte2 and 15
		Byte3 = AscB(MidB(lsGroupBinary, 3, 1))
		Char1 = MidB(sBASE_64_CHARACTERSansi, ((Byte1 and 252) \ 4) + 1, 1)
		Char2 = MidB(sBASE_64_CHARACTERSansi, (((Byte2 and 240) \ 16) Or (SaveBits1 * 16) and &HFF) + 1, 1)
		Char3 = MidB(sBASE_64_CHARACTERSansi, (((Byte3 and 192) \ 64) Or (SaveBits2 * 4) and &HFF) + 1, 1)

		if M3=1 then
			lsGroup64 = Char1 & Char2 & ChrB(61) & ChrB(61)
		else
			lsGroup64 = Char1 & Char2 & Char3 & ChrB(61)
		end if

		lsResult = lsResult & lsGroup64
	end if

	Base64encode = lsResult
End Function

' 암호화 디코더
Function Base64decode(asContents)
	Dim lsResult
	Dim lnPosition
	Dim lsGroup64, lsGroupBinary
	Dim Char1, Char2, Char3, Char4
	Dim Byte1, Byte2, Byte3
	Dim M4, Len1, Len2

	Len1	= LenB(asContents)
	M4	= Len1 Mod 4

	if Len1 < 1 or M4 > 0 then
		Base64decode = ""
		Exit Function
	end if

	if MidB(asContents, Len1, 1) = ChrB(61) then M4 = 3
	if MidB(asContents, Len1-1, 1) = ChrB(61) then M4 = 2

	if M4 = 0 then
		Len2	= Len1
	else
		Len2	= Len1 - 4
	end if

	for lnPosition = 1 to Len2 Step 4
		lsGroupBinary = ""
		lsGroup64 = MidB(asContents, lnPosition, 4)

		Char1 = InStrB(sBASE_64_CHARACTERSansi, MidB(lsGroup64, 1, 1)) - 1
		Char2 = InStrB(sBASE_64_CHARACTERSansi, MidB(lsGroup64, 2, 1)) - 1
		Char3 = InStrB(sBASE_64_CHARACTERSansi, MidB(lsGroup64, 3, 1)) - 1
		Char4 = InStrB(sBASE_64_CHARACTERSansi, MidB(lsGroup64, 4, 1)) - 1

		Byte1 = ChrB(((Char2 and 48) \ 16) or (Char1 * 4) and &HFF)
		Byte2 = lsGroupBinary & ChrB(((Char3 and 60) \ 4) or (Char2 * 16) and &HFF)
		Byte3 = ChrB((((Char3 and 3) * 64) and &HFF) or (Char4 and 63))
		lsGroupBinary = Byte1 & Byte2 & Byte3

		lsResult = lsResult & lsGroupBinary
	next

	if M4 > 0 then
		lsGroupBinary = ""
		lsGroup64 = MidB(asContents, Len2 + 1, M4) & ChrB(65)
		if M4=2 then
			lsGroup64 = lsGroup64 & chrB(65)
		end if
		Char1 = InStrB(sBASE_64_CHARACTERSansi, MidB(lsGroup64, 1, 1)) - 1
		Char2 = InStrB(sBASE_64_CHARACTERSansi, MidB(lsGroup64, 2, 1)) - 1
		Char3 = InStrB(sBASE_64_CHARACTERSansi, MidB(lsGroup64, 3, 1)) - 1
		Char4 = InStrB(sBASE_64_CHARACTERSansi, MidB(lsGroup64, 4, 1)) - 1

		Byte1 = ChrB(((Char2 and 48) \ 16) or (Char1 * 4) and &HFF)
		Byte2 = lsGroupBinary & ChrB(((Char3 and 60) \ 4) or (Char2 * 16) and &HFF)
		Byte3 = ChrB((((Char3 and 3) * 64) and &HFF) or (Char4 and 63))

		if M4 = 2 then
			lsGroupBinary = Byte1
		elseif M4 = 3 then
			lsGroupBinary = Byte1 & Byte2
		end if

		lsResult = lsResult & lsGroupBinary
	end if

	Base64decode = lsResult
End Function

Public Function fnB64Encode(ByVal sVal)
	fnB64Encode = strAnsi2Unicode(Base64encode(strUnicode2Ansi(TRIM(sVal))))
End Function

Public Function fnB64Decode(ByVal sVal)
	fnB64Decode = strAnsi2Unicode(Base64decode(strUnicode2Ansi(TRIM(sVal))))
End Function
%>