<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>

<div class="card-body p-3" style="margin-top: 50px; height: 400px; overflow: auto">
	<h2 class="text-center">ĐƠN HÀNG</h2>
    <table class="table table-bordered table-hover">
        <thead>
           <tr>
               <th class="text-center" style="width:70px;" class="text-center">ID</th>
               <th class="text-center" style="width:120px;">Ngày tạo đơn</th>
               <th class="text-center">Địa chỉ</th>
               <th class="text-center">Tổng tiền</th>
               <th style="width:30px;" class="text-center">Chi tiết</th>
           </tr>
        </thead>
        <tbody>
        	<c:forEach var="o" items="${orders}">
        		<tr>
	            	<td class="text-center">${o.id}</td>
	                <td class="text-center">${o.orderDate}</td>
	                <td class="text-center">${o.address}</td>
	                <td class="text-center"><f:formatNumber value="${o.amount}" pattern="#,###"/> &#8363</td>
	                <td class="text-center">
	                    <a href="/nguoi-dung/chi-tiet-don-hang/${o.id}" class="btn btn-sm btn-warning"><i class="fa-solid fa-eye"></i></a>
	                </td>
	            </tr>
        	</c:forEach>
        </tbody>
    </table>
</div>