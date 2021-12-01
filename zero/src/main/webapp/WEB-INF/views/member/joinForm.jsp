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
<body>
	<div class="wrap" id="wrap">
	<%@ include file="/WEB-INF/views/headerFooter/header.jsp"%>
		<section class="join size-all bg-dg ">
                <div class="join-box">
                    <div class="join-title font-my">
                        <h4 class="join-title-text">회원가입</h4>
                    </div>
                    <div class="container">
                        <form>
                            <div class="form-group">
                                <label for="member_id">아이디</label> <input type="text" class="form-control" placeholder="아이디를 입력하세요" id="member_id">
                                <!-- <button id="btn-checkId" class="btn btn-primary">중복확인</button> -->
                            </div>
                            <div class="form-group">
                                <label for="member_password">비밀번호</label> <input type="password" class="form-control" placeholder="비밀번호를 입력하세요" id="member_password">
                            </div>
                            <div class="form-group">
                                <label for="member_username">사용자 이름</label> <input type="text" class="form-control" placeholder="사용자 이름을 입력하세요" id="member_username">
                            </div>
                            <div class="form-group">
                                <label for="member_email">이메일 주소</label> <input type="text" class="form-control" placeholder="abc@abc.com" id="member_email">
                            </div>
                            <div class="form-group">
                                <label for="member_phone">전화번호</label> <input type="text" class="form-control" placeholder="010-0000-0000" id="member_phone">
                            </div>
                            <div class="form-group fg-address-box">
                                <div class="fg-address-div"><div>주소</div><div class="fg-address">우편번호 찾기</div></div>
                                <input type="text" class="form-control fg-address-info" id="member_address" placeholder="우편번호 찾기를 눌러주세요." disabled>
                                <input type="hidden" class="form-control fg-address-info" id="member_address_no">
                                <input type="text" class="form-control" id="member_address_detail" placeholder="상세주소를 입력하세요.">
                            </div>
                            <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                            <script>
                                $(document).ready(function (){
                                    $('.fg-address').on('click',function (){
                                        new daum.Postcode({
                                            oncomplete: function(data) {
                                                $('.fg-address-info').val(data.address);
                                            }
                                        }).open();
                                    })
                                
                                })
                            </script>
                            <div class="form-group">
                                <label for="member_reference">Reference</label> <input type="text" class="form-control" placeholder="Enter Reference" id="member_reference">
                            </div>
                        </form>
                        <button id="btn-save" class="join-button bg-main3 font-noto">회원가입</button>
                        <script src="/js/member.js"></script>
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

