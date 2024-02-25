<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>

<table class="table table-hover">
	<thead>
		<tr>
			<th class="text-start">Sản phẩm</th>
			<th class="text-center">Giá</th>
			<th class="text-center">Số lượng</th>
			<th class="text-center">Giảm giá</th>
			<th class="text-center">Thành tiền</th>
		</tr>
	</thead>
	<c:forEach var="e" items="${detail}">
		<tbody>
			<tr>
				<td><img src="/static/img/Product/${e.product.image}" style="display: inline-block; margin-right: 25px; width: 80px; height: 80px; object-fit: cover;">
					<h5 style="display: inline-block; text-overflow: ellipsis;">${e.product.name}</h5></td>
				<td class="text-center" style="vertical-align: middle;"><f:formatNumber
						value="${e.unitPrice}" pattern="#,###" />
					&#8363</td>
				<td class="text-center" style="vertical-align: middle;">${e.quantity}</td>
				<td class="text-center" style="vertical-align: middle;">${e.discount*100} %</td>
				<td class="text-center" style="vertical-align: middle; width: 200px"><f:formatNumber
							value="${e.unitPrice * e.quantity * (1-e.discount)}"
							pattern="#,###" /> &#8363</td>
			</tr>
		</tbody>
	</c:forEach>
</table>