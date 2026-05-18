<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="content">

    <div class="header-row">
        <div>
            <h2 class="page-title">사원 관리</h2>
            <p class="page-subtitle">사원 계정과 권한 정보를 조회할 수 있습니다.</p>
        </div>

        <div>
            <p class="page-route">홈 &gt; 사원 관리</p>

            <a class="btn btn-white"
               href="${pageContext.request.contextPath}/admin/add">
                사원 등록
            </a>
        </div>
    </div>

    <form class="search-box"
          action="${pageContext.request.contextPath}/admin/list"
          method="get">

        <div class="search-item">
            <label>검색조건</label>

            <select name="searchType">
                <option value="" ${empty search.searchType ? 'selected' : ''}>
                    전체
                </option>

                <option value="id" ${search.searchType eq 'id' ? 'selected' : ''}>
                    사번
                </option>

                <option value="name" ${search.searchType eq 'name' ? 'selected' : ''}>
                    이름
                </option>

                <option value="auth" ${search.searchType eq 'auth' ? 'selected' : ''}>
                    권한
                </option>
            </select>
        </div>

        <div class="search-item keyword">
            <label>검색어</label>

            <input type="text"
                   name="searchKeyword"
                   value="${search.searchKeyword}"
                   placeholder="검색어를 입력하세요.">
        </div>

        <div class="search-btn-area">
            <button type="submit" class="btn btn-main">
                검색
            </button>
        </div>

    </form>

    <div class="table-wrap">
        <table class="table">
            <thead>
                <tr>
                    <th>사번</th>
                    <th>이름</th>
                    <th>연락처</th>
                    <th>이메일</th>
                    <th>부서</th>
                    <th>권한</th>
                    <th>재직여부</th>
                    <th>입사일</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var="admin" items="${adminList}">
                    <tr onclick="location.href='${pageContext.request.contextPath}/admin/detail?empId=${admin.empId}'"
                        style="cursor: pointer;">
                        <td>${admin.empId}</td>
                        <td>${admin.empName}</td>
                        <td>${admin.empTel}</td>
                        <td>${admin.empEmail}</td>
                        <td>${admin.empDeptno}</td>

                        <td>
                            <c:choose>
                                <c:when test="${admin.empAuth == 1}">
                                    MES 관리자
                                </c:when>
                                <c:when test="${admin.empAuth == 2}">
                                    현장 관리자
                                </c:when>
                                <c:when test="${admin.empAuth == 3}">
                                    작업자
                                </c:when>
                                <c:otherwise>
                                    기타
                                </c:otherwise>
                            </c:choose>
                        </td>

                        <td>
                            <c:choose>
                                <c:when test="${admin.empInOffice == 1}">
                                    재직
                                </c:when>
                                <c:otherwise>
                                    퇴사
                                </c:otherwise>
                            </c:choose>
                        </td>

                        <td>${admin.empHiredate}</td>
                    </tr>
                </c:forEach>

                <c:if test="${empty adminList}">
                    <tr>
                        <td colspan="8" style="text-align:center;">
                            조회된 사원이 없습니다.
                        </td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>

    <jsp:include page="/WEB-INF/views/common/paging.jsp" />

</div>