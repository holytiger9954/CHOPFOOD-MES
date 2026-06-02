<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="content">

	<div class="header-row">
		<div>
			<h2 class="page-title">설비 점검이력 등록</h2>
			<p class="page-subtitle"> ${eqp.eqName}(${eqp.eqId})의 새로운 점검이력을 등록하세요</p>
		</div>

		<div>
			<p class="page-route">홈 &gt; 설비관리 &gt; 점검이력 &gt; 등록</p>
		</div>
	</div>

	<form action="${pageContext.request.contextPath}/equip/mt/insert"
		method="post">

		<input type="hidden" name="elogEqid" value="${eqp.eqId}">

		<div class="btn-row">
			<div></div>

			<div>
				<a class="btn btn-white"
					href="${pageContext.request.contextPath}/equip/detail?eqId=${eqp.eqId}"
					onclick="return confirm('확인을 누르시면 입력한 내용이 모두 사라집니다.\n정말로 취소하시겠습니까?');">
                    취소
				</a>

				<button type="submit" class="btn btn-main">등록</button>
			</div>
		</div>

		<div class="content-content">

			<div class="content-content-content">

				<div class="content-content-content-title">
					점검 설비 : ${eqp.eqName} (${eqp.eqId})
				</div>

				<div class="grid-form">

					<div class="grid-wrap">
						<div class="search-item">
							<label>점검 시작일 <span class="red">*</span></label>
							<input type="datetime-local" name="elogSdate" required>
						</div>

						<div class="search-item">
							<label>점검 종료일</label>
							<input type="datetime-local" name="elogEdate" required>
						</div>
					</div>

					<div class="grid-wrap">
						<div class="search-item">
							<label>점검 사유 <span class="red">*</span></label>
					    <select name="elogReason" required>
						 	<option value="">선택</option>
						    <option value="정기점검">정기점검</option>
						    <option value="소모품 교체">소모품 교체</option>
						    <option value="긴급점검">긴급점검</option>
					    </select>
						</div>

						<div class="search-item">
							<label>점검 결과 <span class="red">*</span></label>
							<input type="text" name="elogResult" required
								placeholder="점검 결과 입력">
						</div>
					</div>

					<div class="grid-wrap">
					<div class="search-item">
					    <label>점검자</label>
					
					    <input type="text"
					           value="${sessionScope.loginUser.empName}(${sessionScope.loginUser.empId})"
					           readonly>
					
					    <input type="hidden"
					           name="elogWorker"
					           value="${sessionScope.loginUser.empId}">
					</div>
					</div>

					<div class="search-item">
						<label>상세 내용 <span class="red">*</span></label>
						<textarea name="elogContent"
							      style="height:180px;"
								  placeholder="설비 점검 상세 내용을 입력하세요." required></textarea>
					</div>

				</div>

			</div>

		</div>

	</form>

</div>

<style>
.search-item select {
    min-width: 262px;
}
</style>

<script>

document.querySelector("form")
.addEventListener("submit", function(e) {

const sdate =
    document.querySelector("[name='elogSdate']").value;

const edate =
    document.querySelector("[name='elogEdate']").value;

const now = new Date();

const yyyy = now.getFullYear();
const mm = String(now.getMonth() + 1).padStart(2, "0");
const dd = String(now.getDate()).padStart(2, "0");
const hh = String(now.getHours()).padStart(2, "0");
const mi = String(now.getMinutes()).padStart(2, "0");

const maxDate =
    yyyy + "-" + mm + "-" + dd + "T" + hh + ":" + mi;

// 시작일 미래 방지
if (sdate > maxDate) {

    alert("점검 시작일은 현재 시간보다 미래일 수 없습니다.");

    e.preventDefault();
    return;
}

// 종료일 미래 방지
if (edate != "" && edate > maxDate) {

    alert("점검 종료일은 현재 시간보다 미래일 수 없습니다.");

    e.preventDefault();
    return;
}

// 종료일 < 시작일 방지
if (edate != "" && edate < sdate) {

    alert("점검 종료일은 점검 시작일보다 빠를 수 없습니다.");

    e.preventDefault();
    return;
}
});
</script>