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
	<link rel="stylesheet" href="resources/css/main.css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</head>

<body class="bg-c">
<%@ include file="./headerFooter/header.jsp"%>
	<div class="wrap" id="wrap">
		<!-- 메인 캐러셀 -->
		<section class="main-carousel">
			<button class="carousel-button bt-left" onclick="mainLeft()"><i class="fas fa-chevron-left"></i></button>
			<button class="carousel-button bt-right" onclick="mainRight()"><i class="fas fa-chevron-right"></i></button>
			<div class="main-carousel-div">
				<script>
					var main_ca_num = 0;
					var sampleObj = [{num:0,name:'kim'},{num:1,name:'kim park'},{num:2,name:'park kim'},{num:3,name:'choi kim'},{num:4,name:'kim choi'}];
					
					$(document).ready(function (){
						
						var mainView = sampleObj.forEach(function(a,i){
							var imgs = `resources/img/appletv\${i}.jpg`;
							var mainTemplate = `<div class="main-carousel-content" id="main-carousel-\${a.num}">
									<img src="\${imgs}" align="center" width="100%;" />
									<div class="main-carousel-text bg-none">
										<h2>\${a.num}</h2>
										<p>\${a.name}</p>
									</div>
								</div>`;
							$('.main-carousel-div').append(mainTemplate);
						});

					})
					var carouNum = 0;

					const mainLeft = () => {
						for(let i=0; i<sampleObj.length;i++){
							if(main_ca_num == i){
								if(main_ca_num==0){
								} else {
									$(`.main-carousel-div`).css({'transform':'translateX('+(1920-carouNum)+'px)'});
									carouNum = carouNum-1920;
								}
							} else {
							}
						}
						if(main_ca_num > 0){
							main_ca_num--;
						}else{
							main_ca_num;
						};
					};

					const mainRight = () => {
						for(let i=0; i<sampleObj.length;i++){
							if(main_ca_num == i){
								if(main_ca_num==4){
								} else {
									$(`.main-carousel-div`).css({'transform':'translateX('+'-'+(1920+carouNum)+'px)'});
									carouNum = (1920+carouNum);
								}
								
							} else {
							}
						}
						if(main_ca_num < 4){
							main_ca_num++;
						}else{
							main_ca_num;
						};
					};
					
					
				</script>


			</div>
		</section>

		<!-- 메뉴 추천 -->
		<section class="rec-carousel size15">
			<div class="carousel-title">
				<h2>이 메뉴는 어떠세요?</h1>
					<p class="ml-10">회원님이 좋아하실 메뉴입니다</p>
			</div>
			<div class="rec-carousel-div">
				<button class="rec-carousel-button c-bt-left bg-main2" id="btn1-l"><i class="fas fa-chevron-left"></i></button>
				<button class="rec-carousel-button c-bt-right bg-main2" id="btn1-r"><i class="fas fa-chevron-right"></i></button>
				<div class="rec-carousel-box">
					<div class="rec-carousel-ul" id="rec-1">
						<script>
							var sample = [{num:0,name:'원할머니 보쌈', price:12000},{num:1,name:'BHC쌈', price:12000},{num:2,name:'김할머니 보쌈', price:12000},
							{num:3,name:'김빡빡이 보쌈', price:12000},{num:4,name:'호호아줌마 보쌈', price:12000},{num:5,name:'원수의불 보쌈', price:12000},
							{num:6,name:'무량수불 보쌈', price:12000},{num:7,name:'금강불괴 보쌈', price:12000},];
							
							$(document).ready(function(){
								var sampleView = sample.forEach(function(a){
									var rec_template = `<div class="rec-carousel-content">
											<div class="rcc-content">
												<h4>\${a.name}</h4>
												<p>\${a.num}</p>
												<p>\${a.price}원</p>
											</div>
										</div>
									`;
									$('#rec-1').append(rec_template);
								})
							})
							
						</script>
					</div>
				</div>
			</div>
		</section>

		<section class="best size15">
			<div class="best-title carousel-title">
				<h2>오늘의 베스트셀러</h1>
				<p class="ml-10">지금 가장 많이 구매되고 있는 메뉴입니다</p>
				<div class="best-tag">
					<div class="tag-check">오늘의 Top</div>
					<div class="">이번주 Top</div>
					<div class="">이번달 Top</div>
				</div>
			</div>
			<div class="best-box">
			</div>	
			<div class="best-box best-off">
			</div>
			<div class="best-box best-off">
			</div>
			<script>
				var bestList = [{num:0,name:'원할머니 보쌈', price:12000},{num:1,name:'BHC쌈', price:12000},{num:2,name:'김할머니 보쌈', price:12000},
						{num:3,name:'김빡빡이 보쌈', price:12000},{num:4,name:'호호아줌마 보쌈', price:12000},{num:5,name:'원수의불 보쌈', price:12000},
						{num:6,name:'무량수불 보쌈', price:12000},{num:7,name:'금강불괴 보쌈', price:12000},{num:8,name:'만근추 갈비', price:12000}];

				$(document).ready(function(){
					var dBestView = bestList.forEach(function (a){
						var bestTemplate = `<div class="best-content ">
								<div class="best-img"><img src="resources/img/img.png"></div>
								<div class="best-text">
									<h5>\${a.name}</h5>
									<p>\${a.num}</p>
									<p class="best-price">\${a.price}</p>
								</div>
							</div>`;
						$('.best-box').eq(0).append(bestTemplate);
					});

					var wBestView = bestList.forEach(function (a){
						var bestTemplate = `<div class="best-content">
								<div class="best-img"><img src="resources/img/img.png"></div>
								<div class="best-text">
									<h5>\${a.name}123123</h5>
									<p>\${a.num}</p>
									<p class="best-price">\${a.price}</p>
								</div>
							</div>`;
						$('.best-box').eq(1).append(bestTemplate);
					});

					var mBestView = bestList.forEach(function (a){
						var bestTemplate = `<div class="best-content">
								<div class="best-img"><img src="resources/img/img.png"></div>
								<div class="best-text">
									<h5>\${a.name}</h5>
									<p>\${a.num}123123123</p>
									<p class="best-price">\${a.price}</p>
								</div>
							</div>`;
						$('.best-box').eq(2).append(bestTemplate);
					});

					$('.best-tag div').eq(0).on('click',function(){
						$('.best-box').eq(0).removeClass('best-off');
						$('.best-box').eq(1).addClass('best-off');
						$('.best-box').eq(2).addClass('best-off');
						$('.best-tag div').eq(0).addClass('tag-check');
						$('.best-tag div').eq(1).removeClass('tag-check');
						$('.best-tag div').eq(2).removeClass('tag-check');
						$('.best-tag span').eq(0).removeClass('off');
						$('.best-tag span').eq(1).addClass('off');
						$('.best-tag span').eq(2).addClass('off');
					})

					$('.best-tag div').eq(1).on('click',function(){
						$('.best-box').eq(1).removeClass('best-off');
						$('.best-box').eq(2).addClass('best-off');
						$('.best-box').eq(0).addClass('best-off');
						$('.best-tag div').eq(1).addClass('tag-check');
						$('.best-tag div').eq(2).removeClass('tag-check');
						$('.best-tag div').eq(0).removeClass('tag-check');
						$('.best-tag span').eq(1).removeClass('off');
						$('.best-tag span').eq(2).addClass('off');
						$('.best-tag span').eq(0).addClass('off');
					})

					$('.best-tag div').eq(2).on('click',function(){
						$('.best-box').eq(2).removeClass('best-off');
						$('.best-box').eq(0).addClass('best-off');
						$('.best-box').eq(1).addClass('best-off');
						$('.best-tag div').eq(2).addClass('tag-check');
						$('.best-tag div').eq(0).removeClass('tag-check');
						$('.best-tag div').eq(1).removeClass('tag-check');
						$('.best-tag span').eq(2).removeClass('off');
						$('.best-tag span').eq(0).addClass('off');
						$('.best-tag span').eq(1).addClass('off');
					})
				});
			</script>
			
			
		</section>

		<section class="rec-carousel size15">
			<div class="carousel-title">
				<h2>새로 나온 메뉴</h1>
				<p class="ml-10">새로 나온 메뉴를 둘러보고 먼저 경험하세요</p>
			</div>
			<div class="rec-carousel-div">
				<button class="rec-carousel-button c-bt-left bg-main2" id="btn2-l"><i class="fas fa-chevron-left"></i></button>
				<button class="rec-carousel-button c-bt-right bg-main2" id="btn2-r"><i class="fas fa-chevron-right"></i></button>
				<div class="rec-carousel-box">
					<div class="rec-carousel-ul" id="rec-2">
						<script>
							var sample = [{num:0,name:'원할머니 보쌈', price:12000},{num:1,name:'BHC쌈', price:12000},{num:2,name:'김할머니 보쌈', price:12000},
							{num:3,name:'김빡빡이 보쌈', price:12000},{num:4,name:'호호아줌마 보쌈', price:12000},{num:5,name:'원수의불 보쌈', price:12000},
							{num:6,name:'무량수불 보쌈', price:12000},{num:7,name:'금강불괴 보쌈', price:12000},];
							
							$(document).ready(function(){
								var sampleView = sample.forEach(function(a){
									var rec_template = `<div class="rec-carousel-content">
											<div class="rcc-content">
												<h4>\${a.name}</h4>
												<p>\${a.num}</p>
												<p>\${a.price}원</p>
											</div>
										</div>`;
									$('#rec-2').append(rec_template);
								})
							})
						</script>
					</div>
				</div>
			</div>
		</section>

		<section class="rec-carousel size15">
			<div class="carousel-title">
				<h2>간편 요리</h1>
				<p class="ml-10">전국 맛집 메뉴를 간단히 요리해보세요</p>
			</div>
			<div class="rec-carousel-div">
				<button class="rec-carousel-button c-bt-left bg-main2" id="btn3-l"><i class="fas fa-chevron-left"></i></button>
				<button class="rec-carousel-button c-bt-right bg-main2" id="btn3-r"><i class="fas fa-chevron-right"></i></button>
				<div class="rec-carousel-box">
					<div class="rec-carousel-ul" id="rec-3">
						<script>
							//db리스트 받아올때는 var list = ${list}; 로 받고 list.foreach돌리면 될 듯;
							$(document).ready(function(){
								var sampleView = sample.forEach(function(a){
									var rec_template = `<div class="rec-carousel-content">
											<div class="rcc-content">
												<h4>\${a.name}</h4>
												<p>\${a.num}</p>
												<p>\${a.price}원</p>
											</div>
										</div>`;
									$('#rec-3').append(rec_template);
								})
							})
						</script>
					</div>
				</div>
			</div>
		</section>

		<section class="rec-carousel size15">
			<div class="carousel-title">
				<h2>특별한 반찬</h1>
				<p class="ml-10">좋은 반찬을 집에서 즐겨보세요</p>
			</div>
			<div class="rec-carousel-div">
				<button class="rec-carousel-button c-bt-left bg-main2" id="btn4-l"><i class="fas fa-chevron-left"></i></button>
				<button class="rec-carousel-button c-bt-right bg-main2" id="btn4-r"><i class="fas fa-chevron-right"></i></button>
				<div class="rec-carousel-box">
					<div class="rec-carousel-ul" id="rec-4">
						<script>
							//db리스트 받아올때는 var list = ${list}; 로 받고 list.foreach돌리면 될 듯;
							$(document).ready(function(){
								var sampleView = sample.forEach(function(a){
									var rec_template = `<div class="rec-carousel-content">
											<div class="rcc-content">
												<h4>\${a.name}</h4>
												<p>\${a.num}</p>
												<p>\${a.price}원</p>
											</div>
										</div>`;
									$('#rec-4').append(rec_template);
								})
							})
						</script>
					</div>
				</div>
			</div>
		</section>

		<section class="rec-carousel size15">
			<div class="carousel-title">
				<h2>간식과 간편식</h1>
			</div>
			<div class="rec-carousel-div">
				<button class="rec-carousel-button c-bt-left bg-main2" id="btn5-l"><i class="fas fa-chevron-left"></i></button>
				<button class="rec-carousel-button c-bt-right bg-main2" id="btn5-r"><i class="fas fa-chevron-right"></i></button>
				<div class="rec-carousel-box">
					<div class="rec-carousel-ul" id="rec-5">
						<script>
							//db리스트 받아올때는 var list = ${list}; 로 받고 list.foreach돌리면 될 듯;
							$(document).ready(function(){
								var sampleView = sample.forEach(function(a){
									var rec_template = `<div class="rec-carousel-content">
										<div class="rcc-content">
												<h4>\${a.name}</h4>
												<p>\${a.num}</p>
												<p>\${a.price}원</p>
											</div>
										</div>`;
									$('#rec-5').append(rec_template);
								})
							})
						</script>
					</div>
				</div>
			</div>
		</section>

		<section class="rec-carousel size15">
			<div class="carousel-title">
				<h2>한국 전통주</h1>
				<p class="ml-10">우리나라 최고의 전통주들을 만나보세요</p>
			</div>
			<div class="rec-carousel-div">
				<button class="rec-carousel-button c-bt-left bg-main2" id="btn6-l" ><i class="fas fa-chevron-left"></i></button>
				<button class="rec-carousel-button c-bt-right bg-main2" id="btn6-r" ><i class="fas fa-chevron-right"></i></button>
				<div class="rec-carousel-box">
					<div class="rec-carousel-ul" id="rec-6">
						<script>
							//db리스트 받아올때는 var list = ${list}; 로 받고 list.foreach돌리면 될 듯;
							$(document).ready(function(){
								var sampleView = sample.forEach(function(a){
									var rec_template = `<div class="rec-carousel-content">
											<div class="rcc-content">
												<h4>\${a.name}</h4>
												<p>\${a.num}</p>
												<p>\${a.price}원</p>
											</div>
										</div>`;
									$('#rec-6').append(rec_template);
								})
							})
						</script>
					</div>
				</div>
			</div>
		</section>

		<section class="rec-carousel size15">
			<div class="carousel-title">
				<h2>고기</h1>
				<p class="ml-10">행복한 BBQ타임을 위한 좋은 고기</p>
			</div>
			<div class="rec-carousel-div">
				<button class="rec-carousel-button c-bt-left bg-main2" id="btn7-l"><i class="fas fa-chevron-left"></i></button>
				<button class="rec-carousel-button c-bt-right bg-main2" id="btn7-r"><i class="fas fa-chevron-right"></i></button>
				<div class="rec-carousel-box">
					<div class="rec-carousel-ul" id="rec-7">
						<script>
							//db리스트 받아올때는 var list = ${list}; 로 받고 list.foreach돌리면 될 듯;
							$(document).ready(function(){
								var sampleView = sample.forEach(function(a){
									var rec_template = `<div class="rec-carousel-content">
											<div class="rcc-content">
												<h4>\${a.name}</h4>
												<p>\${a.num}</p>
												<p>\${a.price}원</p>
											</div>
										</div>`;
									$('#rec-7').append(rec_template);
								})
							})
						</script>
					</div>
				</div>
			</div>
		</section>

		<section class="rec-carousel size15">
			<div class="carousel-title">
				<h2>베이커리/유제품</h1>
				<p class="ml-10">전국 유명 베이커리가 한 곳에</p>
			</div>
			<div class="rec-carousel-div">
				<button class="rec-carousel-button c-bt-left bg-main2" id="btn8-l"><i class="fas fa-chevron-left"></i></button>
				<button class="rec-carousel-button c-bt-right bg-main2" id="btn8-r"><i class="fas fa-chevron-right"></i></button>
				<div class="rec-carousel-box">
					<div class="rec-carousel-ul" id="rec-8">
						<script>
							//db리스트 받아올때는 var list = ${list}; 로 받고 list.foreach돌리면 될 듯;
							$(document).ready(function(){
								var sampleView = sample.forEach(function(a){
									var rec_template = `<div class="rec-carousel-content">
											<div class="rcc-content">
												<h4>\${a.name}</h4>
												<p>\${a.num}</p>
												<p>\${a.price}원</p>
											</div>
										</div>`;
									$('#rec-8').append(rec_template);
								})
							})
						</script>
					</div>
				</div>
			</div>
		</section>
	</div>

	<!-- scripts -->
	<script>
		window.onload = function (){
			var c_bt=0;
			var btid;
			var btChoice;

			for(let k=1; k<9; k++){
				$(`#btn\${k}-l`).on('click',function (event){
					btid = `btn\${k}-l`; 
					btChoice = document.getElementById(btid).parentElement.children[2].children[0].id;
					for(let i=1; i<9; i++){
						if(btid[3]==i){
							c_bt = i;
							if (c_bt == i) {
								for (let j = 1; j < 9; j++) {
									if (btid == 'btn' + j + '-l') {
										$(`#\${btChoice}`).css({ 'transform': 'translateX(0px)' });
										c_bt = -i;
									} else {
										
									}
								}
							} else {
								c_bt = i;
							}
						}
					}
				});

				$(`#btn\${k}-r`).on('click',function (event){
					btid = `btn\${k}-r`;
					btChoice = document.getElementById(btid).parentElement.children[2].children[0].id;
					for(let i=1; i<9; i++){
						if(btid[3]==i){
							c_bt = -i;
							if (c_bt == -i) {
								for (let j = 1; j < 9; j++) {
									if (btid == 'btn' + j + '-r') {
										$(`#\${btChoice}`).css({ 'transform': 'translateX(-1150px)' });
										c_bt = i;
									} else {
										
									}
								}
							} else {
								c_bt = -i;
							}
						}
					}
				});
			}
		};
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<%@ include file="./headerFooter/footer.jsp"%>
</body>

</html>