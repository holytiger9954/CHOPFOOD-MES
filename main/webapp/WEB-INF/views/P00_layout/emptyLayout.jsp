<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title><tiles:insertAttribute name="title" ignore="true" /></title>

<link rel="stylesheet"
    href="${pageContext.request.contextPath}/resources/css/common/common.css">
<link rel="stylesheet"
    href="${pageContext.request.contextPath}/resources/css/common/layout.css">
</head>
<body>

    <tiles:insertAttribute name="content" />

    <script src="${pageContext.request.contextPath}/resources/js/common.js"></script>

</body>
</html>