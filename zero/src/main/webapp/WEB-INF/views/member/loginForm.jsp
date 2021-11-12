<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인기 메뉴 리스트</title>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/main.css">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
</head>
<!-- <div class="container">
	<form action="/auth/loginProc" method="post">
		<div class="form-group">
			<label for="member_id">ID</label>
			 <input type="text" name="username"class="form-control" placeholder="Enter ID" id="member_id">
		</div>
		<div class="form-group">
			<label for="member_password">Password</label>
			 <input type="password" name="password" class="form-control" placeholder="Enter password" id="member_password">
		</div>
		<button id="btn-login" class="btn btn-primary">로그인</button>
	</form>
</div> -->
<body>
	<div class="wrap" id="wrap">
	<%@ include file="/WEB-INF/views/headerFooter/header.jsp"%>
		<section class="login size-all bg-dg ">
                <div class="login-box">
                    <div class="login-title font-my">
                        <h4>로그인하기</h4>
                    </div>
                    <div class="login-contents mr-s20 mt50">
                    	<form action="/auth/loginProc" method="post">
	                        <div class="login-main">
	                            <div class="login-main-content">
	                                <p>아이디 *</p>
	                                <input class="max-input" type="text" autofocus placeholder="아이디를 입력하세요." name="username" id="member_id">
	                            </div>
	                            <div class="login-main-content">
	                                <p>비밀번호 *</p>
	                                <input class="max-input" type="password" name="password" placeholder="비밀번호를 입력하세요." id="member_password">
	                            </div>
	                            <div class="login-main-content lmc1">
	                                <input type="checkbox">
	                                <p class="login-checkbox">아이디 기억하기</p>
	                            </div>
	                            <div class="login-main-content">
	                                <button class="max-button login-button bg-main3">로그인하기</button>
	                            </div>
	                        </div>
                        </form>
                        
                        <div class="login-sub">
                            <div class="login-button-box">
                                <button class="login-sub-button max-button bg-blue"><a href="https://www.facebook.com/login.php?skip_api_login=1&api_key=986571901368829&kid_directed_site=0&app_id=986571901368829&signed_next=1&next=https%3A%2F%2Fwww.facebook.com%2Fv2.8%2Fdialog%2Foauth%3Fclient_id%3D986571901368829%26redirect_uri%3Dhttps%253A%252F%252Fmeesig.com%252Fsocial%252Fcallback%252Ffacebook%26state%3D125%26cartCount%3D0%26welcomePoint%3D300%26ret%3Dlogin%26fbapp_pres%3D0%26logger_id%3D6646564b-efa9-4b04-a944-7bb8eccb87a3%26tp%3Dunspecified&cancel_url=https%3A%2F%2Fmeesig.com%2Fsocial%2Fcallback%2Ffacebook%3Ferror%3Daccess_denied%26error_code%3D200%26error_description%3DPermissions%2Berror%26error_reason%3Duser_denied%26state%3D125%23_%3D_&display=page&locale=ko_KR&pl_dbl=0">페이스북 계정으로 로그인하기</a></button>
                                <button class="login-sub-button max-button bg-green"><a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=wZX7RDtDO372wI67aEUc&redirect_uri=https%3A%2F%2Fmeesig.com%2Fsocial%2Fcallback%2Fnaver%3F&state=102&cartCount=0&welcomePoint=300">네이버 계정으로 로그인하기</a></button>
                                <button class="login-sub-button max-button bg-yellow"><a class="c-bk" href="https://accounts.kakao.com/login?continue=https%3A%2F%2Fkauth.kakao.com%2Foauth%2Fauthorize%3FwelcomePoint%3D300%26encode_state%3D1159%26response_type%3Dcode%26cartCount%3D0%26redirect_uri%3Dhttps%253A%252F%252Fmeesig.com%252Fsocial%252Fcallback%252Fkakao%26client_id%3D3031a6b98fb1286ee31f0b5e9e674dfb%26state%3D159">카카오 계정으로 로그인하기</a></button>
                            </div>
                            <div class="login-sub-contents main-color">
                                <div class="go-signup">
                                    <p>아직 미래식당 회원이 아니세요?</p>
                                    <p><a href="/auth/joinForm" class="main-color3">회원가입하기</a></p>
                                </div>
                                <div class="go-search">
                                    <p>로그인 정보가 기억나지 않으세요?</p>
                                    <p><a href="#n" class="main-color3">비밀번호 찾기</a> / <a href="#n" class="main-color3">아이디 찾기</a></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                </div>
    	</section>
    	<%@ include file="../headerFooter/footer.jsp"%>
	</div>		
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>

</body>
</html>

