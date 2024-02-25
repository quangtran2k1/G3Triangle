<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<div class="panel panel-default">
	<div class="panel-body">
		<form:form action="${base}/index" modelAttribute="entity" enctype="multipart/form-data">
			<div class="row">
				<div class="form-group col-sm-6" style="margin: 20px 0;">
					<label>ID<span></span></label>
					<form:input path="id" class="form-control" readonly="true" placeholder="ID"/>
				</div>
				<div class="form-group col-sm-6" style="margin: 20px 0;">
					<label>Tên sản phẩm</label>
					<form:input path="name" class="form-control"/>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-sm-6" style="margin: 20px 0;">
					<label>Giá</label>
					<form:input path="unitPrice" class="form-control"/>
				</div>
				<div class="form-group col-sm-6" style="margin: 20px 0;">
					<label>Số lượng</label>
					<form:input path="quantity" class="form-control"/>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-sm-6" style="margin: 20px 0;">
					<label>Giảm giá</label>
					<form:input path="discount" class="form-control" placeholder="0.1, 0.2, 0.3, . . ."/>
				</div>
				<div class="form-group col-sm-6" style="margin: 20px 0;">
					<label>Ngày nhập</label>
					<form:input path="productDate" readonly="true" class="form-control"/>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-sm-6" style="margin: 20px 0;">
					<label>Trạng thái</label>
					<div class="form-control">
						<form:radiobutton path="available" value="true" label="Kích hoạt" />
						<form:radiobutton path="available" value="false" label="Chưa kích hoạt" cssStyle="margin-left: 20px"/>
					</div>
				</div>
				<div class="form-group col-sm-6" style="margin: 20px 0;">
					<label>Đặc biệt</label>
					<div class="form-control">
						<form:radiobutton path="special" value="true" label="Yes" />
						<form:radiobutton path="special" value="false" label="No" cssStyle="margin-left: 20px"/>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-sm-6" style="margin: 20px 0;">
					<label>Danh mục sản phẩm</label>
					<form:select path="category.id" class="form-control">
						<form:options items="${cates}" itemLabel="nameVN" itemValue="id"/>
					</form:select>
				</div>
				<div class="form-group col-sm-6" style="margin: 20px 0;">
					<label>Số lần xem</label>
					<form:input path="viewCount" readonly="true" class="form-control" placeholder="1"/>
				</div>			
			</div>
			<div class="row">
				<div class="form-group col-sm-12" style="margin: 20px 0;">
					<label>Ảnh sản phẩm</label>
					<input type="file" name="image_file" class="form-control"/>
					<form:hidden path="image"/>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-sm-12" style="margin: 20px 0;">
					<label>Mô tả</label>
					<form:textarea path="description" rows="3" class="form-control"/>
				</div>
				<div class="form-group col-sm-12" style="margin: 20px 0;">
					<button class="btn btn-primary" formaction="${base}/them-moi">Thêm mới</button>
					<button class="btn btn-warning" formaction="${base}/cap-nhat">Cập nhật</button>
					<button class="btn btn-danger" formaction="${base}/xoa">Xóa</button>
					<a class="btn btn-default" style="border: 1px solid black;" href="${base}/index">Làm mới</a>
				</div>
			</div>
		</form:form>
	</div>
</div>

