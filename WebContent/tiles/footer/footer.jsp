<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>

<!DOCTYPE HTML>
<html lang="en-US">
<head>
<meta charset="UTF-8">
<title>SSLibrary</title>
<link rel="stylesheet" type="text/css" href="style.css" media="all" />
<link rel="stylesheet" media="all" href="style/type/folks.css" />
<!--[if IE 7]>
<link rel="stylesheet" type="text/css" href="style/css/ie7.css" media="all" />
<![endif]-->
<script type="text/javascript" src="style/js/jquery-1.5.min.js"></script>
<script type="text/javascript" src="style/js/jquery.cycle.all.min.js"></script>
<script type="text/javascript" src="style/js/ddsmoothmenu.js"></script>
<script type="text/javascript" src="style/js/scripts.js"></script>
<script type="text/javascript">
$(function() {
         if ($('#sliderholder-cycle').length) {
         // timeouts per slide (in seconds) 
         var timeouts = [150,390,25]; 
         function calculateTimeout(currElement, nextElement, opts, isForward) { 
             var index = opts.currSlide; 
             return timeouts[index] * 1000;
         }
         jQuery('#sliderholder-cycle').cycle({
            fx: 'fade',
            pager: '.slidernav',
            prev:    '.sliderprev',
              next:    '.slidernext',
            speed: 1000,
            timeoutFn: calculateTimeout,
            pagerEvent: 'click',
             pauseOnPagerHover: true,
             cleartype: 1
});
         jQuery('#sliderholder-cycle').css("display", "block");
         jQuery('.slidernav').css("display", "block");
         
         }
});
</script>
</head>
<body>
<div class="line">
         </div>
   <div id="footer-wrapper">
  <div id="footer">
    <div id="footer-content"> 
      
      <!-- Begin Copyright -->
      <div id="copyright">
        <p><h5> 사업자등록번호 : 101-19-00112 &nbsp;&nbsp;&nbsp;통신판매업신고번호 : 제 2017-서울강남-33호&nbsp;&nbsp;&nbsp; <br>
           대표 : 이조은 &nbsp;&nbsp;&nbsp; 대표전화 : 02-1588-5588 &nbsp;&nbsp;&nbsp; 개인정보책임자 : 한소진
             &nbsp;&nbsp;&nbsp;<br>
           주소 : 서울시 강남구 역삼동 33-33 삼삼빌딩 3층 I반 &nbsp;&nbsp;&nbsp;<br> 
             Copyright CharlieBook Corp. All right reserved.</h5></p>
            <br><br>
      </div>
      <!-- End Copyright --> 
      
      <!-- Begin Social Icons -->
      <div id="socials">
       <img src="style/image/footer/footer.png">
      
      </div>
      <!-- End Social Icons --> 
      
    </div>
  </div>
</div>


</body>
</html>