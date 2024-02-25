$(document).ready(function(){
	$("tr[data-id] input").on("input",function(){
		var id = $(this).closest("tr").attr("data-id");
		var price = $(this).closest("tr").attr("data-price");
		var qty = $(this).val();
		$.ajax({
			url:`/gio-hang/cap-nhat/${id}/${qty}`,
			success: function(response){
				$("#cart-cnt").html(response[0]);
				$("#cart-amt").html(response[1]);
			}
		});
		var amount = qty * price;
		$(this).closest("tr").find(".shoping__amount").html(amount);
		$(this).closest("tr").find(".shoping__amount").html(amount);
	});
	$(".fa-xmark").click(function(){
		var id = $(this).closest("tr").attr("data-id");
		$.ajax({
			url:"/gio-hang/xoa/"+id,
			success: function(response){
				$("#cart-cnt").html(response[0]);
				$("#cart-amt").html(response[1]);
			}
		});
		$(this).closest("tr").remove();
	});
	
	$(".cart-btn-clear").click(function(){
		$.ajax({
			url:"/gio-hang/xoa-tat-ca",
			success: function(response){
				$("#cart-cnt").html(0);
				$("table>tbody").html("")
			}
		});
	});
	$(".fa-rocketchat").click(function(){
		var id = $(this).closest("div").attr("data-id");
		$("#myModal #id").val(id);
	});
	
	$(".btn-send").click(function(){
		$("[data-dismiss]").click();
		alert("Gửi thành công")
	});
	
	$(".fa-cart-plus").click(function(){
		var id = $(this).closest("div").attr("data-id");
		$.ajax({
			url:"/gio-hang/them-vao-gio-hang/"+id,
			success: function(response){
				$("#cart-cnt").html(response[0]);
			}
		});
		swal({
			  icon: "success",
			  timer: 1500, 
		})
	});
	
	$(".fa-heart").click(function(){
		var id = $(this).closest("div").attr("data-id");
		$.ajax({
			url:"/san-pham/them-vao-yeu-thich/"+id,
			success: function(response){
				if (response){
					alert("Đã thêm mới vào yêu thích")
				}
				else{
					alert("Đã sẵn có trong yêu thích")
				}
			}
		})
	})
});