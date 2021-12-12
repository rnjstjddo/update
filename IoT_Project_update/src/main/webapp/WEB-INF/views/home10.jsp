<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>



<!-- 지도, 공지사항 -->
<div class="row mx-5 my-5">

	<div class="map_wrap col-md-6 ml-5 mb-3">
		<h2 class="panel-title" style="font-family:'Jua'; ">본사 위치입니다</h2>
		<div id="map" style="width:95%;height:90%;"></div>
	</div>

	<div class="col-md-6">
		<section class="panel">
			<header class="panel-heading">
				<h2 class="panel-title" style="font-family:'Jua'; ">공지사항</h2>
			</header>
			
			<div class="panel-body">
				<div class="table-responsive">
					<table class="table table-hover mb-none">
						<thead>
							<tr>
								<th width=20>번호</th>
								<th width=60>제목</th>
								<th width=20>조회수</th>
							</tr>
						</thead>
						<tbody>
						

						
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

