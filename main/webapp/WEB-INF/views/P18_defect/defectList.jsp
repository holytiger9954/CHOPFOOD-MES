<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="content">

	<div class="header-row">
		<div>
			<h2 class="page-title">불량 유형 관리</h2>
			<p class="page-subtitle">불량 유형을 조회하고 새로운 불량 유형을 등록할 수 있습니다.</p>
		</div>

		<div>
			<p class="page-route">홈 > 불량 유형 관리</p>
			<a class="btn btn-white"
				href="${pageContext.request.contextPath}/defect/add">
				불량 유형 등록
			</a>
		</div>
	</div>

	<form class="search-box"
		action="${pageContext.request.contextPath}/defect/list"
		method="get">

		<div class="search-item">
			<label>검색조건</label>

			<select name="searchType">
				<option value="">전체</option>

				<option value="id"
					${search.searchType == 'id' ? 'selected' : ''}>
					불량유형코드
				</option>

				<option value="name"
					${search.searchType == 'name' ? 'selected' : ''}>
					불량유형명
				</option>
			</select>
		</div>

		<div class="search-item keyword">
			<label>불량유형 검색</label>

			<input type="text"
				name="searchKeyword"
				value="${search.searchKeyword}"
				placeholder="내용을 입력하세요.">
		</div>

		<div class="search-btn-area">
			<button type="submit" class="btn btn-main">
				검색
			</button>
		</div>
	</form>

	<div>
		<div class="table-wrap">
			<table class="table">
				<thead>
					<tr>
						<th style="width: 130px;">불량유형코드</th>
						<th style="width: 220px;">불량유형명</th>
						<th>표준 조치사항</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="def" items="${defList}">
						<tr>
							<td>${def.defTypeId}</td>
							<td>${def.defTypeName}</td>
							<td>${def.defStandardAction}</td>
						</tr>
					</c:forEach>

					<c:if test="${empty defList}">
						<tr>
							<td colspan="3" style="text-align: center;">
								조회된 불량 유형이 없습니다.
							</td>
						</tr>
					</c:if>
				</tbody>
			</table>
		</div>

		<jsp:include page="/WEB-INF/views/common/paging.jsp" />

	</div>
</div>