<%@ page pageEncoding="utf-8"%>

<div class="login__box">
	<h2>Đăng Nhập</h2>
	<h6>${message}</h6>
	<form action="/tai-khoan/dang-nhap" method="post">
		<div class="form-group">
			<label>Tài khoản</label>
			<input name="id" type="text" class="form-control" value="${uid}" placeholder="Tên đăng nhập của bạn">
		</div>
		<div class="form-group">
			<label>Mật khẩu</label>
			<input name="pw" type="password" class="form-control" value="${pwd}" placeholder="********">
		</div>
		<div class="form-group">
			<div class="form-control check__box">
				<input name="rm" type="checkbox">
				<label>Nhớ mật khẩu?</label>
			</div>
		</div>
		<div class="form-group">
			<button class="btn btn-default btn__login">Đăng nhập</button>
		</div>
		<h5>Bạn chưa có tài khoản? <a href="/tai-khoan/dang-ky">Đăng ký</a></h5>
	</form>
</div>
