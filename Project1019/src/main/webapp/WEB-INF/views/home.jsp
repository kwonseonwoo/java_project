<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Zero</title>
	<link rel="stylesheet" href="resources/css/reset.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
		integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="resources/css/main.css">
</head>

<body>
	<div class="wrap">
		<div class="search-modal search-off">
			<div class="search-box">
				<h4>검색<span onclick="searchOff()">X</span></h4>
				<div class="search-div">
					<input type="text" class="search-input" placeholder="메뉴명이나 상점명을 입력해주세요" ><i class="fas fa-search fa-2x"></i>
				</div>
				<div class="search-contents">
					<h4 class="main-color">제로식당 제안 메뉴</h4>
					<div></div>
				</div>
			</div>
		</div>
		
		<div class="header">
			<div class="nav-top">
				<div class="nav-top-contents">
					<div class="input-div">
						<i class="fas fa-search"></i><input type="text" class="nav-input"placeholder="상품명 검색" onclick="searchClick()">
					</div>

					<script>
						const searchClick = function(){
							$('.search-modal').removeClass('search-off');
						}

						const searchOff = function(){
							$('.search-modal').addClass('search-off');
						}
					</script>

					<div class="logo"><a>
							<h4><i class="fab fa-stumbleupon-circle logo-color"></i> 제로식당</h4>
						</a></div>
					<div>
						<ul class="nav-top-ul">
							<li><a href="#n">고객센터</a></li>
							<li><a href="#n">로그인</a></li>
							<li><a href="#n">회원가입</a></li>
							<li id="nav-cart"><a href="#n"><i class="fas fa-shopping-cart"></i> 장바구니</a><span
									class="cart-num">0</span></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="nav-body">
				<div class="nav-body-contents">
					<ul class="nav-body-ul">
						<li class="hover-menu" id="hover-menu1"><a href="#n">인기</a></li>
						<li><a href="#n">신메뉴</a></li>
						<li><a href="#n">선물</a></li>
						<li class="hover-menu" id="hover-menu2"><a href="#n">카테고리</a></li>
						<li id="nav-special"><a href="#n">제로식철학</a></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="section"></div>

		<div class="footer">
			<div class="footer-top">
				<div class="footer-left">
					<h2 class="font-my main-color">제로식당</h2>
					<div class="footer-left-contents">
						<span><a href="#n">
								<h5 class="ft-con">문의/상담하기</h5>
							</a></span>
						<span><a href="#n">
								<h5 class="font-my"><a href="#n">@제로식당</a></h5>
							</a></span>
					</div>
					<p>상담 운영 시간 : 오전 10시 ~ 오후 17시 (주말, 공휴일 제회)</p>
				</div>
				<div class="footer-right">
					<div class="fr-content">
						<p class="main-color">제로 소개</p>
						<div><a href="#n">
								<h5>제로식당 철학</h5>
							</a></div>
					</div>
					<div class="fr-content">
						<p class="main-color">입점 문의</p>
						<div><a href="#n">
								<h5>파트너가 되면 좋은점</h5>
							</a></div>
						<div><a href="#n">
								<h5>입점 신청하기</h5>
							</a></div>
					</div>
					<div class="fr-content">
						<p class="main-color">제로식 소식 받아보기</p>
						<div><a href="#n">
								<h5>페이스북</h5>
							</a></div>
						<div><a href="#n">
								<h5>인스타그램</h5>
							</a></div>
					</div>
				</div>
			</div>
			<div class="footer-bottom">
				<div class="footer-bottom-left">
					<p>고객님의 안전거래를 위해 결제 시 저희 사이트에서 가입한 @@@ 구매안전 서비스를 이용하실 수 있습니다.</p>
					<p><span><a href="#n">이용약관</a></span><span><a href="#n">개인정보보호</a></span></p>
				</div>
				<div class="footer-bottom-right">
					<p><span>(주)제로투비즈니스그룹</span><span><strong>대표 : </strong>권김박</span><span><strong>사업자등록번호 : </strong>123-45-67890</span>
						<span><stron>사업장 소재지 : </stron>서울시 서대문구 거북골로 193</span><span><stron>대표번호 : </stron>0000-0000</span>
						<span><strong>이메일 : </strong>xxx96@naver.com</span></p>
				</div>
			</div>
		</div>

	</div>

	<!-- scripts -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</body>

</html>
