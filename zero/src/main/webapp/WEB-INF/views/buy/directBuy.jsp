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
<title>구매 페이지</title>
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
    	<section class="size-all buy bg-dg">
                <form method="post">
                <div class="size15 buy-box">
                    <div class="buy-title">
                        <h2 class="font-noto">상품 주문하기</h2>
                        <p class="main-color2">배송 및 결제정보를 입력합니다.</p>
                    </div>
                    <div class="buy-ing">
                        <div class="buy-ing-box font-noto">
                            <div class="buy-ing-num">
                                <div class="bin-num main-color2">1</div>
                                <div class="bin-text main-color2">장바구니</div>
                            </div>
                            <div class="buy-ing-arrow">〉</div>
                            <div class="buy-ing-num">
                                <div class="bin-num bg-main3">2</div>
                                <div class="bin-text main-color2">주문서 작성</div>
                            </div>
                            <div class="buy-ing-arrow text-c">〉</div>
                            <div class="buy-ing-num">
                                <div class="bin-num main-color2">3</div>
                                <div class="bin-text main-color2">완료</div>
                            </div>
                        </div>
                    </div>
                    <div class="buy-menu">
                        <div class="buy-menu-title">
                            <h4 class="main-color font-noto">주문 예정인 상품</h4>
                        </div>
                        <div class="buy-menu-col">
                            <div></div>
                            <div>상품</div>
                            <div>수량</div>
                            <div>가격</div>
                            <div>배송일</div>
                        </div>
                        <div class="buy-menu-list">
                        </div>

                     
                     
                        <div class="buy-menu-price font-noto">
                            <div class="bmp-left">
                                <div>상품 합계 <span class="main-color2 bmp-sum">원</span></div>
                                <div>+</div>
                                <div>배송비 <span class="main-color2 bmp-del">원</span></div>
                            </div>
                            <div class="bmp-right">
                                <p class="bmp-right-p">총 합계</p>
                                <p class="bmp-right-price bmp-final main-color2">원</p>
                                <input type="hidden" class="bmp-final" id="">
                            </div>
                        </div>

                        <script>
                            $(document).ready(function (){
                            	
                            	var list = ${product}
                            	var quan = ${quan}
                            	console.log("컨트롤러 제이슨 데이터: ", list);
                                var product_quan_price = 0;
                                var final_price;
                                var del_price = 3900;
                                
                                
                                	var now = new Date();
                                	  var year = now.getFullYear();
                                	  var month = now.getMonth()+1;
                                	  var date = now.getDate()+3;
                                	  /* 
                                	  console.log(now);
                                	  console.log(month); */

                                	  var del_date = year+"년 "+month+"월 "+date+"일 ";
                                	
                                	
                                    var buyTemplate = `
                                    <div class="buy-menu-content">
                                        <div class="bmc-img">
                                            <img src="/img/\${list.product_img1}" style="width: 100%;">
                                        </div>
                                        <div class="bmc-name fw-200">\${list.product_name}</div>
                                        <div class="bmc-quan fw-200">\${quan}</div>
                                        <div class="bmc-price fw-200">\${list.product_price}</div>
                                        <div class="bmc-delDate fw-200">\${del_date}</div>
                                    </div>
                                    `;

                                    $('.buy-menu-list').append(buyTemplate);
                                    product_quan_price = product_quan_price + (quan * list.product_price);

                                
                                if(product_quan_price > 50000) {
                                    final_price = product_quan_price;
                                    del_price = 0;
                                }
                                else final_price = product_quan_price + del_price

                                $('.bmp-sum').text(product_quan_price+' 원');
                                $('.bmp-del').text(del_price+' 원');
                                $('.bmp-final').text(final_price+' 원');
                                $('.bmp-final').val(final_price+' 원');


                                // id는 선우 너가 설정하는게 편할거 같아서 일부러 공란 처리했어.
                                // 구매자 정보 이름 인풋에 보낼 데이터 처리 $('#').val()
                                // 구매자 정보 이메일 인풋에 보낼 데이터 처리 $('#').val()
                                // 구매자 정보 휴대전화 번오에 보낼 데이터 처리 $('#').val()
                            });
                       
                        </script>
                    </div>

                    <div class="buy-info">
                        <div class="buy-menu-title border-btm pd-20">
                            <h4 class="main-color font-noto">어디로 보내드릴까요?</h4>
                        </div>
                        <div class="buy-info-buyer font-noto">
                            <p class="bib-title main-color2 border-btm">구매자 정보 (보내는 사람)</p>
                            <div class="bib-contents">
                                <div class="bib-content">
                                    <div class="bib-c-title bg-main3">
                                        이름
                                    </div>
                                    <div class="bib-c-input">
                                        <input type="text" value="${member.member_username }" id="name">
                                    </div>
                                    <div class="bib-c-text fw-200 main-color">주문하신 분의 성함을 입력해주세요</div>
                                </div>
                                <div class="bib-content">
                                    <div class="bib-c-title bg-main3">
                                        이메일
                                    </div>
                                    <div class="bib-c-input">
                                        <input type="text" value="${member.member_email }" id="email">
                                    </div>
                                    <div class="bib-c-text fw-200 main-color">주문하신 분의 이메일을 입력해주세요</div>
                                </div>
                                <div class="bib-content">
                                    <div class="bib-c-title bg-main3">
                                        휴대전화 번호
                                    </div>
                                    <div class="bib-c-phone">
                                        <input type="text" value="${phone1 }" id="phone1">
                                        <input type="text" value="${phone2 }" id="phone2">
                                        <input type="text" value="${phone3 }" id="phone3">
                                    </div>
                                    <div class="bib-c-text fw-200 main-color">주문하신 분의 전화번호를 입력해주세요</div>
                                </div>
                            </div>

                            <div class="buy-info-buyer font-noto">
                                <p class="bib-title main-color2 border-btm">받는 사람 정보</p>
                                <div class="bib-contents">
                                    <div class="bib-content">
                                        <div class="bib-c-title bg-main3">
                                            배송지 목록
                                        </div>
                                        <div class="bib-c-radio">
                                            <input type="radio" id="bib-c-radio1" checked><label>새로운 배송지</label>
                                            <input type="radio" id="bib-c-radio2"><label>구매자와 동일</label>
                                        </div>

                                        <script>
                                            $(document).ready(function (){
                                                $('#bib-c-radio2').on('click',function (){
                                                    
                                                	var name = $("#name").val();
                                                	var email = $("#email").val();
                                                	var phone1 = $("#phone1").val();
                                                	var phone2 = $("#phone2").val();
                                                	var phone3 = $("#phone3").val();
                                                	var add = '<c:out value="${member.member_address}" />';
                                                	var addDetail = '<c:out value="${member.member_address_detail}" />';
                                                	
                                                    $('#bib-c-radio1').prop('checked',false);
                                                    $("#del_name").val(name);
                                                    $("#del_email").val(email);
                                                    
                                                    $("#del_phone1").val(phone1);
                                                    $("#del_phone2").val(phone2);
                                                    $("#del_phone3").val(phone3);
                                                    
                                                    $("#del_add").val(add);
                                                    $("#del_addDetail").val(addDetail);
                                                    
                                                });
                                                $('#bib-c-radio1').on('click',function (){
                                                    
                                                    $('#bib-c-radio2').prop('checked',false);
                                                    $("#del_name").val("");
                                                    $("#del_email").val("");
                                                    
                                                    $("#del_phone1").val("");
                                                    $("#del_phone2").val("");
                                                    $("#del_phone3").val("");
                                                    $("#del_add").val("");
                                                    $("#del_addDetail").val("");
                                                });
                                                
                                                
                                            })
                                        </script>

                                        <div class="bib-c-text fw-200 main-color"></div>
                                    </div>
                                    <div class="bib-content">
                                        <div class="bib-c-title bg-main3">
                                            이름
                                        </div>
                                        <div class="bib-c-input">
                                            <input type="text" value="" id="del_name">
                                        </div>
                                        <div class="bib-c-text fw-200 main-color">안전한 배송을 위해 받는 분의 성함을 정확히 입력해주세요</div>
                                    </div>
                                    <div class="bib-content">
                                        <div class="bib-c-title bg-main3">
                                            이메일
                                        </div>
                                        <div class="bib-c-input">
                                            <input type="text" value="" id="del_email">
                                        </div>
                                        <div class="bib-c-text fw-200 main-color">받는 분의 이메일을 입력해주세요</div>
                                    </div>
                                    <div class="bib-content">
                                        <div class="bib-c-title bg-main3">
                                            휴대전화 번호
                                        </div>
                                        <div class="bib-c-phone" id="phones">
                                            <input type="text" value="" id="del_phone1">
                                            <input type="text" value="" id="del_phone2">
                                            <input type="text" value="" id="del_phone3">
                                        </div>
                                        <div class="bib-c-text fw-200 main-color">받는 분의 전화번호를 입력해주세요</div>
                                    </div>
                                    <div class="bib-content bib-addr">
                                        <div class="bib-c-title bg-main3" style="height: 280px; line-height: 280px;">
                                            배송지 주소
                                        </div>
                                        <div class="bib-c-text-box" style="height: 280px;">
                                            <div class="bib-addr-search bg-main3" style="border:none">우편번호 찾기</div>
                                            <input type="text" class="bib-addr-info" id="del_add" disabled>
                                            <input type="text" id="del_addDetail" placeholder="상세주소를 입력해주세요.">
                                            <p>※ 제주도 및 도서지역의 경우 지정하신 배송일보다 2~3일 더 소요됩니다.</p>
                                        </div>
                                        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                                        <script>
                                            $(document).ready(function (){
                                                $('.bib-addr-search').on('click',function (){
                                                    new daum.Postcode({
                                                        oncomplete: function(data) {
                                                            $('.bib-addr-info').val(data.address);
                                                        }
                                                    }).open();
                                                })
                                            
                                            })
                                        </script>
                                    </div>
                                    <div class="bib-content">
                                        <div class="bib-c-title bg-main3">
                                            배송 요청사항
                                        </div>
                                        <div class="bib-c-input">
                                            <input type="text" value="" placeholder="배송시 요청사항을 입력해주세요." id="">
                                        </div>
                                        <div class="bib-c-text fw-200 main-color"></div>
                                    </div>
                                    <div class="bib-content bib-addr">
                                        <div class="bib-c-title bg-main3" style="height: 500px; line-height: 500px;">
                                            선물 메세지
                                        </div>
                                        <div class="bib-c-text-box" style="height: 500px;">
                                            <p>다른 분께 보내드리는 선물인가요?</p>
                                            <p>아래 메세지를 입력하시면 받는 분께 선물 메세지를 문자로 보내드립니다.</p>
                                            <input type="checkbox" id="bib-check"><label>네 선물입니다!</label>
                                            <input type="text" placeholder="보내는 분 이름" id="" disabled>
                                            <input type="text" placeholder="받는 분 이름" id="" disabled>
                                            <input type="text" placeholder="받는 분 휴대폰 번호를 입력해주세요." id="" disabled>
                                            <textarea placeholder="받는 분께 선물과 함께 보내드리고 싶은 메세지" id="" disabled></textarea>
                                        </div>

                                        <script>
                                            $(document).ready(function (){
                                                var bib_checked = document.getElementById('bib-check');
                                                $('#bib-check').on('click',function (){
                                                    if(bib_checked.checked == true) $('.bib-c-text-box input[type=text], .bib-c-text-box textarea').attr("disabled", false);
                                                    else $('.bib-c-text-box input[type=text], .bib-c-text-box textarea').attr("disabled", true);
                                                });
                                            })
                                        </script>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="buy-perchase">
                        <div class="buy-menu-title border-btm pd-20">
                            <h4 class="main-color font-noto">구매하기</h4>
                        </div>
                        <div class="buy-info-buyer font-noto buy-contents">
                            <p class="bib-title main-color2 border-btm">결제하기</p>
                            <div class="buy-perchase-price">
                                <div class="bpp-left">
                                    <div>상품합계</div>
                                    <div class="main-color bmp-sum">원</div>
                                    <div>+</div>
                                    <div>배송비</div>
                                    <div class="main-color bmp-del">원</div>
                                </div>
                                <div class="bpp-right">
                                    <p>총 결제금액</p>
                                    <h1 class="bmp-final">0000원</h1>
                                </div>
                            </div>
                            <div class="buy-purchase-tool">
                                <div class="bpt-title bg-main3">결제 방식</div>
                                <div class="bpt-right">
                                    <input type="radio" checked><label>신용카드</label>
                                    <input type="radio"><label>가상계좌 입금</label>
                                    <input type="radio"><label>휴대폰 결제</label>
                                </div>
                            </div>
    
                            <p class="bib-title main-color2 border-btm mt20">약관동의</p>
                            <div class="buy-agree">
                                <div class="buy-agree-contents">
                                    <pre>
    
        <strong>개인정보 판매자 제공에 동의합니다.</strong>
    
        미래식당은 회원님께서 구매하신 상품 및 서비스의 원활한 제공을 위해 
        최소한의 범위 내에서 아래와 같이 제3자에게 정보를 제공합니다.
        그 밖의 사항은 미래식당 이용약관 및 개인정보 취급방침에 따릅니다.
    
        ※ 동의 거부권 등에 대한 고지
        고객님께서는 정보제공에 동의하지 않으실 수 있으며,
        동의하지 않으실 경우 구매가 제한됩니다.
    
        제공받는자 : 상품 공급업체
        제공목적 : 구매자확인, 상품배송, 서비스제공 등
        제공정보 : 구매자 정보(성명, 주소, 전화번호, 휴대전화 번호)
        수취인 정보(성명, 주소, 전화번호, 휴대전화 번호)
        상품정보
        보유 및 이용기간 : 상품 구매 후 5년
    
                                    </pre>
                                </div>
                                <div class="buy-agree-check">
                                    <input type="checkbox" id="agree"><label>개인정보 판매자 제공에 동의합니다.</label>
                                </div>
                            </div>
                        </div>
                        <div class="buy-button-div font-noto">
                            <button class="buy-button bg-main3">결제하기</button>
                            <div class="bb-border-sub">결제가 안되시나요? 도와드릴게요!</div>
                            <div class="bb-border">상담하러 가기</div>
                        </div>
                    </div>
                </div>
                </form>
            </section>
	<%@ include file="/WEB-INF/views/headerFooter/footer.jsp"%>
	</div>
	
	<script>
		$(document).ready(function(){
			
			$(".buy-agree-check label").on("click",function(){
				
				if($("input[id='agree']").is(":checked") == false) 
				$("input:checkbox[id='agree']").prop("checked", true);
				else
					$("input:checkbox[id='agree']").prop("checked", false);
			});
			
			$(".buy-button").on("click", function(e){
				e.preventDefault();
				
				var list = ${product}
				var product_no = list.product_no;
            	var quan = ${quan}
            	var member_no = '<c:out value="${principal.member.member_no}" />';
            	
            	console.log(product_no);
            	console.log(quan);
            	console.log(member_no);
            	
            	var name = $("#del_name").val(); 
				var email = $("#del_email").val();
				var phone = [];
					
				for(var i=0; i<3; i++) {
					phone[i] = $("#phones input").eq(i).val();
				}
				
				var add = $("#del_add").val();
				var add_det = $("#del_addDetail").val();
				
				if(name == "") {
					alert("수취인의 이름을 입력해주세요.");
					$("#del_name").focus();
					return false;
				} else if(email == "") {
					alert("이메일을 입력해주세요.");
					$("#del_email").focus();
					return false;
				} else if(phone[0] == "" || phone[1] == "" || phone[2] == "") {
					alert("전화번호를 입력해주세요.");
					$("#phones input").eq(0).focus();
					return false;
				} else if(add == "" || add_det == "") {
					alert("주소를 확인해주세요.");
					$("#del_add").focus();
					return false;
				} else if($("input[id='agree']").is(":checked") == false) {
					alert("약관에 동의해주세요.");
					$("input[id='agree']").focus();
					return false;
				}
            	
            	location.href="/buy/direct?product_no="+product_no+"&member_no="+member_no+"&product_quantity="+quan;
			});
		});
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