<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세</title>
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
            <section class="bg-dg size-all ptb-30">
                <div class="size15 products-view">
                    <div class="products-view-main">
                        <div class="products-view-title">
                            <div class="pvt-top font-my">
                                <h1>${product.product_name }</h1>
                                <h5>${product.product_type }</h5>
                            </div>
                            <div class="pvt-stars">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="far fa-star"></i>
                            </div>
                        </div>
                        <div class="pv-main-img">
                            <img src="/img/${product.product_img1 }" width="100%">
                        </div>
                        <div class="pv-main-tab">
                            <div class="tab-intro pv-tab">메뉴 소개</div>
                            <div class="tab-comment tab">제로평</div>
                            <div class="tab-del tab">배송 및 규정</div>
                            <div class="tab-question tab">질문과 답변</div>
                        </div>

                        <div class="pv-intro">
                            <div class="pv-intro-top">
                                <h5>지금 주문하면 <span style="color: rgb(220, 20, 113);">${month }월 ${day}일(${days })</span> 부터 받아보실 수 있어요!</h5>
                                <h6>판매자 직배송 상품입니다.</h6>
                            </div>
                            <img src="/img/${product.product_img2 }" width="85%">
                            <div class="pv-intro-text">
                                <h5 class="strong">주문하기 전에</h5>
                                <h5>● 받으시면 이틀 이내 드셔야 합니다. 냉장보관하세요.</h5>
                                <h5>● 집에서 요리해서 드셔야하는 메뉴입니다. 누구나 쉽게 요리할 수 있습니다.</h5>
                            </div>
                        </div>
                        <div class="pv-comment"></div>
                        <div class="pv-del"></div>
                        <div class="pv-question"></div>
                        <div class="clear"></div>
                    </div>

                    <div class="products-view-purchase bg-dg">
                        <div class="for-sticky bg-dg">
                            <div class="pvp-top">
                                <div class="pvp-price-box">
                                    <p class="main-color2">판매 가격</p>
                                    <div>
                                        <h4 class="font-noto strong">${product.product_price } 원 ~</h4>
                                        <p class="c-dg">상품 가격의 1% 적립</p>
                                    </div>
                                </div>
                                <div class="pvp-price-box">
                                    <p class="main-color2">배송비</p>
                                    <div>
                                        <h5 class="font-noto strong main-color">3900 원 ~</h5>
                                        <p class="main-color">이 식당에서 같은 날짜에 50,000원 이상 구매 시 무료</p>
                                    </div>
                                </div>
                                <div class="pvp-select-box">
                                    <div class="pvp-select-menu">
                                        <p>메뉴 선택하기</p>
                                        <select class="menu-select">
                                        	<option value="${product.product_price }">메뉴를 선택해주세요</option>
                                            <option value="${product.product_price }">기본</option>
                                        </select>
                                    </div>
