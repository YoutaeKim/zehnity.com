<% If SubName = "ko" then %>
<!-- header -->
<div id="header" <% If header = "sub" then %>class="sub" <% End If %>>
    <div class="header_inner">
        <a href="/main.asp" class="logo"></a>
        <div class="mb_gnb_btn">
            <span></span>
            <span></span>
            <span></span>
        </div>
        <div class="mb_gnb ">
            <ul class="gnb">
                <li>
                    <a href="/html/service.asp" class="menu">
                        서비스 소개
                    </a>
                </li>

                <li>
                    <a href="/html/support.asp" class="menu">
                        후원단체
                    </a>
                </li>

                <li>
                    <a href="/html/project.asp" class="menu">
                        프로젝트
                    </a>
                </li>

                <li>
                    <a href="javascript:;" class="menu r">
                        커뮤니티
                    </a>
                    <ul class="lang">
                        <li>
                            <a href="/html/news_room.asp">
                                News room
                            </a>
                        </li>

                        <li>
                            <a href="/html/photo.asp">
                                Photo
                            </a>
                        </li>

                        <li>
                            <a href="/html/video.asp">
                                Video
                            </a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="javascript:;" class="menu r">
                        고객센터
                    </a>
                    <ul class="lang">
                        <li>
                            <a href="/html/notice.asp">
                                공지사항
                            </a>
                        </li>

                        <li>
                            <a href="/html/question.asp">
                                자주묻는 질문
                            </a>
                        </li>

                        <li>
                            <a href="/html/inquiry.asp">
                                1:1 문의
                            </a>
                        </li>

                        <li>
                            <a href="/html/system.asp">
                                시스템 신청
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
            <div class="sign_box">
				<%If CKMemberCode = "" Or IsNull(CKMemberCode) Then%>
                <!-- 로그인 전 -->
                <a href="/member/login.asp">로그인</a>
                <a href="/member/sign_up.asp">회원가입</a>
                <!-- END 로그인 전 -->
				<%Else%>
                <!-- 로그인 후 -->
                <a href="/member/logout.asp">로그아웃</a>
                <a href="/member/mypage.asp">마이페이지</a>
                <!-- END 로그인 후 -->
				<%End If%>
            </div>

        </div>
        <div class="right_box">

            <div class="global_box">
                <div class="img_wrap"></div>
                <span class="txt">KOR</span>
                <ul class="lang">
                    <li>
                        <a href="/main.asp" id="kor">
                            KOR
                        </a>
                    </li>

                    <li>
                        <a href="/en/main.asp" id="eng">
                            ENG
                        </a>
                    </li>
                </ul>
            </div>
            <a href="/html/system.asp" class="link common_btn">
                <span>후원 시스템 신청</span>
            </a>
        </div>
    </div>
</div>
<!-- END header -->
<% End If %>

<% If SubName = "en" then %>
<!-- header -->
<div id="header" <% If header = "sub" then %>class="sub" <% End If %>>
    <div class="header_inner en">
        <a href="/en/main.asp" class="logo"></a>
        <div class="mb_gnb_btn">
            <span></span>
            <span></span>
            <span></span>
        </div>
        <div class="mb_gnb ">
            <ul class="gnb">
                <li>
                    <a href="/en/service.asp" class="menu">
                        Service
                    </a>
                </li>

                <li>
                    <a href="/en/support.asp" class="menu">
                        Sponsoring<br />Organization
                    </a>
                </li>

                <li>
                    <a href="/en/project.asp" class="menu">
                        Project
                    </a>
                </li>

                <li>
                    <a href="javascript:;" class="menu r">
                        Community
                    </a>
                    <ul class="lang">
                        <li>
                            <a href="/en/news_room.asp">
                                News room
                            </a>
                        </li>

                        <li>
                            <a href="/en/photo.asp">
                                Photo
                            </a>
                        </li>

                        <li>
                            <a href="/en/video.asp">
                                Video
                            </a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="javascript:;" class="menu r">
                        Customer<br />Service
                    </a>
                    <ul class="lang">
                        <li>
                            <a href="/en/notice.asp">
                                Notice
                            </a>
                        </li>

                        <li>
                            <a href="/en/question.asp">
                                Frequently Asked Questions
                            </a>
                        </li>

                        <li>
                            <a href="/en/inquiry.asp">
                                1:1 inquiry
                            </a>
                        </li>

                        <li>
                            <a href="/en/system.asp">
                                System Application
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
            <div class="sign_box">
				<%If CKMemberCode = "" Or IsNull(CKMemberCode) Then%>
                <!-- 로그인 전 -->
                <a href="/en/login.asp">Login</a>
                <a href="/en/sign_up.asp">Sign Up</a>
                <!-- END 로그인 전 -->
				<%Else%>
                <!-- 로그인 후 -->
                <a href="/en/logout.asp">Log out</a>
                <a href="/en/mypage.asp">Mypage</a>
                <!-- END 로그인 후 -->
				<%End If%>

                

                
            </div>

        </div>
        <div class="right_box">

            <div class="global_box">
                <div class="img_wrap"></div>
                <span class="txt">ENG</span>
                <ul class="lang">
                    <li>
                        <a href="/main.asp" id="kor">
                            KOR
                        </a>
                    </li>

                    <li>
                        <a href="/en/main.asp" id="eng">
                            ENG
                        </a>
                    </li>
                </ul>
            </div>
            <a href="javascript:;" class="link common_btn">
                <span>To apply for a solution</span>
            </a>
        </div>
    </div>
</div>
<!-- END header -->
<% End If %>