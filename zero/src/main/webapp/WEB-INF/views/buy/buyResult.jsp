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
<title>주문완료페이지</title>
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
    	<section class="size-all bg-dg buyResult">
            <div class="buyResult-title font-noto">
                <p class="brt-left"><strong id="buy-date">2021.10.26</strong> 주문</p>
                <p class="brt-right" id="buy-number">주문번호 300100300100</p>
            </div>
            <div class="buyResult-box">
                <div class="brb-price brb">
                    <div class="brb-title">
                        <p class="font-noto">결제 정보</p>
                    </div>
                    <div class="brb-price-contents">
                        <div class="brb-price-val">
                            <p class="">상품총가격</p>
                            <p class="price_count" id="buy-product-price">10,000원</p>
                        </div>
                        <div class="brb-price-del">
                            <p class="">배송비</p>
                            <p class="del_price" id="buy-del-price">3,900원</p>
                            <input type="hidden" class="del_price_option" value="">
                        </div>
                    </div>
                    <div class="brb-final">
                        <div class="brb-final-price">
                            <p class="">총 결제금액</p>
                            <p class="total" id="buy-final-price">13,900원</p>
                        </div>
                    </div>
                </div>
                <div class="brb-del brb">
                    <div class="brb-title">
                        <p class="font-noto" id="buy-user">${member.member_username }</p>
                    </div>
                    <div class="brb-del-contents">
                        <p id="buy-addr"><span style="font-weight:bold;">주소 </span><br><br>
                        	${member.member_address }
                        	${member.member_address_detail }
                        </p>
                        <p id="buy-phone"><span style="font-weight:bold;">전화번호</span><br><br>
                        ${member.member_phone }</p>
                    </div>
                    <div class="brb-final brb-del-contents">
                        <p>배송요청사항</p>
                        <p id="buy-request">부재시 문 앞에 놓아주세요.</p>
                    </div>
                </div>
                <div class="brb-product">
                    <div class="brb-title">
                        <p>배송완료</p>
                        <p id="buy-del-date" class="main-color2"></p>
                    </div>
                    <div class="brb-product-contents">
                    </div>
                    <div class="brb-buttons">
                        <div class="brb-back">교환, 반품 신청</div>
                        <div class="brb-del-search">배송조회</div>
                    </div>
                </div>
                <!-- <div class="buy-delete last-button">주문내역 삭제</div> -->
                <div class="buy-back last-button">목록으로</div>
            </div>
            
            <script>
                $(document).ready(function (){
                	
                	var list = ${order_data}
                	console.log("list", list);
                	
						
						var data = new Date(list[0].order_date);
						
						//도착 날짜 계산
						var year = data.getFullYear();
						var month = data.getMonth()+1;
						var day = data.getDate()+3;
						
						var yoil = getDay(list[0].order_date);
						
						//도착 날짜
						var result = year + "." + month + "." + day + " (" + yoil + ") 도착";

					 
					 $("#buy-del-date").html(result);
                	
                    var buyResultView = list.forEach((a)=>{
                        var buyResultTemplate = `
                            <div class="brb-product-content">
                                <div class="brb-img">
                                    <img src="/img/\${a.product_img1}" width="100%">
                                </div>
                                <div class="brb-product-text">
                                    <p id="buy-product-name">\${a.product_name} <span buy-product-num>\${a.product_quantity} 개</span></p>
                                    <p id="buy-each-price">\${a.product_price} 원</p>
                                </div>
                            </div>
                            <div class="buy-after last-button" onclick="review(\${a.product_no})">구매후기 쓰기</div>
                        `;
                        $('.brb-product-contents').append(buyResultTemplate);
                    });                        
                    
                    
                    var price = 0;
                    var price_quan = 0;
                    
                    for(var i=0; i<list.length; i++) {
                    	price = list[i].product_price * list[i].product_quantity;
                    	price_quan = price_quan + price;
                    }
                    
                    var del = 3900;
                    var del_data = $(".del_price_option");
                    
                    $(".price_count").html(price_quan+" 원");
                    
                    if(price_quan >= 50000) {
                    	$(".del_price").html("무료 배송");
                    	del_data.val(0);
                    	var total = price_quan + parseInt(del_data.val());
                    	console.log(del_data.val());
                    	 $(".total").html(total+" 원")
                    	
                    } else {
                    	$(".del_price").html(del+" 원");
                    	del_data.val(del);
                    	var total = price_quan + parseInt(del_data.val());
                    	console.log(del_data.val());
                    	 $(".total").html(total+" 원")
                    }
                    
                    var date = new Date(list[0].order_date);
                    
                    var year = date.getFullYear();
                    var month = date.getMonth()+1;
                    var day = date.getDate();
                    
                    var days = getDays(list[0].order_date);
                    
                    console.log(year);
                    console.log(month);
                    console.log(day);
                    
                    var result = year + "." + month + "." + day + " (" + days + ")";
					                    
                    $("#buy-date").html(result);
                    
                   $("#buy-number").html("주문번호 " + list[0].order_no);
                    

                    $('.buy-back').on('click',function (){
                        history.go(-1);
                    });

                    // $('#buy-date').text(); 안에 구매날짜 넣으면 됨
                    // $('#buy-number').text(); 안에 구매번호 넣으면 됨
                    // $('#buy-product-price').text(); 안에 물건 가격 넣으면 됨
                    // $('#buy-del-price').text(); 안에 배송비 넣으면 됨
                    // $('#buy-final-price').text(); 안에 총 가격 넣으면 됨
                    // $('#buy-user').text(); 안에 유저 네임 넣으면 됨
                    // $('#buy-addr').text(); 안에 배송주소 넣으면 됨
                    // $('#buy-phone').text(); 안에 전화번호 넣으면 됨
                    // $('#buy-request').text(); 안에 요청사항 넣으면 됨
                    // $('#buy-del-date').text(); 안에 배송도착일자 넣으면 됨
                });
            </script>
        </section>
	<%@ include file="/WEB-INF/views/headerFooter/footer.jsp"%>
	</div>
	
	<script>
		$(document).ready(function(){
			
			$(".brb-back").on("click",function(){
				alert('준비중입니다.');
				return;
			});
			
			$(".brb-del-search").on("click",function(){
				alert("준비중입니다.");
				return;
			});
			
			$(".buy-back").on("click",function(){
				var member_no = "<c:out value='${principal.member.member_no}' />"; 
				location.href="/myPage/myPage?member_no="+member_no;
			});
			
		});
		
		function review(product_no) {
			var product_no = product_no;
			
			location.href="/productView/productView/?product_no="+product_no;
		}
	</script>
	
	<script>
	function getDay(day) {
	    
	    var week = new Array('일', '월', '화', '수', '목', '금', '토');
	    
	    var data = new Date(day).getDay()+3;
	    
 	    	if(data == 7) {
	    		data = 0;
	    	}else if(data == 8) {
	    		data = 1;
	    	}else if(data == 9) {
	    		data = 2;
	    	}
 	    	
	    var result = week[data];
	    
	    return result;
	}

	function getDays(day) {
	    
	    var week = new Array('일', '월', '화', '수', '목', '금', '토');
	    
	    var data = new Date(day).getDay();
 	    	
	    var result = week[data];
	    
	    return result;
	}

	</script>
	
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