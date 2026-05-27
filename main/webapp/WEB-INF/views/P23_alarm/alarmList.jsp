<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="content">

	<div class="header-row">
		<div>
			<h2 class="page-title">알림 관리</h2>
			<p class="page-subtitle">등록된 알림을 조회하고 관리합니다.</p>
		</div>

		<div>
			<p class="page-route">홈 &gt; 알림관리</p>
			<a class="btn btn-white"
				href="${pageContext.request.contextPath}/alarm/add">
				알림 생성
			</a>
		</div>
	</div>

	<form action="${pageContext.request.contextPath}/alarm/list"
		method="get"
		class="search-box">

		<div class="search-item keyword">
			<label>검색어</label>
			<input type="text"
				name="searchKeyword"
				value="${search.searchKeyword}"
				placeholder="알림 제목 / 내용 / 코드">
		</div>

		<button type="submit" class="btn btn-main">검색</button>
	</form>

	<table class="table">
		<thead>
			<tr>
				<th>알림ID</th>
				<th>유형</th>
				<th>제목</th>
				<th>수신대상</th>
				<th>등록일</th>
			</tr>
		</thead>

		<tbody>
			<c:choose>
				<c:when test="${empty alarmList}">
					<tr>
						<td colspan="5" class="empty">
							조회된 알림이 없습니다.
						</td>
					</tr>
				</c:when>

				<c:otherwise>
					<c:forEach var="alarm" items="${alarmList}">
						<tr onclick="location.href='${pageContext.request.contextPath}/alarm/detail?alarmId=${alarm.alarmId}'">
							<td>${alarm.alarmId}</td>

							<td>
								<c:choose>
									<c:when test="${alarm.alarmTypeNo == 10}">일반</c:when>
									<c:when test="${alarm.alarmTypeNo == 20}">품질</c:when>
									<c:when test="${alarm.alarmTypeNo == 30}">재고</c:when>
									<c:when test="${alarm.alarmTypeNo == 40}">위생</c:when>
									<c:when test="${alarm.alarmTypeNo == 50}">작업</c:when>
									<c:otherwise>기타</c:otherwise>
								</c:choose>
							</td>

							<td>${alarm.alarmTitle}</td>

							<td>
								<c:choose>
									<c:when test="${not empty alarm.alarmEmp}">
										${alarm.empName} (${alarm.alarmEmp})
									</c:when>
									<c:when test="${not empty alarm.alarmDept}">
										${alarm.deptName}
									</c:when>
									<c:when test="${not empty alarm.alarmAuth}">
										${alarm.authName}
									</c:when>
									<c:otherwise>
										전체
									</c:otherwise>
								</c:choose>
							</td>

							<td>
								<fmt:formatDate value="${alarm.alarmDate}" pattern="yyyy-MM-dd HH:mm"/>
							</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<jsp:include page="/WEB-INF/views/common/paging.jsp" />

</div>