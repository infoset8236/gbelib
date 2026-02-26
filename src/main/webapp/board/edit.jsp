<%@ page language="java" pageEncoding="utf-8" %>
<!-- 여기부터 -->
<div class="wrapper-bbs">
	<table class="bbs-edit">
		<tbody>
			<tr>
				<th>
				<span class="required">*</span>
				제목</th>
				<td colspan="3">
					<div class="checkbox-original">
						<input type="checkbox" id="check_0" checked="checked">
						<label for="check_0">공지 사용여부</label>
						<em class="info">체크 시 목록 상단에 표시됩니다.</em>
					</div>
					<input type="text" class="text" style="width:90%"/>
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>박경산</td>
				<th>작성일</th>
				<td>2016-10-11</td>
			</tr>
			<tr>
				<th>달력</th>
				<td>
<input type="text" id="notice_start_date" class="text ui-calendar"/>
<input type="text" id="notice_end_date" class="text ui-calendar"/>
<script>
$('input#notice_start_date').datepicker({
  maxDate: $('input#notice_end_date').val(), 
  onClose: function(selectedDate) {
    //$('input#notice_end_date').datepicker('option', 'minDate', selectedDate);
  }
});
$('input#notice_end_date').datepicker({
  minDate: $('input#notice_start_date').val(), 
  onClose: function(selectedDate) {
    //$('input#notice_start_date').datepicker('option', 'maxDate', selectedDate);
  }
});
</script>

				</td>
			</tr>
			<tr>
				<td colspan="4" class="editor">
					<div class="bbs-textarea">
						<textarea id="content" name="content" style="width:95%; display:none" rows="10" cols="100"></textarea>
						<iframe frameborder="0" scrolling="no" src="/resources/common/smart_editor/SmartEditor2Skin.html" style="width: 100%; height: 449px;"></iframe>
					</div>
				</td>
			</tr>
			<!-- <tr>
				<th>첨부파일</th>
				<td colspan="3">
					<input type="file"/>
				</td>
			</tr> -->
			<tr>
				<td colspan="4" class="file_attach">
					<div id="attach_area">
						<h4>파일첨부</h4>
						<div class="fileUploader">
							<div class="file_attach_info">
								<p><strong>파일 용량 :</strong> <span id="fileSizeView">0Byte</span> / 최대 200MB</p>
								<p><strong>파일 갯수 :</strong> 최대 5 개</p>
							</div>
							<div class="preview">
								<span id="previewFile">미리보기</span>
							</div>
							<div class="fileBox">
								<div class="fileListArea">
									<select id="boardFileArray" name="boardFileArray" multiple="multiple" size="6">
									</select>
									<input type="hidden" name="_boardFileArray" value="1"/>
									<div id="fsUploadProgress" class="fileResult">
										<div class="rate" id="progressText">업로드 진행률</div>
										<div class="loading">
											<div class="progress_bar">
												<span id="progressBarStatus" style="width:20%;"></span>
											</div>
										</div>
										<div class="dsc_loading_no">
											<span id="progressStatus" class="progress">0%</span>
										</div>
									</div>
								</div>
								<div class="file_info">
									<div class="fileUploadControl">
										<a class="btn btn1" id="swfUploadButton"><i class="fa fa-plus-circle"></i><span>파일추가</span></a>
										<a class="btn btn1" id="swfUploadButton_del"><i class="fa fa-minus-circle"></i><span>선택삭제</span></a>
										<a class="btn btn1" id="inEditorButton"><i class="fa fa-arrow-circle-up"></i><span>에디터에 넣기</span></a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</td>
			</tr>
		</tbody>
	</table>

	<div class="button bbs-btn center">
		<a href="/board/index.jsp" class="btn btn1"><i class="fa fa-pencil"></i><span>저장하기</span></a>
		<a href="/board/index.jsp" class="btn"><i class="fa fa-reorder"></i><span>목록으로</span></a>
	</div>
</div>
<!-- 여기까지 -->