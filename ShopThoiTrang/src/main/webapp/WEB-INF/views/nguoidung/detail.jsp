<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="row">
	<div class="col-lg-12">
		<div class="shoping__cart__table">
			<h2 class="text-center">CHI TIẾT ĐƠN HÀNG</h2>
			<form:form action="/gio-hang/dat-hang" modelAttribute="order">
				<div class="checkout__input form-control">
					<p>Mã đơn hàng</p>
					<form:input path="id" type="text" class="form-control"
						readonly="true" />
				</div>
				<div class="checkout__input form-control">
					<p>Khách hàng</p>
					<form:input path="customer.id" type="text" class="form-control"
						readonly="true" />
				</div>
				<div class="checkout__input form-control">
					<p>Địa chỉ</p>
					<form:input class="form-control" type="text" path="address"
						readonly="true" />
				</div>
				<div class="checkout__input form-control">
					<p>Thời gian đặt hàng</p>
					<form:input path="orderDate" class="form-control" readonly="true" />
				</div>
				<div class="checkout__input form-control">
					<p>Tổng hóa đơn</p>
					<input value="<f:formatNumber value='${order.amount}' pattern='#,###'/> &#8363" class="form-control" readonly="true" />
				</div>
				<div class="checkout__input form-control">
					<p>Lời nhắn</p>
					<form:textarea type="text" path="desciption" class="form-control"
						readonly="true" />
				</div>
			</form:form>
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
				<c:forEach var="d" items="${detail}">
					<tbody>
						<tr>
							<td class="shoping__cart__item"><img
								src="/static/img/Product/${d.product.image}" alt="">
								<h5>${d.product.name}</h5></td>
							<td class="shoping__cart__price"><f:formatNumber
									value="${d.unitPrice * (1-d.discount)}" pattern="#,###" />
								&#8363</td>
							<td class="shoping__cart__quantity"><input
								value="${d.quantity}" style="width: 50%" class="text-center" readonly="readonly"/>
							</td>
							<td class="shoping__cart__total"><b class="shoping__amount"><f:formatNumber
										value="${d.unitPrice * d.quantity * (1-d.discount)}"
										pattern="#,###" /></b> &#8363</td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</div>
	</div>
</div>