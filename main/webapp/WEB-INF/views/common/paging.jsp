<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    StringBuilder pagingQuery = new StringBuilder();

    Map<String, String[]> paramMap = request.getParameterMap();

    for (Map.Entry<String, String[]> entry : paramMap.entrySet()) {

        String key = entry.getKey();

        // 기존 page 파라미터는 새 page 값으로 다시 붙일 거라 제외
        if ("page".equals(key)) {
            continue;
        }

        String[] values = entry.getValue();

        if (values == null) {
            continue;
        }

        for (String value : values) {

            if (value == null || value.trim().isEmpty()) {
                continue;
            }

            pagingQuery
                .append(URLEncoder.encode(key, "UTF-8"))
                .append("=")
                .append(URLEncoder.encode(value, "UTF-8"))
                .append("&");
        }
    }

    request.setAttribute("pagingQuery", pagingQuery.toString());
%>

<div class="pagination">

    <!-- 첫 페이지 -->
    <c:choose>
        <c:when test="${page.currentPage == 1}">
            <a class="disabled">&laquo;</a>
        </c:when>
        <c:otherwise>
            <a href="?${pagingQuery}page=1">&laquo;</a>
        </c:otherwise>
    </c:choose>

    <!-- 이전 -->
    <c:choose>
        <c:when test="${page.currentPage == 1}">
            <a class="disabled">&lt;</a>
        </c:when>
        <c:otherwise>
            <a href="?${pagingQuery}page=${page.currentPage - 1}">&lt;</a>
        </c:otherwise>
    </c:choose>

    <!-- 페이지 번호 -->
    <c:forEach begin="${page.startPage}" end="${page.endPage}" var="i">
        <c:choose>
            <c:when test="${i == page.currentPage}">
                <a class="active">${i}</a>
            </c:when>
            <c:otherwise>
                <a href="?${pagingQuery}page=${i}">${i}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>

    <!-- 다음 -->
    <c:choose>
        <c:when test="${page.currentPage == page.maxPage}">
            <a class="disabled">&gt;</a>
        </c:when>
        <c:otherwise>
            <a href="?${pagingQuery}page=${page.currentPage + 1}">&gt;</a>
        </c:otherwise>
    </c:choose>

    <!-- 마지막 -->
    <c:choose>
        <c:when test="${page.currentPage == page.maxPage}">
            <a class="disabled">&raquo;</a>
        </c:when>
        <c:otherwise>
            <a href="?${pagingQuery}page=${page.maxPage}">&raquo;</a>
        </c:otherwise>
    </c:choose>

</div>