<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="content">

    <div class="header-row">
        <div>
            <h2 class="page-title">거래처 등록</h2>
            <p class="page-subtitle">새로운 거래처를 등록하세요.</p>
        </div>

        <div>
            <p class="page-route">홈 > 거래처 > 등록</p>
        </div>
    </div>
    
    <form action="${pageContext.request.contextPath}/vendor/insert"
          method="post"
          class="grid-form">
		
		<div class="btn-row">
			<div class="left"></div>
			<div class="right">
				<a class="btn btn-white"
	               href="${pageContext.request.contextPath}/vendor/list">
	                취소
	            </a>
	
	            <button type="submit" class="btn btn-main">
	                등록
	            </button>
			</div>
		</div>
		
		<div class="grid-wrap">
			<div class="grid search-item">
				<label>거래처 이름 <span class="red">*</span></label>
				<input type="text" name="vendorName" placeholder="거래처 이름 입력" required>
			</div>
			<div class="grid search-item">
				<label>유형 <span class="red">*</span></label>
				<select name="vendorType" required>
	                <option value="" selected disabled>거래처 유형 선택</option>
	                <option value="S">공급업체</option>
	                <option value="C">납품처</option>
	                <option value="E">기타</option>
	            </select>
			</div>
		</div>
		
		<div class="grid-wrap">
			<div class="grid search-item">
				<label>연락처 <span class="red">*</span></label>
				<input type="text" name="vendorTel" placeholder="연락처 입력 (ex. 010-1234-5678)" required>
			</div>
			<div class="grid search-item">
				<label>이메일</label>
				<input type="text" name="vendorEmail" placeholder="이메일 입력 (선택)" required>
			</div>
		</div>
		
		<div style="display: flex; flex-direction: column; gap: 10px;">
			<div class="grid search-item">
				<label>주소 <span class="red">*</span></label>
				<div style="display: flex; gap: 8px;">
					<input type="text" name="vendorAddr" placeholder="주소 조회" required readonly>
					<button type="button" class="btn btn-main" onclick="execPostcode()">
	                    조회
	                </button>
				</div>
			</div>
			
	        <div class="search-item keyword" style="flex-basis: 100%;">
	            <input type="text"
	                   name="vendorAddrDetail"
	                   placeholder="상세주소 입력 (선택)"
	                   style="width: 500px;">
	        </div>
	
	        <div class="search-item">
	            <input type="text"
	                   name="vendorZipcode"
	                   placeholder="우편 번호"
	                   readonly
	                   style="width: 300px;">
	        </div>
		</div>

    </form>
    
    <!-- 원래 있던 거 -->
<%--     <form action="${pageContext.request.contextPath}/vendor/insert" --%>
<!--           method="post" -->
<!--           class="search-box"> -->

<!--         <div class="search-btn-area" style="width: 100%; justify-content: flex-end;"> -->
<!--             <a class="btn btn-white" -->
<%--                href="${pageContext.request.contextPath}/vendor/list"> --%>
<!--                 취소 -->
<!--             </a> -->

<!--             <button type="submit" class="btn btn-main"> -->
<!--                 등록 -->
<!--             </button> -->
<!--         </div> -->

<!--         <div class="search-item keyword"> -->
<!--             <label>거래처 이름 *</label> -->
<!--             <input type="text" -->
<!--                    name="vendorName" -->
<!--                    placeholder="거래처 이름 입력" -->
<!--                    required> -->
<!--         </div> -->

<!--         <div class="search-item keyword"> -->
<!--             <label>유형 *</label> -->
<!--             <select name="vendorType" required> -->
<!--                 <option value="">거래처 유형 선택</option> -->
<!--                 <option value="S">공급업체</option> -->
<!--                 <option value="C">납품처</option> -->
<!--                 <option value="E">기타</option> -->
<!--             </select> -->
<!--         </div> -->

<!--         <div class="search-item keyword"> -->
<!--             <label>연락처 *</label> -->
<!--             <input type="text" -->
<!--                    name="vendorTel" -->
<!--                    placeholder="연락처 입력" -->
<!--                    required> -->
<!--         </div> -->

<!--         <div class="search-item keyword"> -->
<!--             <label>이메일 *</label> -->
<!--             <input type="email" -->
<!--                    name="vendorEmail" -->
<!--                    placeholder="이메일 입력" -->
<!--                    required> -->
<!--         </div> -->

<!--         <div class="search-item keyword" style="flex-basis: 100%;"> -->
<!--             <label>주소 *</label> -->

<!--             <div style="display: flex; gap: 8px;"> -->
<!--                 <input type="text" -->
<!--                        name="vendorAddr" -->
<!--                        placeholder="주소 조회" -->
<!--                        readonly -->
<!--                        required> -->

<!--                 <button type="button" -->
<!--                         class="btn btn-main" -->
<!--                         onclick="execPostcode()"> -->
<!--                     조회 -->
<!--                 </button> -->
<!--             </div> -->
<!--         </div> -->

<!--         <div class="search-item keyword" style="flex-basis: 100%;"> -->
<!--             <label>상세주소</label> -->
<!--             <input type="text" -->
<!--                    name="vendorAddrDetail" -->
<!--                    placeholder="상세주소 입력 (선택)"> -->
<!--         </div> -->

<!--         <div class="search-item"> -->
<!--             <label>우편번호</label> -->
<!--             <input type="text" -->
<!--                    name="vendorZipcode" -->
<!--                    placeholder="우편 번호" -->
<!--                    readonly> -->
<!--         </div> -->

<!--     </form> -->

</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
function execPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            document.querySelector('input[name="vendorZipcode"]').value = data.zonecode;
            document.querySelector('input[name="vendorAddr"]').value =
                data.roadAddress || data.jibunAddress;

            document.querySelector('input[name="vendorAddrDetail"]').focus();
        }
    }).open();
}
</script>