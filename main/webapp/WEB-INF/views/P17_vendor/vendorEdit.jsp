<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="content">

    <div class="header-row">
        <div>
            <h2 class="page-title">거래처 수정</h2>
            <p class="page-subtitle">
                거래처 정보를 수정할 수 있습니다.
            </p>
        </div>

        <div>
            <p class="page-route">
                홈 &gt; 거래처 관리 &gt; 수정
            </p>
        </div>
    </div>

    <form action="${pageContext.request.contextPath}/vendor/update"
          method="post"
          class="grid-form">

        <input type="hidden"
               name="vendorId"
               value="${vendor.vendorId}">

        <div class="btn-row">
            <div class="left"></div>

            <div class="right">
                <a class="btn btn-white"
                   href="${pageContext.request.contextPath}/vendor/detail?vendorId=${vendor.vendorId}">
                    취소
                </a>

                <button type="submit"
                        class="btn btn-main">
                    수정완료
                </button>
            </div>
        </div>

        <div class="grid-wrap">
            <div class="grid search-item">
                <label>거래처 코드</label>

                <input type="text"
                       value="${vendor.vendorId}"
                       readonly>
            </div>

            <div class="grid search-item">
                <label>거래처 이름 <span class="red">*</span></label>

                <input type="text"
                       name="vendorName"
                       value="${vendor.vendorName}"
                       required>
            </div>
        </div>

        <div class="grid-wrap">
            <div class="grid search-item">
                <label>유형 <span class="red">*</span></label>

                <select name="vendorType" required>
                    <option value="S"
                        ${vendor.vendorType == 'S' ? 'selected' : ''}>
                        공급업체
                    </option>

                    <option value="C"
                        ${vendor.vendorType == 'C' ? 'selected' : ''}>
                        납품처
                    </option>

                    <option value="E"
                        ${vendor.vendorType == 'E' ? 'selected' : ''}>
                        기타
                    </option>
                </select>
            </div>

            <div class="grid search-item">
                <label>연락처 <span class="red">*</span></label>

                <input type="text"
                       name="vendorTel"
                       value="${vendor.vendorTel}"
                       required>
            </div>
        </div>

        <div class="grid-wrap">
            <div class="grid search-item">
                <label>이메일</label>

                <input type="text"
                       name="vendorEmail"
                       value="${vendor.vendorEmail}">
            </div>
        </div>

        <div class="vendor-address-wrap">

            <div class="grid search-item">
                <label>주소 <span class="red">*</span></label>

                <div class="vendor-address-row">
                    <input type="text"
                           name="vendorAddr"
                           value="${vendor.vendorAddr}"
                           placeholder="주소 조회"
                           required
                           readonly>

                    <button type="button"
                            class="btn btn-main"
                            onclick="execPostcode()">
                        조회
                    </button>
                </div>
            </div>

            <div class="search-item keyword">
                <input type="text"
                       name="vendorAddrDetail"
                       value="${vendor.vendorAddrDetail}"
                       placeholder="상세주소 입력 (선택)"
                       class="vendor-detail-addr">
            </div>

            <div class="search-item">
                <input type="text"
                       name="vendorZipcode"
                       value="${vendor.vendorZipcode}"
                       placeholder="우편 번호"
                       readonly
                       class="vendor-zipcode">
            </div>

        </div>

    </form>

</div>

<style>
    .vendor-address-wrap {
        display: flex;
        flex-direction: column;
        gap: 10px;
    }

    .vendor-address-row {
        display: flex;
        gap: 8px;
    }

    .vendor-detail-addr {
        width: 500px;
    }

    .vendor-zipcode {
        width: 300px;
    }
</style>

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