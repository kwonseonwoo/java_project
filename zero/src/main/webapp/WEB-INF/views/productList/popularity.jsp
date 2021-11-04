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
	<%@ include file="/WEB-INF/views/headerFooter/header.jsp"%>
	<div class="wrap" id="wrap">
		<script>
                class makingObj {
                    constructor(i){
                        this.title = 'title '+i;
                        this.content = 'content '+i;
                        this.price = 'price '+i;
                    }
                }

                var arr1 = [];
                function makingObjRoop(){
                    var obj1 = {};
                    for(let i=0; i<15; i++){
                        obj1 = new makingObj(i);
                        arr1.push(obj1);
                    }
                    return arr1;
                }

                makingObjRoop();

            </script>

            <section class="products size15">
                <div class="carousel-title">
                    <h2 class="font-noto">인기 메뉴</h2>
                        <p class="ml-10 c-g">제로식당의 인기 메뉴</p>
                </div>
                <div class="products-box" >
                </div>
            </section>
            <script>
                $(document).ready(function(){
                    var simpleView = arr1.forEach(function (a,i){
                        var sim_template = `
                            <div class="products-content-box" id="simple-${i}">
                                <div class="products-content test">
                                    <div class="pc-content">
                                        <h4>${a.title}</h4>
                                        <p>${a.content}</p>
                                        <p>${a.price}원</p>
                                    </div>
                                </div>
                            </div> `;
                            $('.products-box').append(sim_template);
                    });
                
                    var didScroll = false;
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
                            var simpleView = arr1.forEach(function (a,i){
                            var sim_template = `
                                <div class="products-content-box" id="simple-${i}">
                                    <div class="products-content test">
                                        <div class="pc-content">
                                            <h4>${a.title}</h4>
                                            <p>${a.content}</p>
                                            <p>${a.price}원</p>
                                        </div>
                                    </div>
                                </div> `;
                            $('.products-box').append(sim_template);
                            });
                        }
                        
                    }
                });
            </script>
	</div>
	
	<script>
		<!-- JSON 데이터를 넘겨주기 위한 테스팅 코드 -->
		$(document).ready(function(){
			
			$.ajax({
				type:"GET",
				url:"/list/popularity",
			}).done(function(data){
				console.log("데이터: ", data);
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
<%@ include file="/WEB-INF/views/headerFooter/footer.jsp"%>