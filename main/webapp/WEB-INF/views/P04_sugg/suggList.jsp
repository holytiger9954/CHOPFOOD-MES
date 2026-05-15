<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="content">
    <div class="header-row">
        <div>
            <h2 class="page-title">건의사항 관리</h2>
            <p class="page-subtitle">
                현장의 건의사항을 조회하고 새로운 건의사항을 등록할 수 있습니다.
            </p>
        </div>
		<div>
			<p class="page-route">
					홈 > 건의사항 관리
				</p>
	        <a class="btn btn-white"
	           href="${pageContext.request.contextPath}/sugg/add">
	            건의사항 등록
	        </a>
    	</div>
    </div>

    <form class="search-box"
          action="${pageContext.request.contextPath}/sugg/list"
          method="get">

        <div class="search-item">
            <label>답변상태</label>
            <select name="sugg_answer">
                <option value="">전체</option>
                <option value="대기" ${suggDTO.sugg_answer == '대기' ? 'selected' :''}>답변대기</option>
                <option value="완료" ${suggDTO.sugg_answer == '완료' ? 'selected' :''}>답변완료</option>
            </select>
        </div>

        <div class="search-item keyword">
            <label>제목/작성자 검색</label>
            <input type="text"
                   name="keyword"
                   placeholder="내용을 입력하세요.">
        </div>
		
		<div class="search-btn-area">
	        <button type="submit" class="btn btn-main">
	            검색
	        </button>
        </div>

    </form>

    <div>
        <div class="table-wrap">
            <table class="table">
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>답변상태</th>
                        <th>작성일</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach var="dto" items="${list}">
                        <tr>
                            <td>${dto.sugg_no}</td>

                            <td>
                                <a href="${pageContext.request.contextPath}/sugg/detail?sugg_no=${dto.sugg_no}">
                                    ${dto.sugg_title}
                                </a>
                            </td>

                            <td>${dto.sugg_writer}</td>

                            <td>
                                <c:choose>
                                    <c:when test="${dto.sugg_answer eq '대기'}">
                                        답변대기
                                    </c:when>
                                    <c:otherwise>
                                        답변완료
                                    </c:otherwise>
                                </c:choose>
                            </td>

                            <td>${dto.sugg_cdate}</td>
                        </tr>
                    </c:forEach>

                    <c:if test="${empty list}">
                        <tr>
                            <td colspan="5" class="vendor-empty">
                                조회된 건의사항이 없습니다.
                            </td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>

        <%-- 페이징 붙일 때 사용 --%>
        <jsp:include page="/WEB-INF/views/common/paging.jsp" />

    </div>

</div>

<style>

</style>