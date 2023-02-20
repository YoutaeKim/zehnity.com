<!--#include virtual="/common/fun/fncSetup.asp"-->
<!--#include virtual="/common/inc/inc_clsInit.asp"-->
<!--#include virtual="/common/class/clsMember.asp"-->
<%
  Language="KO"
  PageName = ""
  SubName = ""

'########## // Request Paramas ##########
Dim iPage       : iPage         = fnSqlChk(Request("page"), 0, 0)  
Dim iSchText	: iSchText		= fnSqlChk(Request("schText"), 0, 0)
Dim iSchType	: iSchType		= fnSqlChk(Request("schType"), 0, 0)
Dim iCode		: iCode			= fnSqlChk(Request("mCode"), 0, 0) : iCode = NullValue(iCode,0)
'########## Request Paramas // ##########

If iCode > 0 Then
	Set objMember = New clsMember
	Dim arrInfo : arrInfo = objMember.GetMemberInfo(iCode)
	Set objMember = Nothing
	If IsArray(arrInfo) Then 
		Cols_Name		= arrInfo(0,0)
		Cols_Email		= arrInfo(1,0)
		Cols_Phone		= arrInfo(2,0)
		Cols_Pwd		= arrInfo(3,0)
		Cols_JoinType	= arrInfo(4,0)	

	End If
End If

%>
<!-- #include file = './include/head.asp' -->
<!-- #include file = './include/header.asp' -->
<style>
#google-map{display:;width:100%;height:300px;margin-top:20px;}
</style>
<!-- container -->
<div id="container">
	<!-- #include file = './include/gnb.asp' -->
	<!-- content -->
	<div class="content">

		<div class="path_wrap">
			<div class="inner">	
				<ul class="path inline_wrap">
					<li class="home"><a href="/admin"><img src="/admin/image/common/home.png"></a></li>
					<li><a href="javascript:$('.gnb_wrap').toggleClass('on_m'); $('.content').toggleClass('on_m');$('.gnb > li').eq(2).addClass('select');">회원관리</a></li>
					<li><a href="group_list.asp">후원단체리스트</a></li>
				</ul>
			</div>
		</div>
		
		<div class="inner">	

			<div class="white_box">
				<!-- info write -->
				<div class="info-write">
					<div class="search_wrap mb20">
						<ul>
							<li class="col02">
								<div class="wrap">
									<div class="tit">회원</div>
									<div class="sub">
										<input type="text" id="write-title" class="large id">
										<em class="id_btn"><a href="javascript:void(0);" onclick="$('.download_p').fadeIn();">회원 검색</a></em>
									</div>
								</div>
								<div class="wrap">
									<div class="tit">템플릿</div>
									<div class="sub txt">
										<select name="" id="">
											<option value="A">A타입</option>
											<option value="B">B타입</option>
											<option value="C">C타입</option>
										</select>
										<!-- <span class="gray9 ml10">템플릿 선택.</span> -->
									</div>
								</div>
							</li>
							<li class="col02">
								<div class="wrap">
									<div class="tit">후원단체명</div>
									<div class="sub txt">
										<input type="text" id="" class="img-w100">
										
									</div>
								</div>
								<div class="wrap">
									<div class="tit">로고</div>
									<div class="sub txt">										
										<input type="file" id="">										
									</div>
								</div>
							</li>
							<li class="col02">
								<div class="wrap">
									<div class="tit">전화번호</div>
									<div class="sub txt">
										<input type="text" id="" class="img-w100">										
									</div>
								</div>
								<div class="wrap">
									<div class="tit">이메일</div>
									<div class="sub txt">										
										<input type="text" id="" class="img-w100">						
									</div>
								</div>
							</li>
							<li class="col02">
								<div class="wrap">
									<div class="tit">홈페이지 주소</div>
									<div class="sub txt">
										<input type="text" id="" class="img-w100">										
									</div>
								</div>
								<div class="wrap">
									<div class="tit">단체주소</div>
									<div class="sub txt">										
										<input type="text" id="" class="img-w100">						
									</div>
								</div>
							</li>
							<li>
								<div class="wrap">
									<div class="tit">간략한 설명</div>
									<div class="sub txt">
										<textarea id="description" class="img-w100" style="height:100px;padding-top:12px;">사단법인 아름다운손길은 외교부 산하 비영리단체이며, 기획재정부 지정 기부금 단체입니다. 아름다운손길은 세상을 행복하게 하고 이로움을 더하고자 하는 의미로 책임감과 의무감으로 시작되었습니다.</textarea>
									</div>
								</div>
							</li>
							<li>
								<div class="wrap">
									<div class="tit">타이틀 이미지1</div>
									<div class="sub txt">
										<input type="file" id="" class="img-w100">										
									</div>
								</div>
							</li>
							<li>
								<div class="wrap">
									<div class="tit">타이틀 이미지2</div>
									<div class="sub txt">										
										<input type="file" id="" class="img-w100">						
									</div>
								</div>
							</li>
							<li>
								<div class="wrap">
									<div class="tit">타이틀 이미지3</div>
									<div class="sub txt">										
										<input type="file" id="" class="img-w100">						
									</div>
								</div>
							</li>
							<li>
								<div class="wrap">
									<div class="tit">소개 타이틀 문구</div>
									<div class="sub txt">
										<textarea id="description" class="img-w100" style="height:100px;padding-top:12px;">사단법인 아름다운손길은 외교부 산하 비영리단체이며, 기획재정부 지정 기부금 단체입니다. 아름다운손길은 세상을 행복하게 하고 이로움을 더하고자 하는 의미로 책임감과 의무감으로 시작되었습니다.</textarea>
									</div>
								</div>
							</li>
							<li>
								<div class="wrap">
									<div class="tit">설명 문구 </div>
									<div class="sub txt">
										<textarea id="description" class="img-w100" style="height:100px;padding-top:12px;">사단법인 아름다운손길은 외교부 산하 비영리단체이며, 기획재정부 지정 기부금 단체입니다. 아름다운손길은 세상을 행복하게 하고 이로움을 더하고자 하는 의미로 책임감과 의무감으로 시작되었습니다.</textarea>
									</div>
								</div>
							</li>
							<li>
								<div class="wrap">
									<div class="tit">구글좌표</div>
									<div class="sub adr">
										
										<div>
											<input type="text" name="mapX"  id="mapX" readonly value="<%=Cols_MapX%>" class="middle num"> / <input type="text" name="mapY" id="mapY" readonly  value="<%=Cols_MapY%>" class="middle num">
										</div>
										<div class="mt10"><input type="text" id="mapAddress" class="large id"><em class="id_btn"><a href="javascript:void(0);" id="googleMapSearch">좌표검색</a></em></div>
										<div id="google-map"></div>	
									</div>
									
								</div>
							</li>
							<li class="col02">
								<div class="wrap">
									<div class="tit">승인여부</div>
									<div class="sub">
										<select name="" id="">
											<option value="A">승인</option>
											<option value="B">보류</option>
											<option value="C">신청</option>
											<option value="C">진행중</option>											
										</select>
									</div>
								</div>
								<div class="wrap">
									<div class="tit">타입</div>
									<div class="sub">
										<span>
											<input type="radio" name="bs" id="bs01"> <label for="bs01">교회</label>
										</span>
										<span>
											<input type="radio" name="bs" id="bs02"> <label for="bs02">학교</label>
										</span>	
										<span>
											<input type="radio" name="bs" id="bs03"> <label for="bs03">기타</label>
										</span>	
									</div>
								</div>
							</li>
							 
						</ul>
					</div>
					<!-- Buttons -->
					<div class="align-c mt30 btn">
						<a href="javascript:fn_save();">저장</a>
						<a href="member_list.asp?page=<%=iPage%>&schText=<%=iSchText%>&schType=<%=iSchType%>" class="bor ml10">취소</a>
					</div><!-- END Buttons -->

					 
					
				</div><!-- END info write -->

			</div>

		</div>

	</div>	
	<!-- END content -->

