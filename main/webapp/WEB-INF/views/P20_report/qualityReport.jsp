<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="content">

    <div class="report-inner">

        <div class="header-row">
            <div>
                <h2 class="page-title">품질 리포트</h2>
                <p class="page-subtitle">
                    생산 조건과 설비 데이터를 기반으로 품질 위험도를 분석합니다.
                </p>
            </div>

            <div>
                <p class="page-route">
                    홈 &gt; 리포트 &gt; 품질
                </p>
            </div>
        </div>

        <form class="search-box"
              action="${pageContext.request.contextPath}/report/quality"
              method="get">

            <div class="search-item">
	            <label>기간</label>
	
	            <div style="display: flex; align-items: center; gap: 8px;">
	                <input type="date"
	                    name="startDate"
	                    value="${search.startDate}">
	
	                <span>~</span>
	
	                <input type="date"
	                    name="endDate"
	                    value="${search.endDate}">
	            </div>
	        </div>

            <div class="search-item">
                <label>품목</label>
                <select name="itemId">
                    <option value="">전체</option>

                    <c:forEach var="item" items="${itemList}">
                        <option value="${item.code}"
                            <c:if test="${searchDTO.itemId == item.code}">
                                selected
                            </c:if>>
                            ${item.name}
                        </option>
                    </c:forEach>
                </select>
            </div>

            <div class="search-item">
                <label>설비</label>
                <select name="equipmentId">
                    <option value="">전체</option>

                    <c:forEach var="equipment" items="${equipmentList}">
                        <option value="${equipment.code}"
                            <c:if test="${searchDTO.equipmentId == equipment.code}">
                                selected
                            </c:if>>
                            ${equipment.name}
                        </option>
                    </c:forEach>
                </select>
            </div>

            <div class="search-item">
                <label>위험도</label>
                <select name="riskLevel">
                    <option value="">전체</option>

                    <option value="LOW"
                        <c:if test="${searchDTO.riskLevel == 'LOW'}">
                            selected
                        </c:if>>
                        LOW
                    </option>

                    <option value="MEDIUM"
                        <c:if test="${searchDTO.riskLevel == 'MEDIUM'}">
                            selected
                        </c:if>>
                        MEDIUM
                    </option>

                    <option value="HIGH"
                        <c:if test="${searchDTO.riskLevel == 'HIGH'}">
                            selected
                        </c:if>>
                        HIGH
                    </option>
                </select>
            </div>

            <div class="search-btn-area"
                 style="width:100%; justify-content:flex-end;">
                <button type="submit" class="btn btn-main">
                    조회
                </button>
                
                <a class="btn btn-white"
                   href="${pageContext.request.contextPath}/report/quality">
                    초기화
                </a>
            </div>

        </form>

        <div class="report-card-grid">

            <div class="report-card">
                <p>총 생산 수량</p>
                <strong>${summary.totalQcQty}</strong>
                <span>EA</span>
            </div>

            <div class="report-card">
                <p>평균 불량률</p>
                <strong class="danger">${summary.defectRate}</strong>
                <span>%</span>
            </div>

            <div class="report-card">
                <p>HIGH 위험 건수</p>
                <strong class="danger">${summary.highRiskCount}</strong>
                <span>건</span>
            </div>

            <div class="report-card">
                <p>AI 위험 비율</p>
                <strong class="danger">${summary.highRiskRate}</strong>
                <span>%</span>
            </div>

        </div>

        <div class="report-chart-grid">

            <div class="report-section">
                <div class="section-title-row">
                    <h3>날짜별 평균 불량률 추이</h3>
                </div>

                <canvas id="defectTrendChart" height="110"></canvas>
            </div>

            <div class="report-section">
                <div class="section-title-row">
                    <h3>AI 위험도 현황</h3>
                </div>

                <div class="risk-summary-grid">

                    <c:forEach var="risk" items="${riskChartList}">

                        <c:set var="riskClass" value="" />

                        <c:choose>
                            <c:when test="${risk.riskLevel == 'LOW'}">
                                <c:set var="riskClass" value="low" />
                            </c:when>
                            <c:when test="${risk.riskLevel == 'MEDIUM'}">
                                <c:set var="riskClass" value="medium" />
                            </c:when>
                            <c:when test="${risk.riskLevel == 'HIGH'}">
                                <c:set var="riskClass" value="high" />
                            </c:when>
                        </c:choose>

                        <div class="risk-summary-card ${riskClass}">
                            <div>
                                <p>${risk.riskLevel}</p>
                                <strong>${risk.count}</strong>
                                <span>건</span>
                            </div>
                        </div>

                    </c:forEach>

                </div>
            </div>

        </div>

        <div class="ai-comment-box">

            <div class="ai-comment-header">
                <strong>AI 품질 분석 결과</strong>
                <span>Machine Learning Analysis</span>
            </div>

            <ul>
                <c:choose>
                    <c:when test="${summary.highRiskRate >= 30}">
                        <li>HIGH 위험 비율이 ${summary.highRiskRate}%로 높게 나타났습니다.</li>
                        <li>고온·고습 및 장시간 설비 가동 조건에서 불량률 상승 패턴이 확인됩니다.</li>
                        <li>특정 설비군의 점검 주기 단축이 필요할 수 있습니다.</li>
                    </c:when>

                    <c:when test="${summary.highRiskRate >= 10}">
                        <li>일부 생산 구간에서 위험도 증가 패턴이 감지되었습니다.</li>
                        <li>온도, 습도, 설비 가동시간 조건을 우선 확인하세요.</li>
                    </c:when>

                    <c:otherwise>
                        <li>현재 AI 위험 비율은 안정적인 수준입니다.</li>
                        <li>생산 조건과 품질 지표가 정상 범위 내에서 유지되고 있습니다.</li>
                    </c:otherwise>
                </c:choose>
            </ul>

        </div>

        <div class="report-section">

            <div class="section-title-row">
                <h3>AI 품질 데이터 상세</h3>
            </div>

            <div class="table-wrap">
                <table class="table">
                    <thead>
                        <tr>
                            <th>등록일시</th>
                            <th>품목</th>
                            <th>설비</th>
                            <th>생산수량</th>
                            <th>불량률</th>
                            <th>AI 위험도</th>
                            <th>AI 판단 근거</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach var="q" items="${qualityList}">
                            <tr>
                                <td>${q.qcDate}</td>
                                <td>${q.itemName}</td>
                                <td>${q.equipmentId}</td>
                                <td>${q.qcQty}</td>

                                <td>
                                    <strong class="danger-text">
                                        ${q.defectRate}%
                                    </strong>
                                </td>

                                <td>
                                    <span class="risk-badge ${q.riskLevel}">
                                        ${q.riskLevel}
                                    </span>
                                </td>

                                <td>
								    <div class="condition-grid">
								
								        <span class="condition-chip <c:if test='${q.temperature >= 30}'>danger</c:if>">
								            온도 ${q.temperature}℃
								        </span>
								
								        <span class="condition-chip <c:if test='${q.humidity >= 75}'>danger</c:if>">
								            습도 ${q.humidity}%
								        </span>
								
								        <span class="condition-chip <c:if test='${q.equipmentRuntime >= 10}'>danger</c:if>">
								            가동 ${q.equipmentRuntime}h
								        </span>
								
								    </div>
								</td>
                            </tr>
                        </c:forEach>

                        <c:if test="${empty qualityList}">
                            <tr>
                                <td colspan="7" style="text-align:center;">
                                    조회된 AI 품질 데이터가 없습니다.
                                </td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>

            <jsp:include page="/WEB-INF/views/common/paging.jsp" />

        </div>

    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>
    const defectLabels = [
        <c:forEach var="d" items="${defectTrendList}" varStatus="status">
            '${d.reportDate}'<c:if test="${!status.last}">,</c:if>
        </c:forEach>
    ];

    const defectValues = [
        <c:forEach var="d" items="${defectTrendList}" varStatus="status">
            ${d.avgDefectRate}<c:if test="${!status.last}">,</c:if>
        </c:forEach>
    ];

    new Chart(document.getElementById('defectTrendChart'), {
        type: 'line',
        data: {
            labels: defectLabels,
            datasets: [{
                label: '평균 불량률',
                data: defectValues,
                borderColor: '#2f7a4f',
                backgroundColor: 'rgba(47, 122, 79, 0.12)',
                pointBackgroundColor: '#2f7a4f',
                pointBorderColor: '#2f7a4f',
                fill: true,
                tension: 0.3
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: true,
            plugins: {
                legend: {
                    display: true
                }
            },
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>

<style>
    .report-inner {
        width: 100%;
        max-width: 1040px;
        margin: 0 auto;
    }

    .report-card-grid {
        display: grid;
        grid-template-columns: repeat(4, minmax(0, 1fr));
        gap: 16px;
        margin-bottom: 24px;
        max-width: 100%;
    }

    .report-card {
        min-width: 0;
        padding: 20px;
        border: 1px solid #d8d8d8;
        border-radius: 10px;
        background-color: #fff;
    }

    .report-card p {
        margin: 0 0 12px 0;
        font-size: 14px;
        color: #222;
        font-weight: 700;
    }

    .report-card strong {
        font-size: 28px;
        color: #111;
        letter-spacing: -0.5px;
    }

    .report-card span {
        margin-left: 4px;
        color: #111;
        font-size: 14px;
        font-weight: 800;
    }

    .report-card .danger {
        color: #d93025;
    }

    .report-chart-grid {
        display: grid;
        grid-template-columns: minmax(0, 1fr) 280px;
        gap: 20px;
        margin-bottom: 24px;
        max-width: 100%;
    }

    .report-section {
        min-width: 0;
        max-width: 100%;
        margin-bottom: 24px;
        padding: 22px;
        border: 1px solid #d8d8d8;
        border-radius: 10px;
        background-color: #fff;
        overflow: hidden;
    }

    .report-section canvas {
        display: block;
        max-width: 100%;
    }

    .section-title-row {
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 12px;
        margin-bottom: 16px;
    }

    .section-title-row h3 {
        margin: 0;
        font-size: 18px;
        color: #111;
        font-weight: 800;
    }

    .risk-summary-grid {
        display: flex;
        flex-direction: column;
        gap: 12px;
    }

    .risk-summary-card {
        padding: 16px 18px;
        border-radius: 10px;
        border: 1px solid #e5e7eb;
    }

    .risk-summary-card p {
        margin: 0 0 8px 0;
        font-size: 13px;
        font-weight: 800;
    }

    .risk-summary-card strong {
        font-size: 26px;
        font-weight: 800;
    }

    .risk-summary-card span {
        margin-left: 4px;
        font-size: 13px;
        color: #666;
        font-weight: 700;
    }

    .risk-summary-card.low {
        background-color: #f0fdf4;
        border-color: #bbf7d0;
        color: #166534;
    }

    .risk-summary-card.medium {
        background-color: #fffbeb;
        border-color: #fde68a;
        color: #92400e;
    }

    .risk-summary-card.high {
        background-color: #fef2f2;
        border-color: #fecaca;
        color: #991b1b;
    }

    .ai-comment-box {
        max-width: 100%;
        margin-bottom: 24px;
        padding: 20px 24px;
        border-radius: 10px;
        border: 1px solid #bbf7d0;
        background-color: #f0fdf4;
    }

    .ai-comment-header {
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 12px;
        margin-bottom: 14px;
    }

    .ai-comment-header strong {
        font-size: 18px;
        color: #166534;
        font-weight: 800;
    }

    .ai-comment-header span {
        font-size: 13px;
        color: #15803d;
        font-weight: 700;
        white-space: nowrap;
    }

    .ai-comment-box ul {
        margin: 0;
        padding-left: 20px;
    }

    .ai-comment-box li {
        margin-bottom: 8px;
        color: #14532d;
        font-size: 14px;
        line-height: 1.6;
    }

    .table-wrap {
        width: 100%;
        max-width: 100%;
        overflow-x: auto;
    }

    .table {
        min-width: 840px;
    }

    .risk-badge {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        min-width: 68px;
        height: 26px;
        padding: 0 10px;
        border-radius: 999px;
        font-size: 12px;
        font-weight: 800;
        white-space: nowrap;
    }

    .risk-badge.LOW {
        color: #166534;
        background-color: #dcfce7;
    }

    .risk-badge.MEDIUM {
        color: #92400e;
        background-color: #fef3c7;
    }

    .risk-badge.HIGH {
        color: #991b1b;
        background-color: #fee2e2;
    }

    .danger-text {
        color: #dc2626;
        font-weight: 800;
    }

    .condition-grid {
	    display: grid;
	    grid-template-columns: 92px 92px 92px;
	    align-items: center;
	    gap: 6px;
	}
	
	.condition-chip {
	    display: inline-flex;
	    align-items: center;
	    justify-content: center;
	    height: 26px;
	    padding: 0 8px;
	    border-radius: 999px;
	    font-size: 13px;
	    font-weight: 600;
	    color: #333;
	    background-color: transparent;
	    white-space: nowrap;
	}
	
	.condition-chip.danger {
	    color: #b91c1c;
	    background-color: #fee2e2;
	    font-weight: 800;
	}

    @media (max-width: 1400px) {
        .report-inner {
            max-width: 960px;
        }

        .report-chart-grid {
            grid-template-columns: 1fr;
        }

        .risk-summary-grid {
            display: grid;
            grid-template-columns: repeat(3, minmax(0, 1fr));
        }
    }

    @media (max-width: 1100px) {
        .report-card-grid {
            grid-template-columns: repeat(2, minmax(0, 1fr));
        }
    }
</style>