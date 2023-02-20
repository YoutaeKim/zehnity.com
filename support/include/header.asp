<% If SubName = "ko" then %>
<!-- header -->
<div id="header">
    <div class="header_innder">
        <div class="h_container <% If detail = "sub" then %>eliminate<% End If %>">
            <a href="main.asp?sgCode=<%=sgCode%>" class="logo"><%If Not(Cols_LogoImg = "" Or IsNull(Cols_LogoImg)) Then%><img src="<%=Cols_LogoImg%>"><%End If%></a>
            <div class="mb_gnb_btn <% If detail = "sub" then %>eliminate<% End If %>">
                <span></span>
                <span></span>
                <span></span>
            </div>
            <div class="gnb_box_wrap <% If detail = "sub" then %>eliminate<% End If %>">
                <ul class="gnb <% If detail = "sub" then %>eliminate<% End If %>">
                    <li>
                        <a href="project.asp?sgCode=<%=sgCode%>">
                            PROJECT
                        </a>
                    </li>
                    <li>
                        <a href="photo.asp?sgCode=<%=sgCode%>">
                            PHOTO
                        </a>
                    </li>
                    <li>
                        <a href="vod.asp?sgCode=<%=sgCode%>">
                            VOD
                        </a>
                    </li>
                    <li>
                        <a href="board.asp?sgCode=<%=sgCode%>">
                            BOARD
                        </a>
                    </li>
                    <li>
                        <a href="inquiry.asp?sgCode=<%=sgCode%>">
                            1:1문의
                        </a>
                    </li>
                    <div class="icon_box">
						<%If Not(Cols_Homepage = "" Or IsNull(Cols_Homepage)) Then%>

                        <a href="<%=Cols_Homepage%>" target="_blank" class="box">
                            <div class="icon"></div>
                            홈페이지
                        </a>
						<%End If%>
                        <div class="box">
							<%If Not(Cols_Tel = "" Or IsNull(Cols_Tel)) Then%>
                            <div class="icon"></div>
                            <%=Cols_Tel%>
							<%End If%>
                        </div>
                    </div>
                </ul>
            </div>
            <div class="right <% If detail = "sub" then %>eliminate<% End If %>">
                <button type="button" onclick="scrollDown();"
                    class="support_btn common_h_btn <% If detail = "sub" then %>eliminate<% End If %>">후원/헌금</button>
            </div>
        </div>
    </div>
</div>
<!-- END header -->
<% End If %>

<% If SubName = "en" then %>
<!-- header -->

<!-- END header -->
<% End If %>