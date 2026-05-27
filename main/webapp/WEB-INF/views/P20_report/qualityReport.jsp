<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="content">

    <div class="report-inner" id="reportPdfArea">

        <div class="pdf-page-area" id="pdfPage1">

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

                    <button type="button"
                            class="btn btn-main pdf-exclude"
                            id="qualityPdfBtn"
                            onclick="downloadQualityReportPdf()">
                        PDF 저장
                    </button>
                </div>
            </div>

            <form class="search-box"
                  action="${pageContext.request.contextPath}/report/quality"
                  method="get">

                <div class="search-item">
                    <label>조회기간</label>

                    <div class="date-range">
                        <input type="date"
                               name="startDate"
                               value="${searchDTO.startDate}">

                        <span>~</span>

                        <input type="date"
                               name="endDate"
                               value="${searchDTO.endDate}">
                    </div>
                </div>

                <div class="search-item">
                    <label>품목유형</label>

                    <select name="itemType">
                        <option value="">전체</option>

                        <option value="10"
                            <c:if test="${searchDTO.itemType == '10'}">selected</c:if>>
                            원자재
                        </option>

                        <option value="20"
                            <c:if test="${searchDTO.itemType == '20'}">selected</c:if>>
                            반제품
                        </option>

                        <option value="30"
                            <c:if test="${searchDTO.itemType == '30'}">selected</c:if>>
                            완제품
                        </option>

                        <option value="40"
                            <c:if test="${searchDTO.itemType == '40'}">selected</c:if>>
                            기타 자재
                        </option>
                    </select>
                </div>

                <div class="search-item">
                    <label>품목 검색</label>

                    <input type="text"
                           name="itemKeyword"
                           value="${searchDTO.itemKeyword}"
                           placeholder="품목명 또는 품목코드 입력"
                           style="min-width:240px">
                </div>

                <input type="hidden"
                       name="riskLevel"
                       value="${searchDTO.riskLevel}">

                <div class="search-btn-area">
                    <button type="submit" class="btn btn-main">
                        조회
                    </button>

                    <a class="btn btn-white"
                       href="${pageContext.request.contextPath}/report/quality">
                        초기화
                    </a>
                </div>

            </form>

            <h3 class="report-block-title">주요 지표</h3>

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

                <div class="report-section chart-section">
                    <div class="section-title-row">
                        <h3>날짜별 평균 불량률 추이</h3>
                    </div>

                    <div class="chart-canvas-box">
                        <canvas id="defectTrendChart"></canvas>
                    </div>
                </div>

                <div class="report-section chart-section">
                    <div class="section-title-row">
                        <h3>AI 위험도 현황</h3>

                        <div class="risk-filter-tabs">
                            <a class="<c:if test='${empty searchDTO.riskLevel}'>active</c:if>"
                               href="${pageContext.request.contextPath}/report/quality?startDate=${searchDTO.startDate}&endDate=${searchDTO.endDate}&itemType=${searchDTO.itemType}&itemKeyword=${searchDTO.itemKeyword}">
                                전체
                            </a>

                            <a class="<c:if test='${searchDTO.riskLevel == "LOW"}'>active</c:if>"
                               href="${pageContext.request.contextPath}/report/quality?startDate=${searchDTO.startDate}&endDate=${searchDTO.endDate}&itemType=${searchDTO.itemType}&itemKeyword=${searchDTO.itemKeyword}&riskLevel=LOW">
                                LOW
                            </a>

                            <a class="<c:if test='${searchDTO.riskLevel == "MEDIUM"}'>active</c:if>"
                               href="${pageContext.request.contextPath}/report/quality?startDate=${searchDTO.startDate}&endDate=${searchDTO.endDate}&itemType=${searchDTO.itemType}&itemKeyword=${searchDTO.itemKeyword}&riskLevel=MEDIUM">
                                MEDIUM
                            </a>

                            <a class="<c:if test='${searchDTO.riskLevel == "HIGH"}'>active</c:if>"
                               href="${pageContext.request.contextPath}/report/quality?startDate=${searchDTO.startDate}&endDate=${searchDTO.endDate}&itemType=${searchDTO.itemType}&itemKeyword=${searchDTO.itemKeyword}&riskLevel=HIGH">
                                HIGH
                            </a>
                        </div>
                    </div>

                    <div class="chart-canvas-box">
                        <canvas id="riskStatusChart"></canvas>
                    </div>
                </div>

            </div>

        </div>

        <div class="pdf-page-area" id="pdfPage2">

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

