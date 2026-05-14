<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="vendor-page">

	<div class="vendor-top-path">
		vendor/list
	</div>

	<div class="vendor-header-row">
		<div>
			<h2 class="page-title">거래처 관리</h2>
			<p class="page-subtitle">
				거래처를 조회하고 새로운 거래처를 등록할 수 있습니다.
			</p>
		</div>

		<a class="btn btn-white"
			href="${pageContext.request.contextPath}/vendor/register">
			거래처 등록
		</a>
	</div>

	<div class="vendor-breadcrumb">
		홈 &gt; 거래처관리
	</div>

	<form class="vendor-search-box"
		action="${pageContext.request.contextPath}/vendor/list"
		method="get">

		<div class="vendor-search-item">
			<label>유형</label>
			<select name="vendorType">
				<option value="">전체</option>
				<option value="S" ${search.vendorType == 'S' ? 'selected' : ''}>공급업체</option>
				<option value="C" ${search.vendorType == 'C' ? 'selected' : ''}>납품처</option>
				<option value="E" ${search.vendorType == 'E' ? 'selected' : ''}>기타</option>
			</select>
		</div>

		<div class="vendor-search-item vendor-search-keyword">
			<label>거래처명/코드 검색</label>
			<input type="text"
				name="vendorName"
				value="${search.vendorName}"
				placeholder="내용을 입력하세요.">
		</div>

		<button type="submit" class="btn btn-main">
			검색
		</button>

	</form>

	<div class="vendor-table-area">
		<div class="table-wrap">
			<table class="table vendor-table">
				<thead>
					<tr>
						<th>거래처 코드</th>
						<th>거래처명</th>
						<th>유형</th>
						<th>번호</th>
						<th>주소</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="vendor" items="${vendorList}">
						<tr>
							<td>${vendor.vendorId}</td>
							<td>${vendor.vendorName}</td>

							<td>
								<c:choose>
									<c:when test="${vendor.vendorType == 'S'}">공급업체</c:when>
									<c:when test="${vendor.vendorType == 'C'}">납품처</c:when>
									<c:when test="${vendor.vendorType == 'E'}">기타</c:when>
									<c:otherwise>-</c:otherwise>
								</c:choose>
							</td>

							<td>${vendor.vendorTel}</td>
							<td>${vendor.vendorAddress}</td>
						</tr>
					</c:forEach>

					<c:if test="${empty vendorList}">
						<tr>
							<td colspan="5" class="vendor-empty">
								조회된 거래처가 없습니다.
							</td>
						</tr>
					</c:if>
				</tbody>
			</table>
		</div>
		
		<jsp:include page="/WEB-INF/views/common/paging.jsp" />
		
	</div>

</div>

<style>
.vendor-page {
	position: relative;
	max-width: 980px;
	margin: 0 auto;
	padding: 8px 0 40px;
}

.vendor-top-path {
	margin-bottom: 34px;
	font-size: 13px;
	color: #bbb;
}

.vendor-header-row {
	display: flex;
	justify-content: space-between;
	align-items: flex-start;
	margin-bottom: 4px;
}

.vendor-breadcrumb {
	margin-bottom: 18px;
	text-align: right;
	font-size: 13px;
	color: #999;
}

.vendor-search-box {
	display: flex;
	justify-content: flex-end;
	align-items: flex-end;
	gap: 8px;
	margin-bottom: 20px;
}

.vendor-search-item {
	display: flex;
	flex-direction: column;
	gap: 6px;
}

.vendor-search-item label {
	font-size: 13px;
	font-weight: 700;
	color: #333;
}

.vendor-search-item select,
.vendor-search-item input {
	height: 36px;
	padding: 0 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	font-size: 13px;
}

.vendor-search-item select {
	width: 90px;
}

.vendor-search-keyword input {
	width: 280px;
}

.vendor-table-area {
	width: 100%;
}

.vendor-table th,
.vendor-table td {
	text-align: center;
}

.vendor-table td:last-child {
	text-align: left;
}

.vendor-empty {
	height: 120px;
	text-align: center !important;
	color: #999;
}
</style>