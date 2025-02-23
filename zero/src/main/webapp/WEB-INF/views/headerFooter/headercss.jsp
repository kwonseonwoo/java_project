<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&family=Nanum+Myeongjo:wght@400;700&display=swap');
html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed, 
figure, figcaption, footer, header, hgroup, 
menu, nav, output, ruby, section, summary,
time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	vertical-align: baseline;
	-webkit-touch-callout: none; 
	user-select: none; 
	-moz-user-select: none; 
	-ms-user-select: none; 
	-webkit-user-select: none;

}

h1,h2,h3,h4,h5,p {
    rotate: (0.03deg);
}

body {
	line-height: 1;
 	padding: 0;
  	margin: 0;
    background-color: darkgray;
}

button{
    cursor: pointer;
    background-color: #eee;
    border: none;
}

div, button, span, input, textarea, a, nav, article, section, form, table, tr, td, th{
    box-sizing: border-box;
}

span{
    display: inline;
}


a{
    text-decoration-line: none;
    text-decoration: none;
    cursor: pointer;
    color: white;
}

a:hover{
    color: rgb(235, 217, 193);
}

/* header*/
.header{
    width: 100%;
    height: auto;
}

.nav-top{
    width: 100%;
    height: auto;
    padding: 25px 0 0px 0;
}

.nav-top-contents{
    margin: 0 auto;
    width: 100%;
    max-width: 1150px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    position: relative;
}

.nav-input{
    border: 1px solid rgb(187, 179, 179);
    border-radius: 50px;
    padding: 0 10px 0 35px;
    width: 90%;
    height: 35px;
    background-color: rgb(20, 20, 20);
    font-size: 13px;
}

input::placeholder{
    color: rgb(235, 217, 193);
}

.input-div{
    display: flex;
    position: relative;
}

.input-div i{
    position: absolute;
    left: 13px;
    color: rgb(235, 217, 193);
}

.logo{
    position: absolute;
    left: 41%;
    top: -10px;
    letter-spacing: 3px;
}

.logo h4 i{
    font-size: 35px;
    position: relative;
    top:4px;
}

.logo-color{
    color: rgb(235, 217, 193);
}


.nav-top-contents div{
    align-items: center;
    margin-bottom: 10px;
}

.nav-top-ul{
    display: flex;
    flex-direction: row;
}

.nav-top-ul li{
    font-size: 14px;
    margin-left: 25px;
}

#nav-cart a i{
    color: rgb(235, 217, 193);
    margin-right: 5px;
}

#nav-cart{
    padding: 0 10px;
}

#nav-cart:before{
    content: "|";
    float: left;
    display:block;
    position: relative;
    left:-15px;
    top:-4px;
    font-size: 20px;
    color: rgb(204, 193, 180);
}

.cart-num{
    display: inline-block;
    padding: 2px 10px;
    margin-left: 5px;
    background-color: rgb(189, 158, 118);
    text-align: center;
    font-size: 6px;
    font-weight: 700;
    border-radius: 8px;
    position: relative;
    top: -1px;
}

.nav-top::after{
   content:"";
   display: block;
   border-bottom: 1px solid rgb(235, 217, 193);
   position: relative;
   top: 5px;
}

.nav-body{
    margin-top: 20px;
    width: 100%;
    height: 40px;
    padding: 0;
}

.nav-body-contents{
    margin: 0 auto;
    width: 100%;
    height: 40px;
    max-width: 1150px;
    align-items: center;
    position: relative;
    padding: 0;
}

.nav-body-ul{
    width: 45%;
    height: 100%;
    display: flex;
    flex-direction: row;
    align-items: center;
    margin: 0 auto;
    position: relative;
    left: -25px;
    justify-content: space-between;
    padding: 0;
}

.nav-body-ul li{
    font-family: 'Nanum Myeongjo', serif;
    font-size: 16px;
    letter-spacing: 4px;
    padding: 0 15px;
    height: 30px;
    align-items: center;
}

#nav-special{
    margin-left: 20px;
    position: relative;
    top:0px;
    
}

#nav-special a{
    color: rgb(204, 193, 180);
}

#nav-special a:hover{
    color: rgb(231, 224, 216);
}

#nav-special::before{
    content: "|";
    float: left;
    display:block;
    position: relative;
    left:-27px;
    top:-1px;
    font-size: 23px;
    color: rgb(204, 193, 180);
}



/* footer */
.footer{
    width: 100%;
    margin: 0 auto;
    max-width: 1150px;
    bottom: 0;
    padding: 50px 0;
    border-top: 1px solid rgb(231, 224, 216);
}
.footer h2 {
    padding: 10px 0 20px 0;
}

.footer h5 {
    font-size: 18px;
    padding: 10px 0;
}

.footer p {
    font-size: 13px;
    word-break:keep-all;
    line-height: 180%;
}

.footer-top{
    width: 100%;
    max-width: 1150px;
    margin: 0 auto;
    display: flex;
    justify-content: space-between;
    padding-bottom: 70px;
}

.footer-left{
    width: 35%;
}

.footer-left h1{
    margin-bottom: 10px;
}

.footer-left-contents{
    display: flex;
}

.footer-left-contents span{
    margin-right: 10px;
    margin-bottom: 5px;
}

.ft-con::after{
    content: " | īī���� ���� : ";
}

.footer-right{
    width: 40%;
    display: flex;
    justify-content: space-between;
}

.footer-bottom{
    width: 100%;
    max-width: 1150px;
    margin: 0 auto;
    padding-top: 20px;
    display: flex;
    justify-content: space-between;
}

.footer-bottom-right{
    border-top: 1px solid rgb(231, 224, 216);
    padding-top: 20px;
    width: 40%;
}

.footer-bottom-right p span{
    margin: 5px;
}

.footer-bottom-right p span::after{
    content: "|";
    position: relative;
    left: 5px;
    color: rgb(231, 224, 216);
}

.footer-bottom-left{
    border-top: 1px solid rgb(231, 224, 216);
    padding-top: 20px;
    width: 35%;
}

.footer-bottom-left p span{
    margin-right: 20px;
    font-weight: 700;
}

.footer-bottom-left p span::after{
    content: "|";
    position: relative;
    left: 10px;
    color: rgb(231, 224, 216);
}

.search-modal{
    z-index: 10;
    width: 100vw;
    position: fixed;
    padding: 100px 0;
    background-color: rgb(85, 85, 85);
}

.search-box{
    margin: 0 auto;
    width: 100%;
    max-width: 1150px;
    position: relative;
    background-color: rgb(85, 85, 85);
}

.search-box h4{
    margin-bottom: 30px;
    font-size: 18px;
    letter-spacing: 2px;
}

.search-box h4 span{
    position: absolute;
    right: 0;
    cursor: pointer;
    color: darkgray;
}

.search-div{
    display: flex;
    margin-bottom: 20px;
}

.search-div i{
    position: absolute;
    right: 5px;
    top: 70px;
    color: darkgray;
}

.search-input{
    width: 100%;
    height: 60px;
    padding: 15px 0;
    background-color: none;
    border: none;
    border-bottom: 1px solid darkgray;
    background-color: rgb(85, 85, 85);
    font-size: 35px;
    color: darkgray;
}

.search-input::placeholder{
    color: darkgray;
}

.search-input:focus{
    outline: none;
}

.search-off{
    display: none;
}

.bg-none{
	background-color: transparent;
}

.bg-gray{
	background-color: darkgray;
}


.search-contents{
    background-color: rgb(85, 85, 85);

</style>
</head>
<body>

</body>
</html>