<!--                                     <div class="pvp-select-day">
                                        <p>배송 도착일 선택하기</p>
                                        <select>
                                            <option value="0">배송일을 선택해주세요</option>
                                            <option value="0">0월 0일 0요일</option>
                                            <option value="0">0월 0일 0요일</option>
                                        </select>
                                    </div> -->
                                    <div class="pvp-select-menu">
                                        <p>배송비 선택하기</p>
                                        <select class="deli-select">
                                            <option value="0">배송 방식을 선택해주세요.</option>
                                            <option value="3900">전국 택배 (3900원)</option>
                                        </select>
                                    </div>
                                    <div class="pvp-select-number pvp-off">
                                        <p>수량 선택하기</p>
                                        <div class="menu-button bg-dg">
                                            <div><i class="far fa-times-circle close-button"></i></div>
                                            <div class="menu-button-text">
                                                <p class="menu-button-name">${product.product_name }</p>
                                                <h6 class="menu-button-day">${month }월 ${day }일</h6>
                                            </div>
                                            <div class="menu-button-icons">
                                                <i class="fas fa-minus-circle minus-button"></i>
                                                <p class="menu-button-num">1</p>
                                                <i class="fas fa-plus-circle plus-button"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="pvp-price">
                                    <div><p>총 결제 금액</p></div>
                                    <div><h4 class="pvp-price-content strong font-noto">0 원</h4></div>
                                </div>

                                <script>
                                    var deli_price;
                                    var menu_price;
                                    var menu_price2;
                                    var total_price;
                                    $(document).ready(function (){
                                        $('.pvp-select-menu select').on('click',function (){
                                            deli_price =  Number($('.deli-select option:selected').val());
                                            menu_price =  Number($('.menu-select option:selected').val());
                                            total_price = deli_price+menu_price;
                                            console.log(total_price);
                                            if(total_price>=50000) total_price = total_price - 3900;
                                            $('.pvp-price-content').text(`\${total_price} 원`);
                                            
                                            $(".menu-select option:eq(0)").prop("selected", true);

                                        })

                                        $('.menu-select').on('change',function(){
                                            $('.pvp-select-number').removeClass('pvp-off');
                                            menuNum = 1;
                                            $('.menu-button-num').text(menuNum);
                                        });
                                        
                                        $(".deli-select").on("click", function(){
                                        	menuNum = 1;
                                        	$('.menu-button-num').text(menuNum);
                                        });

                                        $('.close-button').on('click',function (){
                                            $('.pvp-select-number').addClass('pvp-off');
                                            total_price = 0;
                                            $('.pvp-price-content').text(`\${total_price} 원`);
                                            
                                            menuNum = 1;
                                            $('.menu-button-num').text(menuNum);
                                        })

                                        var menuNum = $('.menu-button-num').text();
                                        menuNum = Number(menuNum);
                                        var menu_price2;
                                        $('.minus-button').on('click',function (){
                                            if(menuNum==1){
                                                menuNum = 1;
                                            } else {
                                                menuNum --;
                                                menu_price2 = menuNum * menu_price;
                                                if(menu_price2>=50000){
                                                    total_price = menu_price2;
                                                } else {
                                                    total_price = menu_price2 + deli_price;
                                                }
                                                $('.menu-button-num').text(menuNum);
                                                $('.pvp-price-content').text(`\${total_price} 원`);
                                            }
                                        });

                                        $('.plus-button').on('click',function (){
                                            menuNum ++;
                                            menu_price2 = menuNum * menu_price;
                                            if(menu_price2>=50000){
                                                total_price = menu_price2;
                                            } else {
                                                total_price = menu_price2 + deli_price;
                                            }

                                            $('.menu-button-num').text(menuNum);
                                            $('.pvp-price-content').text(`\${total_price} 원`);
                                        });
                                    });
                                </script>
                            
                                <div class="pvp-buttons">
                                    <div class="pvp-cart">장바구니에 담기</div>
                                    <div class="pvp-purchaseGo bg-main3">바로 주문하기</div>
                                    <div class="pvp-naverPay bg-green">N pay 구매</div>
                                </div>
                            </div>
                            
                            <div class="pvp-bottom">
                                <p>친구에게 공유하기</p>
                                <div class="pvp-icons">
                                    <div class="pvp-kakao bg-yellow"><i class="fas fa-comment c-brown"></i></div>
                                    <div class="pvp-facebook bg-blue"><i class="fab fa-facebook-f"></i></div>
                                    <div class="pvp-link bg-gray"><i class="fas fa-link"></i></div>
                                    <div class="pvp-mail bg-skyblue"><i class="fas fa-envelope"></i></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
    
            <script>
                $(window).on('scroll', function (){
                    var scr = $(window).scrollTop();
                    if(scr > 134){
                        $('.pvp-price-box').addClass('pvp-price-box-none');
                        $('.for-sticky').addClass('sticky-on');
                        console.log('안녕 ');
                    }else{
                        $('.pvp-price-box').removeClass('pvp-price-box-none');
                        $('.for-sticky').removeClass('sticky-on');
                    }
                });
            </script>
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