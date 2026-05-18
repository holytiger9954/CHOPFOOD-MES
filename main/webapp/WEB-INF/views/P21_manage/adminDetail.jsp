<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="content">

    <div class="header-row">
        <div>
            <h2 class="page-title">사원 상세</h2>
            <p class="page-subtitle">사원 정보를 확인하고 관리할 수 있습니다.</p>
        </div>

        <div>
            <p class="page-route">홈 &gt; 사원관리 &gt; 상세</p>
        </div>
    </div>

    <div class="btn-row">
        <div>
            <a class="btn btn-white"
               href="${pageContext.request.contextPath}/admin/list">
                목록
            </a>
        </div>

        <div>
            <a class="btn btn-main"
               href="${pageContext.request.contextPath}/admin/edit?empId=${admin.empId}">
                수정
            </a>
        </div>
    </div>

    <div class="card emp-profile-card">

        <div class="emp-profile-left">
            <div class="emp-profile-img"></div>

            <div>
                <h3 class="emp-profile-name">${admin.empName}</h3>
                <p class="emp-profile-id">사원번호 : ${admin.empId}</p>
            </div>
        </div>

        <div>
            <c:choose>
                <c:when test="${admin.empInOffice == 0}">
                    <span class="status status-success">● 재직</span>
                </c:when>
                <c:when test="${admin.empInOffice == 10}">
                    <span class="status status-warning">● 휴직</span>
                </c:when>
                <c:when test="${admin.empInOffice == 50}">
                    <span class="status status-info">● 퇴사</span>
                </c:when>
                <c:otherwise>
                    <span class="status status-info">● 미지정</span>
                </c:otherwise>
            </c:choose>
        </div>

    </div>

    <div class="emp-detail-grid">

        <div class="card">
            <h3 class="card-title">사원 정보</h3>

            <div class="info-table-wrap">
                <table class="info-table">
                    <tr>
                        <th>사원번호</th>
                        <td>${admin.empId}</td>
                    </tr>

                    <tr>
                        <th>이름</th>
                        <td>${admin.empName}</td>
                    </tr>

                    <tr>
                        <th>부서</th>
                        <td>${admin.deptName}</td>
                    </tr>
                </table>
            </div>
        </div>

        <div class="card">
            <h3 class="card-title">계정 정보</h3>

            <div class="info-table-wrap">
                <table class="info-table">
                    <tr>
                        <th>이메일</th>
                        <td>${admin.empEmail}</td>
                    </tr>

                    <tr>
                        <th>전화번호</th>
                        <td>${admin.empTel}</td>
                    </tr>

                    <tr>
                        <th>입사일</th>
                        <td>${admin.empHiredate}</td>
                    </tr>

                    <tr>
                        <th>권한</th>
                        <td>
                            <c:choose>
                                <c:when test="${admin.empAuth == 0}">
                                    퇴사자
                                </c:when>
                                <c:when test="${admin.empAuth == 10}">
                                    작업자
                                </c:when>
                                <c:when test="${admin.empAuth == 20}">
                                    관리자
                                </c:when>
                                <c:when test="${admin.empAuth == 30}">
                                    최고관리자
                                </c:when>
                                <c:otherwise>
                                    권한 미지정
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </table>
            </div>
        </div>

    </div>

</div>

<style>
    .emp-profile-card {
        min-height: 150px;
        margin-bottom: 16px;

        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .emp-profile-left {
        display: flex;
        align-items: center;
        gap: 32px;
    }

    .emp-profile-img {
        width: 96px;
        height: 96px;

        border-radius: 50%;
        background-color: var(--gray);
    }

    .emp-profile-name {
        margin: 0 0 10px;

        font-size: 26px;
        font-weight: 700;
    }

    .emp-profile-id {
        margin: 0;

        font-size: 18px;
        color: var(--dark-gray);
    }

    .emp-detail-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 16px;
    }

    .emp-detail-grid .card {
        min-height: 230px;
        padding: 24px;
    }

    .emp-detail-grid .info-table-wrap {
        padding: 0 20px;
    }

    @media (max-width: 1000px) {
        .emp-detail-grid {
            grid-template-columns: 1fr;
        }

        .emp-profile-card {
            align-items: flex-start;
            flex-direction: column;
            gap: 20px;
        }
    }
</style>