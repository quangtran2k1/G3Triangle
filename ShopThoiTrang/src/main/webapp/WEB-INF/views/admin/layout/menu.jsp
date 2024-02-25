<%@ page pageEncoding="utf-8"%>
<div class="container-fluid">
    <a href="/trang-chu/index"><img src="/static/img/logo.png" style="width:150px;"></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Quản lý
                </a>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="/admin/loai-san-pham/index">Loại sản phẩm</a></li>
                    <li><a class="dropdown-item" href="/admin/san-pham/index">Sản phẩm</a></li>
                    <li><a class="dropdown-item" href="/admin/don-hang/index">Đơn hàng</a></li>
                </ul>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/admin/nguoi-dung/index">
                    Tài khoản
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">
                    Thống kê
                </a>
            </li>
        </ul>
        <ul class="navbar-nav ml-auto navbar-right">
            <li class="nav-item">
                <a class="nav-link" href="">${sessionScope.adminId}</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/tai-khoan/dang-xuat">Đăng xuất</a>
            </li>
        </ul>
    </div>
</div>