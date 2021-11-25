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
	<div class="wrap" id="wrap">
	<%@ include file="./headerFooter/header.jsp"%>
		<!-- 메인 캐러셀 -->
		<section class="main-carousel">
			<button class="carousel-button bt-left" onclick="mainLeft()"><i class="fas fa-chevron-left"></i></button>
			<button class="carousel-button bt-right" onclick="mainRight()"><i class="fas fa-chevron-right"></i></button>
			<div class="main-carousel-div">
				<script>
					var main_ca_num = 0;
					var sampleObj = [{num:0,cont:'보충소 앞 그 닭갈비를 집에서',name:'국방의 맛 국군의 맛, <br>춘천 닭갈비', img:'춘천닭갈비메인.jpg'},
						{num:1, cont:'그 때 그 짜글이를 집에서',name:'추운 겨울의 소박한 한상, <br>김치 짜글이', img:'김치짜글이메인.jpg'},
						{num:2, cont:'맛나 떡볶이 최대 20% 할인',name:'친근한 떡볶이의 고급화, <br>사골육수 떡볶이', img:'사골육수떡볶이메인.jpg'},
						{num:3, cont:'대감집 전 품목 프로모션 진행 중',name:'대감집 한우 된장찌개', img:'한우된장찌개메인.jpg'},
						{num:4, cont:'운수좋은 날, 설렁탕을 집에서',name:'대감집 소머리 설렁탕', img:'소머리설렁탕메인.jpg'}];
					$(document).ready(function (){
						
						var mainView = sampleObj.forEach(function(a,i){
							var mainTemplate = `<div class="main-carousel-content" id="main-carousel-\${a.num}">
									<img src="/resources/img/\${a.img}" align="center" width="100%;" />
									<div class="main-carousel-text bg-none">
										<h2>\${a.name}</h2>
										<p>\${a.cont}</p>
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
				<h2>이 메뉴는 어떠세요?</h2>
					<p class="ml-10">회원님이 좋아하실 메뉴입니다</p>
			</div>
			<div class="rec-carousel-div">
				<button class="rec-carousel-button c-bt-left bg-main2" id="btn1-l"><i class="fas fa-chevron-left"></i></button>
				<button class="rec-carousel-button c-bt-right bg-main2" id="btn1-r"><i class="fas fa-chevron-right"></i></button>
				<div class="rec-carousel-box">
					<div class="rec-carousel-ul" id="rec-1">
						<script>
						
							$(document).ready(function(){
								$.ajax({
									type:"GET",
									url : "/list/recommend",
								}).done(function(data){
									var recData = [];
									recData = data;
									recData = recData.sort(()=>Math.random()-0.5).slice(0,8);
									console.log(recData);
									var sampleView = recData.forEach(function(a){
										var rec_template = `<div class="rec-carousel-content-box">
											<div class="rec-carousel-content" style="background-image: linear-gradient( rgba(0, 0, 0, 0.2), rgba(0, 0, 0, 0.2) ), url('/img/\${a.product_img1 }');"
														onclick="javascript: location.href='/productView/productView?product_no=\${a.product_no}'">
												<div class="rcc-content font-noto">
													<h4>\${a.product_name}</h4>
													<p>\${a.product_price}원</p>
													<p>\${a.product_replyCnt}개의 리뷰</p>
												</div>
										</div>
									</div>`;
										$('#rec-1').append(rec_template);
									})
								});
								
							});
							
							function shuffle(array){
								array.sort(()=>Math.random()-0.5);
							};
						</script>
					</div>
				</div>
			</div>
		</section>

		<section class="best size15">
			<div class="best-title carousel-title">
				<h2>오늘의 베스트셀러</h2>
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
				$(document).ready(function(){
					
					$.ajax({
						type:'GET',
						url:'/list/today',
					}).done(function(data){
						console.log("투데이 데이터: ", data);
						var today_list = [];
						today_list = data;
						today_list = today_list.slice(0,9);
					
					var dBestView = today_list.forEach(function (a){
						var bestTemplate = `<div class="best-content " 
						onclick="javascript: location.href='/productView/productView?product_no=\${a.product_no}'">
								<div class="best-img"><img src="/img/\${a.product_img1}"></div>
								<div class="best-text">
									<h5>\${a.product_name}</h5>
									<p>\${a.product_replyCnt}개의 리뷰</p>
									<p class="best-price">\${a.product_price}원</p>
								</div>
							</div>`;
						$('.best-box').eq(0).append(bestTemplate);
					});
				});
					
					$.ajax({
						type:'GET',
						url:'/list/week',
					}).done(function(data){
						console.log("이번주 데이터: ", data);
						var week_list = [];
						week_list = data;
						week_list = week_list.slice(0,9);
						
					var wBestView = week_list.forEach(function (a){
						var bestTemplate = `<div class="best-content"
						onclick="javascript: location.href='/productView/productView?product_no=\${a.product_no}'">
								<div class="best-img"><img src="/img/\${a.product_img1}"></div>
								<div class="best-text">
									<h5>\${a.product_name}</h5>
									<p>\${a.product_replyCnt}개의 리뷰</p>
									<p class="best-price">\${a.product_price}원</p>
								</div>
							</div>`;
						$('.best-box').eq(1).append(bestTemplate);
					});
				});
					
					$.ajax({
						type:'GET',
						url:'/list/month',
					}).done(function(data){
						console.log("이번달 데이터: ", data);
						var month_list = [];
						month_list = data;
						month_list = month_list.slice(0,9);

					var mBestView = month_list.forEach(function (a){
						var bestTemplate = `<div class="best-content"
						onclick="javascript: location.href='/productView/productView?product_no=\${a.product_no}'">
								<div class="best-img"><img src="/img/\${a.product_img1}"></div>
								<div class="best-text">
									<h5>\${a.product_name}</h5>
									<p>\${a.product_replyCnt}개의 리뷰</p>
									<p class="best-price">\${a.product_price}원</p>
								</div>
							</div>`;
						$('.best-box').eq(2).append(bestTemplate);
					});
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
						$(".best-title h2").html("오늘의 베스트셀러");
						$(".best-title p").html("지금 가장 많이 구매되고 있는 메뉴입니다");
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
						$(".best-title h2").html("이번 주 베스트셀러");
						$(".best-title p").html("이번 주에 가장 많이 구매되고 있는 메뉴입니다");
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
						$(".best-title h2").html("이번 달 베스트셀러");
						$(".best-title p").html("이번 달에 가장 많이 구매되고 있는 메뉴입니다");
					})
				});
			</script>
		</section>

		<section class="rec-carousel size15">
			<div class="carousel-title">
				<h2>새로 나온 메뉴</h2>
				<p class="ml-10">새로 나온 메뉴를 둘러보고 먼저 경험하세요</p>
			</div>
			<div class="rec-carousel-div">
				<button class="rec-carousel-button c-bt-left bg-main2" id="btn2-l"><i class="fas fa-chevron-left"></i></button>
				<button class="rec-carousel-button c-bt-right bg-main2" id="btn2-r"><i class="fas fa-chevron-right"></i></button>
				<div class="rec-carousel-box">
					<div class="rec-carousel-ul" id="rec-2">
						<script>
							$(document).ready(function(){
								$.ajax({
									type:"GET",
									url : "/list/news",
								}).done(function(data){
									var recData = [];
									/* console.log("신상품: ", data); */
									recData = data;
									recData = recData.slice(0,8);
									 console.log("신상품: ", recData);
									var sampleView = recData.forEach(function(a){
										var rec_template = `<div class="rec-carousel-content-box">
											<div class="rec-carousel-content" style="background-image: linear-gradient( rgba(0, 0, 0, 0.2), rgba(0, 0, 0, 0.2) ), url('/img/\${a.product_img1 }');"
												onclick="javascript: location.href='/productView/productView?product_no=\${a.product_no}'">
												<div class="rcc-content font-noto">
													<h4>\${a.product_name}</h4>
													<p>\${a.product_price}원</p>
													<p>\${a.product_replyCnt}개의 리뷰</p>
												</div>
										</div>
									</div>`;
										$('#rec-2').append(rec_template);
									})
								});
								
							});
						</script>
					</div>
				</div>
			</div>
		</section>

		<section class="rec-carousel size15">
			<div class="carousel-title">
				<h2>간편 요리</h2>
				<p class="ml-10">전국 맛집 메뉴를 간단히 요리해보세요</p>
			</div>
			<div class="rec-carousel-div">
				<button class="rec-carousel-button c-bt-left bg-main2" id="btn3-l"><i class="fas fa-chevron-left"></i></button>
				<button class="rec-carousel-button c-bt-right bg-main2" id="btn3-r"><i class="fas fa-chevron-right"></i></button>
				<div class="rec-carousel-box">
					<div class="rec-carousel-ul" id="rec-3">
						<script>
							$(document).ready(function(){
								$.ajax({
									type:"GET",
									url : "/list/simple",
								}).done(function(data){
									var recData = [];
									recData = data;
									recData = recData.filter(a=>{
										return a.product_type == "간편요리";
									});
									recData = recData.slice(0,8);
									console.log(recData);
									var sampleView = recData.forEach(function(a){
										var rec_template = `<div class="rec-carousel-content-box">
											<div class="rec-carousel-content" style="background-image: linear-gradient( rgba(0, 0, 0, 0.2), rgba(0, 0, 0, 0.2) ), url('/img/\${a.product_img1 }');"
												onclick="javascript: location.href='/productView/productView?product_no=\${a.product_no}'">
												<div class="rcc-content font-noto">
													<h4>\${a.product_name}</h4>
													<p>\${a.product_price}원</p>
													<p>\${a.product_replyCnt}개의 리뷰</p>
												</div>
										</div>
									</div>`;
										$('#rec-3').append(rec_template);
									})
								});
								
							});
						</script>
					</div>
				</div>
			</div>
		</section>

		<section class="rec-carousel size15">
			<div class="carousel-title">
				<h2>특별한 반찬</h2>
				<p class="ml-10">좋은 반찬을 집에서 즐겨보세요</p>
			</div>
			<div class="rec-carousel-div">
				<button class="rec-carousel-button c-bt-left bg-main2" id="btn4-l"><i class="fas fa-chevron-left"></i></button>
				<button class="rec-carousel-button c-bt-right bg-main2" id="btn4-r"><i class="fas fa-chevron-right"></i></button>
				<div class="rec-carousel-box">
					<div class="rec-carousel-ul" id="rec-4">
						<script>
							$(document).ready(function(){
								$.ajax({
									type:"GET",
									url : "/list/special",
								}).done(function(data){
									var recData = [];
									recData = data;
									recData = recData.filter(a=>{
										return a.product_type == "특별한 반찬";
									});
									recData = recData.slice(0,8);
									console.log(recData);
									var sampleView = recData.forEach(function(a){
										var rec_template = `<div class="rec-carousel-content-box">
											<div class="rec-carousel-content" style="background-image: linear-gradient( rgba(0, 0, 0, 0.2), rgba(0, 0, 0, 0.2) ), url('/img/\${a.product_img1 }');"
												onclick="javascript: location.href='/productView/productView?product_no=\${a.product_no}'">
												<div class="rcc-content font-noto">
													<h4>\${a.product_name}</h4>
													<p>\${a.product_price}원</p>
													<p>\${a.product_replyCnt}개의 리뷰</p>
												</div>
										</div>
									</div>`;
										$('#rec-4').append(rec_template);
									})
								});
								
							});
						</script>
					</div>
				</div>
			</div>
		</section>

		<section class="rec-carousel size15">
			<div class="carousel-title">
				<h2>간식과 간편식</h2>
			</div>
			<div class="rec-carousel-div">
				<button class="rec-carousel-button c-bt-left bg-main2" id="btn5-l"><i class="fas fa-chevron-left"></i></button>
				<button class="rec-carousel-button c-bt-right bg-main2" id="btn5-r"><i class="fas fa-chevron-right"></i></button>
				<div class="rec-carousel-box">
					<div class="rec-carousel-ul" id="rec-5">
						<script>
							$(document).ready(function(){
								$.ajax({
									type:"GET",
									url : "/list/desert",
								}).done(function(data){
									var recData = [];
									recData = data;
									recData = recData.filter(a=>{
										return a.product_type == "간식/간편식";
									}).slice(0,9);
									console.log(recData);
									var sampleView = recData.forEach(function(a){
										var rec_template = `<div class="rec-carousel-content-box">
											<div class="rec-carousel-content" style="background-image: linear-gradient( rgba(0, 0, 0, 0.2), rgba(0, 0, 0, 0.2) ), url('/img/\${a.product_img1 }');"
												onclick="javascript: location.href='/productView/productView?product_no=\${a.product_no}'">
												<div class="rcc-content font-noto">
													<h4>\${a.product_name}</h4>
													<p>\${a.product_price}원</p>
													<p>\${a.product_replyCnt}개의 리뷰</p>
												</div>
										</div>
									</div>`;
										$('#rec-5').append(rec_template);
									})
								});
								
							});
						</script>
					</div>
				</div>
			</div>
		</section>

		<section class="rec-carousel size15">
			<div class="carousel-title">
				<h2>주류/음료</h2>
				<p class="ml-10">우리나라 최고의 전통주들을 만나보세요</p>
			</div>
			<div class="rec-carousel-div">
				<button class="rec-carousel-button c-bt-left bg-main2" id="btn6-l" ><i class="fas fa-chevron-left"></i></button>
				<button class="rec-carousel-button c-bt-right bg-main2" id="btn6-r" ><i class="fas fa-chevron-right"></i></button>
				<div class="rec-carousel-box">
					<div class="rec-carousel-ul" id="rec-6">
						<script>
							$(document).ready(function(){
								$.ajax({
									type:"GET",
									url : "/list/beverage",
								}).done(function(data){
									var recData = [];
									recData = data;
									recData = recData.filter(a=>{
										return a.product_type == "주류/음료";
									}).slice(0,8);
									console.log(recData);
									var sampleView = recData.forEach(function(a){
										var rec_template = `<div class="rec-carousel-content-box">
											<div class="rec-carousel-content" style="background-image: linear-gradient( rgba(0, 0, 0, 0.2), rgba(0, 0, 0, 0.2) ), url('/img/\${a.product_img1 }');"
												onclick="javascript: location.href='/productView/productView?product_no=\${a.product_no}'">
												<div class="rcc-content font-noto">
													<h4>\${a.product_name}</h4>
													<p>\${a.product_price}원</p>
													<p>\${a.product_replyCnt}개의 리뷰</p>
												</div>
										</div>
									</div>`;
										$('#rec-6').append(rec_template);
									})
								});
								
							});
						</script>
					</div>
				</div>
			</div>
		</section>
		<%@ include file="./headerFooter/footer.jsp"%>
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
</body>

</html>