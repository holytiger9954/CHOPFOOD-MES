<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="content">

	<div class="header-row">
		<div>
			<h2 class="page-title">GHP 기준 수정</h2>
			<p class="page-subtitle">GHP 기준정보를 수정합니다.</p>
		</div>

		<div>
			<p class="page-route">홈 &gt; 기준관리 &gt; GHP 기준 수정</p>
		</div>
	</div>

	<form action="${pageContext.request.contextPath}/ghp/updateDo"
		method="post"
		class="search-box"
		style="width:100%; max-width:1050px;">

		<input type="hidden" name="ghpId" value="${ghp.ghpId}">

		<div style="width:100%; display:flex; justify-content:flex-end; gap:12px;">
			<a class="btn btn-white"
				href="${pageContext.request.contextPath}/ghp/detail?ghpId=${ghp.ghpId}">
				취소
			</a>

			<button type="submit" class="btn btn-main">
				수정
			</button>
		</div>

		<div class="form-row">
			<div class="search-item">
				<label>기준ID</label>
				<input type="text" value="${ghp.ghpId}" readonly>
			</div>

			<div class="search-item">
				<label>기준명 <span class="red">*</span></label>
				<input type="text" name="ghpName" value="${ghp.ghpName}">
			</div>
		</div>

		<div class="form-row">
			<div class="search-item">
				<label>구분 <span class="red">*</span></label>
				<select name="ghpCategory">
					<option value="">구분 선택</option>
					<option value="세척관리" ${ghp.ghpCategory == '세척관리' ? 'selected' : ''}>세척관리</option>
					<option value="작업환경" ${ghp.ghpCategory == '작업환경' ? 'selected' : ''}>작업환경</option>
					<option value="개인위생" ${ghp.ghpCategory == '개인위생' ? 'selected' : ''}>개인위생</option>
					<option value="이물관리" ${ghp.ghpCategory == '이물관리' ? 'selected' : ''}>이물관리</option>
					<option value="공정위생" ${ghp.ghpCategory == '공정위생' ? 'selected' : ''}>공정위생</option>
				</select>
			</div>

			<div class="search-item">
				<label>대상 구분</label>
				<select name="targetType" id="targetType">
					<option value="" ${empty ghp.targetType ? 'selected' : ''}>공통</option>
					<option value="WH" ${ghp.targetType == 'WH' ? 'selected' : ''}>창고</option>
					<option value="WP" ${ghp.targetType == 'WP' ? 'selected' : ''}>작업장</option>
				</select>
			</div>
		</div>

		<div class="form-row">
			<div class="search-item" id="whTypeArea">
				<label>창고 유형</label>
				<select name="ghpWhType" id="ghpWhType">
					<option value="0">창고 유형 선택</option>
					<option value="10" ${ghp.ghpWhType == 10 ? 'selected' : ''}>원자재 창고</option>
					<option value="20" ${ghp.ghpWhType == 20 ? 'selected' : ''}>반제품 창고</option>
					<option value="30" ${ghp.ghpWhType == 30 ? 'selected' : ''}>완제품 창고</option>
					<option value="40" ${ghp.ghpWhType == 40 ? 'selected' : ''}>냉장/냉동 창고</option>
				</select>
			</div>

			<div class="search-item" id="wpTypeArea">
				<label>작업장 유형</label>
				<select name="ghpWpType" id="ghpWpType">
					<option value="0">작업장 유형 선택</option>
					<option value="10" ${ghp.ghpWpType == 10 ? 'selected' : ''}>전처리</option>
					<option value="20" ${ghp.ghpWpType == 20 ? 'selected' : ''}>배합</option>
					<option value="30" ${ghp.ghpWpType == 30 ? 'selected' : ''}>반죽</option>
					<option value="40" ${ghp.ghpWpType == 40 ? 'selected' : ''}>성형</option>
					<option value="50" ${ghp.ghpWpType == 50 ? 'selected' : ''}>포장</option>
				</select>
			</div>
		</div>

		<div class="form-row">
			<div class="search-item">
				<label>점검주기</label>
				<input type="text" name="ghpCycle" value="${ghp.ghpCycle}">
			</div>

			<div class="search-item">
				<label>단위</label>
				<input type="text" name="ghpUnit" value="${ghp.ghpUnit}">
			</div>
		</div>

		<div class="form-row">
			<div class="search-item">
				<label>최소값</label>
				<input type="number" name="ghpMinValue" value="${ghp.ghpMinValue}">
			</div>

			<div class="search-item">
				<label>최대값</label>
				<input type="number" name="ghpMaxValue" value="${ghp.ghpMaxValue}">
			</div>
		</div>

		<div class="search-item" style="width:100%;">
			<label>기준내용 <span class="red">*</span></label>
			<textarea name="ghpStandard" style="height:130px;">${ghp.ghpStandard}</textarea>
		</div>

		<div class="search-item" style="width:100%;">
			<label>점검방법 <span class="red">*</span></label>
			<textarea name="ghpCheckMethod" style="height:130px;">${ghp.ghpCheckMethod}</textarea>
		</div>

	</form>
</div>

<style>
.form-row {
	width: 100%;
	display: flex;
	gap: 40px;
	margin-bottom: 26px;
}

.form-row .search-item {
	flex: 1;
	display: flex;
	flex-direction: column;
}
</style>

<script>
window.addEventListener("load", function() {

	const targetType = document.querySelector("#targetType");
	const whTypeArea = document.querySelector("#whTypeArea");
	const wpTypeArea = document.querySelector("#wpTypeArea");
	const ghpWhType = document.querySelector("#ghpWhType");
	const ghpWpType = document.querySelector("#ghpWpType");

	function applyTargetType() {
		if (targetType.value === "WH") {
			whTypeArea.style.display = "flex";
			wpTypeArea.style.display = "none";
			ghpWpType.value = "0";
		} else if (targetType.value === "WP") {
			whTypeArea.style.display = "none";
			wpTypeArea.style.display = "flex";
			ghpWhType.value = "0";
		} else {
			whTypeArea.style.display = "none";
			wpTypeArea.style.display = "none";
			ghpWhType.value = "0";
			ghpWpType.value = "0";
		}
	}

	targetType.addEventListener("change", applyTargetType);

	applyTargetType();
});
</script>