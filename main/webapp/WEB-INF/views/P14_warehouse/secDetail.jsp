<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="content">
	
	<div class="header-row">
		<div>
			<h2 class="page-title">창고 내 섹션 상세</h2>
			<p class="page-subtitle">선택한 섹션의 상세 정보를 확인하세요.</p>
		</div>
		
		<div>
			<p class="page-route">홈 > 창고 관리 > 섹션 > 상세</p>
		</div>
	</div>
	<div class="btn-row">
		<div class="left">
			<a class="btn btn-white"
				href="${pageContext.request.contextPath}/warehouse/detail?whId=${secDTO.whSecWhid}">
				창고 상세
			</a>
		</div>
		<div class="right">
			<a class="btn btn-main"
				href="${pageContext.request.contextPath}/warehouse/sec/edit?secId=${secDTO.whSecId}">
				수정
			</a>
			<a class="btn btn-red"
				href="${pageContext.request.contextPath}/warehouse/sec/delete?whId=${secDTO.whSecId}">
				삭제
			</a>
		</div>
	</div>
	
	<div class="content-content">
		<div class="content-content-content">
			<div class="content-content-content-title">
				섹션 상세정보
			</div>
			<div class="info-table-wrap">
				<table class="info-table">
					<tbody>
						<tr>
							<th>섹션번호</th>
							<td>${secDTO.whSecId}</td>
							<th>소속 창고</th>
							<td>${secDTO.whSecWhid}</td>
						</tr>
						<tr>
							<th>수용량</th>
							<td>${secDTO.whSecQty}</td>
							<th>적재량</th>
							<td>${secDTO.whSecPrevQty}</td>
							<th>적재율</th>
							<td>${secDTO.whSecUsageRate}</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		<div class="content-content-content">
			<div class="left content-content-content-title">
				섹션 위치 및 현황
			</div>
			
			<div style="display: flex; align-items: flex-start; gap: 15px;">
				<div class="card" style="width: 600px; padding: 20px;">
					<div class="content-content-content-title">섹션 이미지</div>
					<c:if test="${empty secDTO.whSecImg or secDTO.whSecImg == ''}">
						<div style="font-size: 14px; color: var(--dark-gray);">섹션 이미지가 없습니다</div>
					</c:if>
					<c:if test="${not empty secDTO.whSecImg and secDTO.whSecImg != ''}">
			        	<div class="info-image">
							<img src="${secDTO.whSecImg}"
								title="${secDTO.whSecId}_img" alt="${secDTO.whSecId}_img"
								 style="width: 100%;">
						</div>
					</c:if>
				</div>
				
				<div class="card" style="padding: 20px;">
					<div class="content-content-content-title">섹션 적재 현황</div>
					<div style="display: flex;">
						<div id="qtyGraph">
						</div>
						<div id="qtyInfo search-item">
							<div>
								<label>수용량</label>
								<div>${secDTO.whSecQty}</div>
							</div>
							<div>
								<label>현재 적재량</label>
								<div>${secDTO.whSecPrevQty}</div>
							</div>
							<div>
								<label>여유 수용량</label>
								<div>${secDTO.whSecQty - secDTO.whSecPrevQty}</div>
							</div>
							<div>
								<label>현재 적재율</label>
								<div>${secDTO.whSecUsageRate}</div>
							</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
		
		<div class="content-content-content">
			<div class="left content-content-content-title">
				LOT 현황
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
	.table tbody tr:hover .secId,  .table tbody tr:hover .glogId {
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
		moveSec();
	}
	
	function moveSec() {
		const secLists = document.querySelectorAll(".secList");
		
		for (let i=0; i<secLists.length; i++) {
			
			secLists[i].addEventListener("click", () => {
				const secId = secLists[i].querySelector(".secId").textContent.trim();
				console.log ("secId : " + secId);
				
				const url = `${pageContext.request.contextPath}/warehouse/sec/detail?secId=` + secId;
				console.log ("url : " + url);
				
				window.location.href = url;
			})
		}
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