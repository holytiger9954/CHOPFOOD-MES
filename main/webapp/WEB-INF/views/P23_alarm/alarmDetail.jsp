<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="content">

	<div class="header-row">
		<div>
			<h2 class="page-title">알림 상세</h2>
			<p class="page-subtitle">등록된 알림 내용을 확인합니다.</p>
		</div>

		<div>
			<p class="page-route">홈 &gt; 알림관리 &gt; 상세</p>
		</div>
	</div>

	<div class="btn-row">
		<div class="left">
			<a class="btn btn-white"
				href="${pageContext.request.contextPath}/mypage">
				마이페이지로
			</a>
		</div>

		<div class="right">
			<a class="btn btn-red"
				href="${pageContext.request.contextPath}/alarm/delete?alarmId=${alarm.alarmId}"
				onclick="return confirm('알림을 삭제하시겠습니까?');">
				삭제
			</a>
		</div>
	</div>

	<div class="content-content">
		<div class="content-content-content">

			<div class="content-content-content-title">
				알림 정보
			</div>

			<div class="info-table-wrap">
				<table class="info-table">
					<tbody>
						<tr>
							<th>알림ID</th>
							<td>${alarm.alarmId}</td>

							<th>알림유형</th>
							<td>
								<c:choose>
									<c:when test="${alarm.alarmTypeNo == 40}">일반</c:when>
									<c:when test="${alarm.alarmTypeNo == 10}">작업</c:when>
									<c:when test="${alarm.alarmTypeNo == 20}">이상</c:when>
									<c:when test="${alarm.alarmTypeNo == 30}">점검</c:when>
									<c:otherwise>기타</c:otherwise>
								</c:choose>
							</td>
						</tr>

						<tr>
							<th>제목</th>
							<td>${alarm.alarmTitle}</td>

							<th>등록일</th>
							<td>
								<fmt:formatDate value="${alarm.alarmDate}" pattern="yyyy-MM-dd HH:mm"/>
							</td>
						</tr>

						<tr>
							<th>수신대상</th>
							<td colspan="3">
								<c:choose>
									<c:when test="${not empty alarm.alarmEmp}">
										사원 - ${alarm.empName} (${alarm.alarmEmp})
									</c:when>
									<c:when test="${not empty alarm.alarmDept}">
										부서 - ${alarm.deptName}
									</c:when>
									<c:when test="${not empty alarm.alarmAuth}">
										권한 - ${alarm.authName}
									</c:when>
									<c:otherwise>
										전체
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</tbody>
				</table>
			</div>

			<div class="simple-section">
				<div class="simple-title">알림 내용</div>
				<div class="simple-content">${alarm.alarmContent}</div>
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
	white-space: pre-line;
}
</style>