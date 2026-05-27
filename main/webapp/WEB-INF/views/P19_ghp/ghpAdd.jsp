<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="content">

	<div class="header-row">
		<div>
			<h2 class="page-title">GHP 기준 등록</h2>
			<p class="page-subtitle">새로운 GHP 기준정보를 등록합니다.</p>
		</div>

		<div>
			<p class="page-route">홈 &gt; 기준관리 &gt; GHP 기준 등록</p>
		</div>
	</div>

	<form action="${pageContext.request.contextPath}/ghp/insertDo"
		method="post"
		class="search-box"
		style="width:100%; max-width:1050px;">

		<div style="width:100%; display:flex; justify-content:flex-end; gap:12px;">
			<a class="btn btn-white"
				href="${pageContext.request.contextPath}/ghp/list">
				취소
			</a>

			<button type="submit" class="btn btn-main">
				등록
			</button>
		</div>

		<div class="form-row">
			<div class="search-item">
				<label>기준명 <span class="red">*</span></label>
				<input type="text" name="ghpName" placeholder="기준명 입력">
			</div>

			<div class="search-item">
				<label>구분 <span class="red">*</span></label>
				<select name="ghpCategory">
					<option value="">구분 선택</option>
					<option value="세척관리">세척관리</option>
					<option value="작업환경">작업환경</option>
					<option value="개인위생">개인위생</option>
					<option value="이물관리">이물관리</option>
					<option value="공정위생">공정위생</option>
				</select>
			</div>
		</div>

		<div class="form-row">
			<div class="search-item">
				<label>대상 구분</label>
				<select name="targetType" id="targetType">
					<option value="">공통</option>
					<option value="WH">창고</option>
					<option value="WP">작업장</option>
				</select>
			</div>

			<div class="search-item" id="whTypeArea">
				<label>창고 유형</label>
				<select name="ghpWhType" id="ghpWhType">
					<option value="0">창고 유형 선택</option>
					<option value="10">원자재 창고</option>
					<option value="20">반제품 창고</option>
					<option value="30">완제품 창고</option>
					<option value="40">냉장/냉동 창고</option>
				</select>
			</div>

			<div class="search-item" id="wpTypeArea">
				<label>작업장 유형</label>
				<select name="ghpWpType" id="ghpWpType">
					<option value="0">작업장 유형 선택</option>
					<option value="10">전처리</option>
					<option value="20">배합</option>
					<option value="30">반죽</option>
					<option value="40">성형</option>
					<option value="50">포장</option>
				</select>
			</div>
		</div>

		<div class="form-row">
			<div class="search-item">
				<label>점검주기</label>
				<input type="text" name="ghpCycle" placeholder="예: 작업 전/후, 1일 2회">
			</div>

			<div class="search-item">
				<label>단위</label>
				<input type="text" name="ghpUnit" placeholder="예: ℃, %, mm">
			</div>
		</div>

		<div class="form-row">
			<div class="search-item">
				<label>최소값</label>
				<input type="number" name="ghpMinValue">
			</div>

			<div class="search-item">
				<label>최대값</label>
				<input type="number" name="ghpMaxValue">
			</div>
		</div>

		<div class="search-item" style="width:100%;">
			<label>기준내용 <span class="red">*</span></label>
			<textarea name="ghpStandard"
				placeholder="기준 내용을 입력하세요."
				style="height:130px;"></textarea>
		</div>

		<div class="search-item" style="width:100%;">
			<label>점검방법 <span class="red">*</span></label>
			<textarea name="ghpCheckMethod"
				placeholder="점검 방법을 입력하세요."
				style="height:130px;"></textarea>
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
	const form = document.querySelector("form");

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

	form.addEventListener("submit", function(e) {
		const requiredLabels = document.querySelectorAll("label .red");

		for (let i = 0; i < requiredLabels.length; i++) {
			const label = requiredLabels[i].closest("label");
			const target = label.nextElementSibling;

			if (!target || target.value.trim() === "") {
				alert(label.innerText.replace("*", "").trim() + " 항목을 입력하세요.");
				target.focus();
				e.preventDefault();
				return;
			}
		}
	});

	applyTargetType();
});
</script>