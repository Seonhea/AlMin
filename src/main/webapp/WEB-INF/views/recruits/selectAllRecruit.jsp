<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap"
	rel="stylesheet">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공고 관리</title>
<!-- Favicon -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/assets/images/logo/favicon.png"
	type="image/x-icon">


<!-- CSS Files -->
<link rel="stylesheet"
	href="<c:url value="/resources/assets/css/almin.css"/>">
<style>
.active {
	color: #1fa5fd;
}

#rtitle {
	font-size: 18px;
}
</style>
</head>
<body>
	<header>
		<c:import url="/WEB-INF/views/template/header.jsp" />
	</header>

	<!-- Start blog-posts Area -->
	<section class="blog-posts-area section-padding">
		<div class="container">
			<div class="row">

				<div class="col-lg-8 post-list blog-post-list">
					<div class="single-post">

						<!-- Start comment-sec Area -->
						<section class="comment-sec-area py-5">


							<c:forEach var="item" items="${allRecruit}">
								<c:if test="${item.recruitTitle==null}">
									<div class="container">
										<div class="row flex-colum">
											<h5>
												회원님의 공고가 없습니다.<br>회원님만의 공고를 등록해주세요.
											</h5>
										</div>
									</div>
								</c:if>

								<div class="container">
									<div class="row flex-column">

										<div class="comment-list">
											<div class="single-comment justify-content-between d-flex">
												<div class="user justify-content-between d-flex">
													<div class="thumb"></div>
													<div class="desc">
														<h5>
															<a id="rtitle"
																href="${pageContext.request.contextPath}/recruits/detailjobinfo?recruitNo=${item.recruitNo}">${item.recruitTitle }</a>
														</h5>
														<p class="rno" style="display: none">${item.recruitNo}</p>
														<p class="date">${item.recruitDate}</p>
														<div class="reply-btn"></div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>

						</section>
						<!-- End comment-sec Area -->

					</div>
				</div>
				<div class="col-lg-4 sidebar mt-5 mt-lg-0">
					<div class="single-widget category-widget">
						<h4 class="title">마이페이지</h4>
						<ul>
							<li><a
								href="${pageContext.request.contextPath}/members/mypage"
								class="justify-content-between align-items-center d-flex">회원정보</a></li>
							<li><a
								href="${pageContext.request.contextPath}/applicants/myapplicants"
								class="justify-content-between align-items-center d-flex ">관심인재
							</a></li>
							<li><a
								href="${pageContext.request.contextPath}/recruits/myallrecruit"
								class="justify-content-between align-items-center d-flex "><span
									class="active">공고관리</span> </a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>

	<footer>
		<c:import url="/WEB-INF/views/template/footer.jsp" />
	</footer>
</body>
</html>