</div>


<!-- 회원검색 팝업 -->
<div class="down_popup download_p">
	<div class="mask" onclick="$('.download_p').fadeOut();"></div>
	<div class="popup">
		<a href="javascript:" onclick="$('.download_p').fadeOut();" class="esc"><img src="/admin/image/sub/esc.png"></a>
		<div class="tit">DOWNLOAD 자료 등록</div>

		<div class="board-write">
			<table>
				<tr>
					<th>이메일</th>
					<td>
						<input type="text" id="w-file">
						<em class="id_btn"><a href="javascript:void(0);" onclick="$('.download_p').fadeIn();">검색</a></em>
					</td>
				</tr>
				<tr>
					<th>조회결과</th>
					<td>
						
					</td>
				</tr>
			</table>
			
			<div class="align-c mt30 btn">
				<a href="">입력</a>
			</div>

		</div>

	</div>	
</div>	
<!-- END 회원검색 팝업 -->

<!-- END container -->
<!-- Google Map API -->
<script async defer
src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBvnnHgaQdVLIfcsXWOlI0bcoMh3gqmF6Y&callback=initMap">
</script>
<script>
	function initMap(){
		//console.log('Map is initialized.');
		var map = new google.maps.Map(document.getElementById('google-map'), {
			zoom: 18,
			center: {
				lat: <%=NullValue(Cols_MapX,"37.4856641")%> ,
				lng: <%=NullValue(Cols_MapY,"126.8955021")%>
			}
			 
		});
		var cityHall = {lat: <%=NullValue(Cols_MapX,"37.4856641")%>, lng: <%=NullValue(Cols_MapY,"126.8955021")%>};		
		var marker = new google.maps.Marker({
			position: cityHall, 
			map: map,
			info : "<%=Cols_GroupName%>",
			title : "<%=Cols_GroupName%>"
		});
		var geocoder = new google.maps.Geocoder();
		$("#googleMapSearch").click(function(){
			if( $("#mapAddress").val()=="" ){
				alert("주소를 입력해주세요.");
				$("#mapAddress").focus();
				return false
			}
			geocodeAddress(geocoder, map);
		});
		function geocodeAddress(geocoder, resultMap) {
			//console.log('geocodeAddress 함수 실행'); 
			// 주소 설정
			var address = document.getElementById('mapAddress').value;
			geocoder.geocode({'address': address}, function(result, status) {
				/*console.log(result);
				console.log(status);*/

				if (status === 'OK') {
					// 맵의 중심 좌표를 설정한다.
					resultMap.setCenter(result[0].geometry.location);
					// 맵의 확대 정도를 설정한다.
					resultMap.setZoom(18);
					// 맵 마커
					var marker = new google.maps.Marker({
						map: resultMap,
						position: result[0].geometry.location
					});
					$("#mapX").val(marker.position.lat());
					$("#mapY").val(marker.position.lng());
					// 위도
					//console.log('위도(latitude) : ' + marker.position.lat());
					// 경도
					//console.log('경도(longitude) : ' + marker.position.lng());
					$("#google-map").show();
				} else {
					alert('단어검색 실패 : ' + status);
				}
			});
		}
	}
</script>
<!-- #include file = './include/footer.asp' -->
  