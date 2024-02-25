<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<c:set var="cart" value="${sessionScope['scopedTarget.cartService']}"/>

<section class="shoping-cart spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="shoping__cart__table">
                    <h2 class="text-center">GIỎ HÀNG</h2>
                    <table>
                        <thead>
                            <tr>
                                <th class="shoping__product">Sản phẩm</th>
                                <th>Giá</th>
                                <th>Số lượng</th>
                                <th>Thành tiền</th>
                                <th></th>
                            </tr>
                        </thead>
                        <c:forEach var="p" items="${sessionScope['scopedTarget.cartService'].items}">
                            <tbody>
                                <tr data-id="${p.id}" data-price="${p.unitPrice * (1-p.discount)}">
                                    <td class="shoping__cart__item">
                                        <img src="/static/img/Product/${p.image}" alt="">
                                        <h5>${p.name}</h5>
                                    </td>
                                    <td class="shoping__cart__price">
                                        <f:formatNumber value="${p.unitPrice * (1-p.discount)}" pattern="#,###"/> &#8363
                                    </td>
                                    <td class="shoping__cart__quantity">
                                        <input name="qty" value="${p.quantity}" type="number" min="1" style="width:50%"/>
                                    </td>
                                    <td class="shoping__cart__total">
                                        <b class="shoping__amount"><f:formatNumber value="${p.unitPrice * p.quantity * (1-p.discount)}" pattern="#,###"/></b> &#8363
                                    </td>
                                    <td class="shoping__cart__item__close text-center">
                                        <a><span class="fa-solid fa-xmark"></span></a>           
                                    </td>
                                </tr>
                            </tbody>
                            </c:forEach>
                    </table>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="shoping__cart__btns">
                    <a href="/san-pham/tat-ca-san-pham" class="primary-btn cart-btn">TIẾP TỤC MUA SẮM</a>
                    <input type="submit" class="primary-btn cart-btn cart-btn-right cart-btn-clear" name="update" value="XÓA TẤT CẢ" style="border:none">
                </div>
            </div>
            <div class="col-lg-6">
            </div>
            <div class="col-lg-6">
                <div class="shoping__checkout">
                    <h5>Tổng thanh toán</h5>
                    <ul>
                        <li>Giảm giá <span>-- &#8363 </span></li>
                        <li>Tổng <span><b id="cart-amt"><f:formatNumber value="${cart.amount}" pattern="#,###"/></b> &#8363 </span></li>
                    </ul>
                    <a href="/gio-hang/dat-hang" class="primary-btn">THANH TOÁN</a>
                </div>
            </div>
        </div>
    </div>
</section>