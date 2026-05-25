<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="content">

    <div class="header-row">
        <div>
            <h2 class="page-title">AI 품질 예측</h2>
            <p class="page-subtitle">
                생산 조건을 입력하여 품질 위험도를 예측합니다.
            </p>
        </div>

        <div>
            <p class="page-route">
                홈 &gt; AI 분석 &gt; AI 품질 예측
            </p>
        </div>
    </div>

    <form class="search-box"
          action="${pageContext.request.contextPath}/ai/predict"
          method="post">

        <div class="search-item">
            <label>생산량</label>
            <input type="number"
                   name="prodQty"
                   value="1800"
                   required>
        </div>

        <div class="search-item">
            <label>온도(℃)</label>
            <input type="number"
                   step="0.1"
                   name="temperature"
                   value="35.5"
                   required>
        </div>

        <div class="search-item">
            <label>습도(%)</label>
            <input type="number"
                   step="0.1"
                   name="humidity"
                   value="88.0"
                   required>
        </div>

        <div class="search-item">
            <label>설비 가동시간</label>
            <input type="number"
                   name="equipmentRuntime"
                   value="25"
                   required>
        </div>

        <div class="search-item">
            <label>근무 구분</label>
            <select name="workShiftNum">
                <option value="0">주간</option>
                <option value="1" selected>야간</option>
            </select>
        </div>

        <div class="search-btn-area"
             style="width:100%; justify-content:flex-end;">
            <button type="submit" class="btn btn-main">
                AI 예측 실행
            </button>
        </div>

    </form>

</div>