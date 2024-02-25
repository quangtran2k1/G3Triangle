<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<table class="table table-hover">
	<thead>
		<tr>
			<th>ID</th>
			<th>Tên (EN)</th>
			<th>Tên (VN)</th>
			<th>Chức năng</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="e" items="${list}">
		<tr>
			<td>${e.id}</td>
			<td>${e.name}</td>
			<td>${e.nameVN}</td>
			<td>
				<a class="btn btn-sm btn-warning" href="${base}/chinh-sua/${e.id}"><i class="fa-solid fa-pencil"></i></a>
				<a class="btn btn-sm btn-danger" href="${base}/xoa/${e.id}"><i class="fa-solid fa-trash-can"></i></a>
			</td>
		</tr>
	</c:forEach>
	</tbody>
</table>