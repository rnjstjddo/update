<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<%@ include file="/WEB-INF/views/include/header.jsp"  %>

<!-- 지도, 공지사항 -->
<div class="row mx-5 my-5">

	<div class="map_wrap col-md-6 ml-5 mb-3">
		<h2 class="panel-title" style="font-family:'Jua'; ">본사 위치입니다</h2>
		<div id="map" style="width:95%;height:600px;"></div>
	</div>

	<div class="col-md-6">
		<section class="panel">
			<header class="panel-heading">
				<h2 class="panel-title" style="font-family:'Jua'; ">공지사항</h2>
			</header>
			
			<div class="panel-body">
				<div class="table-responsive" style="height:600px;">
					<table class="table table-hover mb-none" >
						<thead>
							<tr>
								<th width=20>번호</th>
								<th width=60>제목</th>
								<th width=20>조회수</th>
							</tr>
						</thead>
						<tbody>
						
						<c:forEach items="${list}" var="board">
							<tr>
								<td><c:out value="${board.bno }"/></td>
								<td><a class='move'  style="text-decoration:none;" href='<c:out value="${board.bno}"/>' >
										<c:out value="${board.title}" /></a></td>
								<td><c:out value="${board.viewcnt}"/></td>
							</tr>
						</c:forEach>
						
						</tbody>
					</table>
				</div>
			</div>
		</section>
	</div>
	
</div>
<!-- 지도, 공지사항 -->


<form id='actionForm' action="/board/notice/list" method='get'>
	<input type="hidden" name="bno">
</form>


<script>
$(document).ready(function(){
	
	var actionForm = $("#actionForm");
	
	$(".move").on("click", function(e){
		e.preventDefault();
		actionForm.find("input[name='bno']").val($(this).attr("href"));
		actionForm.attr("action", "/board/notice/get");
		actionForm.submit();
	});

	var container = document.getElementById('map');
	var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(35.207447, 129.070227), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};

	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new kakao.maps.MapTypeControl();

	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
	
	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(35.207447, 129.070227); 

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition,
	    clickable:true
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
	// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
	var iwContent = '<div style="padding:5px; height:30px;">5층으로 오세요</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

	// 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
	    content : iwContent,
	    removable : iwRemoveable
	});

	// 마커에 클릭이벤트를 등록합니다
	kakao.maps.event.addListener(marker, 'click', function() {
	      // 마커 위에 인포윈도우를 표시합니다
	      infowindow.open(map, marker); 
	});
});
</script>


<%@ include file="/WEB-INF/views/include/footer.jsp"  %>