<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="content">

    <div class="header-row">
        <div>
            <h2 class="page-title">라우팅 수정</h2>
            <p class="page-subtitle">라우팅 기본 정보와 공정 흐름을 수정합니다.</p>
        </div>

        <div>
            <p class="page-route">홈 &gt; 라우팅 관리 &gt; 수정</p>
        </div>
    </div>

    <form id="routForm"
          action="${pageContext.request.contextPath}/routing/update"
          method="post">

        <input type="hidden"
               name="routId"
               value="${rout.routId}">

        <div class="search-box">

            <div class="search-btn-area"
                 style="width: 100%; justify-content: flex-end;">
                <a class="btn btn-white"
                   href="${pageContext.request.contextPath}/routing/detail?routId=${rout.routId}">
                    취소
                </a>

                <button type="submit"
                        class="btn btn-main">
                    저장
                </button>
            </div>

            <div class="search-item">
                <label>라우팅 코드</label>
                <input type="text"
                       value="${rout.routId}"
                       readonly>
            </div>

            <div class="search-item">
                <label>라우팅명</label>
                <input type="text"
                       name="routName"
                       value="${rout.routName}"
                       required>
            </div>

            <div class="search-item">
                <label>생산 품목</label>
                <select name="routItem"
                        required>
                    <option value="">품목 선택</option>

                    <c:forEach var="item" items="${routItemList}">
                        <option value="${item.itemId}"
                                <c:if test="${item.itemId == rout.routItem}">selected</c:if>>
                            <c:choose>
                                <c:when test="${item.itemType == 20}">
                                    [반제품]
                                </c:when>
                                <c:when test="${item.itemType == 30}">
                                    [완제품]
                                </c:when>
                                <c:otherwise>
                                    [기타]
                                </c:otherwise>
                            </c:choose>
                            ${item.itemName} (${item.itemId})
                        </option>
                    </c:forEach>
                </select>
            </div>

            <div class="search-item keyword">
                <label>라우팅 설명</label>
                <textarea name="routContent"
                          placeholder="라우팅 설명을 입력하세요.">${rout.routContent}</textarea>
            </div>

        </div>

        <div class="header-row"
             style="margin-top: 28px;">
            <div>
                <h3 class="page-title"
                    style="font-size: 20px;">
                    공정 흐름 수정
                </h3>
                <p class="page-subtitle">공정을 추가/삭제하거나 드래그해서 순서를 변경하세요.</p>
            </div>
        </div>

        <div class="search-box">

            <div class="search-item">
                <label>공정 선택</label>

                <select id="procSelect">
                    <option value="">공정 선택</option>

                    <c:forEach var="proc" items="${processList}">
                        <option value="${proc.procId}"
                                data-proc-name="${proc.procName}"
                                data-wp-type-name="${proc.wpTypeName}"
                                data-eq-names="${proc.eqNames}">
                            [${proc.wpTypeName}] ${proc.procName} (${proc.procId})
                        </option>
                    </c:forEach>
                </select>
            </div>

            <div class="search-item">
                <label>작업장 타입</label>
                <input type="text"
                       id="wpTypeView"
                       readonly
                       placeholder="공정을 선택하세요.">
            </div>

            <div class="search-item keyword">
                <label>사용 가능 설비</label>
                <input type="text"
                       id="eqView"
                       readonly
                       placeholder="공정을 선택하세요.">
            </div>

            <div class="search-btn-area"
                 style="align-self: flex-end;">
                <button type="button"
                        class="btn btn-main"
                        id="addProcBtn">
                    공정 추가
                </button>
            </div>

        </div>

        <div class="table-wrap"
             style="margin-top: 20px;">
            <table class="table">
                <thead>
                    <tr>
                        <th style="width: 80px;">순서</th>
                        <th style="width: 160px;">공정 코드</th>
                        <th style="width: 180px;">공정명</th>
                        <th style="width: 180px;">작업장 타입</th>
                        <th>사용 가능 설비</th>
                        <th style="width: 90px;">삭제</th>
                    </tr>
                </thead>

                <tbody id="selectedProcBody">
                    <c:forEach var="detail" items="${detailList}">
                        <tr class="proc-row"
                            draggable="true">
                            <td class="step-cell">${detail.routDtlStep}</td>
                            <td>
                                <span class="drag-handle">≡</span>
                                ${detail.procId}
                                <input type="hidden"
                                       name="routDtlProcList"
                                       value="${detail.procId}">
                            </td>
                            <td>${detail.procName}</td>
                            <td>${detail.wpTypeName}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${empty detail.eqNames}">
                                        등록된 설비 없음
                                    </c:when>
                                    <c:otherwise>
                                        ${detail.eqNames}
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <button type="button"
                                        class="btn btn-white remove-btn">
                                    삭제
                                </button>
                            </td>
                        </tr>
                    </c:forEach>

                    <c:if test="${empty detailList}">
                        <tr id="emptyProcRow">
                            <td colspan="6"
                                style="text-align: center;">
                                추가된 공정이 없습니다.
                            </td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>

    </form>

