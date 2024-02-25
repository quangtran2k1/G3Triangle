<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<section class="gradient-custom-2">
    <div class="container py-5 h-100">
        <div class="row d-flex align-items-center h-100" style="width: 175%">
            <div class="col col-lg-9 col-xl-7">
                <div class="user__card">
                    <div class="rounded-top text-white d-flex flex-row user__header">
                        <div class="ms-4 mt-5 d-flex flex-column user__img">
                            <img src="/static/img/Customer/${user.photo}"
                                    alt="Generic placeholder image" class="img-fluid img-thumbnail mt-4 mb-2">
                                <a href="/nguoi-dung/sua-thong-tin/${user.id}" class="btn btn-outline-dark" data-mdb-ripple-color="dark">
                                    <i class="fa-solid fa-pencil"></i> Sửa
                                </a>
                        </div>
                        <div class="user__pr">
                            <h5><strong>${user.fullName}</strong></h5>
                            <p>${user.id}</p>
                        </div>
                    </div>
                    <div class="p-4 text-black" style="background-color: #f8f9fa;">
                        <div class="d-flex justify-content-end text-center py-1">
                            <div class="user__shipping">
                                <a href="/nguoi-dung/don-hang">
                                	<i class="fa-solid fa-truck-fast"></i>
                                	<p class="small text-muted mb-0">Đơn hàng</p>
                                </a>
                            </div>
                            <div class="px-3">
                                <p class="mb-1 h5">1026</p>
                                <p class="small text-muted mb-0">Followers</p>
                            </div>
                            <div>
                                <p class="mb-1 h5">478</p>
                                <p class="small text-muted mb-0">Following</p>
                            </div>
                        </div>
                    </div>
                    <div class="card-body p-4 text-black" style="background-color: #fff">
                        <div class="mb-5">
                            <p class="lead fw-normal mb-1">Thông tin</p>
                            <div class="p-4" style="background-color: #f8f9fa;">
                                <p class="font-italic mb-1"><i class="fa-solid fa-envelope"></i><i>&#160 ${user.email}</i></p>
                                <p class="font-italic mb-1"><a href="/nguoi-dung/doi-mat-khau/${user.id}"><i class="fa-solid fa-pencil"></i><i>&#160 Sửa mật khẩu</i></a></p>
                                <p class="font-italic mb-1"><a href="/tai-khoan/dang-xuat"><i class="fa-solid fa-right-from-bracket"></i><i>&#160 Đăng xuất</i></a></p>
                            </div>
                        </div>
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <p class="lead fw-normal mb-0">Recent photos</p>
                            <p class="mb-0"><a href="#!" class="text-muted">Show all</a></p>
                        </div>
                        <div class="row g-2">
                            <div class="col mb-2">
                                <img src="https://mdbcdn.b-cdn.net/img/Photos/Lightbox/Original/img%20(112).webp"
                                        alt="image 1" class="w-100 rounded-3">
                            </div>
                            <div class="col mb-2">
                                <img src="https://mdbcdn.b-cdn.net/img/Photos/Lightbox/Original/img%20(107).webp"
                                        alt="image 1" class="w-100 rounded-3">
                            </div>
                        </div>
                        <div class="row g-2">
                            <div class="col">
                                <img src="https://mdbcdn.b-cdn.net/img/Photos/Lightbox/Original/img%20(108).webp"
                                        alt="image 1" class="w-100 rounded-3">
                            </div>
                            <div class="col">
                                <img src="https://mdbcdn.b-cdn.net/img/Photos/Lightbox/Original/img%20(114).webp"
                                        alt="image 1" class="w-100 rounded-3">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>