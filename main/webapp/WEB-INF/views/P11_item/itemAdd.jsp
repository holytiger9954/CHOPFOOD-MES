<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="content">

	<div class="header-row">

		<div>
			<h2 class="page-title">품목 등록</h2>

			<p class="page-subtitle">
				새로운 품목을 등록하세요.
			</p>
		</div>

		<div>
			<p class="page-route">
				홈 &gt; 품목관리 &gt; 등록
			</p>
		</div>

	</div>

	<form action="${pageContext.request.contextPath}/item/insert"
		method="post"
		style="
			width:100%;
			max-width:1050px;
		">

		<!-- 버튼 -->
		<div style="
			display:flex;
			justify-content:flex-end;
			gap:12px;
		">

			<a class="btn btn-white"
				href="${pageContext.request.contextPath}/item/list">
				취소
			</a>

			<button type="submit"
				class="btn btn-main">
				등록
			</button>

		</div>

		<!-- 1줄 -->
		<div style="
			display:flex;
			gap:40px;
			margin-bottom:26px;
		">

			<!-- 품목명 -->
			<div style="
				display:flex;
				flex-direction:column;
				flex:1;
			" class="search-item">

				<label>
					품목명 <span class="red">*</span>
				</label>

				<input type="text"
					name="itemName"
					placeholder="품목명 입력">
			</div>

			<!-- 품목유형 -->
			<div style="
				display:flex;
				flex-direction:column;
				flex:1;
			" class="search-item">

				<label>
					품목유형 <span class="red">*</span>
				</label>

				<select name="itemType">

					<option value="">
						품목 유형 선택
					</option>

					<option value="10">
						원자재
					</option>

					<option value="20">
						반제품
					</option>

					<option value="30">
						완제품
					</option>

				</select>

			</div>

		</div>

		<!-- 2줄 -->
		<div style="
			display:flex;
			gap:40px;
			margin-bottom:26px;
		">

			<!-- 안전재고 -->
			<div style="
				display:flex;
				flex-direction:column;
				flex:1;
			" class="search-item">

				<label>
					안전재고 <span class="red">*</span>
				</label>

				<input type="text"
					name="safetyStock"
					placeholder="안전재고 입력">
			</div>

			<!-- 사용가능기간 -->
			<div style="
				display:flex;
				flex-direction:column;
				flex:1;
			" class="search-item">

				<label>
					사용가능기간 <span class="red">*</span>
				</label>

				<input type="number"
					name="useDate"
					placeholder="사용가능 기간 입력">
			</div>

		</div>

		<!-- 3줄 -->
		<div style="
			display:flex;
			gap:36px;
			margin-bottom:26px;
		">

			<!-- 단위 -->
			<div style="
				display:flex;
				flex-direction:column;
				flex:1;
			" class="search-item">

				<label>
					단위 <span class="red">*</span>
				</label>

				<input type="text"
					name="unit"
					placeholder="단위 입력">
			</div>

			<!-- 규격 -->
			<div style="
				display:flex;
				flex-direction:column;
				flex:1;
			" class="search-item">

				<label>
					규격 <span class="red">*</span>
				</label>

				<input type="text"
					name="spec"
					placeholder="규격 입력">
			</div>

			<!-- 단가 -->
			<div style="
				display:flex;
				flex-direction:column;
				flex:1;
			" class="search-item">

				<label>
					단가(원) <span class="red">*</span>
				</label>

				<input type="text"
					name="unitPrice"
					placeholder="단가 입력">
			</div>

		</div>

		<!-- 거래처 -->
		<div style="
			display:flex;
			flex-direction:column;
			margin-bottom:26px;
		" class="search-item">

			<label>
				거래처
			</label>

			<select name="itemVendor">

				<option value="">
					거래처명(거래처코드) 선택
				</option>

				<c:forEach var="vendor" items="${vendors}">

					<option value="${vendor.vendorId}">
						${vendor.vendorName} (${vendor.vendorId})
					</option>

				</c:forEach>

			</select>

		</div>

		<!-- 보관방법 -->
		<div style="
			display:flex;
			flex-direction:column;
		" class="search-item">

			<label>
				보관방법 <span class="red">*</span>
			</label>

			<textarea name="itemStorage"
				placeholder="보관방법을 입력하세요."
				style="
					height:220px;
				"></textarea>

		</div>

	</form>

