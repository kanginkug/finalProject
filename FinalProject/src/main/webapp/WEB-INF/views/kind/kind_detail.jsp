<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<% String kind_add = request.getParameter("kind_add");%>

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<!-- Hero Section-->
<section class="pt_jhj3 pb-5 d-flex align-items-end dark-overlay bg-cover" 
	style="background-image: url('https://${kind.img1}'); font-family: 'GmarketSansMedium' !important;">
	<div class="container overlay-content">
		<div
			class="d-flex justify-content-between align-items-start flex-column flex-lg-row align-items-lg-end">
			<div class="text-white mb-4 mb-lg-0">
				<h1 class="text-shadow verified">${kind.kind_name}</h1>
				<p>
					<i class="fa-map-marker-alt fas me-2"></i>${kind.adress}
				</p>
				<p class="mb-0 d-flex align-items-center">

					<c:choose>
						<c:when test="${kind.cnt >= 0}">
							<i class="fa fa-xs fa-star text-primary"></i>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${kind.cnt > 10}">
							<i class="fa fa-xs fa-star text-primary"></i>
						</c:when>
						<c:otherwise>
							<i class="fa fa-xs fa-star text-gray-200"></i>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${kind.cnt > 20}">
							<i class="fa fa-xs fa-star text-primary"></i>
						</c:when>
						<c:otherwise>
							<i class="fa fa-xs fa-star text-gray-200"></i>
						</c:otherwise>
					</c:choose>

					<c:choose>
						<c:when test="${kind.cnt > 30}">
							<i class="fa fa-xs fa-star text-primary"></i>
						</c:when>
						<c:otherwise>
							<i class="fa fa-xs fa-star text-gray-200"></i>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${kind.cnt > 40}">
							<i class="fa fa-xs fa-star text-primary me-4"></i>
						</c:when>
						<c:otherwise>
							<i class="fa fa-xs fa-star text-gray-200 me-4"></i>
						</c:otherwise>
					</c:choose>

					3??? ??????
				</p>
			</div>
			<div class="calltoactions">
				<a class="btn btn-primary" href="${path}/mem/bookmark?bmc_code=5&code=${kind.kind_id}&User_CODE=${loginMember.getUser_CODE()}">	
					?????????
				</a>
			</div>
		</div>
	</div>
</section>

