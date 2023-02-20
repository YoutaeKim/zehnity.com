<% If SubName = "ko" then %>
<!-- sub_mv -->
<div class="sub_mv <% If detail = "sub" then %>sub<% End If %>">
    <div class="sub_mv_bg"></div>
    <div class="sub_mv_inner inner">
        <% If PageName = "sub01" then %>
        <div class="sub_common_tit">PROHECT</div>
        <div class="sub_common_sub_tit">
            여러분의 사랑과 관심을 기다리고 있어요! 작은 나눔이 모여 큰 기적을 이루는 후원 프로젝트입니다.
        </div>
        <% End If %>
        <% If PageName = "sub02" then %>
        <div class="sub_common_tit">PHOTO</div>
        <div class="sub_common_sub_tit">
            후원 프로젝트에서 등록된 사진을 모아서 보실 수 있습니다.
        </div>
        <% End If %>
        <% If PageName = "sub03" then %>
        <div class="sub_common_tit">VOD</div>
        <div class="sub_common_sub_tit">
            후원 프로젝트와 관련된 영상을 모아서 알려드립니다.
        </div>
        <% End If %>
        <% If PageName = "sub04" then %>
        <div class="sub_common_tit">BOARD</div>
        <div class="sub_common_sub_tit">
            공지사항 및 뉴스를 알려드리는 게시판입니다.
        </div>
        <% End If %>
        <% If PageName = "sub05" then %>
        <div class="sub_common_tit">1:1 문의</div>
        <div class="sub_common_sub_tit">
            후원단체 및 후원프로젝트와 관련된 궁금한 점이 있으면 언제든지 문의해 주세요.
        </div>
        <% End If %>
        <% If PageName = "sub06" then %>
        <div class="sub_common_tit"><%=Cols_ProjectName%></div>
        <div class="sub_common_sub_tit">
            <%=Cols_GroupName%>
        </div>
        <% End If %>
    </div>
</div>
<!-- END sub_mv -->
<% End If %>

<% If SubName = "en" then %>
<!-- sub_mv -->

<!-- END sub_mv -->
<% End If %>