<%
  Language="KO"
  PageName = "sub01"
  SubName = "en"
  header = "sub"
%>

<!-- #include file = '../include/head.asp' -->
<!-- #include file = '../include/header.asp' -->
<!-- #include file = '../include/sub_title.asp' -->

<!-- container -->
<div id="container" class="en">
    <!-- service -->
    <div class="service_wrap ">
        <div class="sub_wrap">
            <div class="inner con_inner">
                <div class="top_txt">
                    The Zenithi sponsorship system is <br  class="hide-767"/>
                    available for religious organizations, <br  class="hide-767"/>
                     school sponsorship, and government <br  class="hide-767"/>
                    sponsorship.
                </div>
                <div id="text" class="txt_move"></div>
                <div class="img_con_box">
                    <div class="box scroll_box d-1s">
                        <div class="img_wrap"></div>
                        <div class="alt_box">
                            <div class="name">Religious group</div>
                            <div class="alts">
                                We create the same online donation environment as offline using 
                                Zenit sponsorship systems such as churches and Catholics
                            </div>
                        </div>
                    </div>
                    <div class="box animated d-2s">
                        <div class="img_wrap"></div>
                        <div class="alt_box">
                            <div class="name">School sponsorship</div>
                            <div class="alts">
                                Zenit's sponsorship system is available at school for various activities
                                such as bazaar, flea market, and sponsorship fundraising. 
                                Experience happiness through the practice of sharing.
                            </div>
                        </div>
                    </div>
                    <div class="box animated d-2s">
                        <div class="img_wrap"></div>
                        <div class="alt_box">
                            <div class="name">Government branch</div>
                            <div class="alts">
                                Zenit's sponsorship system is available at school for various activities
                                such as bazaar, flea market, and sponsorship fundraising. 
                                Experience happiness through the practice of sharing.
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="btm_wrap">
            <div class="btm_bg ani"></div>
            <div class="txt_box animated d-1s">
                Promote the campaign to my acquaintances  <br class="hide-767"/>
                and friends through the PR system
            </div>
        </div>
    </div>
    <!-- END service -->
</div>
<!-- END container -->

<script>
    $(document).ready(function () {
        // 스크롤 이벤트
        $(window).scroll(function () {
            if ($(window).scrollTop() > 0) {
                $('.scroll_box').addClass('on');
            }
        });
        // END

    });
    // 스크롤 이벤트
    let stars = document.getElementById('text');

    window.addEventListener('scroll', function () {
        let value = window.scrollY;
        text.style.marginRight = value * 1 + 'px';
    })
</script>

<!-- #include file = '../include/footer.asp' -->