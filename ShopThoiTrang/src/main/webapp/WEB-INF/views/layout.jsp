<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>G3Triangle | </title>
	<tiles:insertAttribute name="head"/>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
	    // kéo xuống khoảng cách 500px thì xuất hiện nút Top-up
	    var offset = 500;
	    // thời gian di trượt 0.75s ( 1000 = 1s )
	    var duration = 750;
	    $(function(){
	    $(window).scroll(function () {
	    if ($(this).scrollTop() > offset)
	    $('#top-up').fadeIn(duration);else
	    $('#top-up').fadeOut(duration);
	    });
	    $('#top-up').click(function () {
	    $('body,html').animate({scrollTop: 0}, duration);
	    });
	    });
	</script>
</head>
<body>

<body>
<!-- Header Section Begin -->
<header class="header">
    <div class="header__top">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="header__top__left">
                        <ul>
                            <li><i class="fa-solid fa-envelope"></i> trannhatquang107@gmail.com</li>
                            <li><i class="fa-solid fa-phone"></i> 0377092001</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="header__top__right">
                        <div class="header__top__right__social">
                            <a href="#"><i class="fa-brands fa-facebook-f"></i></a>
                            <a href="#"><i class="fa-brands fa-twitter"></i></a>
                            <a href="#"><i class="fa-brands fa-instagram"></i></a>
                            <a href="#"><i class="fa-brands fa-pinterest-p"></i></a>
                        </div>
                        <div class="header__top__right__auth">
                        	<c:choose>
                        		<c:when test="${empty sessionScope.userId}">
                        			<a href="/tai-khoan/dang-nhap"><i class="fa fa-user"></i> Đăng nhập</a>
                        		</c:when>
                        		<c:otherwise>
                        			<a href="/nguoi-dung/${sessionScope.userId}">${sessionScope.userId}</a>
                        		</c:otherwise>
                        	</c:choose>             
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <tiles:insertAttribute name="menu"/>
</header>
<!-- Header Section End -->

<!-- Drop__Menu Section Begin -->
<section class="dropdown__menu">
	<div class="container flex__menu">
		<div class="col-lg-3">
			<div class="dropdown">
				<div class="select">
					<span class="selected"><i class="fa-solid fa-bars"></i> Loại
						sản phẩm</span>
					<div class="caret"></div>
				</div>
				<ul class="menu">
					<c:forEach var="c" items="${cates}">
						<li><a href="/san-pham/loai-san-pham/${c.id}">${c.nameVN}</a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="col-lg-9">
			<div class="search">
				<div class="search__form">
					<form action="/san-pham/tim-kiem" method="post">
						<div class="search__input">
							<input value="${param.keywords}" type="text" name="keywords" required
								placeholder="Tìm kiếm . . .">
						</div>
						<button type="submit">Tìm kiếm</button>
					</form>
				</div>
				<div class="hotline">
					<div class="hotline__icon">
						<a href="#"><i class="fa-solid fa-phone"></i></a>
					</div>
					<div class="hotline__text">
						<h5>0377 092 001</h5>
						<span>Hỗ trợ 24/7</span>
					</div>
				</div>
			</div>
			<tiles:insertAttribute name="body"/>
		</div>
	</div>
</section>
<!-- Drop__menu Section End -->




<!-- Footer Section Begin -->
<footer class="footer spad">
    <div title="Về đầu trang" id="top-up">
        <i class="fas fa-arrow-circle-up"></i>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="footer__about">
                    <div class="footer__about__logo">
                        <a href="/trang-chu/index"><img src="/static/img/logo.png"/></a>
                    </div>
                    <ul>
                        <li>Địa chỉ: 7/46 Mai Trai, Sơn Tây, Hà Nội</li>
                        <li>Điện thoại: 0377092001</li>
                        <li>Email: trannhatquang107@gmail.com</li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1" style="margin-top: 27px;">
                <div class="footer__widget">
                    <ul>
                        <li><a href="#">Thông tin về G3Triangle</a></li>
                        <li><a href="#">G3Triangle Blog</a></li>
                        <li><a href="#">Thanh toán</a></li>
                        <li><a href="#">Chính sách bảo hành</a></li>
                        <li><a href="#">Trả hàng hoàn tiền</a></li>
                        <li><a href="#">Vận chuyển</a></li>
                    </ul>
                    <ul>
                        <li><a href="#">Trung tâm trợ giúp</a></li>
                        <li><a href="#">Điều khoản</a></li>
                        <li><a href="#">Chính sách bảo mật</a></li>
                        <li><a href="">Liên hệ</a></li>
                        <li><a href="#">Chăm sóc khách hàng</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-4 col-md-12">
                <div class="footer__widget">
                    <h6>Đăng ký tham gia chương trình</h6>
                    <p>Nhận thông tin chương trình và ưu đãi của cửa hàng qua mail</p>
                    <form action="#">
                        <input type="text" placeholder="Nhập mail của bạn">
                        <button type="submit" class="site-btn">Đăng ký</button>
                    </form>
                    <div class="footer__widget__social">
                        <a href="#"><i class="fa-brands fa-facebook-f"></i></a>
                        <a href="#"><i class="fa-brands fa-twitter"></i></a>
                        <a href="#"><i class="fa-brands fa-instagram"></i></a>
                        <a href="#"><i class="fa-brands fa-pinterest-p"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="footer__copyright">
                    <div class="footer__copyright__text">
                        <p>
                            Copyright &copy;
                            <script>document.write(new Date().getFullYear());</script> All rights reserved | Website được xây dựng bởi <a href="https://www.facebook.com/fb.of.quang">Quang</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- Footer Section End -->
<tiles:insertAttribute name="foot"/>
</body>
</html>