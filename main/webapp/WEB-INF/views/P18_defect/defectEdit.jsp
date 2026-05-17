<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="content">

    <div class="header-row">
        <div>
            <h2 class="page-title">불량 유형 수정</h2>

            <p class="page-subtitle">
                불량 유형 정보를 수정할 수 있습니다.
            </p>
        </div>

        <div>
            <p class="page-route">
                홈 &gt; 불량 유형 관리 &gt; 수정
            </p>
        </div>
    </div>

    <form action="${pageContext.request.contextPath}/defect/update"
          method="post">

        <input type="hidden"
               name="defTypeId"
               value="${def.defTypeId}">

        <div class="btn-row">

            <div class="left"></div>

            <div class="right">

                <a class="btn btn-red"
                   href="${pageContext.request.contextPath}/defect/detail?defTypeId=${def.defTypeId}"
                   onclick="return confirm('수정을 취소하시겠습니까?');">
                    취소
                </a>

                <button type="submit"
                        class="btn btn-main">
                    수정완료
                </button>

            </div>

        </div>

        <div class="content-content">

            <div class="content-content-content">

                <div class="content-content-content-title">
                    불량 유형 수정정보
                </div>

                <div class="info-table-wrap">

                    <table class="info-table">
                        <tbody>

                            <tr>
                                <th>불량 유형 코드</th>

                                <td colspan="3">
                                    ${def.defTypeId}
                                </td>
                            </tr>

                            <tr>
                                <th>
                                    불량 유형명
                                    <span class="required">*</span>
                                </th>

                                <td colspan="3">
                                    <input type="text"
                                           name="defTypeName"
                                           class="def-input"
                                           value="${def.defTypeName}"
                                           maxlength="20"
                                           required>
                                </td>
                            </tr>

                            <tr>
                                <th>
                                    기준 조치
                                    <span class="required">*</span>
                                </th>

                                <td colspan="3"
                                    class="def-top-align">

                                    <textarea name="defStandardAction"
                                              class="def-textarea"
                                              maxlength="100"
                                              required>${def.defStandardAction}</textarea>

                                </td>
                            </tr>

                        </tbody>
                    </table>

                </div>

            </div>

        </div>

    </form>

</div>

<style>

.required {
    color: #d9534f;
    font-weight: 700;
}

.def-top-align {
    vertical-align: top !important;
}

.def-input {
    width: 100%;
    height: 38px;

    padding: 8px 10px;

    border: 1px solid #dcdfe6;
    border-radius: 6px;

    font-size: 14px;
    box-sizing: border-box;
}

.def-textarea {
    width: 100%;
    min-height: 100px;

    padding: 10px;

    border: 1px solid #dcdfe6;
    border-radius: 6px;

    font-size: 14px;
    line-height: 1.6;

    resize: vertical;
    box-sizing: border-box;
}

.def-input:focus,
.def-textarea:focus {
    outline: none;
    border-color: #2f7d5c;
}

.btn-row .btn,
.btn-row button.btn {
    height: 36px;

    display: inline-flex;
    align-items: center;
    justify-content: center;

    padding: 0 16px;

    box-sizing: border-box;
}

</style>