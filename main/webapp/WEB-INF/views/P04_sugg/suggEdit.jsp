<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="content">

    <div class="header-row">
        <div>
            <h2 class="page-title">건의사항 수정</h2>
            <p class="page-subtitle">등록된 건의사항의 내용을 수정할 수 있습니다.</p>
        </div>

        <div>
            <p class="page-route">홈 > 건의사항 관리 > 수정</p>
        </div>
    </div>

    <div class="btn-row">
        <div class="left">
            <a class="btn btn-white"
               href="${pageContext.request.contextPath}/sugg/detail?sugg_no=${dto.sugg_no}">
                상세로
            </a>
        </div>
    </div>

    <form action="${pageContext.request.contextPath}/sugg/edit"
          method="post">

        <input type="hidden" name="sugg_no" value="${dto.sugg_no}">

        <div class="content-content">

            <div class="content-content-content">
                <div class="content-content-content-title">
                    건의사항 정보
                </div>

                <div class="info-table-wrap">
                    <table class="info-table">
                        <tbody>
                            <tr>
                                <th>건의사항 번호</th>
                                <td>
                                    ${dto.sugg_no}
                                </td>

                                <th>작성자</th>
                                <td>
                                    <input type="text"
                                           name="sugg_writer"
                                           value="${dto.sugg_writer}"
                                           readonly>
                                </td>
                            </tr>

                            <tr>
                                <th>제목</th>
                                <td colspan="3">
                                    <input type="text"
                                           name="sugg_title"
                                           value="${dto.sugg_title}"
                                           placeholder="제목을 입력하세요."
                                           required>
                                </td>
                            </tr>

                            <tr>
                                <th>답변 여부</th>
                                <td>
                                    <select name="sugg_answer">
                                        <option value="N"
                                            ${dto.sugg_answer eq 'N' ? 'selected' : ''}>
                                            답변대기
                                        </option>
                                        <option value="Y"
                                            ${dto.sugg_answer eq 'Y' ? 'selected' : ''}>
                                            답변완료
                                        </option>
                                    </select>
                                </td>

                                <th>비밀번호</th>
                                <td>
                                    <input type="password"
                                           name="sugg_pw"
                                           value="${dto.sugg_pw}"
                                           required>
                                </td>
                            </tr>

                            <tr>
                                <th>건의 내용</th>
                                <td colspan="3">
                                    <textarea name="sugg_content"
                                              rows="10"
                                              placeholder="건의 내용을 입력하세요."
                                              required>${dto.sugg_content}</textarea>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="btn-row">
                <div class="left"></div>

                <div class="right">
                    <button type="submit" class="btn btn-main">
                        수정
                    </button>

                    <a class="btn btn-white"
                       href="${pageContext.request.contextPath}/sugg/detail?sugg_no=${dto.sugg_no}">
                        취소
                    </a>
                </div>
            </div>

        </div>

    </form>

</div>