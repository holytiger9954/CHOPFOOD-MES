<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="content">

	<div class="header-row">
		<div>
			<h2 class="page-title">거래처 상세</h2>
			<p class="page-subtitle">선택한 거래처의 상세 정보를 확인하세요.</p>
		</div>

		<div>
			<p class="page-route">홈 &gt; 거래처 관리 &gt; 상세</p>
		</div>
	</div>

	<div class="btn-row">
		<div class="left">
			<a class="btn btn-white"
				href="${pageContext.request.contextPath}/vendor/list"> 목록 </a>
		</div>

		<div class="right">
			<a class="btn btn-main"
				href="${pageContext.request.contextPath}/vendor/edit?vendorId=${vendor.vendorId}">
				수정 </a>

			<form action="${pageContext.request.contextPath}/vendor/delete"
				method="post" style="display: inline;"
				onsubmit="return confirm('삭제하시겠습니까?');">

				<input type="hidden" name="vendorId" value="${vendor.vendorId}">

				<button type="submit" class="btn btn-red">삭제</button>
			</form>
		</div>
	</div>

	<div class="content-content">

		<div class="content-content-content">

			<div class="content-content-content-title">거래처 상세정보</div>

			<div class="info-table-wrap">
				<table class="info-table">
					<tbody>
						<tr>
							<th>거래처 코드</th>
							<td>${vendor.vendorId}</td>

							<th>거래처명</th>
							<td>${vendor.vendorName}</td>
						</tr>

						<tr>
							<th>유형</th>
							<td><c:choose>
									<c:when test="${vendor.vendorType == 'S'}">
                                        공급업체
                                    </c:when>
									<c:when test="${vendor.vendorType == 'C'}">
                                        납품처
                                    </c:when>
									<c:when test="${vendor.vendorType == 'E'}">
                                        기타
                                    </c:when>
									<c:otherwise>
                                        -
                                    </c:otherwise>
								</c:choose></td>

							<th>전화번호</th>
							<td>${vendor.vendorTel}</td>
						</tr>

						<tr>
							<th>이메일</th>
							<td><c:choose>
									<c:when test="${not empty vendor.vendorEmail}">
                                        ${vendor.vendorEmail}
                                    </c:when>
									<c:otherwise>
                                        -
                                    </c:otherwise>
								</c:choose></td>

							<th>우편번호</th>
							<td><c:choose>
									<c:when test="${not empty vendor.vendorZipcode}">
                                        ${vendor.vendorZipcode}
                                    </c:when>
									<c:otherwise>
                                        -
                                    </c:otherwise>
								</c:choose></td>
						</tr>

						<tr>
							<th>주소</th>
							<td colspan="3"><c:choose>
									<c:when test="${not empty vendor.vendorAddr}">
                                        ${vendor.vendorAddr}
                                        ${vendor.vendorAddrDetail}
                                    </c:when>
									<c:otherwise>
                                        -
                                    </c:otherwise>
								</c:choose></td>
						</tr>
					</tbody>
				</table>
			</div>

		</div>

	</div>

</div>