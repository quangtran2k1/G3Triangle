<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>

<section class="product-details spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-6">
                <div class="product__details__pic">
                    <div class="product__details__pic__item">
                        <img class="product__details__pic__item--large"
                             src="/static/img/Product/${prod.image}" alt="">
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-6">
                <div class="product__details__text">
                    <h3>${prod.name}</h3>
                    <div class="product__details__rating">
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star-half"></i>
                        <span>(18 đánh giá)</span>&#160| ${prod.viewCount} lượt xem
                    </div>
                    <div class="product__details__price">
	                    <c:if test="${prod.discount > 0}">
	                    	<del><f:formatNumber value="${prod.unitPrice}" pattern="#,###"/> &#8363</del> <b style="color: red"><f:formatNumber value="${prod.unitPrice * (1-prod.discount)}" pattern="#,###"/> &#8363</b>
	                    </c:if>
	                    <c:if test="${prod.discount == 0}">
	                    	<f:formatNumber value="${prod.unitPrice}" pattern="#,###"/> &#8363
	                    </c:if>
                    </div>
                    <div class="product__details__quantity">
                        <div class="quantity">
                            <div class="pro-qty">
                                <input type="number" value="1" min="1" class="w-100">
                            </div>
                        </div>
                    </div>
                    <div class="pop__up" data-id="${prod.id}">
	                    <a href="/gio-hang/chi-tiet-gio-hang" class="primary-btn">THÊM VÀO GIỎ HÀNG</a>
	                    <a class="heart-icon"><span class="fa-solid fa-heart"></span></a>
	                    <p style="font-family: 'helvetica-neue-light',sans-serif;">
	                        ${prod.quantity} sản phẩm có sẵn
	                    </p>
                    </div>                   
                    <ul>
                          <li><b>Vận chuyển tới:</b>&#160 <span><a href="">Thêm địa chỉ</a></span></li>
                          <li><b>Phí vận chuyển:</b></li>
                        <li>
                            <b>Chia sẻ</b>
                            <div class="share">
                                <a href="#"><i class="fa-brands fa-facebook-f"></i></a>
                                <a href="#"><i class="fa-brands fa-twitter"></i></a>
                                <a href="#"><i class="fa-brands fa-instagram"></i></a>
                                <a href="#"><i class="fa-brands fa-facebook-messenger"></i></a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="product__details__tab">
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                               aria-selected="true">Chi tiết</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
                               aria-selected="false">Mô tả</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tabs-1" role="tabpanel">
                            <div class="product__details__tab__desc">
                                <h6>Chi tiết sản phẩm</h6>
                                <table>
								  <tr>
								    <td>Danh mục:</td>
								    <td style="padding-left: 70px">
								    	<a href="/trang-chu/index" style="color: #5eb8ef;"> G3Triangle</a>&#160>
								    	<a href="/san-pham/loai-san-pham/${prod.category.id}" style="color: #5eb8ef;"> ${prod.category.nameVN}</a>
								    </td>
								  </tr>
								  <tr>
								    <td>Kho:</td>
								    <td style="padding-left: 70px">${prod.quantity} sản phẩm</td>
								  </tr>
								  <tr>
								    <td>Ngày sản xuất:</td>
								    <td style="padding-left: 70px"><f:formatDate value="${prod.productDate}" pattern="dd/MM/yyyy"/></td>
								  </tr>
								</table>
                            </div>
                        </div>
                        <div class="tab-pane" id="tabs-2" role="tabpanel">
                            <div class="product__details__tab__desc">
                                <h6>Mô tả sản phẩm</h6>
                                <p class="text-justifi" style="font-family: 'helvetica-neue-light',sans-serif;">
                                    ${prod.description}
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container" style="margin-top: 90px;">
	            <h3 class="text__categories" style="margin-bottom: 50px">SẢN PHẨM CÙNG LOẠI</h3>
			    <div class="row featured__filter">
			    <c:forEach var="p" items="${list}">
				    <div class="col-lg-3 col-md-4 col-sm-6">
				                <div class="featured__item">
				                    <div class="featured__item__pic pop__up" data-id="${p.id}">
				                    	<a href="/san-pham/chi-tiet/${p.id}">
				                    		<img src="/static/img/Product/${p.image}" />
				                    	</a>                      
				                        <ul class="featured__item__pic__hover">
				                            <li><a><i class="fa-solid fa-heart"></i></a></li>
				                            <li><a data-toggle="modal" data-target="#myModal"><i class="fa-brands fa-rocketchat"></i></a></li>
				                            <li><a><i class="fa-solid fa-cart-plus"></i></a></li>
				                        </ul>
				                    </div>
				                    <div class="featured__item__text">
				                        <h6><a href="/san-pham/chi-tiet/${p.id}">${p.name}</a></h6>
				                        <c:if test="${p.discount > 0}">
				                        	<h5><b style="color: red;font-size: 15px">-<f:formatNumber value="${p.discount}" type="percent"/></b> <f:formatNumber value="${p.unitPrice * (1-p.discount)}" pattern="#,###"/> &#8363</h5>
				                        </c:if>
				                        <c:if test="${p.discount == 0}">
				                        	<h5><f:formatNumber value="${p.unitPrice}" pattern="#,###"/> &#8363</h5>
				                        </c:if>
				                    </div>
				                </div>
				            </div>
			    	</c:forEach> 
			    	<jsp:include page="dialog.jsp"/>          
			    </div>
			</div>
			<div style="margin-top: 30px;">
				<h3>SẢN PHẨM YÊU THÍCH</h3>
	            <c:forEach var="p" items="${favo}">
	            	<a href="/san-pham/chi-tiet/${p.id}">
	            		<img class="thumb-img" src="/static/img/Product/${p.image}">
	            	</a>
           		</c:forEach>
			</div>
			<div style="margin-top: 30px;">
				<h3>SẢN PHẨM ĐÃ XEM</h3>
	            <c:forEach var="p" items="${viewed}">
	            	<a href="/san-pham/chi-tiet/${p.id}">
	            		<img class="thumb-img" src="/static/img/Product/${p.image}">
	            	</a>
           		</c:forEach>
			</div>
        </div>
    </div>
</section>