<section class="py-6" style="font-family: 'GmarketSansMedium' !important;">
	<div class="container">
		<div class="row">
			<div class="col-lg-8">


				<!-- ?????? -->
				<div class="text-block">
					<p class=" text-sm text-primary"
						style="font-size: 5px; margin-bottom: 2px;">Info</p>
					<h3 class="mb-3">??????</h3>
					<p class="text-muted">??? : ${kind.tel}</p>
					<p class="text-muted">${kind.kind_content}</p>
				</div>

				<!-- ?????? -->
				<div class="text-block">
					<p class=" text-sm text-primary"
						style="font-size: 5px; margin-bottom: 2px;">Location</p>
					<h3 class="mb-4">??????</h3>
					<div id="map" style="width: 100%; height: 320px;"></div>

					<script type="text/javascript"
					src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=5e2fc54837543e3e11952411b0a71542&libraries=services"></script>

					<script>
                                var mapContainer = document.getElementById('map'), // ????????? ????????? div 
                                    mapOption = {
                                        center: new kakao.maps.LatLng(33.450701, 126.570667), // ????????? ????????????
                                        level: 3 // ????????? ?????? ??????
                                    };

                                // ????????? ???????????????    
                                var map = new kakao.maps.Map(mapContainer, mapOption);

                                // ??????-?????? ?????? ????????? ???????????????
                                var geocoder = new kakao.maps.services.Geocoder();

                                // ????????? ????????? ???????????????
                                geocoder.addressSearch('${kind.adress}', function(result, status) {

                                    // ??????????????? ????????? ??????????????? 
                                    if (status === kakao.maps.services.Status.OK) {
                                    	
                                        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
										
                                        // ??????????????? ?????? ????????? ????????? ???????????????
                                        var marker = new kakao.maps.Marker({
                                            map: map,
                                            position: coords
                                        });

                                        // ????????? ????????? ??????????????? ?????? ????????? ??????????????????
                                        map.setCenter(coords);
                                    }
                                });
								
                                // ?????? ????????? ??????????????? ?????? ????????? ????????? ??? ?????? ???????????? ???????????? ???????????????
                                var mapTypeControl = new kakao.maps.MapTypeControl();

                                // ????????? ???????????? ???????????? ???????????? ???????????????
                                // kakao.maps.ControlPosition??? ???????????? ????????? ????????? ??????????????? TOPRIGHT??? ????????? ?????? ???????????????
                                map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

                                // ?????? ?????? ????????? ????????? ??? ??????  ??? ???????????? ???????????????
                                var zoomControl = new kakao.maps.ZoomControl();
                                map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
                            </script>
				</div>

				<div class="text-block">
					<!-- ?????? -->
					<p class=" text-sm text-primary"
						style="font-size: 5px; margin-bottom: 2px;">Photo</p>
					<h3 class="mb-4">??????</h3>
					<div class="row gallery ms-n1 me-n1">
						<div class="col-lg-4 col-6 px-1 mb-2">
							<a href="https://${kind.img1}"><img
								class="img-fluid"
								src="https://${kind.img1}"
								alt="..."></a>
						</div>
						
						<c:if test="${empty kind.img2}">
    						<div class="col-lg-4 col-6 px-1 mb-2">
									<a href="${path}/resources/img/Busan/?????????.jpg"><img
										class="img-fluid" src="${path}/resources/img/Busan/?????????.jpg"
										alt="..."></a>
							</div>
						</c:if>
						<c:if test="${!empty kind.img2}">
								<div class="col-lg-4 col-6 px-1 mb-2">
									<a href="https://${kind.img2}"><img class="img-fluid"
										src="https://${kind.img2}" alt="..."></a>
								</div>
						</c:if>

						<c:choose>
							<c:when test="${kind.kind_name eq '???????????????'}">
								<div class="col-lg-4 col-6 px-1 mb-2">
									<a href="${path}/resources/img/Busan/???????????????.jpg"><img
										class="img-fluid" src="${path}/resources/img/Busan/???????????????.jpg"
										alt="..."></a>
								</div>
							</c:when>
							<c:otherwise>
								<div class="col-lg-4 col-6 px-1 mb-2">
									<a href="${path}/resources/img/Busan/?????????.jpg"><img
										class="img-fluid" src="${path}/resources/img/Busan/?????????.jpg"
										alt="..."></a>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>


				<!-- ?????? -->
				<div class="text-block">
					<p class=" text-sm text-primary"
						style="font-size: 5px; margin-bottom: 2px;">Listing Reviews</p>
					<h5 class="mb-4">??????</h5>
					<div class="d-flex d-block d-sm-flex review">
						<div class="text-md-center flex-shrink-0 me-4 me-xl-5">
							<img class="d-block avatar avatar-xl p-2 mb-2"
								src="${path}/resources/img/Busan/????????????2.jpeg" alt="Padm?? Amidala"><span
								class="text-uppercase text-muted text-sm">Oct 2022</span>
						</div>
						<div>
							<h6 class="mt-2 mb-1">?????????</h6>
							<div class="mb-2">
								<i class="fa fa-xs fa-star text-primary"></i><i
									class="fa fa-xs fa-star text-primary"></i><i
									class="fa fa-xs fa-star text-primary"></i><i
									class="fa fa-xs fa-star text-primary"></i><i
									class="fa fa-xs fa-star text-primary"></i>
							</div>
							<p class="text-muted text-sm">${kind.kind_name}??? ???????????? ????????????????????????. 
							????????? ????????? ????????? ???????????? ?????? ???????????? ?????? ??? ????????????.</p>
						</div>
					</div>
					<div class="d-flex d-block d-sm-flex review">
						<div class="text-md-center flex-shrink-0 me-4 me-xl-5">
							<img class="d-block avatar avatar-xl p-2 mb-2"
								src="${path}/resources/img/Busan/????????????3.jpeg" alt="Luke Skywalker"><span
								class="text-uppercase text-muted text-sm">Oct 2022</span>
						</div>
						<div>
							<h6 class="mt-2 mb-1">?????????</h6>
							<div class="mb-2">
								<i class="fa fa-xs fa-star text-primary"></i><i
									class="fa fa-xs fa-star text-primary"></i><i
									class="fa fa-xs fa-star text-primary"></i><i
									class="fa fa-xs fa-star text-primary"></i><i
									class="fa fa-xs fa-star text-gray-200"></i>
							</div>
							<p class="text-muted text-sm">?????? ????????? ???????????? ${kind.kind_name}?????? ??????????????????! 
							?????? ?????? ????????? ??? ???????????????.</p>
						</div>
					</div>
					<div class="d-flex d-block d-sm-flex review">
						<div class="text-md-center flex-shrink-0 me-4 me-xl-5">
							<img class="d-block avatar avatar-xl p-2 mb-2"
								src="${path}/resources/img/Busan/????????????1.png" alt="Princess Leia"><span
								class="text-uppercase text-muted text-sm">Oct 2022</span>
						</div>
						<div>
							<h6 class="mt-2 mb-1">?????????</h6>
							<div class="mb-2">
								<i class="fa fa-xs fa-star text-primary"></i><i
									class="fa fa-xs fa-star text-primary"></i><i
									class="fa fa-xs fa-star text-primary"></i><i
									class="fa fa-xs fa-star text-gray-200"></i><i
									class="fa fa-xs fa-star text-gray-200"></i>
							</div>
							<p class="text-muted text-sm">?????? ?????????????????? ??? ???????????? ${kind.kind_name}?????????. ????????????
								?????? ?????? ????????? ?????????.</p>
						</div>
					</div>

					
				</div>
			</div>


			<div class="col-lg-4">
				<div class="ps-xl-4">
					<!-- ????????? ???????????? -->
					<div class="card border-0 shadow mb-5">
						<div class="card-header bg-gray-100 py-4 border-0">
							<div class="d-flex align-items-center justify-content-between">
								<div>
									<p class=" text-sm text-primary"
										style="font-size: 5px; margin-bottom: 2px;">Opening hours
										by day</p>
									<h4 class="mb-0">????????????</h4>
								</div>
								<svg
									class="svg-icon svg-icon svg-icon-light w-3rem h-3rem ms-3 text-muted flex-shrink-0">
                                      <use xlink:href="#wall-clock-1"> </use>
                                    </svg>
							</div>
						</div>



						<!-- ?????? ??????-->
						<div class="card-body">
							<table class="table text-sm mb-0">
								<tr>
									<th class="ps-0">?????????</th>
									<td class="pe-0 text-end">${kind.bsntime}</td>
								</tr>
								<tr>
									<th class="ps-0">?????????</th>
									<td class="pe-0 text-end">${kind.bsntime}</td>
								</tr>
								<tr>
									<th class="ps-0">?????????</th>
									<td class="pe-0 text-end">${kind.bsntime}</td>
								</tr>
								<tr>
									<th class="ps-0">?????????</th>
									<td class="pe-0 text-end">${kind.bsntime}</td>
								</tr>
								<tr>
									<th class="ps-0">?????????</th>
									<td class="pe-0 text-end">${kind.bsntime}</td>
								</tr>
								<tr>
									<th class="ps-0">?????????</th>
									<td class="pe-0 text-end">${kind.bsntime}</td>
								</tr>
								<tr>
									<th class="ps-0">?????????</th>
									<td class="pe-0 text-end">${kind.bsntime}</td>
								</tr>
							</table>
						</div>
					</div>

					<!-- ?????? ?????????-->
					<div class="card border-0 shadow mb-5">
						<div class="card-header bg-gray-100 py-4 border-0">
							<div class="d-flex align-items-center justify-content-between">
								<div>
									<p class="text-sm text-primary"
										style="font-size: 5px; margin-bottom: 2px;">Around other
										places</p>
									<h4 class="mb-0">?????? ?????????</h4>
								</div>
								<!-- <svg class="theme-line-1"><use xlink:href="#map-marker-1"></use></svg> -->
								<svg
									class="svg-icon svg-icon svg-icon-light w-3rem h-3rem ms-3 text-muted flex-shrink-0">
                                      <use xlink:href="#map-marker-1"> </use></svg>
							</div>
						</div>

						<div class="col-jhj pd_jhj11">
							<c:forEach var="des" items="${des}" end="3">
									<div class="pd_jhj">
										<a href="${path}/Des/detail?de_id=${des.de_id}"><img
										class="img-fluid pd_jhj4"
										src="${des.img}"
										alt="..."></a> <a href="${path}/Des/detail?de_id=${des.de_id}">${des.name}</a>
									</div>
								</c:forEach>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</section>


 <!-- JavaScript files-->
        <script>
            // ------------------------------------------------------- //
            //   Inject SVG Sprite - 
            //   see more here 
            //   https://css-tricks.com/ajaxing-svg-sprite/
            // ------------------------------------------------------ //
            function injectSvgSprite(path) {

                var ajax = new XMLHttpRequest();
                ajax.open("GET", path, true);
                ajax.send();
                ajax.onload = function(e) {
                    var div = document.createElement("div");
                    div.className = 'd-none';
                    div.innerHTML = ajax.responseText;
                    document.body.insertBefore(div, document.body.childNodes[0]);
                }
            }
        
            injectSvgSprite('https://demo.bootstrapious.com/directory/1-4/icons/orion-svg-sprite.svg');
        </script>
        
        <jsp:include page="/WEB-INF/views/common/footer.jsp"/>