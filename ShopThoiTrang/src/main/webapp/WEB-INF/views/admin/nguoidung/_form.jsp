<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<div class="panel panel-default">
	<div class="panel-body">
		<form:form action="${base}/index" modelAttribute="entity">
			<div class="row">
				<div class="col-md-9">
					<div class="form-group" style="margin: 20px 0;">
						<label>Tài khoản<span></span></label>
						<form:input path="id" type="text" class="form-control" readonly="${!empty entity.id}"/>
						<h4 class="label label-danger">${errorId}${param.errorId}</h4>
					</div>
					<div class="form-group" style="margin: 20px 0;">
						<label>Họ tên</label>
						<form:input path="fullName" type="text" class="form-control"/>
						<h4 class="label label-danger">${errorFn}${param.errorFn}</h4>
					</div>
					<div class="form-group" style="margin: 20px 0;">
						<label>Email</label>
						<form:input path="email" type="text" class="form-control"/>
						<h4 class="label label-danger">${errorEmail}${param.errorEmail}</h4>
					</div>
					<div class="form-group" style="margin: 20px 0;">
						<label>Mật khẩu</label>
						<form:input path="password" type="password" class="form-control"/>
						<h4 class="label label-danger">${errorPw}${param.errorPw}</h4>
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group" style="margin: 20px 0;">
						<label>Trạng thái</label>
						<div class="form-control">
							<form:radiobutton path="activated" value="true" label="Kích hoạt" />
							<form:radiobutton path="activated" value="false" label="Chưa kích hoạt" cssStyle="margin-left: 20px"/>
						</div>
					</div>
					<div class="form-group" style="margin: 20px 0;">
						<label>Quyền</label>
						<div class="form-control">
							<form:radiobutton path="admin" value="true" label="Quản trị" />
							<form:radiobutton path="admin" value="false" label="Người dùng" cssStyle="margin-left: 20px"/>
						</div>
					</div>
				</div>
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

