<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<div class="admin__scroll">
    <h2 class="alert alert-warning">Quản lý loại sản phẩm</h2>
    <c:set var="base" value="/admin/loai-san-pham" scope="request"/>
    <h4 class="label label-success">${message}${param.message}</h4>
    
	<ul class="nav nav-tabs">
	  <li class="active"><a data-toggle="tab" href="#tab1">Chỉnh sửa</a></li>
	  <li><a data-toggle="tab" href="#tab2">Danh sách</a></li>
	</ul>
	
	<div class="tab-content">
	  <div id="tab1" class="tab-pane fade in active">
    	<jsp:include page="_form.jsp"/>
	  </div>
	  <div id="tab2" class="tab-pane fade">
    	<jsp:include page="_table.jsp"/>
	  </div>
	</div>
</div>