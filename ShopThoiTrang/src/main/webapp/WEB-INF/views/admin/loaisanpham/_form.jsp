<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<div class="panel panel-default">
	<div class="panel-body">
		<form:form action="${base}/index" modelAttribute="entity">
			<div class="form-group" style="margin: 20px 0;">
				<label>ID</label>
				<form:input path="id" readonly="true" class="form-control" placeholder="ID"/>
			</div>
			<div class="form-group" style="margin: 20px 0;">
				<label>Tên (EN)</label>
				<form:input path="name" type="text" class="form-control"/>
			</div>
			<div class="form-group" style="margin: 20px 0;">
				<label>Tên (VN)</label>
				<form:input path="nameVN" type="text" class="form-control"/>
			</div>
			<div class="form-group" style="margin: 20px 0;">
				<button class="btn btn-primary" formaction="${base}/them-moi">Thêm mới</button>
				<button class="btn btn-warning" formaction="${base}/cap-nhat">Cập nhật</button>
				<button class="btn btn-danger" formaction="${base}/xoa">Xóa</button>
				<a class="btn btn-default" style="border: 1px solid black;" href="${base}/index">Làm mới</a>
			</div>
		</form:form>
	</div>
</div>

