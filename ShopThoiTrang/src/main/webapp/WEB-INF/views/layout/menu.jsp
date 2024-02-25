<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<c:set var="cart" value="${sessionScope['scopedTarget.cartService']}"/>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>

<div class="container">
    <div class="row">
        <div class="col-lg-3">
            <div class="header__logo">
                <a href="/trang-chu/index"><img src="/static/img/logo.png" /></a>
            </div>
        </div>
        <div class="col-lg-8">
            <nav class="header__menu">
                <ul>
                    <li class="active"><a href="/trang-chu/index">Trang chủ</a></li>
                    <li>
                        <a href="/san-pham/tat-ca-san-pham">Cửa hàng</a>
                        <ul class="header__menu__dropdown">
                            <li><a href="/trang-chu/index#sale-off">Sale Off</a></li>
                            <li><a href="/trang-chu/index#featured">Nổi bật</a></li>
                            <li><a href="/san-pham/tat-ca-san-pham">Sản phẩm</a></li>
                        </ul>
                    </li>
                    <li><a href="/blog/index">Blog</a></li>
                    <li><a href="/gioi-thieu/lien-he">Liên hệ</a></li>
                </ul>
            </nav>
        </div>
        <div class="col-lg-1">
            <div class="header__cart">
                <ul>
                    <li>
                        <a href="/gio-hang/chi-tiet-gio-hang"><i class="fa-solid fa-shopping-cart"></i>
                        <c:choose>
                        	<c:when test="${cart.count == null}">
                        		<span id="cart-cnt">0</span>
                        	</c:when>
                        	<c:otherwise>
                        		<span id="cart-cnt">${cart.count}</span>
                        	</c:otherwise>
                        </c:choose>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>