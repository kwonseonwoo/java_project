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
<title>마이페이지</title>
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
.cont {
	display:flex;
	flex-direction: column;
    align-items: center;
    background-color: rgb(45, 45, 45);
}

.paginations {
    padding-left: 0;
    list-style: none;
    display: flex;
    text-align:center;
}

.paginations li {
	font-size: 20px;
	font-weight: bold;
	margin-left:10px;
}

.paginations li a {
    text-decoration: none;
    color: rgb(216, 190, 157);
    font-size: 20px;
	font-weight: bold;
    
}
</style>
</head>
<body>
	<div class="wrap" id="wrap">
	<%@ include file="/WEB-INF/views/headerFooter/adminHeader.jsp"%>
    	<section class="size-all bg-dg myPage">
            <div class="myPage-title">
                <p class="font-noto">MyPage 주문목록</p>
                
                <form id="searchForm" action="/myPage/myPage" method="get">
               		<input type="hidden" name="type" value="TCW" style="display:none;">
                	<input type="text" name="keyword" placeholder="주문한 상품을 검색할 수 있어요!"></input>
                	<input type='hidden' name='member_no' value='${pageMaker.cri.member_no}'>
                	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
					<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
                	<button class="adminList-search-button pd-5 bg-dg main-color2">Search</button>
                </form>
                
            
            </div>
            
            <div class="myPage-box">
                
            </div>
            
            <div class="cont">
            	<ul class="paginations">

						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous"
								aria-controls="dataTables-example" tabindex="0"
								id="dataTables-example_previous"><a
								href="${pageMaker.startPage -1}">이전</a></li>
						</c:if>

						<c:if test="!${pageMaker.prev}">
							<li class="paginate_button previous disabled"
								aria-controls="dataTables-example" tabindex="0"
								id="dataTables-example_previous"><a
								href="${pageMaker.startPage -1}">이전</a></li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<c:if test="${num==pageMaker.cri.pageNum}">
								<li class="paginate_button active"
									aria-controls="dataTables-example" tabindex="0"><a
									href="${num}">${num}</a></li>
							</c:if>
							<c:if test="${num!=pageMaker.cri.pageNum}">
								<li class="paginate_button" aria-controls="dataTables-example"
									tabindex="0"><a href="${num}">${num}</a></li>
							</c:if>
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"
								aria-controls="dataTables-example" tabindex="0"
								id="dataTables-example_next"><a
								href="${pageMaker.endPage + 1}">다음</a></li>
						</c:if>
					</ul>
					
					<form id="actionForm" action="/myPage/myPage" method="get">
						<input type='hidden' name='member_no' value='<c:out value="${pageMaker.cri.member_no}"/>'>
						<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum }'>
						<input type='hidden' name='amount' value='${pageMaker.cri.amount }'>
						<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type}"/>'> 
						<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'>
						
					</form>
				</div>

            <script>
                $(document).ready(function (){
                	
                	var list = ${list} //받아온 마이페이지 리스트
                	console.log(list);
                	
                	var date = [];
                	
                	for(var i=0; i<list.length; i++) {
						
						var data = new Date(list[i].order_date);
						
						//도착 날짜 계산
						var year = data.getFullYear();
						var month = data.getMonth()+1;
						var day = data.getDate()+3;
						
						//도착 날짜
						var result = year + "." + month + "." + day;
						
						//주문 날짜 계산
						var days = data.getDate();
						
						//주문 날짜
						var result_date = year + "." + month + "." + days;
							
						date[i] = result;
						list[i].sample = date[i];
						
						list[i].order_date = result_date;
                	}
                	
                	
                    var myPageView = list.forEach((a,i)=>{
                        var myPageTemplate = `
                        <div class="myPage-content-box">
                            <div class="myPage-content">
                                <div class="myPage-content-top mc-div">
                                    <p class="strong mct-date">\${a.order_date} 주문</p>
                                    <p class="mct-view main-color" id="order_no\${i}">주문 상세 보기 ▶ </p>
                                    <input type="hidden" value="\${a.order_no}" id="order_value\${i}">
                                </div>
                                <div class="myPage-content-main mc-div">
                                    <p class="mcm-del-date main-color2">\${a.sample} 도착 예정</p>
                                    <div class="mcm-main">
                                        <div class="mcm-main-img">
                                            <img src="/img/\${a.product_img1 }" width="100%">
                                        </div>
                                        <div class="mcm-main-text">
                                            <p class="mcm-main-name">\${a.product_name}</p>
                                            <div class="mcm-main-sub">
                                                <p>\${a.product_price}원 \${a.product_quantity}개</p>
                                                <form method="post" id="formTag">
                                                    <input type="hidden" value="\${a.product_no}" id="product_no\${i}" name="product_no">
                                                    <input type="hidden" value="\${a.product_quantity}" name="product_quantity">
                                                    <input type="hidden" value="\${a.product_price}" name="product_price">  
                                                    <input type="hidden" value="\${a.product_name}" name="product_name">   
                                                    <button class="mcm-cart-button" id="mcm-cart-button\${i}">장바구니 담기</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mcm-buttons">
                                        <div class="mmb-cancel">주문/배송 취소</div>
                                        <div class="mmb-search">배송조회</div>
                                    </div>
                                </div>
                                <div class="myPage-review" onclick="move_review(\${a.product_no})">구매후기 쓰기</div>
                            </div>
                        </div>
                        
                        `;
                        $('.myPage-box').append(myPageTemplate);

                        $(`#order_no\${i}`).on('click',function (){
                        	
                            /* alert(a.order_no);
                             */
                            var order_no = document.getElementById(`order_value\${i}`).value;

                             console.log(order_no);
                             
                             location.href="/buy/buyResult?order_no="+order_no;
                            
                        });
                        
                        $(`#mcm-cart-button\${i}`).on("click", function(e){
                        	
                        	e.preventDefault();
    	
                        		var member_no = "<c:out value='${principal.member.member_no}' />";
                        		var product_no = document.getElementById(`product_no\${i}`).value;
                        		var product_quantity = 1;
                        		
								console.log(document.getElementById(`product_no\${i}`).value);
                        		
                        		console.log("멤버번호: ", member_no);
                        		console.log("상품번호: ", product_no);
                        		
                        		 if(member_no == null || member_no == "") {
                    				alert("로그인을 해주세요.");
                    				location.href="/auth/loginForm";
                    			} else {
                    				
                    				var content = {
                    						member_no: member_no,
                    						product_no: product_no,
                    						product_quantity: product_quantity
                    				};
                    				
                    				cartAdd.add(content, function(result){
                    					alert(result);
                    				});
                    				
                    			} 
                        		
                        	});
                        
                    });
                });
            </script>
            
            <script>
            	$(document).ready(function(){
            		
            		$(".mmb-cancel").on("click", function(){
                    	alert("준비중입니다.");
                    	return;
                    });
                    
                    $(".mmb-search").on("click", function(){
                    	alert("준비중입니다.");
                    	return;
                    });
                    
                    var searchForm=$("#searchForm");

            		$("#searchForm button").on("click",function(e){
            			
            			if(!searchForm.find("input[name='keyword']").val()){
            				alert("검색 키워드를 입력하세요");
            				return false;
            			}
            			
            			e.preventDefault();
            			
            			searchForm.submit();
            			
            			});
            		
            		var actionForm = $("#actionForm");
            		
            		/* 페이지 네비게이션 버튼 클릭시 */
            		$('.paginate_button a').on("click",function(e){
            			e.preventDefault();
            			
            			console.log('click');
            			/* 클릭한 <a>태그의 페이지번호를 actionForm의 input tage 에 설정 val(값); */
            			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
            			actionForm.submit();//action으로 전송처리
            			
            		});
                    
                 });
            	
            	function move_review(product_no) {
            		
            		location.href="/productView/productView?product_no="+product_no;
            	}
            </script>
            
            <script>
        	//카트 추가 함수
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
</body>
</html>