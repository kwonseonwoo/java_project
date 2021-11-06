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
		
            <section class="products size15">
                <div class="carousel-title">
                    <h2 class="font-noto">카테고리</h2>
                    <p class="ml-10 c-g">종류별 상품들</p>
                    <input class="ds" type="hidden" value="${type_name }">
                </div>
                <div class="category-tab">
                	<div class="cg-tab" id="easy">간편요리</div>
                	<div class="cg-tab" id="dish">특별한 반찬</div>
                	<div class="cg-tab" id="snack">간식/간편식</div>
                	<div class="cg-tab" id="drink">주류/음료</div>
                </div>
                <div class="products-easy products-box" >
                </div>
            </section>
            
            <script>
            	var datass = $(".ds").val();
                $(document).ready(function(){
                	
            		console.log("카테고리 타입 : "+datass);
            		var catess ='';
            		if(datass == '간편요리') catess = 'easy';
            		else if(datass == '특별한 반찬')catess = 'dish';
            		else if(datass == '간식/간편식')catess = 'snack';
            		else catess = 'drink';
            		//console.log("catess : "+catess);
                	
            		$(`#\${catess}`).addClass('ct-tab');
            		
                	$.ajax({
        				type:"GET",
        				url:"/list/categoryList",
        			}).done(function(data){
        				console.log( data);
        				var productList = data;		
						typeList = productList.filter(a=>{
							return a.product_type == `\${datass}`;
						});
        				var typeView = typeList.forEach(function (a,i){
                            var type_template = `
                                <div class="products-content-box" id="simple-${i}">
	                                	<div class="products-content" style="background-image: linear-gradient( rgba(0, 0, 0, 0.2), rgba(0, 0, 0, 0.2) ), url('/img/\${a.product_img1 }');"
	                                		onclick="javascript: location.href='/productView/productView?product_no=\${a.product_no}'">
	                                        <div class="pc-content">
												<h4>\${a.product_name}</h4>
		                                        <p>\${a.product_price}</p>
		                                        <p>0개의 리뷰</p>
	                                        </div>
	                                    </div>
                                </div> `;
                                $(`.products-box`).append(type_template);
                        });
        				
                       /*  var didScroll = false;
                        $(window).on('scroll', function (){didScroll = true;});
                        setInterval(function (){
                            var bottomH = $(window).scrollTop()+$(window).height() + 400;
                            var docH = $(document).height();

                            if(didScroll){
                                didScroll = false;
                                if(bottomH > docH) infiniteScrollContent();
                            }
                        }, 250);

                        function infiniteScrollContent(){
                            var scr = $(window).scrollTop();
                            if(scr<4800){
                                var simpleView = productList.forEach(function (a,i){
                                var sim_template = `
                                    <div class="products-content-box" id="simple-${i}">
                                        <div class="products-content test">
                                            <div class="pc-content">
	                                            <h4>\${a.product_name}</h4>
	                                            <p>\${a.product_price}</p>
	                                            <p>0개의 리뷰</p>
                                            </div>
                                        </div>
                                    </div> `;
                                $('.products-box').append(sim_template);
                                });
                            }
                            
                        } */
        			});
                });
            </script>
	<%@ include file="/WEB-INF/views/headerFooter/footer.jsp"%>
	</div>
	<script>
		$(document).ready(function(){
			var cg_num;
			var cg_type;
			$('.cg-tab').on('click',function(event){
				cg_num = event.target.id;
				cg_type = event.target.innerHTML;
				$('.cg-tab').removeClass('ct-tab');
				$(`#\${cg_num}`).addClass('ct-tab');
				location.href = `/productList/categoryList?product_type=\${cg_type}`;
			});
		});
	</script>
	
	
	<!-- <script>
	$(document).ready(function(){
		var datass = $(".ds").val();
		console.log("카테고리 타입 : "+datass);
		if(datass == '간편요리') {datass = 'easy'} 
		else if(datass == '특별한 반찬'){datass = 'dish'}
		else if(datass == '간식/간편식'){datass = 'snack'}
		else{datass = 'drink'};
		console.log(datass);
	});
	
	</script> -->
	
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