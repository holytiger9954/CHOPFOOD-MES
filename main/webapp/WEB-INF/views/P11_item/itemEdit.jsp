<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="content">

	<div class="header-row">

		<div>
			<h2 class="page-title">품목 수정 (${itemDTO.itemId})</h2>
			<p class="page-subtitle">품목을 수정하세요.</p>
		</div>

		<div>
			<p class="page-route">홈 &gt; 품목관리 &gt; 수정</p>
		</div>

	</div>

	<form action="${pageContext.request.contextPath}/item/update"
		method="post"
		style="width:100%; max-width:1050px;">

		<input type="hidden" name="itemId" value="${itemDTO.itemId}">

		<div style="display:flex; justify-content:flex-end; gap:12px;">

			<a class="btn btn-white"
				href="${pageContext.request.contextPath}/item/detail?itemId=${itemDTO.itemId}">
				취소
			</a>

			<button type="submit" class="btn btn-main">
				수정
			</button>

		</div>

		<div style="display:flex; gap:40px; margin-bottom:26px;">

			<div class="search-item"
				style="display:flex; flex-direction:column; flex:1;">

				<label>품목명 <span class="red">*</span></label>

				<input type="text"
					name="itemName"
					value="${itemDTO.itemName}"
					placeholder="품목명 입력"
					style="width: 48%;">
			</div>


		</div>

		<div style="display:flex; gap:40px; margin-bottom:26px;">
			<div class="search-item"
				style="display:flex; flex-direction:column; flex:1;">

				<label>품목유형</label>

				<select name="itemType" id="itemType">

					<option value="10"
						<c:if test="${itemDTO.itemType == '10'}">selected</c:if>>
						원자재
					</option>

					<option value="20"
						<c:if test="${itemDTO.itemType == '20'}">selected</c:if>>
						반제품
					</option>

					<option value="30"
						<c:if test="${itemDTO.itemType == '30'}">selected</c:if>>
						완제품
					</option>
					
					<option value="40"
						<c:if test="${itemDTO.itemType == '40'}">selected</c:if>>
						기타 자재
					</option>

				</select>

			</div>

			<div style="
				display:flex;
				flex-direction:column;
				flex:1;
			" class="search-item">
			<label>창고 유형</label>
			<select name="itemWhType" id="itemWhType">
				<option>창고 유형 선택</option>
			</select>
			</div>

		</div>

		<div style="display:flex; gap:36px; margin-bottom:26px;">

			<div class="search-item"
				style="display:flex; flex-direction:column; flex:1;">

				<label>안전재고 <span class="red">*</span></label>

				<input type="text"
					name="safetyStock"
					value="${itemDTO.safetyStock}"
					placeholder="안전재고 입력">
			</div>
			<div class="search-item"
				style="display:flex; flex-direction:column; flex:1;">

				<label>사용가능기간 <span class="red">*</span></label>

				<input type="number"
					name="useDate"
					value="${itemDTO.useDate}"
					placeholder="사용가능 기간 입력">
			</div>
			
		</div>
			
		<div style="display:flex; gap:36px; margin-bottom:26px;">

			<div class="search-item"
				style="display:flex; flex-direction:column; flex:1;">

				<label>단위 <span class="red">*</span></label>

				<input type="text"
					name="unit"
					value="${itemDTO.unit}"
					placeholder="단위 입력">
			</div>

			<div class="search-item"
				style="display:flex; flex-direction:column; flex:1;">

				<label>규격 <span class="red">*</span></label>

				<input type="text"
					name="spec"
					value="${itemDTO.spec}"
					placeholder="규격 입력">
			</div>

			<div class="search-item"
				style="display:flex; flex-direction:column; flex:1;">

				<label>단가(원) <span class="red">*</span></label>

				<input type="text"
					name="unitPrice"
					value="${itemDTO.unitPrice}"
					placeholder="단가 입력">
			</div>

		</div>



	</form>

</div>

<script>
window.addEventListener("load", function() {

	
	/* =========================
	품목 유형별 창고 유형
	========================= */
	
	const itemTypeSelect =
		document.querySelector("#itemType");
	
	const whTypeSelect =
		document.querySelector("#itemWhType");
	
	const currentItemType =
		"${itemDTO.itemType}";
	
	const currentWhType =
		"${itemDTO.itemWhType}";
	
	function loadWhTypeList(itemType, selectedWhType) {
	
		let html =
			'<option value="">창고 유형 선택</option>';
	
		// 원자재
		if (itemType == "10") {
	
			html += '<option value="10">원자재 냉동창고</option>';
			html += '<option value="20">원자재 냉장창고</option>';
			html += '<option value="30">원자재 실온창고</option>';
	
		}
	
		// 반제품
		else if (itemType == "20") {
	
			html += '<option value="40">반제품 냉동창고</option>';
			html += '<option value="50">반제품 냉장창고</option>';
	
		}
	
		// 완제품
		else if (itemType == "30") {
	
			html += '<option value="60">완제품 냉동창고</option>';
	
		}
	
		// 기타자재
		else if (itemType == "40") {
	
			html += '<option value="70">기타 자재 실온창고</option>';
	
		}
	
		whTypeSelect.innerHTML = html;
	
		if (selectedWhType !== "") {
			whTypeSelect.value = selectedWhType;
		}
	}
	
	loadWhTypeList(currentItemType, currentWhType);
	
	itemTypeSelect.addEventListener("change", function() {
	
		loadWhTypeList(this.value, "");
	
	});

	const unitPriceInput = document.querySelector("input[name='unitPrice']");
	const safetyStockInput = document.querySelector("input[name='safetyStock']");
	const useDateInput = document.querySelector("input[name='useDate']");
	const form = document.querySelector("form");

	function formatComma(inputTag) {

		let firstValue = inputTag.value.replace(/[^0-9]/g, "");

		if (firstValue !== "") {
			inputTag.value = Number(firstValue).toLocaleString("ko-KR");
		}

		inputTag.addEventListener("input", function() {

			let value = this.value.replace(/[^0-9]/g, "");

			if (value === "") {
				this.value = "";
				return;
			}

			this.value = Number(value).toLocaleString("ko-KR");
		});
	}

	function preventNegative(inputTag) {

		inputTag.addEventListener("keydown", function(e) {

			if (e.key === "-" || e.key === "e") {
				e.preventDefault();
			}

		});

		inputTag.addEventListener("input", function() {

			if (Number(this.value) < 0) {
				this.value = "";
			}

		});
	}

	formatComma(unitPriceInput);
	formatComma(safetyStockInput);

	preventNegative(safetyStockInput);
	preventNegative(useDateInput);

	form.addEventListener("submit", function() {

		unitPriceInput.value =
			unitPriceInput.value.replace(/,/g, "");

		safetyStockInput.value =
			safetyStockInput.value.replace(/,/g, "");

	});

});
</script>