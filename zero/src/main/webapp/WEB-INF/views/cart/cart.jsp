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
<title>장바구니</title>
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
            <section class="products size15">
                <div class="carousel-title">
                    <h2 class="font-noto">장바구니</h1>
                </div>
                <div class="cart-box" >
                    <div class="cart-checkbox">
                        <div class="check-box-div">
                            <input type="checkbox" class="check-box" id="all-checkbox">
                            <div class="another-check" id="all-check"><i class="fas fa-check"></i></div>
                            <label for="">전체선택 <span id="cart-list-quan">(/)</span><span class="c-r">  지금 구매하시면 ${month }/${day }일 (${days })까지 도착합니다.</span></label>
                        </div>
                        <div>
                            <form method="post" class="delete_form">
                                <input type="hidden" id="cart-del-input">
                                <button class="cart-del-button" id="cart-del">선택삭제</button>
                                <!-- <button class="cart-del-button no-so" id="sold-out" onclick="nope(event);">품절삭제</button> -->
                                <script>
                                    var ids = [];
                                    function nope(e){
                                        e.preventDefault();
                                    }
                                </script>
                            </form>
                        </div>
                    </div>
                    <div class="cart-list-box">
                        <div class="cart-list-top">
                            <div>상품정보</div>
                            <div>옵션</div>
                            <div>상품금액</div>
                        </div>

