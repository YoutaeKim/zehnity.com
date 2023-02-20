<% If SubName = "ko" then %>
<!-- sub_mv -->
<div class="sub_mv">
    <div class="sub_mv_bg"></div>
    <div class="inner con_inner <% If PageName = "mypage" then %>my<% End If %>">
        <% If PageName = "sub01" then %>
        <div class="txt_box">
            <div class="sub_mv_tit">
                <span class="animated">서비스 소개</span>
            </div>
            <div class="sub_mv_sub_tit">
                <span class="animated d-2s">온라인과 오프라인에서 사용가능한 후원시스템</span>
            </div>
        </div>
        <div class="page_nav">
            <a href="/main.asp" class="home"></a>
            <a href="javascript:;" class="arw"></a>
            <a href="/html/service.asp" class="txt">서비스 소개</a>
        </div>
        <% End If %>
        <% If PageName = "sub02" then %>
        <div class="txt_box">
            <div class="sub_mv_tit">
                <span class="animated">커뮤니티</span>
            </div>
            <div class="sub_mv_sub_tit">
                <span class="animated d-2s">온라인과 오프라인에서 사용가능한 후원시스템</span>
            </div>
        </div>
        <div class="page_nav b">
            <a href="/main.asp" class="home"></a>
            <a href="javascript:;" class="arw"></a>
            <a href="/html/news_room.asp" class="txt x">커뮤니티</a>
            <a href="javascript:;" class="arw"></a>
            <% If Menu = "01" then %>
            <a href="/html/news_room.asp" class="txt">
                News Room
            </a>
            <% End If %>
            <% If Menu = "02" then %>
            <a href="/html/photo.asp" class="txt">
                Photo
            </a>
            <% End If %>
            <% If Menu = "03" then %>
            <a href="/html/video.asp" class="txt">
                Video
            </a>
            <% End If %>


        </div>

        <% End If %>
        <% If PageName = "sub03" then %>
        <div class="txt_box">
            <div class="sub_mv_tit">
                <span class="animated">후원단체</span>
            </div>
            <div class="sub_mv_sub_tit">
                <span class="animated d-2s">온라인과 오프라인에서 사용가능한 후원시스템</span>
            </div>
        </div>
        <div class="page_nav">
            <a href="/main.asp" class="home"></a>
            <a href="javascript:;" class="arw"></a>
            <a href="/html/support.asp" class="txt">후원단체</a>
        </div>
        <% End If %>

        <% If PageName = "sub04" then %>
        <div class="txt_box">
            <div class="sub_mv_tit">
                <span class="animated">프로젝트</span>
            </div>
            <div class="sub_mv_sub_tit">
                <span class="animated d-2s">온라인과 오프라인에서 사용가능한 후원시스템</span>
            </div>
        </div>
        <div class="page_nav">
            <a href="/main.asp" class="home"></a>
            <a href="javascript:;" class="arw"></a>
            <a href="/html/project_ing.asp" class="txt">프로젝트</a>
        </div>
        <% End If %>

        <% If PageName = "sub05" then %>
        <div class="txt_box">
            <div class="sub_mv_tit">
                <span class="animated">고객센터</span>
            </div>
            <div class="sub_mv_sub_tit">
                <span class="animated d-2s">온라인과 오프라인에서 사용가능한 후원시스템</span>
            </div>
        </div>
        <div class="page_nav b">
            <a href="/main.asp" class="home"></a>
            <a href="javascript:;" class="arw"></a>
            <a href="/html/notice.asp" class="txt x">고객센터</a>
            <a href="javascript:;" class="arw"></a>
            <% If Menu = "04" then %>
            <a href="/html/notice.asp" class="txt">
                공지사항
            </a>
            <% End If %>
            <% If Menu = "05" then %>
            <a href="/html/question.asp" class="txt">
                자주 묻는 질문
            </a>
            <% End If %>
            <% If Menu = "06" then %>
            <a href="/html/inquiry.asp" class="txt">
                1:1 문의
            </a>
            <% End If %>
            <% If Menu = "07" then %>
            <a href="/html/system.asp" class="txt">
                시스템신청
            </a>
            <% End If %>
        </div>

        <% End If %>

        <% If PageName = "sub06" then %>
        <div class="txt_box">
            <div class="sub_mv_tit">
                <span class="animated">로그인</span>
            </div>
            <div class="sub_mv_sub_tit">
                <span class="animated d-2s">가입하신 정보를 확인하여 로그인 해주세요.</span>
            </div>
        </div>
        <div class="page_nav">
            <a href="/main.asp" class="home"></a>
            <a href="javascript:;" class="arw"></a>
            <a href="/member/login.asp" class="txt">로그인</a>
        </div>
        <% End If %>

        <% If PageName = "sub07" then %>
        <div class="txt_box">
            <div class="sub_mv_tit">
                <span class="animated">회원가입</span>
            </div>
            <div class="sub_mv_sub_tit">
                <span class="animated d-2s">Zehnity에 가입하시고 다양한 서비스를<br class="hide-default show-900"/> 편리하게 이용해 보세요.</span>
            </div>
        </div>
        <div class="page_nav">
            <a href="/main.asp" class="home"></a>
            <a href="javascript:;" class="arw"></a>
            <a href="/member/sign_up.asp" class="txt">회원가입</a>
        </div>
        <% End If %>
		<% If PageName = "sub09" then %>
        <div class="txt_box">
            <div class="sub_mv_tit">
                <span class="animated">비밀번호찾기</span>
            </div>
            <div class="sub_mv_sub_tit">
                <span class="animated d-2s">가입하신 정보를 확인하여 비밀번호 찾기를 해주세요.</span>
            </div>
        </div>
        <div class="page_nav">
            <a href="/main.asp" class="home"></a>
            <a href="javascript:;" class="arw"></a>
            <a href="/member/find_pwd.asp" class="txt">비밀번호찾기</a>
        </div>
        <% End If %>

        

    </div>

    <% If PageName = "sub02" then %>
    <div class="dark_bg">
        <% If Menu = "01" then %><span>News Room</span><% End If %>
        <% If Menu = "02" then %><span>Photo</span><% End If %>
        <% If Menu = "03" then %><span>Video</span><% End If %>
        <ul class="sub_menu_wrap">
            <li <% If Menu = "01" then %>class="on" <% End If %>>
                <a href="/html/news_room.asp">
                    News Room
                </a>
            </li>
            <li <% If Menu = "02" then %>class="on" <% End If %>>
                <a href="/html/photo.asp">
                    Photo
                </a>
            </li>
            <li <% If Menu = "03" then %>class="on" <% End If %>>
                <a href="/html/video.asp">
                    Video
                </a>
            </li>
        </ul>
    </div>
    <% End If %>

    <% If PageName = "sub05" then %>
    <div class="dark_bg">
        <% If Menu = "04" then %><span>공지사항</span><% End If %>
        <% If Menu = "05" then %><span>자주 묻는 질문</span><% End If %>
        <% If Menu = "06" then %><span>1:1 문의</span><% End If %>
        <% If Menu = "07" then %><span>시스템 신청</span><% End If %>
        <ul class="sub_menu_wrap">
            <li <% If Menu = "04" then %>class="on" <% End If %>>
                <a href="/html/notice.asp">
                    공지사항
                </a>
            </li>
            <li <% If Menu = "05" then %>class="on" <% End If %>>
                <a href="/html/question.asp">
                    자주 묻는 질문
                </a>
            </li>
            <li <% If Menu = "06" then %>class="on" <% End If %>>
                <a href="/html/inquiry.asp">
                    1:1 문의
                </a>
            </li>
            <li <% If Menu = "07" then %>class="on" <% End If %>>
                <a href="/html/system.asp">
                    시스템 신청
                </a>
            </li>
        </ul>
    </div>
    <% End If %>   

