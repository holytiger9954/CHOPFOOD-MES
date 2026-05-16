<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
	.defList {
		cursor: pointer;
	}

	.defList:hover {
		background-color: #f5f5f5;
	}

	.modal-overlay {
		position: fixed;
		top: 0;
		left: 0;
		right: 0;
		bottom: 0;

		width: 100%;
		height: 100%;

		background-color: rgba(0, 0, 0, 0.35);

		display: none;
		justify-content: center;
		align-items: center;

		z-index: 9999;
	}

	.defect-detail-modal {
		width: 760px;
		min-height: 460px;

		background-color: #fff;
		border: 1px solid #888;
		border-radius: 8px;

		padding: 36px 52px;

		box-shadow: 0 8px 24px rgba(0, 0, 0, 0.2);

		box-sizing: border-box;
	}

	.defect-modal-header {
		display: flex;
		justify-content: space-between;
		align-items: flex-start;
	}

	.defect-modal-header h2 {
		margin: 0 0 8px 0;
		font-size: 28px;
		font-weight: 800;
		color: #111;
	}

	.defect-modal-header p {
		margin: 0;
		font-size: 16px;
		color: #666;
	}

	.btn-danger {
		background-color: #d93030;
		color: #fff;
		border: none;
	}

	.btn-danger:hover {
		background-color: #b82828;
	}

	.detail-line {
		margin-top: 34px;
		padding: 14px 16px;

		border-top: 1px solid #999;
		border-bottom: 1px solid #999;

		display: flex;
		align-items: center;
		gap: 70px;

		font-size: 17px;
	}

	.detail-label {
		font-weight: 800;
		color: #111;
	}

	.detail-section {
		min-height: 170px;

		padding: 20px 16px;

		border-bottom: 1px solid #999;
	}

	.detail-section h3 {
		margin: 0 0 14px 0;
		font-size: 20px;
		font-weight: 800;
		color: #111;
	}

	.detail-section p {
		margin: 0;
		font-size: 15px;
		line-height: 1.7;
		color: #222;

		white-space: pre-line;
	}

	.defect-modal-footer {
		margin-top: 28px;

		display: flex;
		justify-content: center;
		align-items: center;
		gap: 12px;
	}

	.defect-modal-footer .btn {
		min-width: 84px;
		text-align: center;
	}

	#detailUpdateBtn {
		text-decoration: none;
	}
</style>

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
				<option value=""
					${empty search.searchType ? 'selected' : ''}>
					전체
				</option>

				<option value="id"
					${search.searchType eq 'id' ? 'selected' : ''}>
					불량유형코드
				</option>

				<option value="name"
					${search.searchType eq 'name' ? 'selected' : ''}>
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
						<tr class="defList">
							<td class="defTypeId">${def.defTypeId}</td>
							<td class="defTypeName">${def.defTypeName}</td>
							<td class="defStandardAction">${def.defStandardAction}</td>
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


<div id="defectDetailModal" class="modal-overlay">

	<div class="defect-detail-modal">

		<div class="defect-modal-header">
			<div>
				<h2>불량 유형 상세</h2>
				<p>선택한 불량 유형에 대한 상세 정보를 확인하세요.</p>
			</div>

			<form action="${pageContext.request.contextPath}/defect/delete"
				method="post"
				onsubmit="return confirm('삭제하시겠습니까?');">

				<input type="hidden"
					name="defTypeId"
					id="detailDefTypeIdForDelete">

				<button type="submit" class="btn btn-danger">
					삭제
				</button>
			</form>
		</div>

		<div class="detail-line">
			<span class="detail-label">불량 유형</span>
			<span id="detailDefTypeName"></span>
		</div>

		<div class="detail-section">
			<h3>표준 조치사항</h3>
			<p id="detailDefStandardAction">내용 없음</p>
		</div>

		<div class="defect-modal-footer">
			<button type="button"
				class="btn btn-white"
				onclick="closeDefectDetailModal()">
				취소
			</button>

			<a id="detailUpdateBtn"
				class="btn btn-main"
				href="#">
				수정
			</a>
		</div>

	</div>
</div>


<script>
	window.addEventListener("load", () => {
		init();
	});

	function init() {
		bind();
	}

	function bind() {
		openDetailByRowClick();
		closeModalByBackgroundClick();
	}

	function openDetailByRowClick() {
		const defLists = document.querySelectorAll(".defList");

		for (let i = 0; i < defLists.length; i++) {
			defLists[i].addEventListener("click", () => {

				const defTypeId = defLists[i]
					.querySelector(".defTypeId")
					.textContent
					.trim();

				const defTypeName = defLists[i]
					.querySelector(".defTypeName")
					.textContent
					.trim();

				const defStandardAction = defLists[i]
					.querySelector(".defStandardAction")
					.textContent
					.trim();

				openDefectDetailModal(
					defTypeId,
					defTypeName,
					defStandardAction
				);
			});
		}
	}

	function openDefectDetailModal(defTypeId, defTypeName, defStandardAction) {
		document.getElementById("detailDefTypeIdForDelete").value = defTypeId;

		document.getElementById("detailDefTypeName").innerText =
			defTypeName + " (" + defTypeId + ")";

		document.getElementById("detailDefStandardAction").innerText =
			defStandardAction && defStandardAction.trim() !== ""
				? defStandardAction
				: "내용 없음";

		document.getElementById("detailUpdateBtn").href =
			"${pageContext.request.contextPath}/defect/update?defTypeId=" + defTypeId;

		document.getElementById("defectDetailModal").style.display = "flex";
	}

	function closeDefectDetailModal() {
		document.getElementById("defectDetailModal").style.display = "none";
	}

	function closeModalByBackgroundClick() {
		const modal = document.getElementById("defectDetailModal");

		modal.addEventListener("click", (e) => {
			if (e.target === modal) {
				closeDefectDetailModal();
			}
		});
	}
</script>