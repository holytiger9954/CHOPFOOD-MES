<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="content">

    <div class="header-row">
        <div>
            <h2 class="page-title">AI 품질 분석</h2>
            <p class="page-subtitle">
                냉동만두 생산 데이터를 기반으로 품질 위험도를 분석합니다.
            </p>
        </div>

        <div>
            <p class="page-route">
                홈 &gt; AI 분석 &gt; AI 품질 분석
            </p>
        </div>
    </div>

    <div class="table-wrap">
        <table class="table">
            <thead>
                <tr>
                    <th>AI 데이터</th>
                    <th>품목</th>
                    <th>공정</th>
                    <th>설비</th>
                    <th>생산량</th>
                    <th>불량수량</th>
                    <th>불량률</th>
                    <th>온도</th>
                    <th>습도</th>
                    <th>근무</th>
                    <th>위험도</th>
                    <th>결과</th>
                </tr>
            </thead>

            <tbody>
                <c:choose>
                    <c:when test="${not empty aiList}">
                        <c:forEach var="ai" items="${aiList}">
                            <tr>
                                <td>${ai.aiDataId}</td>
                                <td>${ai.itemId}</td>
                                <td>${ai.processId}</td>
                                <td>${ai.equipmentId}</td>
                                <td>${ai.prodQty}</td>
                                <td>${ai.defectQty}</td>
                                <td>${ai.defectRate}%</td>
                                <td>${ai.temperature}℃</td>
                                <td>${ai.humidity}%</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${ai.workShift == 'DAY'}">주간</c:when>
                                        <c:when test="${ai.workShift == 'NIGHT'}">야간</c:when>
                                        <c:otherwise>${ai.workShift}</c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <span class="risk-badge risk-${ai.riskLevel}">
                                        ${ai.riskLevel}
                                    </span>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${ai.resultYn == 'Y'}">정상</c:when>
                                        <c:when test="${ai.resultYn == 'N'}">불량</c:when>
                                        <c:otherwise>${ai.resultYn}</c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>

                    <c:otherwise>
                        <tr>
                            <td colspan="12" style="text-align: center;">
                                AI 품질 데이터가 없습니다.
                            </td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </div>

</div>

<style>
    .risk-badge {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        min-width: 72px;
        height: 26px;
        padding: 0 10px;
        border-radius: 999px;
        font-size: 12px;
        font-weight: 700;
    }

    .risk-LOW {
        background-color: #e8f7ef;
        color: #168348;
    }

    .risk-MEDIUM {
        background-color: #fff4db;
        color: #b36b00;
    }

    .risk-HIGH {
        background-color: #ffe8e8;
        color: #d93025;
    }
</style>