</div>
<!-- END sub_mv -->
<% End If %>

<% If SubName = "en" then %>
<!-- sub_mv -->
<div class="sub_mv">
    <div class="sub_mv_bg"></div>
    <div class="inner con_inner <% If PageName = "mypage" then %>my<% End If %>">
        <% If PageName = "sub01" then %>
        <div class="txt_box">
            <div class="sub_mv_tit">
                <span class="animated">Introduction to Services</span>
            </div>
            <div class="sub_mv_sub_tit">
                <span class="animated d-2s">Sponsorship systems available online and offline</span>
            </div>
        </div>
        <div class="page_nav">
            <a href="/en/main.asp" class="home"></a>
            <a href="javascript:;" class="arw"></a>
            <a href="/en/service.asp" class="txt">Introduction to Services</a>
        </div>
        <% End If %>
        <% If PageName = "sub02" then %>
        <div class="txt_box">
            <div class="sub_mv_tit">
                <span class="animated">Community</span>
            </div>
            <div class="sub_mv_sub_tit">
                <span class="animated d-2s">Sponsorship systems available online and offline</span>
            </div>
        </div>
        <div class="page_nav b">
            <a href="/en/main.asp" class="home"></a>
            <a href="javascript:;" class="arw"></a>
            <a href="/en/news_room.asp" class="txt x">Community</a>
            <a href="javascript:;" class="arw"></a>
            <% If Menu = "01" then %>
            <a href="/en/news_room.asp" class="txt">
                News Room
            </a>
            <% End If %>
            <% If Menu = "02" then %>
            <a href="/en/photo.asp" class="txt">
                Photo
            </a>
            <% End If %>
            <% If Menu = "03" then %>
            <a href="/en/video.asp" class="txt">
                Video
            </a>
            <% End If %>


        </div>

        <% End If %>
        <% If PageName = "sub03" then %>
        <div class="txt_box">
            <div class="sub_mv_tit">
                <span class="animated">A sponsoring organization</span>
            </div>
            <div class="sub_mv_sub_tit">
                <span class="animated d-2s">Sponsorship systems available online and offline</span>
            </div>
        </div>
        <div class="page_nav">
            <a href="/en/main.asp" class="home"></a>
            <a href="javascript:;" class="arw"></a>
            <a href="/en/support.asp" class="txt">A sponsoring organization</a>
        </div>
        <% End If %>

        <% If PageName = "sub04" then %>
        <div class="txt_box">
            <div class="sub_mv_tit">
                <span class="animated">Project</span>
            </div>
            <div class="sub_mv_sub_tit">
                <span class="animated d-2s">Sponsorship systems available online and offline</span>
            </div>
        </div>
        <div class="page_nav">
            <a href="/en/main.asp" class="home"></a>
            <a href="javascript:;" class="arw"></a>
            <a href="/en/project.asp" class="txt">Project</a>
        </div>
        <% End If %>

        <% If PageName = "sub05" then %>
        <div class="txt_box">
            <div class="sub_mv_tit">
                <span class="animated">Customer Service</span>
            </div>
            <div class="sub_mv_sub_tit">
                <span class="animated d-2s">Sponsorship systems available online and offline</span>
            </div>
        </div>
        <div class="page_nav b">
            <a href="/en/main.asp" class="home"></a>
            <a href="javascript:;" class="arw"></a>
            <a href="/en/notice.asp" class="txt x">Customer Service</a>
            <a href="javascript:;" class="arw"></a>
            <% If Menu = "04" then %>
            <a href="/en/notice.asp" class="txt">
                Notice
            </a>
            <% End If %>
            <% If Menu = "05" then %>
            <a href="/en/question.asp" class="txt">
                Frequently Asked Questions
            </a>
            <% End If %>
            <% If Menu = "06" then %>
            <a href="/en/inquiry.asp" class="txt">
                1:1 inquiry
            </a>
            <% End If %>
            <% If Menu = "07" then %>
            <a href="/en/system.asp" class="txt">
                System application
            </a>
            <% End If %>
        </div>

        <% End If %>

        <% If PageName = "sub06" then %>
        <div class="txt_box">
            <div class="sub_mv_tit">
                <span class="animated">Login</span>
            </div>
            <div class="sub_mv_sub_tit">
                <span class="animated d-2s">Please check your registered information and log in.</span>
            </div>
        </div>
        <div class="page_nav">
            <a href="/en/main.asp" class="home"></a>
            <a href="javascript:;" class="arw"></a>
            <a href="/en/login.asp" class="txt">Login</a>
        </div>
        <% End If %>

        <% If PageName = "sub07" then %>
        <div class="txt_box">
            <div class="sub_mv_tit">
                <span class="animated">Sign Up</span>
            </div>
            <div class="sub_mv_sub_tit">
                <span class="animated d-2s">Sign up for Zehnity and use a variety of services conveniently.</span>
            </div>
        </div>
        <div class="page_nav">
            <a href="/en/main.asp" class="home"></a>
            <a href="javascript:;" class="arw"></a>
            <a href="/en/sign_up.asp" class="txt">Sign Up</a>
        </div>
        <% End If %>

        <% If PageName = "sub09" then %>
        <div class="txt_box">
            <div class="sub_mv_tit">
                <span class="animated">Find password</span>
            </div>
            <div class="sub_mv_sub_tit">
                <span class="animated d-2s">Please check your registered information to retrieve your password..</span>
            </div>
        </div>
        <div class="page_nav">
            <a href="/en/main.asp" class="home"></a>
            <a href="javascript:;" class="arw"></a>
            <a href="/en/find_pwd.asp" class="txt">Find password</a>
        </div>
        <% End If %>

    </div>

    <% If PageName = "sub02" then %>
    <div class="dark_bg">
        <% If Menu = "01" then %><span>News Room</span><% End If %>
        <% If Menu = "02" then %><span>Photo</span><% End If %>
        <% If Menu = "03" then %><span>Video</span><% End If %>
        <ul class="sub_menu_wrap">
            <li <% If Menu = "01" then %>class="on" <% End If %>>
                <a href="/en/news_room.asp">
                    News Room
                </a>
            </li>
            <li <% If Menu = "02" then %>class="on" <% End If %>>
                <a href="/en/photo.asp">
                    Photo
                </a>
            </li>
            <li <% If Menu = "03" then %>class="on" <% End If %>>
                <a href="/en/video.asp">
                    Video
                </a>
            </li>
        </ul>
    </div>
    <% End If %>

    <% If PageName = "sub05" then %>
    <div class="dark_bg">
        <% If Menu = "04" then %><span>Notice</span><% End If %>
        <% If Menu = "05" then %><span>Frequently Asked Questions</span><% End If %>
        <% If Menu = "06" then %><span>1:1 inquiry</span><% End If %>
        <% If Menu = "07" then %><span>System Application</span><% End If %>
        <ul class="sub_menu_wrap">
            <li <% If Menu = "04" then %>class="on" <% End If %>>
                <a href="/en/notice.asp">
                    Notice
                </a>
            </li>
            <li <% If Menu = "05" then %>class="on" <% End If %>>
                <a href="/en/question.asp">
                    Frequently Asked Questions
                </a>
            </li>
            <li <% If Menu = "06" then %>class="on" <% End If %>>
                <a href="/en/inquiry.asp">
                    1:1 inquiry
                </a>
            </li>
            <li <% If Menu = "07" then %>class="on" <% End If %>>
                <a href="/en/system.asp">
                    System Application
                </a>
            </li>
        </ul>
    </div>
    <% End If %>   

</div>
<!-- END sub_mv -->
<% End If %>
