<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="content">

    <div class="header-row">
        <div>
            <h2 class="page-title">섹션 수정</h2>
            <p class="page-subtitle">섹션 : ${secDTO.secId} | 창고 : ${secDTO.secWhName} (${secDTO.secWhId})</p>
        </div>

        <div>
            <p class="page-route">홈 > 창고 관리 > 섹션 > 수정</p>
        </div>
    </div>

    <form action="${pageContext.request.contextPath}/warehouse/section/update"
          method="post"
          enctype="multipart/form-data"
          class="grid-form">
		
		<div class="btn-row">
			<div class="left"></div>
			<div class="right">
				<a class="btn btn-white"
	               href="${pageContext.request.contextPath}/warehouse/section/detail?secId=${secId}">
	                취소
	            </a>
	
	            <button type="submit" class="btn btn-main">
	                등록
	            </button>
			</div>
		</div>
		
		<div class="grid-wrap">
			<div class="grid search-item">
				<label>섹션 수량</label>
				<input type="text" name="secQty" placeholder="섹션 수량 입력" value="${secQty}" required readonly>
			</div>
			
			<div class="grid search-item">
			</div>
		</div>
		
		<div class="search-item">
			<input type="hidden" name="secImg" value="${secDTO.secImg}">
			<input type="hidden" name="delImg" id="delImg" value="N">
			<label style="font-size: 13px; font-weight: 600; color: #555;">
	   			섹션 이미지 (선택)
	   		</label>
	   		<div style="display: flex; gap: 15px;">
				<input type="file" name="secImgFile" id="secImgFile" accept="image/*" style="display: none;">
				<input type="text" id="fileName" placeholder="선택된 파일 없음" readonly>
				<div style="display: flex; gap: 10px;">
					<label type="button" class="btn btn-main" for="secImgFile"
							style="color: white; font-size: 14px;">이미지 선택</label>
					<button type="button" class="btn btn-red" id="delImgBtn" onclick="delImg()">삭제</button>
				</div>
	   		</div>
			
			<div id="imgPreviewBox" style="display: none;">
		        <img id="previewImg" src="" alt="이미지 미리보기"
		        >
			</div>
			
			<div id="noImg"
			     style="font-size:12px; display: block; margin-top: 8px;">
			    등록된 사진 없음
			</div>
		</div>

    </form>

</div>

<style>
	/* ==============================
	   addImg
	============================== */
	
	#imgPreviewBox {
	    width: 100%;
	    display: none;
	    
	    align-items: center;
	    justify-content: flex-start;
	    overflow: hidden;
	    margin-top: 8px;
	}
	
	#noImg {
		padding: 0 15px;
	}
	
	#imgPreviewBox img {
	    display: none;
	    width: 80%;
	    height: 100%;
	    object-fit: cover;
	}
</style>

<script>
	window.addEventListener("load", () => {
		init();
	})
	
	function init() {
		bind();
	}
	
	function bind() {
		addImg();
	}
	
	function addImg() {
		const secImgFile = document.querySelector("#secImgFile");
		const previewImg = document.querySelector("#previewImg");
		const imgPreviewBox = document.querySelector("#imgPreviewBox");
		const noImg = document.querySelector("#noImg");
		const fileName = document.querySelector("#fileName");
		const delImg = document.querySelector("#delImg");

		secImgFile.addEventListener("change", function () {
		    const file = this.files[0];

		    if (!file) {
		        previewImg.src = "";
		        previewImg.style.display = "none";
		        imgPreviewBox.style.display = "none";
		        noImg.style.display = "block";
		        return;
		    }

		    if (!file.type.startsWith("image/")) {
		        alert("이미지 파일만 등록할 수 있습니다.");
		        this.value = "";
		        previewImg.src = "";
		        previewImg.style.display = "none";
		        imgPreviewBox.style.display = "none";
		        noImg.style.display = "block";
		        return;
		    }
		    
		    delImg.value = "N";

		    const reader = new FileReader();

		    reader.onload = function (e) {
		        previewImg.src = e.target.result;
		        imgPreviewBox.style.display = "flex";
		        previewImg.style.display = "block";
		        noImg.style.display = "none";
		        fileName.value = e.target.result;
		    };

		    reader.readAsDataURL(file);
		});
	}
	
	function delImg() {
		const secImgFile = document.querySelector("#secImgFile");
		const previewImg = document.querySelector("#previewImg");
		const imgPreviewBox = document.querySelector("#imgPreviewBox");
		const noImg = document.querySelector("#noImg");
		const fileName = document.querySelector("#fileName");
		const delImg = document.querySelector("#delImg");
		
		previewImg.src = "";
		previewImg.style.display = "none";
		imgPreviewBox.style.display = "none";
		secImgFile.value = "";
		noImg.style.display = "block";
		fileName.value = "";
		delImg.value = "Y";
	}

</script>
