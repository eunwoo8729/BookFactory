<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML>
<html lang="en-US">
<head>
<meta charset="UTF-8">
<title>Delphic | Creative Portfolio Template</title>
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
         var timeouts = [ 150, 390, 25 ];
         function calculateTimeout(currElement, nextElement, opts, isForward) {
            var index = opts.currSlide;
            return timeouts[index] * 1000;
         }
         jQuery('#sliderholder-cycle').cycle({
            fx : 'fade',
            pager : '.slidernav',
            prev : '.sliderprev',
            next : '.slidernext',
            speed : 1000,
            timeoutFn : calculateTimeout,
            pagerEvent : 'click',
            pauseOnPagerHover : true,
            cleartype : 1
         });
         jQuery('#sliderholder-cycle').css("display", "block");
         jQuery('.slidernav').css("display", "block");

      }
   });

   function idCheck() {
      
       var a = document.getElementsByName("memberID").value;
       
       if (a == null) {
         alert("로그인을 해주세요.");
         return false;
      }
    }
</script>
</head>
<body>

   <div id="container">
      <!-- Begin Header Wrapper -->
      <div id="page-top">
         <div id="header-wrapper">
            <!-- Begin Header -->
            <div id="header">
               <div id="logo">
                  <a href="mainAction.action"><img src="./style/image/lgoo.jpg"
                     alt="logo img" width="100" height="100" /></a>
               </div>
               <!-- Logo -->
               <!-- Begin Menu -->
               <div id="menu-wrapper">
                  <div id="smoothmenu1" class="ddsmoothmenu">

                     <table width="100%" height="100%" cellpadding="0" cellspacing="0"
                        border="0">
                        <tr>
                           <td align="left">
                              <!--  <div id="logo"><a href="mainAction.action"><img src="./style/image/logo.jpg" alt="logo img"  /></a></div> -->
                           </td>
                           <td align="right"><a href="mainAction.action">home</a> <s:if
                                 test="${ session_id == null }">
                                 <a href="joinAgree.action">회원가입</a>
                                 <a href="loginForm.action">로그인</a>
                              </s:if> <s:else>
                                 <s:if test="${ session_admin_tp == 1 }">
                                    <a href="admin.action">관리자페이지</a>
                                 </s:if>
                                 <s:else>
                                    <a href="myPage.action">마이페이지</a>
                                 </s:else>
                                 <a href="logout.action">로그아웃 (${ session_id })</a>
                              </s:else></td>
                        </tr>
                     </table>
                     <ul>
                
                        <li><a href="bookSearchForm.action">도서 검색</a>
                           <ul>
                              <li><a href="bookSearchForm.action">도서 검색</a></li>
                              <li><a
                                 href="bookSearch.action?searchNum=0&searchKeyword=">도서 목록</a></li>
                           </ul></li>
                        <li><a href="boardList.action">통합 게시판</a>
                           <ul>
                              <li><a href="noticeList.action">공지 사항</a></li>
                              <li><a href="boardListFree.action">자유 게시판</a></li>
                              <li><a href="boardListQna.action">Q & A</a></li>
                              <li><a href="boardListBookOrder.action">도서 신청</a></li>
                           </ul></li>
                        <li><a href="introduce.action">도서관소개</a>
                           <ul>
                              <li><a href="history.action">도서관 연혁</a></li>
                              <li><a href="map.action">오시는 길</a></li>
                           </ul></li>
                           <s:hidden name="member_id" value="${session_id}" />
                           <li><a href="myPage.action" onclick="return idCheck();">마이페이지</a>
                              <ul>
                                 <li><a href="memberModifyForm.action">내 정보 수정</a></li>
                                 <li><a href="memberDeleteForm.action">회원 탈퇴</a></li>
                                 <li><a href="myPageBookList.action">내 서재 목록</a></li>
                                 <li><a href="myWrote.action">내가 쓴 글</a></li>
                                 <li><a href="myRentList.action">대출 내역 확인</a></li>
                                 <li><a href="myReserveList.action">예약 내역 확인</a></li>
                              </ul></li>
                     </ul>
                  </div>
               </div>
               <!-- End Menu -->
            </div>
            <!-- End Header -->
         </div>
      </div>
   </div>
   <div class="line"></div>
</body>
</html>