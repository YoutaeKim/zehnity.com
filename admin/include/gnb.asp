<!-- gnb -->
    <div class="gnb_wrap on">
      <div class="gnb_scroll">
        <div class="gnb_top"> 
            <div class="name"><img src="/admin/image/common/user2.png" class="img-mid">제니티(<%=CkAdminName%>)</div>
            <div class="table_wrap">
              <table>    
                  <tr> 
                      <th>CPID</th>
                      <td><%=CkAdminId%></td>
                  </tr>
                  <tr> 
                      <th>업체</th>
                      <td>제니티(<%=CkAdminName%>)</td>
                  </tr>
                  <tr> 
                      <th>IP</th>
                      <td><%=sysUserIP%></td>
                  </tr>
              </table>
            </div>
        </div>
        <ul class="gnb">
          <li>
            <a href="javascript:"><img src="/admin/image/common/gnb01.png">관리자</a>
            <ul class="gsnb">
              <!-- <li><a href="approval.asp">관리자정보</a></li> -->
              <li><a href="logout.asp">로그아웃</a></li>
            </ul>
          </li>
          <li>
            <a href="javascript:"><img src="/admin/image/common/gnb02.png">시스템관리</a>    
            <ul class="gsnb">
              <li><a href="statslist.asp">신청리스트</a></li>
              <li><a href="statslistday.asp">후원리스트</a></li> 
            </ul>
          </li>
          <li>
            <a href="javascript:"><img src="/admin/image/common/gnb03.png">회원관리</a>    
            <ul class="gsnb">
              <li><a href="member_list.asp">회원리스트</a></li>
              <li><a href="group_list.asp">후원단체리스트</a></li>
              <li><a href="">프로젝트 리스트</a></li>
            </ul>
          </li>
      
          <li>
            <a href="javascript:"><img src="/admin/image/common/gnb05.png">게시판</a>    
            <ul class="gsnb">
              <li><a href="board_list.asp?bType=B0102">공지사항</a></li>
              <li><a href="board_list.asp?bType=B0106">자주묻는질문</a></li>
              <li><a href="board_list.asp?bType=B0101">News Room</a></li>
              <li><a href="board_list.asp?bType=B0103">Board</a></li>
              <li><a href="board_list.asp?bType=B0104">Photo</a></li>
              <li><a href="board_list.asp?bType=B0105">Video</a></li>
			  <li><a href="qna_list.asp">1:1문의</a></li>
            </ul>
          </li>
          <!-- <li>
            <a href="javascript:"><img src="/admin/image/common/gnb06.png">기타</a>    
            <ul class="gsnb">
              <li><a href="weblocklist.asp">암호화폐_관리</a></li>
              <li><a href="">로그인Log</a></li>
              <li><a href="">직원관리</a></li>
              <li><a href="">암호화테스트</a></li>
            </ul>
          </li> -->
          <li>
            <a href="javascript:"><img src="/admin/image/common/gnb07.png">사이트관리</a>    
            <ul class="gsnb">
              <li><a href="">영문</a></li>
              <li><a href="">한글</a></li>
            </ul>
          </li>
           
        </ul>
      </div>
    </div>
    <!-- END gnb -->


<!-- 날짜 공통 js -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
  $.datepicker.setDefaults({
    dateFormat: 'yy-mm-dd',
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
    showMonthAfterYear: true,
    yearSuffix: '년'
  });

  $(function() {
    $(".datepicker").datepicker();
  });

</script>
