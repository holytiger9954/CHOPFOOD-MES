<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="content">

	<div class="header-row">

		<div>
			<h2 class="page-title">품목 수정</h2>
			<p class="page-subtitle">${itemDTO.itemId}</p>
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
					placeholder="품목명 입력">
			</div>

			<div class="search-item"
				style="display:flex; flex-direction:column; flex:1;">

				<label>품목유형</label>

				<select name="itemType">

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

				</select>

				<input type="hidden"
					name="itemType"
					value="${itemDTO.itemType}">
			</div>

		</div>

		<div style="display:flex; gap:40px; margin-bottom:26px;">

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

		<div style="display:flex; gap:40px; margin-bottom:26px;">

			<div class="search-item"
				style="display:flex; flex-direction:column; flex:1;">

				<label>거래처 타입</label>

				<select id="vendorType"
					name="vendorType">

					<option value="">거래처 타입 선택</option>

					<option value="S"
						<c:if test="${vendorType == 'S'}">selected</c:if>>
						공급처
					</option>

					<option value="C"
						<c:if test="${vendorType == 'C'}">selected</c:if>>
						납품처
					</option>

					<option value="E"
						<c:if test="${vendorType == 'E'}">selected</c:if>>
						기타
					</option>

				</select>

			</div>

			<div class="search-item"
				style="display:flex; flex-direction:column; flex:1;">

				<label>거래처</label>

				<select id="itemVendor"
					name="itemVendor">

					<option value="">거래처명(거래처코드) 선택</option>

				</select>

			</div>

		</div>

		<div class="search-item"
			style="display:flex; flex-direction:column;">

			<label>보관방법 <span class="red">*</span></label>

			<textarea name="itemStorage"
				placeholder="보관방법을 입력하세요."
				style="height:220px;">${itemDTO.itemStorage}</textarea>

		</div>

	</form>

</div>

<script>
window.addEventListener("load", function() {

	const vendorTypeSelect = document.querySelector("#vendorType");
	const vendorSelect = document.querySelector("#itemVendor");

	const currentVendorType = "${vendorType}";
	const currentVendorId = "${itemDTO.itemVendor}";

	function loadVendorList(vendorType, selectedVendorId) {

		vendorSelect.innerHTML =
			'<option value="">거래처명(거래처코드) 선택</option>';

		if (vendorType === "") {
			return;
		}

		fetch("${pageContext.request.contextPath}/item/vendorList?vendorType="
			+ encodeURIComponent(vendorType))
			.then(function(response) {
				return response.json();
			})
			.then(function(result) {

				let html =
					'<option value="">거래처명(거래처코드) 선택</option>';

				for (let i = 0; i < result.length; i++) {

					let selected = "";

					if (selectedVendorId === result[i].vendorId) {
						selected = "selected";
					}

					html += '<option value="' + result[i].vendorId + '" ' + selected + '>';
					html += result[i].vendorName + ' (' + result[i].vendorId + ')';
					html += '</option>';
				}

				vendorSelect.innerHTML = html;
			})
			.catch(function() {
				alert("거래처 목록 조회 실패");
			});
	}

	if (currentVendorType !== "") {
		vendorTypeSelect.value = currentVendorType;
		loadVendorList(currentVendorType, currentVendorId);
	}

	vendorTypeSelect.addEventListener("change", function() {
		loadVendorList(this.value, "");
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