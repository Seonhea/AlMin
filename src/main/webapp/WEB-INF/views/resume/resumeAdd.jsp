<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/resources/assets/images/logo/favicon.png"
	type="image/x-icon">
<link rel="stylesheet"
	href="<c:url value="/resources/assets/css/almin.css"/>">
<title>이력서 등록</title>
<Style>
	
	.resumeform{
	margin-left:150px;
	margin-right:150px;
	margin-bottom:60px;
	}
	button{
	width:100px;
	
	color:gray;
	}
	.single-input{
		width:500px;
	}
</Style>
</head>
<body>
<div class="resumeform">
<header>
		<c:import url="/WEB-INF/views/template/header.jsp" />
</header>
	<section>
	<c:if test="${!empty msg}">

		<script>
			alert("${msg}");

			<c:remove var="msg"/>
		</script>

	</c:if>
	 <form action="addres" method="post">
	<h1>이력서 등록</h1>
    <br>
    <div id="logininfo">
        <strong>개인기본정보</strong>
        <span>가입 시 등록한 개인정보를 한번 더 확인해주세요.</span><br>
        
       <input type="text" name="memberId" value="${sessionScope.loginInfo.memberId}" readonly><br><strong>님의 알바의 민족</strong>
        
    </div>
    <br>
    <hr>
    
    
   <!-- 	<div id="resumePhoto">
   	<strong>이력서 사진</strong><br>
   	 <input type="file" name="resumePhoto"><br>
   	 </div> -->
   	 <!-- <div id="dropbox" >
   	 <strong>사진</strong><br>
   	  <span id="droplabel" >이곳에 파일을 드랍주세요.</span>
   	
   		<img id="preview" name="resumePhoto" alt="[미리보기 표시]"/> -->
   		<div id="dropbox">
   			<input type="file" name="resumePhoto" onchange="setThumbnail(event);"/>
   			<div class="fileEmpty" id="preView"></div>

   		</div>
   	 <br>
        <div id="resumeTitle">
            <strong>이력서 제목</strong><br>
            <input type="text" name="resumeTitle" class="single-input" placeholder="제목을 입력해주세요." maxlength="12"><br>
        </div>
        <div id="resumePhone">
            <strong>전화번호</strong><br>
            <input type="text" name="resumePhone" class="single-input" placeholder="연락받으실 연락처 입력해주세요.">
        </div>
        <strong>지역</strong><br>
        <div id="jobDistrictNo" class="default-select">
            <select name="jobDistrictNo">
                <option value="1">경기도</option>
                <option value="2">인천</option>
                <option value="3">대전</option>
                <option value="4">대구</option>
                <option value="5">부산</option>
                <option value="6">울산</option>
                <option value="7">광주</option>
                <option value="8">강원</option>
                <option value="9">세종</option>
                <option value="10">충북</option>
                <option value="11">충남</option>
                <option value="12">경북</option>
                <option value="13">경남</option>
                <option value="14">전북</option>
                <option value="15">전남</option>
                <option value="16">제주</option>
                <option value="17">전국</option>
                <option value="18">서울</option>
            </select><br>
        </div>
        <strong>학력</strong><br>
        <div id="educationNo" class="default-select">
            
            <select name="educationNo">
            	<option value="0">무관</option>
                <option value="1">초등학교</option>
                <option value="2">중학교</option>
                <option value="3">고등학교</option>
                <option value="4">대학(2,3년)</option>
                <option value="5">대학(4년)</option>
                <option value="6">대학원</option>
            </select>
            <br>
        </div>
        <strong>경력</strong><br>
        <div id="careers" class="default-select">
            
            <select name="jobTypeNo">
            	<option value="0">무관</option>
                <option value="1">외식/음료</option>
                <option value="2">유통/판매</option>
                <option value="3">문화/여가</option>
                <option value="4">서비스</option>
                <option value="5">사무/회계</option>
                <option value="6">고객상담</option>
                <option value="7">생산/건설/인력</option>
                <option value="8">IT/미디어</option>
                <option value="9">교육/강사/학원</option>
                <option value="10">디자인</option>
                <option value="11">배달/운전</option>
                <option value="12">병원/간호</option>
            </select>
            <select name="periodNo" class="default-select">
            	<option value="0">무관</option>
                <option value="1">1주일</option>
                <option value="2">1주일~1개월</option>
                <option value="3">1개월~3개월</option>
                <option value="4">3개월~6개월</option>
                <option value="5">6개월~1년</option>
                <option value="6">1년이상</option>
            </select>
            
        </div>
        <br>
        	<br>
            <input type="text" name="jobCareers" class="single-input" placeholder="담당했던 업무 입력해주세요.">
            <br>
        <div id="resumePublicYn">
            <input type="radio" name="resumePublicYn" value="Y">공개
            <input type="radio" name="resumePublicYn" value="N">비공개
        </div>
        <br>
        <button class="template-btn">등록</button>
        </form>
    </div>
    
    </section>
   
    <footer>
		<c:import url="/WEB-INF/views/template/footer.jsp" />
	</footer>
	
	<script>
	function setThumbnail(event) { 
		var reader = new FileReader();
		reader.onload = function(event) { 
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			document.querySelector("div#preView").appendChild(img); 
			}; 
			reader.readAsDataURL(event.target.files[0]);
			}
    </script>
</body>
</html>