<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<!-- Page Title -->
<title>신고 공고 목록</title>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Favicon -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/resources/assets/images/logo/favicon.png"
	type="image/x-icon">

<!-- CSS Files -->
<link rel="stylesheet"
	href="<c:url value="/resources/assets/css/almin.css"/>">

<style>
.topleft>ul>li>h4 {
	padding-right: 20px;
	padding-bottom: 20px;
}

.jobs-area {
	min-height: 60%;
	padding-bottom: 200px;
}

.job-text>p {
	margin-top: 10px;
	margin-bottom: 10px;
}

.d-toggle {
	display: none;
}

button {
	border: 0;
	outline: 0;
	background-color: transparent
}

.jobs-area {
	padding-bottom: 350px;
}

.reportItem {
	padding-top: 3px;
	padding-bottom: 3px;
}

#rlist {
	padding-left: 10px;
}

#reasonbtn{
	margin-top: 6px; 
	margin-bottom: 6px; 
}
</style>

</head>
<body>
	<!-- Preloader Starts -->
	<div class="preloader">
		<div class="spinner"></div>
	</div>
	<!-- Preloader End -->

	<c:import url="/WEB-INF/views/template/header.jsp" />

	<!-- Body Area Starts -->
	<section class="jobs-area section-padding3">
		<div class="container">

			<div class="topleft">
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item"><h4>
							<a class="nav-link" id="home-tab"
								href="${pageContext.request.contextPath }/admins" role="tab"
								aria-controls="home" aria-selected="true">회원조회</a>
						</h4></li>
					<li class="nav-item"><h4>
							<a class="nav-link active" id="profile-tab"
								href="${pageContext.request.contextPath }/report" role="tab"
								aria-controls="profile" aria-selected="false">의심공고</a>
						</h4></li>
				</ul>
			</div>


			<div class="row">
				<div class="col-lg-12">
					<div class="tab-content" id="myTabContent">
						<div class="tab-pane fade show active" id="recent" role="tabpanel"
							aria-labelledby="home-tab">
							<div class="single-job mb-4 d-lg-flex justify-content-between">
								<div class="job-text">
									<c:forEach var="item" items="${reportview}">
										<div class="reportItem">
											<hr style="border: 1px color= silver;" width="90%">
											<button onclick="myFunction(this)">${item.recruitTitle}</button>
											<div class="d-toggle" id="rlist">
												<div class="title" id="reportItem">${item.recruitCompanyId}<br>${item.recruitDate}</div>
												<div style="display: none" class="rt">${item.recruitNo}</div>
												<button class="genric-btn primary small"
													onclick="location.href='${pageContext.request.contextPath}/recruits/detailjobinfo?recruitNo=${item.recruitNo}'">공고보기</button>
												<button class="genric-btn primary small deletert">삭제</button>
												<button class="genric-btn primary small reason" id="reasonbtn"
													onclick="reason(this)">신고사유</button>
												<div class="d-toggle rlist">
													<div>
														통장,신분증,비밀번호를 요구하는 경우<span id="here_1"></span>
													</div>
													<div>
														유흥업소 및 불건전 업소<span id="here_2"></span>
													</div>
													<div>
														허위 사기성 내용<span id="here_3"></span>
													</div>
													<div>
														다단계 및 피라미드성 통신상품 판매 업체<span id="here_4"></span>
													</div>
													<div>
														최저임금 미만의 급여<span id="here_5"></span>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</section>
	<!-- Body Area End -->


	<!-- Footer Area Starts -->
	<footer>
		<c:import url="/WEB-INF/views/template/footer.jsp" />
	</footer>
	<!-- Footer Area End -->


	<!-- Javascript -->
	<script>
		function myFunction(targetEle) {
			console.log(targetEle);
			var $togggleEle = $(targetEle).next();
			$togggleEle.toggle();
		}
	</script>
	<script>
		function reason(targetEle) {
			var reasonlist = "";
			var rno = $(targetEle).parents().children(".rt").text();
			//var selectedVal = $(targetEle).next().children("id").split("_");
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/report/listreason",
				data : {
					recruitNo : rno
				},
				success : function(result) {
					console.log("신고 사유 목록");
					console.log(result);
					displayDiv_rlist(result, targetEle);
				},
				error : function(error) {
					alert('오류 발생. 오류 코드: ' + error.code);
				}
			});
			myFunction(targetEle);
		}
		function displayDiv_rlist(reasonlist, targetEle) {
			//$(targetEle).next().children("id").split("_");
			for (var i = 1; i < reasonlist.length + 1; i++) {
				$(targetEle).next().find("#here_" + i).html("");
				$(targetEle).next().find("#here_" + i).html(reasonlist[i - 1]);
			}
		}
	</script>
	<script>
		$(".deletert").click(deletert);

		function deletert() {
			var rt = $(this).prevAll(".rt").text();
			var $itemEle = $(this).parents(".reportItem");
			if (confirm('정말 삭제하시겠습니까?')) {
				$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/report/dereport",
					data : {
						rtno : rt
					},
					success : function(data) {
						if (data == "OK") {
							alert('공고가 삭제되었습니다.');
							$itemEle.remove();
						}
					},
					error : function(error) {
						alert('오류 발생. 오류 코드: ' + error.code);
					}
				});
			} else {
				return false;
			}
		}
	</script>
</body>
</html>
