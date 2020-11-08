<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>say cheese</title>
<link href="resources/css/style.css" type="text/css" rel="stylesheet">

<script type="text/javascript" src="<c:url value='resources/js/jquery-1.12.3.js'/>"></script>
<script type="text/javascript" src="<c:url value='resources/js/jjscript.js'/>"></script>



</head>

<body>

<!--==== ìì´ì´íë ì ì¼ìª½ ìì ====-->
<header>
<div class="top"> <!-- top:logoì menu ë¬¶ì´ì¤ -->
  <div class="logo">
  <a href="MemberStart"><img src="resources/img/logo.png" alt="ë¡ê³ "></a>
  </div>
  <nav class="menu">
  <ul class="navi">
    <li><a href="#">About us</a>
      <ul class="submenu">
        <li><a href="#">Hello!</a></li>
        <li><a href="#">News</a></li>
        <li><a href="#">Our space</a></li>
      </ul>
    </li>
    <li><a href="#">Programs</a>
      <ul class="submenu">
        <li><a href="#">Why Skateboarding?</a></li>
        <li><a href="#">Schedule</a></li>
        <li><a href="#">the rookie of the month</a></li>
      </ul>
    </li>
    <li><a href="#">Booking</a>
      <ul class="submenu">
        <li><a href="#">Booking</a></li>
        <li><a href="#">Confirm</a></li>
        <li><a href="#">Cancelation</a></li>
      </ul>
    </li>
    <li><a href="#">Community</a>
      <ul class="submenu">
        <li><a href="#">Notice</a></li>
        <li><a href="GoReview?name=${login.name }">Review</a></li>
        <li><a href="GoFBoard?name=${login.name }">Free board</a></li>
      </ul>
    </li>
  </ul>
  </nav>
</div>  <!-- top ë -->
</header>
<!--==== ìì´ì´íë ì ì¼ìª½ ë ====-->

<!--==== ìì´ì´íë ì ì¤ë¥¸ìª½ ìì ====-->
<div class="bodywrap"> <!-- bodywrap:imgslideì contents ë¬¶ì´ì¤ -->
<div class="imgslide">
  <a href="#">
  <img src="resources/img/img1.jpg" alt="ì´ë¯¸ì§1">     
  <span class="imgtext">NOW WE ARE OPEN!</span>
  </a>
  
  <a href="#">
  <img src="resources/img/img2.jpg" alt="ì´ë¯¸ì§2">     
  <span class="imgtext">Meet our new tough cookies!</span>                     
  </a>
  
  <a href="#">
  <img src="resources/img/img3.jpg" alt="ì´ë¯¸ì§3">     
  <span class="imgtext">Covid-19: Say Cheese</span>                     
  </a>
</div>

<div class="contents"> <!-- contents:tabmenuì otherwrap ë¬¶ì´ì¤ -->
  <ul class="tabmenu"> <!-- tabmenu:ê³µì§ì¬í­ê³¼ ê°¤ë¬ë¦¬ ë¬¶ì´ì¤ -->
    <li class="active"><a href="#">Notice</a>
    <div class="notice">
    <ul>
      <li><a href="#">Youth Voices
      <span>2020.03.14</span></a></li>
      <li><a href="#">Queer Skate Night
      <span>2020.03.14</span></a></li>
      <li><a href="#">Ugly Sweater 
      <span>2020.03.14</span></a></li>
      <li><a href="#">Neuro-Diverse
      <span>2020.03.14</span></a></li>
    </ul>
    </div>
    </li>
    <li><a href="#">Gallery</a>
    <div class="gallery">
    <ul>
      <li><a href="#"><img src="resources/img/icon1.jpg" alt="ê°¤ë¬ë¦¬1"></a></li>
      <li><a href="#"><img src="resources/img/icon2.jpg" alt="ê°¤ë¬ë¦¬2"></a></li>
      <li><a href="#"><img src="resources/img/icon3.jpg" alt="ê°¤ë¬ë¦¬3"></a></li>
    </ul>
    </div>
    </li>
  </ul>  <!-- tabmenu ë -->
  
  <div class="otherwrap"> <!-- otherwrap:bannerì shortcut ë¬¶ì´ì¤ -->
    <div class="banner">
      <a href="#">
      <img src="resources/img/banner.jpg" alt="ë°°ë">
         
      </a> 
    </div>    
    <div class="shortcut">
      <form class="login-form" action="logoutPro">
        <div class="started">
          <li>             </li>
          <li>Let's go Cruising ${login.name } !!</li>
        </div>
        <button onclick="submit"> logout</button>
      </form>
    </div>
  </div> <!-- otherwrap ë -->
</div> <!-- contents ë -->
</div> <!-- bodywrap ë -->

<div id="modal"> <!-- ë ì´ì´ íìì°½ ìì­ -->
  <div class="modal_up">
    <div class="uptitle">Youth Voices: An Interactive Workshop</div>
    <div class="upbody">
      The Youth Voices event this past Sunday with Dobijoki was amazing. We had a brilliant group of young adults get together and learn what it means to know who you are.
      So grateful for our facilitator and everyone who came out and participated! Thank you all for being part of this incredible event!
    </div>
    <div class="btn">ë«ê¸°</div>
  </div>
</div> <!-- ë ì´ì´ íìì°½ ìì­ ë -->

<footer>
    
  
  <div class="site"> <!-- site:btmenuì copy ë¬¶ì´ì¤ -->
    <div class="btmenu">
      <ul>
        <li><a href="#">HOME</a></li>
        <li><a href="#">CAREER</a></li>
        <li><a href="#">LOCATION</a></li>
      </ul>
      </div>
    <div class="copy">
    COPYRIGHT Â© by Doyoon Kim. ALL RIGHTS RESERVED
    </div>               
  </div> <!-- site ë -->
</footer>
<!--==== ìì´ì´íë ì ì¤ë¥¸ìª½ ë ====-->

</body>
</html>

