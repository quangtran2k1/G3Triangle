<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:set var="cart" value="${sessionScope['scopedTarget.cartService']}"/>

<section class="checkout spad">
        <div class="container">
            <div class="checkout__form">
                <h4>Chi tiết hóa đơn</h4>
                <form:form action="/gio-hang/dat-hang" modelAttribute="order" enctype="multipart/form-data">
	                <div class="form-control">
	                    <div class="row">
	                        <div class="col-lg-7 col-md-6">
	                            <div class="checkout__input form-control">
	                                <p>Mã khách hàng</p>
	                                <form:input path="customer.id" type="text" class="form-control"/>
	                            </div>
	                            <div class="checkout__input form-control">
	                                <p>Địa chỉ</p>
	                                <form:input class="form-control" type="text" path="address" value=""/>
	                            </div>
	                            <div class="checkout__input form-control" style="display: none;">
                                	<p>Thời gian đặt hàng</p>
	                                <form:input path="orderDate" class="form-control"/>
	                            </div>
	                            <div class="checkout__input form-control" style="display: none;">
	                                <p>Tổng</p>
	                                <form:input path="amount" class="form-control"/>
	                            </div>
	                            <div class="checkout__input form-control">
	                                <p>Lời nhắn</p>
	                                <form:textarea type="text" path="desciption" class="form-control" placeholder="Lưu ý cho cửa hàng."/>
	                            </div>
	                        </div>
	                        <div class="col-lg-5 col-md-6">
	                            <div class="checkout__order">
	                                <h4 style="text-align: center;">Đơn hàng</h4>	                                
	                                <div class="order__table">
	                                    <table>
	                                        <thead>
	                                            <tr>
	                                                <th class="shoping__product">Sản phẩm</th>
	                                                <th class="text-center">Số lượng</th>
	                                                <th class="text-end">Thành tiền</th>
	                                            </tr>
	                                        </thead>
	                                            <tbody>
	                                            	<c:forEach var="p" items="${sessionScope['scopedTarget.cartService'].items}">
		                                                <tr>
		                                                    <td class="shoping__cart__item">
		                                                        <h6>${p.name}</h6>
		                                                    </td>
		                                                    <td class="shoping__cart__quantity text-center">
		                                                        <h6>${p.quantity}</h6>
		                                                    </td>
		                                                    <td class="shoping__cart__total text-end" style="width: 120px;">
		                                                        <h6><f:formatNumber value="${p.quantity * p.unitPrice * (1-p.discount)}" pattern="#,###"/> &#8363</h6>
		                                                    </td>
		                                                </tr>
	                                                </c:forEach>
	                                            </tbody>
	                                    </table>
		                            </div>
	                                <div class="col-md-12 order__submit">
	                                    <table>
	                                        <tr>
	                                            <td><h5>Tổng thanh toán</h5></td>
	                                            <td class="text-end"><h5><f:formatNumber value="${cart.amount}" pattern="#,###"/> &#8363 </h5></td>
	                                        </tr>
	                                    </table>
	                                    <button class="primary-btn btn__order">ĐẶT HÀNG</button>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
                </form:form>
            </div>
        </div>
    </section>