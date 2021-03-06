<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/resources/assets/images/logo/favicon.png"
	type="image/x-icon">
<link rel="stylesheet"
	href="<c:url value="/resources/assets/css/almin.css"/>">
<title>인재정보</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
.nice-select span.current {
	line-height: 0;
}

.job-text {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.tab {
	color: #1FA5FD;
}
</style>
</head>
<body>
	<header>
		<c:import url="/WEB-INF/views/template/header.jsp" />
	</header>

	<!-- Job Single Content Starts -->
	<section class="job-single-content section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="jobs-tab tab-item">
						<h4 class="tab listTitle">인재정보&emsp;</h4>
					</div>
					<div id="here"></div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-8">

					<c:if test="${empty applicants}">
						<div class="more-job-btn mt-5 text-center">
							<input type="button" class="template-btn" onclick="search()"
								id="btnshow" value="목록으로 돌아가기">
						</div>
					</c:if>

					<c:forEach var="item" items="${applicants}">
						<div class="main-content">
							<div class="single-content1">
								<div class="single-job mb-4 d-lg-flex justify-content-between">
									<div class="job-text">
										<h4>${item.resumeTitle}</h4>${item.memberId}
										<ul class="mt-4">
											<li class="mb-3"><h5>
													<i class="fa fa-map-marker"></i>
												</h5></li>
										</ul>
										<button class="genric-btn primary small"
											onclick="location.href='${pageContext.request.contextPath}/resumes/resume?resumeNo=${item.resumeNo}'">상세보기</button>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>

				</div>
				<div class="col-lg-4">
					<form id="searchApplicant">
						<div class="sidebar mt-5 mt-lg-0">
							<div class="single-item mb-4">
								<h4 class="mb-4">지역</h4>
								<div class="default-select">
									<select name="jobDistrictNo">
										<option value="100">무관</option>
										<option value="1">경기</option>
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
									</select>
								</div>
							</div>
							<div class="single-item mb-4">
								<h4 class="mb-4">성별</h4>
								<div class="default-select">
									<select name="memberGender">
										<option value="0">무관</option>
										<option value="F">여</option>
										<option value="M">남</option>
									</select>
								</div>
							</div>
							<div class="single-item mb-4">
								<h4 class="mb-4">경력</h4>
								<div class="default-select">
									<select name="careersNo">
										<option value="0">무관</option>
										<option value="1">1주일</option>
										<option value="2">1주일~1개월</option>
										<option value="3">1개월~3개월</option>
										<option value="4">3개월~6개월</option>
										<option value="5">6개월~1년</option>
										<option value="6">1년 이상</option>
									</select>
								</div>
							</div>
							<div class="single-item mb-4">
								<h4 class="mb-4">학력</h4>
								<div class="default-select">
									<select name="educationNo">
										<option value="0">무관</option>
										<option value="1">초등학교</option>
										<option value="2">중학교</option>
										<option value="3">고등학교</option>
										<option value="4">대학(2,3년)</option>
										<option value="5">대학(4년)</option>
										<option value="6">대학원</option>
									</select>
								</div>
							</div>
							<div class="more-job-btn mt-5 text-center">
								<input type="button" class="template-btn" onclick="search()"
									id="btnSearch" value="검색" />
									<input type="button"
									class="template-btn" onclick="location.href='${pageContext.request.contextPath}/applicants'"
									value="전체보기" />
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<!-- Job Single Content End -->

	<footer>
		<c:import url="/WEB-INF/views/template/footer.jsp" />
	</footer>

	<script>
	function search(){
		$("#searchApplicant").attr("action","${pageContext.request.contextPath }/applicants").attr("method","get").submit();
	}
	</script>
	<script>
        function btnshow(){
        	  if($('#dis').css('display') == 'none'){
            $('#btnshow').hide();
        }else{
            $('#btnshow').show();
        	}
        }
    </script>
	<c:if test="${!empty msg}">
		<script>
			alert("${msg}");
			<c:remove var="msg"/>
		</script>
	</c:if>
	
	<c:if test="${!empty alist}">
		<script>
		function isNull(obj) {
			   return (typeof obj != "undefined" && obj != null && obj != "") ? false : true;
		}
		
		var jobDistrictNo="${alist.jobDistrictNo}";
		var memberGender="${alist.memberGender}";
		var careersNo="${alist.careersNo}";
		var educationNo="${alist.educationNo}";
		var searchHtml = "";
		var isSearchResult = false;
		if(!isNull(jobDistrictNo)){
			isSearchResult = true;
			switch(jobDistrictNo){
			case "1":
				searchHtml += " #경기";
				break;
			case "2":
				searchHtml += " #인천";
				break;
			case "3":
				searchHtml += " #대전";
				break;
			case "4":
				searchHtml += " #대구";
				break;
			case "5":
				searchHtml += " #부산";
				break;
			case "6":
				searchHtml += " #울산";
				break;
			case "7":
				searchHtml += " #광주";
				break;
			case "8":
				searchHtml += " #강원";
				break;
			case "9":
				searchHtml += " #세종";
				break;
			case "10":
				searchHtml += " #충북";
				break;
			case "11":
				searchHtml += " #충남";
				break;
			case "12":
				searchHtml += " #경북";
				break;
			case "13":
				searchHtml += " #경남";
				break;
			case "14":
				searchHtml += " #전북";
				break;
			case "15":
				searchHtml += " #전남";
				break;
			case "16":
				searchHtml += " #제주";
				break;
			case "17":
				searchHtml += " #전국";
				break;
			case "18":
				searchHtml += " #서울";
				break;
			default:
				searchHtml += "";
				break;
			}
		}
		if(!isNull(memberGender)){
			isSearchResult = true;
			switch(memberGender){
			case "0":
				searchHtml += "";
				break;
			case "F":
				searchHtml += " #여";
				break;
			case "M":
				searchHtml += " #남";
				break;
			default:
				searchHtml += "";
				break;
			}
		}
		if(!isNull(careersNo)){
			isSearchResult = true;
			switch(careersNo){
			case "0":
				searchHtml += "";
				break;
			case "1":
				searchHtml += " #1주일 ";
				break;
			case "2":
				searchHtml += " #1주일~1개월";
				break;
			case "3":
				searchHtml += " #1개월~3개월";
				break;
			case "4":
				searchHtml += " #3개월~6개월";
				break;
			case "5":
				searchHtml += " #6개월~1년";
				break;
			case "6":
				searchHtml += " #1년 이상";
				break;
			default:
				searchHtml += "";
				break;
			}
		}
		if(!isNull(educationNo)){
			isSearchResult = true;
			switch(educationNo){
			case "0":
				searchHtml += "";
				break;
			case "1":
				searchHtml += " #초등학교 ";
				break;
			case "2":
				searchHtml += " #중학교";
				break;
			case "3":
				searchHtml += " #고등학교";
				break;
			case "4":
				searchHtml += " #대학(2,3년)";
				break;
			case "5":
				searchHtml += " #대학(4년)";
				break;
			case "6":
				searchHtml += " #대학원";
				break;
			default:
				searchHtml += "";
				break;
			}
		}
		if(isSearchResult){
			$("#here").html(searchHtml);
		}
		</script>
	</c:if>
</body>
</html>