</div>
<script>
window.addEventListener("load", function() {

	const vendorSelect = document.querySelector("select[name='itemVendor']");

	const vendorRow = document.createElement("div");

	vendorRow.setAttribute("style",
		"display:flex;" +
		"gap:40px;" +
		"margin-bottom:26px;"
	);

	vendorRow.innerHTML =

		/* 거래처 타입 */
		'<div class="search-item" ' +
			'style="display:flex; flex-direction:column; flex:1;">' +

			'<label>거래처 타입</label>' +

			'<select id="vendorType" name="vendorType">' +

				'<option value="">거래처 타입 선택</option>' +
				'<option value="S">공급처</option>' +
				'<option value="C">납품처</option>' +
				'<option value="E">기타</option>' +

			'</select>' +
		'</div>' +

		/* 거래처 */
		'<div class="search-item" ' +
			'style="display:flex; flex-direction:column; flex:1;">' +

			'<label>거래처</label>' +

			'<select id="itemVendor" name="itemVendor">' +

				'<option value="">거래처명(거래처코드) 선택</option>' +

			'</select>' +

		'</div>';

	const oldVendorArea = vendorSelect.closest(".search-item");

	oldVendorArea.parentNode.replaceChild(vendorRow, oldVendorArea);

	const vendorTypeSelect = document.querySelector("#vendorType");
	const newVendorSelect = document.querySelector("#itemVendor");

	vendorTypeSelect.addEventListener("change", function() {

		const vendorType = this.value;

		newVendorSelect.innerHTML =
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

					html += '<option value="' + result[i].vendorId + '">';
					html += result[i].vendorName + ' (' + result[i].vendorId + ')';
					html += '</option>';

				}

				newVendorSelect.innerHTML = html;

			})

			.catch(function() {
				alert("거래처 목록 조회 실패");
			});

	});
	
	const unitPriceInput =
		document.querySelector("input[name='unitPrice']");

	unitPriceInput.addEventListener("input", function() {

		let value = this.value;

		/* 숫자만 남김 */
		value = value.replace(/[^0-9]/g, "");

		/* 세자리 콤마 */
		value = Number(value).toLocaleString("ko-KR");

		/* 값 적용 */
		if (value === "0") {
			this.value = "";
		} else {
			this.value = value;
		}

	});
	
	const safetyStockInput =
		document.querySelector("input[name='safetyStock']");

	safetyStockInput.addEventListener("input", function() {

		let value = this.value;

		value = value.replace(/[^0-9]/g, "");

		value = Number(value).toLocaleString("ko-KR");

		if (value === "0") {
			this.value = "";
		} else {
			this.value = value;
		}

	});
	
	/* =========================
	음수 입력 방지
========================= */



const useDateInput =
	document.querySelector("input[name='useDate']");

function preventNegative(inputTag) {

	inputTag.addEventListener("input", function() {

		if (this.value < 0) {
			this.value = 0;
		}

	});

	inputTag.addEventListener("keydown", function(e) {

		if (e.key === "-") {
			e.preventDefault();
		}

	});

}

preventNegative(safetyStockInput);

preventNegative(useDateInput);


	/* =========================
		폼 전송 전 콤마 제거
	========================= */

	const form = document.querySelector("form");

	form.addEventListener("submit", function() {

		unitPriceInput.value =
			unitPriceInput.value.replace(/,/g, "");
		
		safetyStockInput.value =
			safetyStockInput.value.replace(/,/g, "");

	});

});
</script>