<!--                         <script>
                            class 객체생성 {
                                constructor(i){
                                    this.name = '상품인데 아주 개쩌는 이름을 가진 상품 '+i;
                                    this.quan = i;
                                    this.price = 17000;
                                }
                            }
            
                            var list = [];
                            function 객체반복생성(){
                                var obj1 = {};
                                for(let i=1; i<5; i++){
                                    obj1 = new 객체생성(i);
                                    list.push(obj1);
                                }
                                return list;
                            }
            
                            객체반복생성();
                        </script> -->

                        <form method="post" class="cart-frm">
                            
                        </form>
                        <script>
                            
                            $(document).ready(function (){
                            	
                              $.ajax({
                            	  type:"GET",
                            	  url:"/cart/list",
                              }).done(function(data){
                            	  console.log("카트 데이터: " + data);
                            	  var list = [];
                            	  list = data;
                            	  
                            	  var count = list.length;
                            	  
                                var cartView = list.forEach(function (a,i){
                                	
                                    var delPrice = 3900;
                                    var delPlus = a.product_price * a.product_quantity + delPrice;
                                    if((delPlus - delPrice) > 50000) {
                                        delPlus = delPlus - delPrice;
                                        delPrice = '배송비 무료'
                                    } else {
                                        delPlus = a.product_price * a.product_quantity + delPrice;
                                        delPrice = '3900원';
                                    };
                                    var cartTemplate = `
                                        <div class="cart-list-content">
                                            <div class="clc-info">
                                                <div class="clc-checks" style="padding: 10px 0; margin: auto;">
                                                    <input type="checkbox" class="check-box" name="each-checkbox" id="each-checkbox\${i}" value="0">
                                                    <input type="hidden" name="cart_no" value="\${a.cart_no}" id="cart_no\${i}" style="display:none;">
                                                    <input type="hidden" class="count-check" value="\${count}" style="display:none;">
                                                    <div class="another-check" id="each-check\${i}"><i class="fas fa-check"></i></div>
                                                </div>
                                                <div class="clc-child">
                                                    <img src="/img/\${a.product_img1}" alt="" width="100%">
                                                </div>
                                                <div class="clc-child">
                                                    <h5><strong>\${a.product_name}</strong></h5>
                                                    <h6><strong id="product-price\${i}">\${a.product_price}</strong></h6>
                                                </div>
                                                <div class="clc-x-button clc-child" onclick="remove(\${a.cart_no})">
                                                    ×
                                                </div>
                                            </div>
                                            <div class="clc-option">
                                                <div class="clc-child">
                                                    <div class="clc-del-op">필수옵션 : 배송비</div>
                                                    <div class="clc-op-right">
                                                        <div class="clc-op-buttons">
                                                            <div class="clc-minus" id="clc-minus\${i}">-</div>
                                                            <div class="clc-op-num" id="clc-op-num\${i}">\${a.product_quantity}</div>
                                                            <div class="clc-plus" id="clc-plus\${i}">+</div>
                                                        </div>
                                                        <div class="clc-op-price" id="del-price\${i}">\${delPrice}</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="clc-price">
                                                <div class="clc-price-content" id="clc-price-content\${i}">
                                                    <!-- db로 넘겨줄 각 품목별 가격 -->
                                                    <input type="hidden" value="\${delPlus}">
                                                    <h3 class="clc-price-text" id="price\${i}">\${delPlus} 원</h3>
                                                    <button class="clc-price-button bg-main3">구매하기</button>
                                                </div>
                                                
                                            </div>
                                        </div>
                                    `;
                                    $('.cart-frm').append(cartTemplate);
                                    var lastNum = list.length;
                                    var firstNum;
                                    $('#cart-list-quan').text(`(0/\${lastNum})`);

                                    var quan = document.getElementById(`clc-op-num\${i}`).innerHTML;
                                    var product_price = a.product_price;
                                    
                                    console.log("product_price: ", product_price);
                                    
                                    quan = Number(quan);
                                    $(`#clc-minus\${i}`).on('click',function (){
                                        if(quan>1){
                                            quan = quan-1;
                                            delPlus = delPlus - product_price;
                                            if(delPlus - 3900 < 50000){
                                                delPlus =  product_price * quan + 3900;
                                                $(`#del-price\${i}`).text('3900원');
                                            }
                                            $(`#clc-op-num\${i}`).text(quan);
                                            document.getElementById(`price\${i}`).innerHTML=delPlus+" 원";
                                            $(`#clc-price-content\${i} input`).val(delPlus);

                                            $(".another-check").eq(i+1).removeClass("check-clicked");
                                            $("#all-check").removeClass("check-clicked");
                                            document.getElementById('all-checkbox').checked = false;
                                            document.getElementById(`each-checkbox\${i}`).checked = false;
                                            aboutCheck();
                                        } else quan = quan
                                        
                                        /* quantity 수정을 위한 script */
                                        
                                        
                                        var cart_value = document.getElementById(`cart_no\${i}`).value;
                                        console.log(cart_value);
                                        
                                        var content = {cart_no:cart_value, product_quantity:quan};
                                        
                                        cartService.update(content, function(result){
                                        	/* alert(result); */
                                        });
                                        
                                    });

                                    $(`#clc-plus\${i}`).on('click',function (){
                                        if(quan>=1){
                                            quan = quan+1;
                                            delPlus = delPlus + product_price;
                                            if(delPlus -3900 > 50000) {
                                                delPlus = product_price * quan;
                                                $(`#del-price\${i}`).text('배송비 무료');
                                            };
                                            $(`#clc-op-num\${i}`).text(quan);
                                            document.getElementById(`price\${i}`).innerHTML=delPlus+" 원";
                                            $(`#clc-price-content\${i} input`).val(delPlus);
                                            
                                            $(".another-check").eq(i+1).removeClass("check-clicked");
                                            $("#all-check").removeClass("check-clicked");
                                            document.getElementById('all-checkbox').checked = false;
                                            document.getElementById(`each-checkbox\${i}`).checked = false;
                                            aboutCheck();
                                        };
                                        
                                        /* quantity 수정을 위한 script */
                                        var cart_value = document.getElementById(`cart_no\${i}`).value;
                                        console.log(cart_value); 
                                        
                                        var content = {cart_no:cart_value, product_quantity:quan};
                                        
                                        cartService.update(content, function(result){
                                        	/* alert(result); */
                                        });
                                    });
                                });
                                 
                                var all_chk = 0;
                                var chk = $('.check-box');
                                function aboutCheck(){
                                    var checked_arr = [];
                                    var price_info = [];
                                    var total_price;
                                    var lastNum = list.length;
                                        
                                    if(chk.is(':checked') == true){
                                        for(let i=0; i<list.length; i++){
                                        	var checked_id = document.querySelectorAll(".clc-checks input[type='checkbox']:checked")[i].id;
                                            checked_arr.push(checked_id);
                                            ids = [...checked_arr];
                                            totalPriceCal();
                                            var newArr = [];
                                            newArr = document.querySelectorAll("input[type='checkbox']:checked");
                                            $('#cart-del-input').val(ids);
                                            firstNum = newArr.length;
                                            $('#cart-list-quan').text(`(\${firstNum}/\${lastNum})`);
                                        }
                                        
                                    } else {
                                        for(let i=0; i<list.length; i++){
                                            var unchecked_id = document.querySelectorAll("input[type='checkbox']")[i].id;
                                            let filtered = checked_arr.filter((a) => a !== unchecked_id);
                                            ids = [...checked_arr];
                                            totalPriceCal();
                                            $('#cart-del-input').val(ids);

                                            var firstNum = ids.length;
                                            if(firstNum > 4) {
                                                firstNum = 4;
                                            }
                                            $('#cart-list-quan').text(`(\${firstNum}/\${lastNum})`);
                                        };
                                    };

                                    function totalPriceCal(){
                                        var find = checked_arr.forEach(function (a){
                                            var each_target = $(`#\${a}`).parent().next().next().children().last().children().text();
                                            var each_quan = $(`#\${a}`).parent().parent().next().children().children().last().children().first().children().first().next().text();
                                            var total = each_target * each_quan;
                                            var price_obj = {each_price:each_target, each_quan:each_quan, total:total, id:a};
                                            price_info.push(price_obj);
                                            
                                            function getUniqueListBy(arr, key) {
                                                return [...new Map(arr.map(item => [item[key], item])).values()]
                                            };
                                            price_info = getUniqueListBy(price_info, 'id');
                                        });

                                        var total_sum = 0;
                                        var totalPlus = price_info.forEach((a)=>{
                                            total_sum = total_sum + a.total;
                                        });
                                        total_price = total_sum;

                                        if(total_price>50000){
                                            $('.pb-pd-total').text(total_price+" 원");
                                            $('.pb-pd-final').text(total_price+" 원");
                                            $('.pb-pd-del').text('배송비 무료');
                                        }else{
                                            $('.pb-pd-total').text(total_price+" 원");
                                            $('.pb-pd-final').text(total_price+3900+" 원");
                                            $('.pb-pd-del').text('3900 원');
                                        }

                                    }

                                
                                };

                                $("#all-check").on('click',function (){
                                    var each_chk = $(`.check-each-box`).val();
                                    if(all_chk==0){
                                        each_chk=1;
                                        $('.check-each-box').val(each_chk);
                                        all_chk=1;
                                        $(".another-check").addClass("check-clicked");
                                        document.getElementById('all-checkbox').checked = true;
                                        for(let i=0;i<list.length;i++) document.getElementsByName("each-checkbox")[i].checked=true;
                                        console.log(each_chk);
                                        aboutCheck();
                                    } else {
                                        each_chk=0;
                                        $('.check-each-box').val(each_chk);
                                        all_chk=0;
                                        $(".another-check").removeClass("check-clicked");
                                        document.getElementById('all-checkbox').checked = false;
                                        for(let i=0;i<list.length;i++) document.getElementsByName("each-checkbox")[i].checked=false;
                                        aboutCheck();
                                    };
                                });

                                for(let i=0; i<list.length; i++){
                                    $(`#each-check\${i}`).on('click',function (){
                                        var each_chk = $(`#each-checkbox\${i}`).val();
                                        if(each_chk==0){
                                            each_chk=1;
                                            $(`#each-checkbox\${i}`).val(each_chk);
                                            $(".another-check").eq(i+1).addClass("check-clicked");
                                            document.getElementById(`each-checkbox\${i}`).checked = true;
                                            aboutCheck();
                                            
                                        } else {
                                            each_chk=0;
                                            $(`#each-checkbox\${i}`).val(each_chk);
                                            all_chk=0;
                                            $(".another-check").eq(i+1).removeClass("check-clicked");
                                            $("#all-check").removeClass("check-clicked");
                                            document.getElementById('all-checkbox').checked = false;
                                            document.getElementById(`each-checkbox\${i}`).checked = false;
                                            aboutCheck();
                                        };
                                    });
                                };
                            });
                          });

                        </script>
                    </div>
                    <form method="post">
                        <div class="price-box">
                            <div class="pb-calculate font-noto">
                                <div class="pb-pd-price">
                                    <p class="c-dg">총 상품금액</p>
                                    <h5 class="pb-pd-total">0 원</h5>
                                </div>
                                <div class="pb-plus"><h3>+</h3></div>
                                <div class="pb-del-price">
                                    <p class="c-dg">배송비</p>
                                    <h5 class="pb-pd-del">0 원</h5>
                                </div>
                            </div>
                            <div class="pb-price font-noto">
                                <h5 class="c-dg">총 결제금액</h5>
                                <h4 class="main-color2 pb-pd-final">0 원</h4>
                            </div>
                        </div>
                        <div class="total_button_div">
                            <button class="total_button bg-main3 font-noto">구매하기</button>
                        </div>
                    </form>

                    <script>
                    
                    $(document).ready(function(){
                    	$("#cart-del").on("click", function(e){
                    		
                    		var count = $(".count-check").val();
                    		
                    		/* console.log("상품 개수: ", count); */
                    		
                    		e.preventDefault();
                    		
                    		if($("input:checkbox[name=each-checkbox]:checked").length == 0) {
                    			alert("삭제할 상품을 최소 한개 선택해주세요.");
                    			return;
                    		} else {
                    			
                    		
                    		for(var i=0; i<count; i++) {
                    		
                    			if($("input[type='checkbox']").eq(i+1).is(":checked") == true) {
                        			var cart_no = $("input[name='cart_no']").eq(i).val();
                        			console.log(cart_no);
                        			
                            		 cartService.remove(cart_no, function(result){
                            			 /* alert(result);  */
                            		}); 
                        			
                        		}
                    			
                    		}
                    		alert("삭제가 완료되었습니다.");
                    		}
							 location.reload(); 
                    		
                    	});
                    	
                    	/* End remove function */

                    	
                    	$(".total_button").on("click", function(e){
                    		e.preventDefault();
                    		
                    		var cart_no = [];
                    		var count = $(".count-check").val();
                    		
                    		for(var i=0; i<count; i++) {	
                    		if($("input[type='checkbox']").eq(i+1).is(":checked") == true) {
                    			cart_no[i] = $("input[name='cart_no']").eq(i).val();
                    			
                    			} else {
                    				cart_no[i] = 0;
                    			}
                    		}
                    		
                    		if($("input:checkbox[name=each-checkbox]:checked").length == 0) {
                    			alert("상품을 최소 한개 선택해주세요.");
                    			return;
                    		} else {
                    			location.href='/buy/buy?cart_no='+cart_no;                    			
                    		}
                    		
                    	});
                    	
                    });
                    
                        function remove(cart_val) {
                        	
                        	var cart_no = cart_val;
                        	
                        	cartService.remove(cart_no, function(result) {
                        		alert(result);
                        		location.reload();
                        	});
                        }
                    </script>
                </div>
            </section>
	<%@ include file="/WEB-INF/views/headerFooter/footer.jsp"%>
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
		
	<script>
		var cartService = (function(){
			
			function remove(cart_no, callback, error) {
				
				$.ajax({type:'delete',
						url:'/cart/'+ cart_no,
						success:function(deleteResult, status, xhr) {
							if(callback) {
								callback(deleteResult);
							}
						},
						error:function(xhr, status, er) {
							if(error) {
								error(er);
							}
						}
						});
			}
			
			/* End remove */
			
			function update(content, callback, error) {
				
				$.ajax({
					type:'put',
					url:'/cart/'+content.cart_no,
					data:JSON.stringify(content),
					contentType:'application/json; charset=utf-8',
					success:function(result, status, xhr){
	                	if(callback){
	                		callback(result);
	                	}
	                }, 
	                error:function(xhr, status, er){
	                	if(error){
	                		error(er);
	                	}
	                }
	            });
			}
			
			/* End update */
			
			return {remove:remove,
					update:update}
			
		})();
	</script>
</body>
</html>