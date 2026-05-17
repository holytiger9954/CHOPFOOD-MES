<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="content">

	<div class="header-row">
		<div>
			<h2 class="page-title">품목 등록</h2>
			<p class="page-subtitle">새로운 품목을 등록하세요.</p>
		</div>

		<div>
			<p class="page-route">홈 > 품목 관리 > 등록</p>
		</div>
	</div>

	<form action="${pageContext.request.contextPath}/item/insert"
		method="post"
		class="search-box"
		style="display:flex;
			   flex-wrap:wrap;
			   gap:14px 40px;
			   align-items:flex-start;
			   padding:30px;">

		<div class="search-btn-area"
			style="width:100%;
				   display:flex;
				   justify-content:flex-end;
				   gap:10px;">
				   
			<a class="btn btn-white"
				href="${pageContext.request.contextPath}/item/list">
				취소
			</a>

			<button type="submit" class="btn btn-main">등록</button>
		</div>

		<!-- 품목명 -->
		<div style="display:flex;
					align-items:center;
					width:420px;">
					
			<label style="width:100px;
						  font-weight:700;">
				품목명
			</label>

			<input type="text"
				   name="itemName"
				   placeholder="품목명 입력"
				   style="width:250px;
				   		  height:34px;
				   		  border:1px solid #ccc;
				   		  border-radius:4px;
				   		  padding:0 10px;">
		</div>

		<!-- 품목유형 -->
		<div style="display:flex;
					align-items:center;
					width:420px;">

			<label style="width:100px;
						  font-weight:700;">
				품목유형
			</label>

			<select name="itemType"
					style="width:250px;
						   height:34px;
						   border:1px solid #ccc;
						   border-radius:4px;
						   padding:0 10px;">

				<option value="10">원자재</option>
				<option value="20">반제품</option>
				<option value="30">완제품</option>
			</select>
		</div>

		<!-- 안전재고 -->
		<div style="display:flex;
					align-items:center;
					width:420px;">

			<label style="width:100px;
						  font-weight:700;">
				안전재고
			</label>

			<input type="number"
				   name="safetyStock"
				   style="width:250px;
				   		  height:34px;
				   		  border:1px solid #ccc;
				   		  border-radius:4px;
				   		  padding:0 10px;">
		</div>

		<!-- 사용가능기간 -->
		<div style="display:flex;
					align-items:center;
					width:420px;">

			<label style="width:100px;
						  font-weight:700;">
				사용가능기간
			</label>

			<div style="display:flex;
						align-items:center;
						gap:8px;">

				<input type="number"
					   name="useDate"
					   style="width:220px;
					   		  height:34px;
					   		  border:1px solid #ccc;
					   		  border-radius:4px;
					   		  padding:0 10px;">

				<span>일</span>
			</div>
		</div>

		<!-- 단위 -->
		<div style="display:flex;
					align-items:center;
					width:260px;">

			<label style="width:60px;
						  font-weight:700;">
				단위
			</label>

			<input type="text"
				   name="unit"
				   style="width:150px;
				   		  height:34px;
				   		  border:1px solid #ccc;
				   		  border-radius:4px;
				   		  padding:0 10px;">
		</div>

		<!-- 규격 -->
		<div style="display:flex;
					align-items:center;
					width:260px;">

			<label style="width:60px;
						  font-weight:700;">
				규격
			</label>

			<input type="text"
				   name="spec"
				   style="width:150px;
				   		  height:34px;
				   		  border:1px solid #ccc;
				   		  border-radius:4px;
				   		  padding:0 10px;">
		</div>

		<!-- 단가 -->
		<div style="display:flex;
					align-items:center;
					width:260px;">

			<label style="width:60px;
						  font-weight:700;">
				단가
			</label>

			<input type="number"
				   name="unitPrice"
				   style="width:150px;
				   		  height:34px;
				   		  border:1px solid #ccc;
				   		  border-radius:4px;
				   		  padding:0 10px;">
		</div>

		<!-- 거래처 -->
		<div style="display:flex;
					align-items:center;
					width:420px;">

			<label style="width:100px;
						  font-weight:700;">
				거래처
			</label>

			<select name="itemVendor"
					style="width:250px;
						   height:34px;
						   border:1px solid #ccc;
						   border-radius:4px;
						   padding:0 10px;">

				<c:forEach var="vendor" items="${vendors}">
					<option value="${vendor.vendorId}">
						${vendor.vendorName}
					</option>
				</c:forEach>
			</select>
		</div>

		<!-- 보관방법 -->
		<div style="width:100%;">

			<label style="display:block;
						  margin-bottom:10px;
						  font-weight:700;">
				보관방법
			</label>

			<textarea name="itemStorage"
					  style="width:100%;
							 height:140px;
							 border:1px solid #ccc;
							 border-radius:4px;
							 padding:12px;
							 resize:none;
							 box-sizing:border-box;"></textarea>
		</div>

	</form>

</div>