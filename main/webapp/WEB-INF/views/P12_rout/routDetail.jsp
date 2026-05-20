<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="content">

    <div class="header-row">
        <div>
            <h2 class="page-title">라우팅 상세</h2>
            <p class="page-subtitle">선택한 라우팅의 공정 흐름을 확인합니다.</p>
        </div>

        <div>
            <p class="page-route">홈 &gt; 라우팅 관리 &gt; 상세</p>

            <a class="btn btn-white"
               href="${pageContext.request.contextPath}/routing/list">
                목록
            </a>

            <a class="btn btn-main"
               href="${pageContext.request.contextPath}/routing/edit?routId=${rout.routId}">
                수정
            </a>
        </div>
    </div>

    <div class="search-box">

        <div class="search-item">
            <label>라우팅 코드</label>
            <input type="text"
                   value="${rout.routId}"
                   readonly>
        </div>

        <div class="search-item">
            <label>라우팅명</label>
            <input type="text"
                   value="${rout.routName}"
                   readonly>
        </div>

        <div class="search-item">
            <label>생산 품목</label>
            <input type="text"
                   value="${rout.itemName} (${rout.routItem})"
                   readonly>
        </div>

        <div class="search-item">
            <label>품목 규격</label>
            <input type="text"
                   value="${rout.itemSpec}"
                   readonly>
        </div>

        <div class="search-item keyword">
            <label>라우팅 설명</label>
            <textarea readonly>${rout.routContent}</textarea>
        </div>

    </div>

    <div class="header-row"
         style="margin-top: 28px;">
        <div>
            <h3 class="page-title"
                style="font-size: 20px;">
                공정 흐름
            </h3>
            <p class="page-subtitle">라우팅에 등록된 공정 순서입니다.</p>
        </div>
    </div>

    <div class="routing-flow-wrap">
        <c:forEach var="detail" items="${detailList}" varStatus="status">
            <div class="flow-card">
                <div class="flow-step">
                    STEP ${detail.routDtlStep}
                </div>

                <div class="flow-title">
                    ${detail.procName}
                </div>

                <div class="flow-meta">
                    <span>작업장 타입</span>
                    <strong>${detail.wpTypeName}</strong>
                </div>

                <div class="flow-meta">
                    <span>사용 가능 설비</span>
                    <strong>
                        <c:choose>
                            <c:when test="${empty detail.eqNames}">
                                등록된 설비 없음
                            </c:when>
                            <c:otherwise>
                                ${detail.eqNames}
                            </c:otherwise>
                        </c:choose>
                    </strong>
                </div>

                <div class="flow-desc">
                    ${detail.procContent}
                </div>
            </div>

            <c:if test="${!status.last}">
                <div class="flow-arrow">→</div>
            </c:if>
        </c:forEach>

        <c:if test="${empty detailList}">
            <div class="empty-flow">
                등록된 공정 흐름이 없습니다.
            </div>
        </c:if>
    </div>

    <div class="table-wrap"
         style="margin-top: 24px;">
        <table class="table">
            <thead>
                <tr>
                    <th style="width: 90px;">순서</th>
                    <th style="width: 160px;">공정 코드</th>
                    <th style="width: 180px;">공정명</th>
                    <th style="width: 180px;">작업장 타입</th>
                    <th>사용 가능 설비</th>
                    <th>공정 설명</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var="detail" items="${detailList}">
                    <tr>
                        <td>${detail.routDtlStep}</td>
                        <td>${detail.procId}</td>
                        <td>${detail.procName}</td>
                        <td>${detail.wpTypeName}</td>
                        <td>
                            <c:choose>
                                <c:when test="${empty detail.eqNames}">
                                    -
                                </c:when>
                                <c:otherwise>
                                    ${detail.eqNames}
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>${detail.procContent}</td>
                    </tr>
                </c:forEach>

                <c:if test="${empty detailList}">
                    <tr>
                        <td colspan="6"
                            style="text-align: center;">
                            등록된 공정 정보가 없습니다.
                        </td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>

</div>

<style>
    .routing-flow-wrap {
        display: flex;
        align-items: stretch;
        gap: 12px;

        padding: 20px;
        margin-top: 12px;

        background-color: #fff;
        border: 1px solid var(--gray);
        border-radius: 8px;

        overflow-x: auto;
    }

    .flow-card {
        min-width: 220px;
        padding: 16px;

        border: 1px solid var(--gray);
        border-radius: 8px;
        background-color: #fff;

        flex-shrink: 0;
    }

    .flow-step {
        margin-bottom: 8px;

        color: var(--main-green);
        font-size: 13px;
        font-weight: 700;
    }

    .flow-title {
        margin-bottom: 12px;

        color: #222;
        font-size: 18px;
        font-weight: 700;
    }

    .flow-meta {
        display: flex;
        flex-direction: column;
        gap: 4px;

        margin-bottom: 10px;

        font-size: 13px;
    }

    .flow-meta span {
        color: #777;
    }

    .flow-meta strong {
        color: #333;
        font-weight: 600;
        line-height: 1.4;
    }

    .flow-desc {
        margin-top: 12px;
        padding-top: 12px;

        border-top: 1px solid var(--gray);

        color: #555;
        font-size: 13px;
        line-height: 1.5;
        white-space: pre-line;
    }

    .flow-arrow {
        display: flex;
        align-items: center;

        color: var(--main-green);
        font-size: 26px;
        font-weight: 700;

        flex-shrink: 0;
    }

    .empty-flow {
        width: 100%;
        padding: 30px;

        color: #777;
        text-align: center;
    }

    textarea[readonly] {
        min-height: 90px;
        resize: none;
    }
</style>