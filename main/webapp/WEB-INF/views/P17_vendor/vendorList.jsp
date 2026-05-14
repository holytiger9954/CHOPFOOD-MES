<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>

<h2>거래처 관리</h2>

<form action="${pageContext.request.contextPath}/vendor/list"
	method="get">

	<input type="text"
		name="vendorName"
		value="${search.vendorName}"
		placeholder="거래처명 검색">

	<select name="vendorType">

		<option value="">전체</option>

		<option value="S"
			${search.vendorType == 'S' ? 'selected' : ''}>
			공급업체
		</option>

		<option value="C"
			${search.vendorType == 'C' ? 'selected' : ''}>
			고객사
		</option>

		<option value="E"
			${search.vendorType == 'E' ? 'selected' : ''}>
			기타
		</option>

	</select>

	<select name="vendorUsage">

		<option value="">전체</option>

		<option value="Y"
			${search.vendorUsage == 'Y' ? 'selected' : ''}>
			사용
		</option>

		<option value="N"
			${search.vendorUsage == 'N' ? 'selected' : ''}>
			미사용
		</option>

	</select>

	<button type="submit">검색</button>

</form>

<hr>

<table border="1">

	<thead>
		<tr>
			<th>거래처 코드</th>
			<th>거래처명</th>
			<th>유형</th>
			<th>전화번호</th>
			<th>이메일</th>
			<th>주소</th>
			<th>사용여부</th>
		</tr>
	</thead>

	<tbody>

		<c:forEach var="vendor"
			items="${vendorList}">

			<tr>

				<td>${vendor.vendorId}</td>

				<td>${vendor.vendorName}</td>

				<td>${vendor.vendorType}</td>

				<td>${vendor.vendorTel}</td>

				<td>${vendor.vendorEmail}</td>

				<td>${vendor.vendorAddress}</td>

				<td>${vendor.vendorUsage}</td>

			</tr>

		</c:forEach>

		<c:if test="${empty vendorList}">

			<tr>
				<td colspan="7">
					조회된 거래처가 없습니다.
				</td>
			</tr>

		</c:if>

	</tbody>

</table>