</div>

<style>
    textarea {
        min-height: 90px;
        resize: none;
    }

    .proc-row {
        cursor: grab;
    }

    .proc-row.dragging {
        opacity: 0.5;
    }

    .drag-handle {
        color: #888;
        font-weight: 700;
        cursor: grab;
    }
</style>

<script>
    window.addEventListener("load", function() {
        const procSelect = document.getElementById("procSelect");
        const wpTypeView = document.getElementById("wpTypeView");
        const eqView = document.getElementById("eqView");
        const addProcBtn = document.getElementById("addProcBtn");
        const selectedProcBody = document.getElementById("selectedProcBody");
        const routForm = document.getElementById("routForm");

        procSelect.addEventListener("change", function() {
            const option = procSelect.options[procSelect.selectedIndex];

            if (!procSelect.value) {
                wpTypeView.value = "";
                eqView.value = "";
                return;
            }

            wpTypeView.value = option.dataset.wpTypeName || "";
            eqView.value = option.dataset.eqNames || "등록된 설비 없음";
        });

        addProcBtn.addEventListener("click", function() {
            const option = procSelect.options[procSelect.selectedIndex];

            if (!procSelect.value) {
                alert("공정을 선택하세요.");
                return;
            }

            addProcessRow({
                procId: option.value,
                procName: option.dataset.procName,
                wpTypeName: option.dataset.wpTypeName,
                eqNames: option.dataset.eqNames || "등록된 설비 없음"
            });

            procSelect.value = "";
            wpTypeView.value = "";
            eqView.value = "";
        });

        routForm.addEventListener("submit", function(e) {
            const rows = selectedProcBody.querySelectorAll(".proc-row");

            if (rows.length === 0) {
                e.preventDefault();
                alert("공정을 1개 이상 추가하세요.");
                return;
            }

            refreshStep();
        });

        function addProcessRow(proc) {
            const emptyRow = document.getElementById("emptyProcRow");

            if (emptyRow) {
                emptyRow.remove();
            }

            const tr = document.createElement("tr");
            tr.className = "proc-row";
            tr.draggable = true;

            tr.innerHTML =
                '<td class="step-cell"></td>' +
                '<td>' +
                    '<span class="drag-handle">≡</span> ' +
                    proc.procId +
                    '<input type="hidden" name="routDtlProcList" value="' + proc.procId + '">' +
                '</td>' +
                '<td>' + proc.procName + '</td>' +
                '<td>' + proc.wpTypeName + '</td>' +
                '<td>' + proc.eqNames + '</td>' +
                '<td>' +
                    '<button type="button" class="btn btn-white remove-btn">삭제</button>' +
                '</td>';

            selectedProcBody.appendChild(tr);

            bindRowEvent(tr);
            refreshStep();
        }

        function bindRowEvent(row) {
            const removeBtn = row.querySelector(".remove-btn");

            if (removeBtn) {
                removeBtn.addEventListener("click", function() {
                    row.remove();
                    refreshStep();
                    showEmptyRowIfNeeded();
                });
            }

            row.addEventListener("dragstart", function() {
                row.classList.add("dragging");
            });

            row.addEventListener("dragend", function() {
                row.classList.remove("dragging");
                refreshStep();
            });
        }

        function refreshStep() {
            const rows = selectedProcBody.querySelectorAll(".proc-row");

            rows.forEach(function(row, index) {
                row.querySelector(".step-cell").textContent = index + 1;
            });
        }

        function showEmptyRowIfNeeded() {
            const rows = selectedProcBody.querySelectorAll(".proc-row");

            if (rows.length === 0) {
                selectedProcBody.innerHTML =
                    '<tr id="emptyProcRow">' +
                        '<td colspan="6" style="text-align: center;">' +
                            '추가된 공정이 없습니다.' +
                        '</td>' +
                    '</tr>';
            }
        }

        selectedProcBody.addEventListener("dragover", function(e) {
            e.preventDefault();

            const dragging = selectedProcBody.querySelector(".dragging");

            if (!dragging) {
                return;
            }

            const afterElement = getDragAfterElement(selectedProcBody, e.clientY);

            if (afterElement == null) {
                selectedProcBody.appendChild(dragging);
            } else {
                selectedProcBody.insertBefore(dragging, afterElement);
            }
        });

        function getDragAfterElement(container, y) {
            const draggableElements = [
                ...container.querySelectorAll(".proc-row:not(.dragging)")
            ];

            return draggableElements.reduce(function(closest, child) {
                const box = child.getBoundingClientRect();
                const offset = y - box.top - box.height / 2;

                if (offset < 0 && offset > closest.offset) {
                    return {
                        offset: offset,
                        element: child
                    };
                } else {
                    return closest;
                }
            }, {
                offset: Number.NEGATIVE_INFINITY
            }).element;
        }

        const currentRows = selectedProcBody.querySelectorAll(".proc-row");

        currentRows.forEach(function(row) {
            bindRowEvent(row);
        });

        refreshStep();
    });
</script>