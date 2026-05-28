<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="content">

    <div class="header-row">

        <div>
            <h2 class="page-title">입출고 이력 상세</h2>

            <p class="page-subtitle">
                선택한 입출고 이력의 상세 정보를 확인할 수 있습니다.
            </p>
        </div>

        <div>
            <p class="page-route">
                홈 > 입출고관리 > 상세
            </p>
        </div>

    </div>

    <div class="btn-row">

        <div>
            <a class="btn btn-white"
                href="${pageContext.request.contextPath}/io/list">
                목록
            </a>
        </div>

        <div>

            <a class="btn btn-main"
                href="${pageContext.request.contextPath}/io/update?ioId=${io.ioId}">
                수정
            </a>

            <a class="btn btn-red"
                href="${pageContext.request.contextPath}/io/delete?ioId=${io.ioId}"
                onclick="return confirm('입출고 이력을 삭제하시겠습니까?');">
                삭제
            </a>

        </div>

    </div>

    <div class="content-content">

        <div class="content-content-content">

            <div style="
                display:flex;
                justify-content:space-between;
                align-items:center;
                margin-bottom:14px;
            ">

                <div class="content-content-content-title">
                    입출고 상세정보
                </div>

                <div>

                    <c:choose>

                        <c:when test="${io.ioType == 'IN'}">
                            <span class="status-back status-back-safe">
                                • 입고
                            </span>
                        </c:when>

                        <c:when test="${io.ioType == 'OUT'}">
                            <span class="status-back status-back-warning">
                                • 출고
                            </span>
                        </c:when>

                        <c:otherwise>
                            <span class="status">
                                ${io.ioType}
                            </span>
                        </c:otherwise>

                    </c:choose>

                </div>

            </div>

            <div class="info-table-wrap">

                <table class="info-table">

                    <tr>
                        <th>입출고 번호</th>
                        <td>${io.ioId}</td>

                        <th>담당자</th>
                        <td>
						    <c:choose>
						
						        <c:when test="${empty io.workerName}">
						            ${io.ioWorker}
						        </c:when>
						
						        <c:otherwise>
						            ${io.workerName} (${io.ioWorker})
						        </c:otherwise>
						    </c:choose>
						</td>
                    </tr>
                    <tr>
                        <th>입출고 LOT</th>
                        <td><a class="toDetail" href="${pageContext.request.contextPath}/lot/detail?lotId=${io.ioLot}">${io.ioLot}</a></td>

                        <th>입출고 품목</th>
                        <td>

						    <c:choose>
						
						        <c:when test="${empty io.itemName}">
						            -
						        </c:when>
						
						        <c:otherwise>
						            <a class="toDetail" href="${pageContext.request.contextPath}/item/detail?itemId=${io.itemId}">${io.itemName} (${io.itemId})</a>
						        </c:otherwise>
						
						    </c:choose>
						
						</td>
                    </tr>

                    <tr>
                        <th>입출고 사유</th>
                        <td>${io.ioReason}</td>

                        <th>거래처</th>
						<td>
						    <c:choose>
						        <c:when test="${empty io.vendorName}">
						            -
						        </c:when>
						        <c:otherwise>
						            <a class="toDetail" href="${pageContext.request.contextPath}/vendor/detail?vendorId=${io.ioVendor}">${io.vendorName} (${io.ioVendor})</a>
						        </c:otherwise>
						    </c:choose>
						</td>
                    </tr>

                    <tr>
                        <th>입출고 수량</th>
                        <td>
                        	<fmt:formatNumber value="${io.ioQty}" pattern="#,###"/>
                        </td>

                        <th>일시</th>
                        <td>
                        	<fmt:formatDate value="${io.ioDate}"
								pattern="yyyy-MM-dd HH:mm"/>
                        </td>
                    </tr>

                    <tr>
                        <th colspan="4"
                            style="
                                text-align:left;
                                background:#fafafa;
                            ">
                            비고
                        </th>
                    </tr>

                    <tr>
                        <td colspan="4"
                            style="
                                height:80px;
                                text-align:left;
                                vertical-align:top;
                                padding-top:14px;
                            ">

                            <c:choose>

                                <c:when test="${empty io.ioMsg}">
                                    내용 없음
                                </c:when>

                                <c:otherwise>
                                    ${io.ioMsg}
                                </c:otherwise>

                            </c:choose>

                        </td>
                    </tr>

                </table>

            </div>

        </div>

    </div>

</div>