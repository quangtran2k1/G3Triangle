<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>

<div class="panel panel-default">
	<div class="panel-body">
		<form:form action="${base}/index" modelAttribute="entity">
			<div class="form-group" style="margin: 20px 0;">
				<label>Mã đơn hàng</label>
				<form:input path="id" readonly="true" class="form-control" placeholder="ID"/>
			</div>
			<div class="form-group" style="margin: 20px 0;">
				<label>Khách hàng</label>
				<form:input path="customer.id" readonly="true" class="form-control"/>
			</div>
			<div class="form-group" style="margin: 20px 0;">
				<label>Địa chỉ</label>
				<form:input path="address" readonly="true" class="form-control"/>
			</div>
			<div class="form-group" style="margin: 20px 0;">
				<label>Ngày tạo đơn</label>
				<form:input path="orderDate" readonly="true" class="form-control"/>
			</div>
			<div class="form-group" style="margin: 20px 0;">
				<label>Tổng thanh toán</label>
				<input value="<f:formatNumber value='${entity.amount}' pattern='#,###'/> &#8363" class="form-control" readonly="true" />
			</div>
			<div class="form-group" style="margin: 20px 0;">
				<label>Mô tả</label>
				<form:textarea path="desciption" rows="3" class="form-control" readonly="true"/>
			</div>
			<div class="form-group" style="margin: 20px 0;">
				<button class="btn btn-danger" formaction="${base}/xoa">Xóa</button>
				<a class="btn btn-default" style="border: 1px solid black;" href="${base}/index">Làm mới</a>
			</div>
		</form:form>
		<c:if test="${!empty detail}">
			<jsp:include page="_detail.jsp"/>
		</c:if>
	</div>
</div>

