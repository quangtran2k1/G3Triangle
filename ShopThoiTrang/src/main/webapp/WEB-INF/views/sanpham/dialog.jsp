<%@ page pageEncoding="utf-8"%>

<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">Nhắn tin với G3Triangle</h4>
      </div>
      <div class="modal-body">
        <div class="form-group">
        	<label>G3Triangle</label>
        	<input id="mail_contact" readonly="readonly"value="trannhatquang107@gmail.com"  class="form-control">
        </div>
        <div class="form-group">
        	<label>Nội dung</label>
        	<textarea id="comments" class="form-control" rows="3"></textarea>
        </div>
        <input id="id" type="hidden">
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-default btn-send" style="border: 1px solid #ced4da">Gửi</button>
        <button type="button" class="btn btn-default" data-dismiss="modal" style="border: 1px solid #ced4da">Đóng</button>
      </div>
    </div>

  </div>
</div>