</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>

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

    const riskLabels = [
        <c:forEach var="r" items="${riskChartList}" varStatus="status">
            '${r.riskLevel}'<c:if test="${!status.last}">,</c:if>
        </c:forEach>
    ];

    const riskValues = [
        <c:forEach var="r" items="${riskChartList}" varStatus="status">
            ${r.count}<c:if test="${!status.last}">,</c:if>
        </c:forEach>
    ];

    const riskColors = riskLabels.map(function(label) {
        if (label === 'LOW') {
            return '#2f7a4f';
        }

        if (label === 'MEDIUM') {
            return '#f59e0b';
        }

        if (label === 'HIGH') {
            return '#dc2626';
        }

        return '#9ca3af';
    });

    new Chart(document.getElementById('defectTrendChart'), {
        type: 'line',
        data: {
            labels: defectLabels,
            datasets: [{
                label: '평균 불량률(%)',
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
            maintainAspectRatio: false,

            plugins: {
                legend: {
                    display: true,
                    labels: {
                        boxWidth: 12
                    }
                }
            },

            scales: {
                x: {
                    ticks: {
                        maxTicksLimit: 10
                    }
                },
                y: {
                    beginAtZero: true
                }
            }
        }
    });

    new Chart(document.getElementById('riskStatusChart'), {
        type: 'bar',
        data: {
            labels: riskLabels,
            datasets: [{
                label: '위험도 건수',
                data: riskValues,
                backgroundColor: riskColors,
                borderRadius: 8,
                barThickness: 28
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,

            plugins: {
                legend: {
                    display: false
                }
            },

            scales: {
                x: {
                    beginAtZero: true
                }
            }
        }
    });
</script>

<script>
async function downloadQualityReportPdf() {

    const page1 = document.getElementById('pdfPage1');
    const page2 = document.getElementById('pdfPage2');
    const pdfBtn = document.getElementById('qualityPdfBtn');

    if (!page1 || !page2) {
        alert('PDF 저장 영역을 찾을 수 없습니다.');
        return;
    }

    const { jsPDF } = window.jspdf;

    const pdf = new jsPDF('l', 'mm', 'a4');

    const pageWidth = 297;
    const pageHeight = 210;
    const margin = 3;
    const captureWidth = 1024;

    async function addPageImage(element, isFirstPage) {

        if (!isFirstPage) {
            pdf.addPage();
        }

        const elementId = element.id;

        const canvas = await html2canvas(element, {
            scale: 2,
            backgroundColor: '#ffffff',
            useCORS: true,
            scrollX: 0,
            scrollY: 0,
            windowWidth: captureWidth,
            windowHeight: element.scrollHeight,

            ignoreElements: function(el) {
                return el.classList && el.classList.contains('pdf-exclude');
            },

            onclone: function(clonedDoc) {
                const clonedElement = clonedDoc.getElementById(elementId);

                if (clonedElement) {
                    clonedElement.style.width = captureWidth + 'px';
                    clonedElement.style.maxWidth = captureWidth + 'px';
                    clonedElement.style.overflow = 'visible';
                    clonedElement.style.backgroundColor = '#ffffff';
                }

                const clonedTableWraps = clonedDoc.querySelectorAll('.table-wrap');
                clonedTableWraps.forEach(function(wrap) {
                    wrap.style.overflow = 'visible';
                });
            }
        });

        const imgData = canvas.toDataURL('image/png');

        const maxWidth = pageWidth - (margin * 2);
        const maxHeight = pageHeight - (margin * 2);

        let imgWidth = maxWidth;
        let imgHeight = (canvas.height * imgWidth) / canvas.width;

        if (imgHeight > maxHeight) {
            imgHeight = maxHeight;
            imgWidth = (canvas.width * imgHeight) / canvas.height;
        }

        const x = (pageWidth - imgWidth) / 2;
        const y = margin;

        pdf.addImage(imgData, 'PNG', x, y, imgWidth, imgHeight);
    }

    try {
        if (pdfBtn) {
            pdfBtn.disabled = true;
            pdfBtn.innerText = '저장 중...';
            pdfBtn.style.visibility = 'hidden';
        }

        await addPageImage(page1, true);
        await addPageImage(page2, false);

        const today = new Date().toISOString().slice(0, 10);
        pdf.save('quality-report-' + today + '.pdf');

    } catch (e) {
        console.error(e);
        alert('PDF 저장 중 오류가 발생했습니다.');

    } finally {
        if (pdfBtn) {
            pdfBtn.disabled = false;
            pdfBtn.innerText = 'PDF 저장';
            pdfBtn.style.visibility = 'visible';
        }
    }
}
</script>

<style>
    .report-inner {
        width: 100%;
        max-width: 1040px;
        margin: 0 auto;
    }

    .pdf-page-area {
        width: 100%;
        max-width: 1040px;
        margin: 0 auto;
        background-color: #fff;
    }

    .date-range {
        display: flex;
        align-items: center;
        gap: 8px;
    }

    .date-range input {
        width: 150px;
    }

    .report-block-title {
        margin: 0 0 18px 0;
        font-size: 19px;
        color: #111;
        font-weight: 800;
    }

    .report-card-grid {
        display: grid;
        grid-template-columns: repeat(4, minmax(0, 1fr));
        gap: 16px;
        margin-bottom: 30px;
        max-width: 100%;
    }

    .report-card {
        min-width: 0;
        padding: 20px;
        border: 1px solid #bdbdbd;
        border-radius: 10px;
        background-color: #fff;
    }

    .report-card p {
        margin: 0 0 16px 0;
        font-size: 14px;
        color: #222;
        font-weight: 800;
    }

    .report-card strong {
        font-size: 29px;
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
        grid-template-columns: 1fr 1fr;
        gap: 24px;
        margin-bottom: 30px;
        align-items: stretch;
    }

    .report-section {
        min-width: 0;
        max-width: 100%;
        margin-bottom: 24px;
        padding: 22px;
        border: 1px solid #bdbdbd;
        border-radius: 10px;
        background-color: #fff;
        overflow: hidden;
    }

    .chart-section {
        margin-bottom: 0;
    }

    .chart-canvas-box {
        position: relative;
        width: 100%;
        height: 260px;
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

    .risk-filter-tabs {
        display: flex;
        align-items: center;
        gap: 6px;
        flex-wrap: wrap;
    }

    .risk-filter-tabs a {
        min-width: 48px;
        height: 28px;
        padding: 0 10px;
        border: 1px solid #d1d5db;
        border-radius: 999px;

        display: inline-flex;
        align-items: center;
        justify-content: center;

        color: #555;
        background-color: #fff;

        font-size: 12px;
        font-weight: 800;
        text-decoration: none;
    }

    .risk-filter-tabs a.active {
        color: #fff;
        border-color: #2f7a4f;
        background-color: #2f7a4f;
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

    .pdf-exclude {
        white-space: nowrap;
    }

    @media (max-width: 900px) {
        .report-inner {
            max-width: 960px;
        }

        .report-chart-grid {
            grid-template-columns: 1fr;
            gap: 20px;
        }
    }

    @media (max-width: 1100px) {
        .report-card-grid {
            grid-template-columns: repeat(2, minmax(0, 1fr));
        }
    }
</style>