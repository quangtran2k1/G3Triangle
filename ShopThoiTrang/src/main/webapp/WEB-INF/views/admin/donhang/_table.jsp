<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>

<table class="table table-hover">
	<thead>
		<tr>
			<th>ID</th>
			<th>Khách hàng</th>
			<th>Địa chỉ</th>
			<th>Ngày tạo đơn</th>
			<th>Tổng thanh toán</th>
			<th>Chức năng</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="e" items="${list}">
		<tr>
			<td>${e.id}</td>
			<td>${e.customer.id}</td>
			<td>${e.address}</td>
			<td>${e.orderDate}</td>
			<td><f:formatNumber value='${e.amount}' pattern='#,###'/> &#8363</td>
			<td>
				<a class="btn btn-sm btn-success" href="${base}/chi-tiet/${e.id}"><i class="fa-solid fa-eye"></i></a>
				<a class="btn btn-sm btn-danger" href="${base}/xoa/${e.id}"><i class="fa-solid fa-trash-can"></i></a>
			</td>
		</tr>
	</c:forEach>
	</tbody>
</table>