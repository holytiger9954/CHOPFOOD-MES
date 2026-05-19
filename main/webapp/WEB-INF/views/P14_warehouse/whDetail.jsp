<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="content">
	
	<div class="header-row">
		<div>
			<h2 class="page-title">창고 상세</h2>
			<p class="page-subtitle">선택한 창고의 상세 정보를 확인하세요.</p>
		</div>
		
		<div>
			<p class="page-route">홈 > 창고 관리 > 상세</p>
		</div>
	</div>
	<div class="btn-row">
		<div class="left">
			<a class="btn btn-white"
				href="${pageContext.request.contextPath}/warehouse/list">
				목록으로
			</a>
		</div>
		<div class="right">
			<a class="btn btn-main"
				href="${pageContext.request.contextPath}/warehouse/edit?whId=${whDTO.whId}">
				수정
			</a>
			<a class="btn btn-red"
				href="${pageContext.request.contextPath}/warehouse/delete?whId=${whDTO.whId}">
				삭제
			</a>
		</div>
	</div>
	
	<div class="content-content">
		<div class="content-content-content">
			<div class="content-content-content-title">
				창고 상세정보
			</div>
			<div class="info-table-wrap">
				<table class="info-table">
					<tbody>
						<tr>
							<th>창고명</th>
							<td>${whDTO.whName}</td>
							<th>창고 코드</th>
							<td>${whDTO.whId}</td>
						</tr>
						<tr>
							<th>유형</th>
							<td>${whDTO.whTypeName}</td>
							<th>설명</th>
							<td>${whDTO.whTypeContent}</td>
						</tr>
						<tr>
							<th>수용량</th>
							<td>${whDTO.whQty} LOT</td>
							<th>적재율</th>
							<td>${whDTO.whUsageRate} %</td>
						</tr>
						<tr>
							<th>적재량</th>
							<td>${whDTO.whPrevQty} LOT</td>
							<th>마지막 점검일</th>
							<c:if test="${not empty whDTO.lastGlogDate}">
								<td>${whDTO.lastGlogDate}</td>
							</c:if>
							<c:if test="${empty whDTO.lastGlogDate}">
								<td>-</td>
							</c:if>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		<div class="content-content-content">
			<div class="btn-row">
				<div class="left content-content-content-title">
					창고 내 섹션 정보
				</div>
				<div class="right">
					<a class="btn btn-main"
						href="${pageContext.request.contextPath}/warehouse/section/add?whId=${whDTO.whId}">
						섹션 추가
					</a>
				</div>
			</div>
			
			<div style="display: flex; align-items: flex-start; gap: 15px;">
				<div class="card" style="width: 600px;">
					<div class="card-title">창고 영역도</div>
					<c:if test="${empty whDTO.whImg or whDTO.whImg == ''}">
						<div class="card-subtitle">창고 영역도가 없습니다.</div>
					</c:if>
					<c:if test="${not empty whDTO.whImg and whDTO.whImg != ''}">
				        <div class="card-value">${whDTO.whImg}</div>
					</c:if>
				</div>
				
				<div class="table-wrap">
					<table class="table">
						<thead>
							<tr>
								<th>섹션번호</th>
								<th>이름</th>
								<th>수용량(LOT)</th>
								<th>적재율(%)</th>
							</tr>
						</thead>
						<tbody>
	<%-- 						<c:forEach var="glog" items="${glogList}"> --%>
	<!-- 							<tr class="glogList"> -->
	<%-- 								<td class="glogId">${glog.glogId}</td> --%>
	<%-- 								<td>${glog.glogWName} (${glog.glogWorker})</td> --%>
	<%-- 								<td>${glog.ghpName} (${glog.ghpId})</td> --%>
	<%-- 								<c:if test="${glog.glogResult eq 'pass'}"> --%>
	<!-- 									<td>적합</td> -->
	<%-- 								</c:if> --%>
	<%-- 								<c:if test="${glog.glogResult eq 'fail'}"> --%>
	<!-- 									<td>부적합</td> -->
	<%-- 								</c:if> --%>
	<%-- 								<c:if test="${glog.glogResult != 'fail' && glog.glogResult != 'pass'}"> --%>
	<!-- 									<td>-</td> -->
	<%-- 								</c:if> --%>
	<%-- 								<td>${glog.glogDate}</td> --%>
	<!-- 							</tr>	 -->
	<%-- 						</c:forEach> --%>
							
	<%-- 						<c:if test="${empty glogList}"> --%>
	<!-- 							<tr> -->
	<!-- 								<td colspan="5" style="text-align: center;"> -->
	<!-- 									조회된 내역이 없습니다. -->
	<!-- 								</td> -->
	<!-- 							</tr> -->
	<%-- 						</c:if>	 --%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		
		<div class="content-content-content">
			<div class="btn-row">
				<div class="left content-content-content-title">
					창고 위생점검 이력
				</div>
				<div class="right">
					<a class="btn btn-main"
						href="${pageContext.request.contextPath}/warehouse/glog/add?whId=${whDTO.whId}">
						점검 이력 추가
					</a>
				</div>
			</div>
			
			<div class="table-wrap">
				<table class="table">
					<thead>
						<tr>
							<th style="width: 150px">점검 이력 번호</th>
							<th style="width: 180px">점검자</th>
							<th style="width: 250px">점검 기준</th>
							<th style="width: 120px">점검 결과</th>
							<th style="width: 230px">점검 일시</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="glog" items="${glogList}">
							<tr class="glogList">
								<td class="glogId">${glog.glogId}</td>
								<td>${glog.glogWName} (${glog.glogWorker})</td>
								<td>${glog.ghpName} (${glog.ghpId})</td>
								<c:if test="${glog.glogResult eq 'pass'}">
									<td>적합</td>
								</c:if>
								<c:if test="${glog.glogResult eq 'fail'}">
									<td>부적합</td>
								</c:if>
								<c:if test="${glog.glogResult != 'fail' && glog.glogResult != 'pass'}">
									<td>-</td>
								</c:if>
								<td>${glog.glogDate}</td>
							</tr>	
						</c:forEach>
						
						<c:if test="${empty glogList}">
							<tr>
								<td colspan="5" style="text-align: center;">
									조회된 내역이 없습니다.
								</td>
							</tr>
						</c:if>	
					</tbody>
				</table>
			</div>
			
			<jsp:include page="/WEB-INF/views/common/paging.jsp" />
		</div>
	</div>
	
</div>

<style>
	.table tbody tr:hover .glogId {
	    color: var(--main-green);
	    text-decoration: underline;
	}
</style>

<script>
	
	window.addEventListener ("load", () => {
		init();
	})
	
	function init() {
		bind();
	}
	
	function bind() {
		moveGlog();
	}
	
	function moveGlog() {
		const glogLists = document.querySelectorAll(".glogList");
		
		for (let i=0; i<glogLists.length; i++) {
			
			glogLists[i].addEventListener("click", () => {
				const glogId = glogLists[i].querySelector(".glogId").textContent.trim();
				console.log ("glogId : " + glogId);
				
				const url = `${pageContext.request.contextPath}/warehouse/glog/detail?glogId=` + glogId;
				console.log ("url : " + url);
				
				window.location.href = url;
			})
		}
	}
	
</script>