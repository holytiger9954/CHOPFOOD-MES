<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="content">

    <div class="header-row">
        <div>
            <h2 class="page-title">불량 유형 등록</h2>
            <p class="page-subtitle">새로운 불량 유형을 등록하세요.</p>
        </div>

        <div>
            <p class="page-route">홈 > 불량 유형 > 등록</p>
        </div>
    </div>

    <form action="${pageContext.request.contextPath}/defect/insert"
          method="post"
          class="search-box">

        <div class="search-btn-area" style="width: 100%; justify-content: flex-end;">
            <a class="btn btn-white"
               href="${pageContext.request.contextPath}/defect/list">
                취소
            </a>

            <button type="submit" class="btn btn-main">
                등록
            </button>
        </div>

        <div class="search-item keyword">
            <label>불량 유형명 *</label>
            <input type="text"
                   name="defTypeName"
                   placeholder="불량 유형명 입력"
                   maxlength="20"
                   required>
        </div>

        <div class="search-item keyword" style="flex-basis: 100%;">
            <label>유형별 기준 조치</label>

            <textarea name="defStandardAction"
                      placeholder="예: 재작업 진행&#10;원인 분석 후 보고&#10;폐기 처리"
                      maxlength="100"
                      rows="5"
                      style="resize: vertical;"></textarea>
        </div>

    </form>

</div>