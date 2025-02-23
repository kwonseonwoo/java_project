<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Zero</title>
	<link rel="stylesheet" href="resources/css/reset.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
		integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="resources/css/headerFooter.css">
	<link rel="stylesheet" href="resources/css/main.css">

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<style>
		@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&family=Nanum+Myeongjo:wght@400;700&display=swap');
		html, body, div, span, applet, object, iframe,
		h1, h2, h3, h4, h5, h6, p, blockquote, pre,
		a, abbr, acronym, address, big, cite, code,
		del, dfn, em, img, ins, kbd, q, s, samp,
		small, strike, strong, sub, sup, tt, var,
		b, u, i, center,
		dl, dt, dd, ol, ul, li,
		fieldset, form, label, legend,
		table, caption, tbody, tfoot, thead, tr, th, td,
		article, aside, canvas, details, embed, 
		figure, figcaption, footer, header, hgroup, 
		menu, nav, output, ruby, section, summary,
		time, mark, audio, video {
			margin: 0;
			padding: 0;
			border: 0;
			vertical-align: baseline;
			-webkit-touch-callout: none; 
			user-select: none; 
			-moz-user-select: none; 
			-ms-user-select: none; 
			-webkit-user-select: none;
		
		}
		
		h1,h2,h3,h4,h5,p {
		    rotate: (0.03deg);
		}
		
		body {
			line-height: 1;
		 	padding: 0;
		  	margin: 0;
		    background-color: darkgray;
		}
		
		button{
		    cursor: pointer;
		    background-color: #eee;
		    border: none;
		}
		
		div, button, span, input, textarea, a, nav, article, section, form, table, tr, td, th{
		    box-sizing: border-box;
		}
		
		span{
		    display: inline;
		}
		
		
		a{
		    text-decoration-line: none;
		    text-decoration: none;
		    cursor: pointer;
		    color: white;
		}
		
		a:hover{
		    color: rgb(235, 217, 193);
		}
		
		/* header*/
		.header{
		    width: 100%;
		    height: auto;
		}
		
		.nav-top{
		    width: 100%;
		    height: auto;
		    padding: 25px 0 0px 0;
		}
		
		.nav-top-contents{
		    margin: 0 auto;
		    width: 100%;
		    max-width: 1150px;
		    display: flex;
		    justify-content: space-between;
		    align-items: center;
		    position: relative;
		}
		
		.nav-input{
		    border: 1px solid rgb(187, 179, 179);
		    border-radius: 50px;
		    padding: 0 10px 0 35px;
		    width: 90%;
		    height: 35px;
		    background-color: rgb(20, 20, 20);
		    font-size: 13px;
		}
		
		input::placeholder{
		    color: rgb(235, 217, 193);
		}
		
		.input-div{
		    display: flex;
		    position: relative;
		}
		
		.input-div i{
		    position: absolute;
		    left: 13px;
		    color: rgb(235, 217, 193);
		}
		
		.logo{
		    position: absolute;
		    left: 41%;
		    top: -10px;
		    letter-spacing: 3px;
		}
		
		.logo h4 i{
		    font-size: 35px;
		    position: relative;
		    top:4px;
		}
		
		.logo-color{
		    color: rgb(235, 217, 193);
		}
		
		
		.nav-top-contents div{
		    align-items: center;
		    margin-bottom: 10px;
		}
		
		.nav-top-ul{
		    display: flex;
		    flex-direction: row;
		}
		
		.nav-top-ul li{
		    font-size: 14px;
		    margin-left: 25px;
		}
		
		#nav-cart a i{
		    color: rgb(235, 217, 193);
		    margin-right: 5px;
		}
		
		#nav-cart{
		    padding: 0 10px;
		}
		
		#nav-cart:before{
		    content: "|";
		    float: left;
		    display:block;
		    position: relative;
		    left:-15px;
		    top:-4px;
		    font-size: 20px;
		    color: rgb(204, 193, 180);
		}
		
		.cart-num{
		    display: inline-block;
		    padding: 2px 10px;
		    margin-left: 5px;
		    background-color: rgb(189, 158, 118);
		    text-align: center;
		    font-size: 6px;
		    font-weight: 700;
		    border-radius: 8px;
		    position: relative;
		    top: -1px;
		}
		
		.nav-top::after{
		   content:"";
		   display: block;
		   border-bottom: 1px solid rgb(235, 217, 193);
		   position: relative;
		   top: 5px;
		}
		
		.nav-body{
		    margin-top: 20px;
		    width: 100%;
		    height: 40px;
		    padding: 0;
		}
		
		.nav-body-contents{
		    margin: 0 auto;
		    width: 100%;
		    height: 40px;
		    max-width: 1150px;
		    align-items: center;
		    position: relative;
		    padding: 0;
		}
		
		.nav-body-ul{
		    width: 45%;
		    height: 100%;
		    display: flex;
		    flex-direction: row;
		    align-items: center;
		    margin: 0 auto;
		    position: relative;
		    left: -25px;
		    justify-content: space-between;
		    padding: 0;
		}
		
		.nav-body-ul li{
		    font-family: 'Nanum Myeongjo', serif;
		    font-size: 16px;
		    letter-spacing: 4px;
		    padding: 0 15px;
		    height: 30px;
		    align-items: center;
		}
		
		#nav-special{
		    margin-left: 20px;
		    position: relative;
		    top:0px;
		    
		}
		
		#nav-special a{
		    color: rgb(204, 193, 180);
		}
		
		#nav-special a:hover{
		    color: rgb(231, 224, 216);
		}
		
		#nav-special::before{
		    content: "|";
		    float: left;
		    display:block;
		    position: relative;
		    left:-27px;
		    top:-1px;
		    font-size: 23px;
		    color: rgb(204, 193, 180);
		}
		
		
		
		/* footer */
		.footer{
		    width: 100%;
		    margin: 0 auto;
		    max-width: 1150px;
		    bottom: 0;
		    padding: 50px 0;
		    border-top: 1px solid rgb(231, 224, 216);
		}
		.footer h2 {
		    padding: 10px 0 20px 0;
		}
		
		.footer h5 {
		    font-size: 18px;
		    padding: 10px 0;
		}
		
		.footer p {
		    font-size: 13px;
		    word-break:keep-all;
		    line-height: 180%;
		}
		
		.footer-top{
		    width: 100%;
		    max-width: 1150px;
		    margin: 0 auto;
		    display: flex;
		    justify-content: space-between;
		    padding-bottom: 70px;
		}
		
		.footer-left{
		    width: 35%;
		}
		
		.footer-left h1{
		    margin-bottom: 10px;
		}
		
		.footer-left-contents{
		    display: flex;
		}
		
		.footer-left-contents span{
		    margin-right: 10px;
		    margin-bottom: 5px;
		}
		
		.footer-right{
		    width: 40%;
		    display: flex;
		    justify-content: space-between;
		}
		
		.footer-bottom{
		    width: 100%;
		    max-width: 1150px;
		    margin: 0 auto;
		    padding-top: 20px;
		    display: flex;
		    justify-content: space-between;
		}
		
		.footer-bottom-right{
		    border-top: 1px solid rgb(231, 224, 216);
		    padding-top: 20px;
		    width: 40%;
		}
		
		.footer-bottom-right p span{
		    margin: 5px;
		}
		
		.footer-bottom-right p span::after{
		    content: "|";
		    position: relative;
		    left: 5px;
		    color: rgb(231, 224, 216);
		}
		
		.footer-bottom-left{
		    border-top: 1px solid rgb(231, 224, 216);
		    padding-top: 20px;
		    width: 35%;
		}
		
		.footer-bottom-left p span{
		    margin-right: 20px;
		    font-weight: 700;
		}
		
		.footer-bottom-left p span::after{
		    content: "|";
		    position: relative;
		    left: 10px;
		    color: rgb(231, 224, 216);
		}
		
		.search-modal{
		    z-index: 10;
		    width: 100vw;
		    position: fixed;
		    padding: 100px 0;
		    background-color: rgb(85, 85, 85);
		}
		
		.search-box{
		    margin: 0 auto;
		    width: 100%;
		    max-width: 1150px;
		    position: relative;
		    background-color: rgb(85, 85, 85);
		}
		
		.search-box h4{
		    margin-bottom: 30px;
		    font-size: 18px;
		    letter-spacing: 2px;
		}
		
		.search-box h4 span{
		    position: absolute;
		    right: 0;
		    cursor: pointer;
		    color: darkgray;
		}
		
		.search-div{
		    display: flex;
		    margin-bottom: 20px;
		}
		
		.search-div i{
		    position: absolute;
		    right: 5px;
		    top: 70px;
		    color: darkgray;
		}
		
		.search-input{
		    width: 100%;
		    height: 60px;
		    padding: 15px 0;
		    background-color: none;
		    border: none;
		    border-bottom: 1px solid darkgray;
		    background-color: rgb(85, 85, 85);
		    font-size: 35px;
		    color: darkgray;
		}
		
		.search-input::placeholder{
		    color: darkgray;
		}
		
		.search-input:focus{
		    outline: none;
		}
		
		.search-off{
		    display: none;
		}
		
		.bg-none{
			background-color: transparent;
		}
		
		.bg-gray{
			background-color: darkgray;
		}
		
		
		.search-contents{
		    background-color: rgb(85, 85, 85);
		}	
	</style>
</head>

<body>
	<div class="wrap">
            <div class="footer">
                <div class="footer-top">
                    <div class="footer-left">
                        <h2 class="font-my main-color">제로식당</h2>
                        <div class="footer-left-contents">
                            <span><a href="#n">
                                    <h5 class="ft-con">문의/상담하기 <span>| 카카오톡</span></h5>
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
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</body>

</html>