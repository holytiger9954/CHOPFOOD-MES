<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="content">

	<div class="header-row">
		<div>
			<h2 class="page-title">GHP 기준 상세</h2>
			<p class="page-subtitle">선택한 GHP 기준정보를 확인합니다.</p>
		</div>

		<div>
			<p class="page-route">홈 &gt; 기준관리 &gt; GHP 기준 상세</p>
		</div>
	</div>

	<div class="btn-row">
		<div class="left">
			<a class="btn btn-white"
				href="${pageContext.request.contextPath}/ghp/list">
				목록으로
			</a>
		</div>

		<div class="right">
			<a class="btn btn-main"
				href="${pageContext.request.contextPath}/ghp/update?ghpId=${ghp.ghpId}">
				수정
			</a>

			<a class="btn btn-red"
				href="${pageContext.request.contextPath}/ghp/delete?ghpId=${ghp.ghpId}"
				onclick="return confirm('GHP 기준정보를 삭제하시겠습니까?');">
				삭제
			</a>
		</div>
	</div>

	<div class="content-content">
		<div class="content-content-content">

			<div class="content-content-content-title">
				GHP 기준정보
			</div>

			<div class="info-table-wrap">
				<table class="info-table">
					<tbody>
						<tr>
							<th>기준ID</th>
							<td>${ghp.ghpId}</td>

							<th>기준명</th>
							<td>${ghp.ghpName}</td>
						</tr>

						<tr>
							<th>구분</th>
							<td>${ghp.ghpCategory}</td>

							<th>점검주기</th>
							<td>${ghp.ghpCycle}</td>
						</tr>

						<tr>
							<th>대상</th>
							<td>
								<c:choose>
									<c:when test="${ghp.ghpWhType != 0}">
										${ghp.whTypeName}(창고)
									</c:when>
									<c:when test="${ghp.ghpWpType != 0}">
										${ghp.wpTypeName}(작업장)
									</c:when>
									<c:otherwise>
										공통
									</c:otherwise>
								</c:choose>
							</td>

							<th>기준값</th>
							<td>
								<c:choose>
									<c:when test="${not empty ghp.ghpMinValue or not empty ghp.ghpMaxValue}">
										${ghp.ghpMinValue} ~ ${ghp.ghpMaxValue} ${ghp.ghpUnit}
									</c:when>
									<c:otherwise>
										-
									</c:otherwise>
								</c:choose>
							</td>
						</tr>

					</tbody>
				</table>
			</div>

			<div class="simple-section">
				<div class="simple-title">기준내용</div>
				<div class="simple-content">${ghp.ghpStandard}</div>
			</div>

			<div class="simple-section">
				<div class="simple-title">점검방법</div>
				<div class="simple-content">${ghp.ghpCheckMethod}</div>
			</div>

		</div>
	</div>

</div>

<style>
.simple-section {
	border-bottom: 1px solid var(--dark-gray);
	padding: 18px 12px 28px;
}

.simple-title {
	font-size: 16px;
	font-weight: 700;
	margin-bottom: 18px;
}

.simple-content {
	font-size: 14px;
	padding-left: 16px;
}
</style>