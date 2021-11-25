<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>

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
	
<style>
/* pv-comment */
.pv-comments{
    padding: 30px;
}

.pv-comments-content{
    display: grid;
    grid-template-columns: 1fr 7fr;
    grid-column-gap: 15px;
    padding: 20px 0;
    border-top: 1px solid rgb(172, 144, 107);
}

.pv-cc-img{
    height: 95px;
    border-radius: 50%;
    overflow: hidden;
}

.pv-cc-img img{
    height:100%;
    object-fit: cover;
}


.pv-cc-text p, .pv-cc-text div{
    margin: 10px 5px;
}

.pv-cc-text p{
    font-size: 14px;
}

.pv-cc-text p strong{
    font-size: 16px;
    margin-right: 10px;
}

.pv-cc-stars{
    color: goldenrod;
    font-size: 20px;
}

.none{
   display: none;
}

</style>
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
                            <div class="pvt-stars" style="display:inline-block;">
                                <i class="fas fa-star"></i>
                                <!-- <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="far fa-star"></i> -->
                            </div>
                            
                            <c:choose>
                            	<c:when test="${average ne null}">
                            		<div class="pvt-top font-my" style="display:inline-block; margin-left: 10px;">
                            			<h3>${average}</h3>
                            		</div>
                            	</c:when>
                            	
                            	<c:when test="${average eq null}">
                            		<div class="pvt-top font-my" style="display:inline-block; margin-left: 10px;">
                            			<h3>0.0</h3>
                            		</div>
                            	</c:when>
                            </c:choose>
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

                        <div class="pv-intro pv-tab-view">
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
						
						<c:choose>
						<c:when test="${empty principal }">
                        	<div class="pv-comments pv-tab-view">
                        		<h5 class="log" style="text-align:center; margin-bottom:30px; font-weight:bold; cursor:pointer;">리뷰를 작성하려면 로그인을 해주세요.</h5>
                        	</div>						
						</c:when>
						<c:otherwise>
							<div class="pv-comments pv-tab-view">
                          		<div class="pv-comments-button bg-main3">리뷰작성하기</div>
                        	</div>	
						</c:otherwise>
                        </c:choose>
                        


                        <div class="pv-del pv-tab-view">
                        	<div class="pv-del-contents">
                                <div class="pv-del-title font-my main-color2">
                                    <h3>배송 안내</h3>
                                </div>
                                <div class="pv-del-content">
                                    <p>● 배송비 3,900원이 추가됩니다.</p> 
                                    <p>● 12:00시(정오) 까지 주문 시 당일 발송, 이후 주문 시 다음날 발송되어 다다음날 도착합니다.</p> 
                                    <p>● 금요일 12:00시(정오) 부터 일요일까지의 주문은 월요일에 발송되어 화요일에 도착합니다.</p> 
                                    <p>● 일부 도서 산간 지역은 배송에 이틀 이상이 소요될 수 있습니다.</p> 
                                    <img src="deliver.jpg" width="100%">
                                </div>
                            </div>
                            <div class="pv-del-contents">
                                <div class="pv-del-title font-my main-color2">
                                    <h3>제로 식당의 세 가지 약속</h3>
                                </div>
                                <div class="pv-del-content pv-promise">
                                    <div>
                                        <h5><strong>제식 요원들이 직접 먹어본 음식만 소개합니다.</strong></h5>
                                        <p>전국 팔도의 맛집을 찾아 직접 맛본 뒤 엄선하여 소개해 드리겠습니다.</p>
                                    </div>
                                    <div>
                                        <h5><strong>소중한 사람에게 주고 싶은 음식을 소개합니다.</strong></h5>
                                        <p>좋은 식재료와 윤리적인 절차로 만들어진 음식만을 소개합니다.</p>
                                    </div>
                                    <div>
                                        <h5><strong>지역 식당의 고유성을 존경합니다.</strong></h5>
                                        <p>그들의 정신과 맛들 고객에게 충실히 전하기 위해 노력합니다.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="pv-question pv-tab-view"></div>
                        <div class="re-modal off">
                            <form method="post">
                                <div class="re-modal-contents">
                                    <div class="rmc-info">
                                        <h5 class="usna">고객명: ${principal.member.member_username }</h5>
                                    </div>
                                    <div class="rmc-info rmc-member">
                                        <h5>제품명: ${product.product_name }</h5>
                                        <h5>구입 날짜: (미정)</h5>
                                        <h5>가격: ${product.product_price } 원</h5>
                                    </div>
                                    <div class="rmc-info rmc-stars">
                                        <div class="star bg-tr" id="star1">★</div>
                                        <div class="star bg-tr" id="star2">★</div>
                                        <div class="star bg-tr" id="star3">★</div>
                                        <div class="star bg-tr" id="star4">★</div>
                                        <div class="star bg-tr" id="star5">★</div>
                                        <input type="hidden" name="review_score" value="" class="review-rate">
                                    </div>
                                    <script>
                                        var star_rate;
                                        $(document).ready(function (){
                                            for(let i=0; i<5; i++){
                                                $('.star').eq(i).on('click',function (event){
                                                    $(this).parent().children('div').removeClass('star-on');
                                                    $(this).addClass('star-on').prevAll('div').addClass('star-on');
                                                    star_rate = event.target.id[4];
                                                    $('.review-rate').val(star_rate);
                                                })
                                            }
                                        })

                                    </script>

                                    <div class="rmc-text">
                                        <textarea class="rmc-textarea" name="review_content" placeholder="리뷰를 작성해주세요."></textarea>
                                    </div>
                                    <div class="rmc-button">
                                        <button class="submit-button bg-main3">확인</button>
                                        <div class="back-button border-main3">취소</div>
                                        <div class="delete-button border-main3">삭제</div>
                                    </div>

                                </div>
                            </form>
                        </div>
                    </div>
                    <script>
                        $(document).ready(function (){
                            for(let i=0; i<4; i++){
                                $(".pv-main-tab div").eq(i).on('click',function (){
                                    $(".pv-main-tab div").removeClass('pv-tab');
                                    $(".pv-main-tab div").eq(i).addClass('pv-tab');
                                    $(".pv-tab-view").addClass('none');
                                    $(".pv-tab-view").eq(i).removeClass('none');
                                });
                            }
                        })
                    </script>

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
                                     <!-- <div class="pvp-select-day">
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
                                        
                                        
                                        var member_val = "<c:out value='${principal.member.member_no}' />";
                            			var product_val = "<c:out value='${product.product_no}' />";
                                        
                                		<!-- 장바구니 등록을 위한 script -->
                                		$(".pvp-cart").on("click", function(e){
                                			
                                			if(member_val == null || member_val == "") {
                                				alert("로그인을 해주세요.");
                                				return false;
                                			}
                                			
                                			console.log("카트 멤버 번호: ", member_val);
                                			console.log("카트 상품 번호: ", product_val);
                                			console.log("카트 상품 수량: ", menuNum);
                                			
                                			var content = {member_no: member_val,
                                						   product_no: product_val,
                                						   product_quantity: menuNum};
                                			
                                			cartAdd.add(content, function(result){
                                				alert(result);
                                			});
                                		});
                                        
                                		<!-- 바로 구매를 위한 script -->
                                		$(".pvp-purchaseGo").on("click", function(){
                                			
                                			if(member_val == null || member_val == "") {
                                				alert("로그인을 먼저 해주세요.");
                                				return false;
                                			} else {
                                				location.href="/buy/directBuy?product_no="+product_val+"&quantity="+menuNum;
                                			}
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
		
		
	<script type="text/javascript" src="/resources/js/reply.js"></script>
	
	<script>
		$(document).ready(function(){
			
			var product_noVal = '<c:out value="${product.product_no}" />';
			
			
			/* console.log(product_no); */
 			/* var ex = '<c:out value='${principal.member.member_username}' />'; */
			
			
			 replyService.getList({product_no:product_noVal}, function(list) {
				console.log("list: ", list);
				
				
				var commentView = list.forEach(function (a,j){
                    var imgNum = (a.review_no).toString();
                    imgNum = imgNum.charAt(imgNum.length-1);
                    for(let i=1; i<10; i++){
                        if(imgNum[-1] == i){
                            imgNum = i;
                        };
                    };
                    
                    var date = a.review_regDate.slice(0,10);    
                    
                    var commentTemplate = `
                        <div class="pv-comments-content">
                            <div class="pv-cc-img">
                            	<img src="/resources/img/profile\${imgNum}.jpg" alt="" >
                            </div>
                            <div class="pv-cc-text" onclick="getReview(\${a.review_no})" data-review_no="\${a.review_no}">
                                <p><strong>\${a.member_username}</strong> \${date}</p>
                                <div class="pv-cc-stars" id="pv-cc-stars\${j}">
                                	<div class="pv-cc-st" id="rate1">★</div>
                                	<div class="pv-cc-st" id="rate2">★</div>
                                	<div class="pv-cc-st" id="rate3">★</div>
                                	<div class="pv-cc-st" id="rate4">★</div>
                                	<div class="pv-cc-st" id="rate5">★</div>
                            	</div>
                                <div class="pv-cc-texts">\${a.review_content}</div> 
                            </div>
                        </div>
                    `;
                    $('.pv-comments').append(commentTemplate);
                    
                    for(let i=0; i<5; i++){
                        //stars는 별점 변수임.
                        if(a.review_score == i+1){
                            $(`#pv-cc-stars\${j}`).children().eq(i).addClass('pv-cc-st-on').prevAll('div').addClass('pv-cc-st-on');
                        }
                    }
                });
			});                

        	var review_con = $("textarea[name='review_content']");
        	var review_sco = $("input[name='review_score']");
        	
        	
        	/* 리뷰 작성하기 버튼 클릭 시 */
            $('.pv-comments-button').on('click',function (){
                $('.re-modal').removeClass('off');
                $(".submit-button").show();
                $(".delete-button").hide();
            });
        	
        	/* 리뷰 작성 모달 내 취소버튼 클릭 시*/
            $('.back-button').on('click',function (){
				$('.re-modal').addClass('off');
				$(".usna").html("고객명: ${principal.member.member_username }");
				 $(".rmc-textarea").val("");
            });
        	
        	/* 모달창 내 리뷰 등록 버튼 클릭 시 */
        	$(".submit-button").on("click",function(){
        		
        		var reply={product_no:product_noVal,
        				   review_content:review_con.val(),
        				   review_score:review_sco.val()};
        		
        		replyService.add(reply, function(result){
        			
        			alert(result);
        			review_con.val("");
        			$('.re-modal').addClass('off');
        			location.reload();
        		});
        	});
        	
        	$(".log").on("click", function(e){
        		e.preventDefault();
        		location.href="/auth/loginForm";
        	});
		
        });

		
	</script>
	
	<script>
		/* 댓글 조회 버튼 클릭 시*/
		function getReview(review_num) {
			var review_no = review_num;
			var session_member = "<c:out value='${principal.member.member_username}' />";
			console.log(review_no);
			console.log(session_member);
			
			replyService.get(review_no, function(reply){
				 console.log(reply.member_username);
				 
				 $(".usna").html("<h5>고객명: " + reply.member_username + "</h5>")
				 $(".rmc-textarea").val(reply.review_content);
				 
				 $(".re-modal-contents").data("review_no", reply.review_no);
/* 				 var rno = $(".re-modal-contents").data("review_no");
				 console.log("모달창 리뷰번호: ", rno); */

				 $(".submit-button").hide();
				 
				 if(session_member == reply.member_username) {
					 $(".delete-button").show();
				 } else {
					 $(".delete-button").hide();
				 }
				 
				 $('.re-modal').removeClass('off');
				 
			});
			
		}
		
		$(document).ready(function(){
			
			$(".delete-button").on("click",function(e){	
				
				var review_no= $(".re-modal-contents").data("review_no");
				console.log("모달창 리뷰번호: ", review_no);
				
				replyService.remove(review_no, function(result){
					alert(result);
					$('.re-modal').addClass('off');
					location.reload();
				});
			});
		});
	</script>
	
	<script>
		var cartAdd = (function(){
			
			function add(content, callback, error) {
				console.log("cart ajax execute!!!");
				
				$.ajax({
					type:'post',
					url:'/cart/new',
					data:JSON.stringify(content),
					contentType:"application/json; charset=utf-8",
					success:function(result, status, xhr) {
						if(callback) {
							callback(result);
						}
					},
					error:function(xhr, status, er) {
						if(error) {
							error(er);
						}
					}
				})
			}
			
			/* and add function */
			
			
			return {add:add}
		})();
	</script>
</body>
</html>