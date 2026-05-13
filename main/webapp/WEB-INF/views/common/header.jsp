<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<header class="header">
    <div class="header-left">
        <a href="${pageContext.request.contextPath}/dashboard" class="header-logo">
            <span class="logo-icon">◇</span>
            <span class="logo-text">MES SYSTEM</span>
        </a>

        <button type="button" class="btn-menu">☰</button>
    </div>

    <div class="header-right">
        <button type="button" class="header-icon">🔔</button>
        <button type="button" class="header-icon">⚙</button>

        <div class="header-profile">
            <span class="profile-img"></span>
            <span class="profile-name">홍길동</span>
            <span class="profile-arrow">⌄</span>
        </div>
    </div>
</header>