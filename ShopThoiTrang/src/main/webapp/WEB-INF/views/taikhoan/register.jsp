<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<div class="login__box">
	<h2>Đăng Ký</h2>
	<h6>${message}</h6>
	<form:form action="/tai-khoan/dang-ky" modelAttribute="form" enctype="multipart/form-data">
		<div class="form-group">
			<label>Tài khoản<span>(*)</span></label>
			<form:input path="id" type="text" class="form-control" placeholder="Tên đăng nhập của bạn"/>
			<h6>${errorId}</h6>
		</div>
		<div class="form-group">
			<label>Họ và Tên<span>(*)</span></label>
			<form:input path="fullName" type="text" class="form-control" placeholder="Nguyễn Văn A"/>
			<h6>${errorFn}</h6>
		</div>
		<div class="form-group">
			<label>Email<span>(*)</span></label>
			<form:input path="email" type="email" class="form-control" placeholder="abc@xyz.com"/>
			<h6>${errorEmail}</h6>
		</div>
		<div class="form-group">
			<label>Mật khẩu<span>(*)</span></label>
			<form:input path="password" type="password" class="form-control" placeholder="********"/>
			<h6>${errorPw}</h6>
		</div>
		<div class="form-group">
			<button class="btn btn-default btn__login">Đăng ký</button>
		</div>
		<h5>Bạn đã có tài khoản? <a href="/tai-khoan/dang-nhap">Đăng nhập</a></h5>
	</form:form>
</div>
