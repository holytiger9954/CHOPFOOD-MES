<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
    const materialOptions = `
        <option value="">투입 품목 선택</option>

        <c:forEach var="item" items="${materialItemList}">
            <option value="${item.itemId}"
                    data-spec="${item.itemSpec}"
                    data-price="${item.itemPrice}"
                    data-unit="${item.itemUnit}">
                ${item.itemName} (${item.itemId})
            </option>
        </c:forEach>
    `;
</script>

<div class="content">

    <div class="header-row">
        <div>
            <h2 class="page-title">BOM 등록</h2>
            <p class="page-subtitle">새로운 BOM을 등록하세요.</p>
        </div>

        <div>
            <p class="page-route">홈 &gt; BOM 관리 &gt; 등록</p>
        </div>
    </div>

    <form action="${pageContext.request.contextPath}/bom/insert"
          method="post"
          class="grid-form"
          id="bomAddForm">

        <div class="btn-row">
            <div class="left"></div>

            <div class="right">
                <a class="btn btn-white"
                   href="${pageContext.request.contextPath}/bom/list">
                    취소
                </a>

                <button type="submit" class="btn btn-main">
                    등록
                </button>
            </div>
        </div>

        <div class="grid-wrap bom-grid-wrap">

            <div class="grid search-item">
                <label>생산 품목 <span class="red">*</span></label>

                <select name="bomItem" required>
                    <option value="" selected disabled>
                        품목명 (품목코드) 선택
                    </option>

                    <c:forEach var="item" items="${finishItemList}">
                        <option value="${item.itemId}">
                            ${item.itemName} (${item.itemId})
                        </option>
                    </c:forEach>
                </select>
            </div>

            <div class="grid search-item">
                <label>BOM명 <span class="red">*</span></label>

                <input type="text"
                       name="bomName"
                       required
                       placeholder="BOM명 입력">
            </div>

            <div class="grid search-item bom-content-item">
                <label>BOM 설명</label>

                <textarea name="bomContent"
                          class="bom-content-textarea"
                          placeholder="BOM 설명을 입력하세요."></textarea>
            </div>

        </div>

        <div class="bom-section-title-row">
            <div class="content-content-content-title">
                투입 품목
            </div>

            <button type="button"
                    class="btn btn-main"
                    id="addItemBtn">
                품목 추가
            </button>
        </div>

        <div class="table-wrap">
            <table class="table">
                <thead>
                    <tr>
                        <th>투입 품목</th>
                        <th>투입 수량</th>
                        <th>규격</th>
                        <th>단가 (원)</th>
                        <th>삭제</th>
                    </tr>
                </thead>

                <tbody id="bomDetailBody">
                    <tr>
                        <td>
                            <select name="bomDtlItemList"
                                    class="bom-detail-select"
                                    required>
                                <option value="">투입 품목 선택</option>

                                <c:forEach var="item" items="${materialItemList}">
                                    <option value="${item.itemId}"
                                            data-spec="${item.itemSpec}"
                                            data-price="${item.itemPrice}"
                                            data-unit="${item.itemUnit}">
                                        ${item.itemName} (${item.itemId})
                                    </option>
                                </c:forEach>
                            </select>
                        </td>

                        <td>
                            <input type="number"
                                   name="bomDtlQtyList"
                                   min="1"
                                   required
                                   placeholder="수량">
                        </td>

                        <td class="item-spec">-</td>
                        <td class="item-price">-</td>

                        <td>
                            <button type="button"
                                    class="remove-row-btn">
                                ✕
                            </button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

    </form>

</div>

<style>
    .bom-grid-wrap {
        display: grid;
        grid-template-columns: 200px 400px;
        justify-content: flex-start;

        column-gap: 24px;
        row-gap: 18px;
    }

    .bom-content-item {
        grid-column: 1 / 3;
        width: 100%;
    }

    .bom-content-textarea {
        min-height: 100px;
    }

    .bom-section-title-row {
        display: flex;
        justify-content: space-between;
        align-items: center;

        margin: 32px 0 16px;
    }

    #bomDetailBody select,
    #bomDetailBody input {
        width: 90%;
        height: 34px;

        padding: 0 10px;

        border: 1px solid var(--dark-gray);
        border-radius: 6px;

        font-size: 14px;
        background-color: #fff;
    }

    #bomDetailBody select:focus,
    #bomDetailBody input:focus {
        outline: none;
        border-color: var(--main-green);
    }

    .remove-row-btn {
	    width: 32px;
	    height: 32px;
	
	    border: none;
	    border-radius: 50%;
	
	    background-color: #f1f3f5;
	    color: #666;
	
	    font-size: 18px;
	    font-weight: 700;
	
	    cursor: pointer;
	
	    transition: 0.2s;
	}
	
	.remove-row-btn:hover {
	    background-color: #dee2e6;
	    color: #333;
	
	    transform: scale(1.05);
	}
</style>

<script>
    window.addEventListener("load", function () {
        bindBomAddEvents();
    });

    function bindBomAddEvents() {
        const addItemBtn = document.querySelector("#addItemBtn");
        const bomDetailBody = document.querySelector("#bomDetailBody");

        addItemBtn.addEventListener("click", function () {
            addBomDetailRow();
        });

        bomDetailBody.addEventListener("change", function (e) {
            if (e.target.classList.contains("bom-detail-select")) {
                updateItemInfo(e.target);
            }
        });

        bomDetailBody.addEventListener("click", function (e) {
            if (e.target.classList.contains("remove-row-btn")) {
                removeBomDetailRow(e.target);
            }
        });
    }

    function addBomDetailRow() {
        const bomDetailBody = document.querySelector("#bomDetailBody");

        const tr = document.createElement("tr");

        tr.innerHTML =
            '<td>' +
                '<select name="bomDtlItemList" class="bom-detail-select" required>' +
                    materialOptions +
                '</select>' +
            '</td>' +

            '<td>' +
                '<input type="number" name="bomDtlQtyList" min="1" required placeholder="수량">' +
            '</td>' +

            '<td class="item-spec">-</td>' +

            '<td class="item-price">-</td>' +

            '<td>' +
                '<button type="button" class="remove-row-btn">✕</button>' +
            '</td>';

        bomDetailBody.appendChild(tr);
    }

    function updateItemInfo(selectEl) {
        const selectedOption =
            selectEl.options[selectEl.selectedIndex];

        const spec =
            selectedOption.dataset.spec || "-";

        const unit =
            selectedOption.dataset.unit || "";

        const price =
            selectedOption.dataset.price || "-";

        const row =
            selectEl.closest("tr");

        row.querySelector(".item-spec").textContent =
            unit ? spec + " / " + unit : spec;

        row.querySelector(".item-price").textContent =
            price === "-"
                ? "-"
                : Number(price).toLocaleString();
    }

    function removeBomDetailRow(buttonEl) {
        const bomDetailBody =
            document.querySelector("#bomDetailBody");

        const rows =
            bomDetailBody.querySelectorAll("tr");

        if (rows.length <= 1) {
            alert("투입 품목은 최소 1개 이상 필요합니다.");
            return;
        }

        buttonEl.closest("tr").remove();
    }
</script>