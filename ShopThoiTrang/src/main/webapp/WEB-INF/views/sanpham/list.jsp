<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>

<div class="container" style="margin-top: 90px;">
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
