<%@ page contentType="text/html;charset=utf-8" %>

<table class="type2">
	<colgroup>
		<col width="130"/>
		<col width="*"/>
	</colgroup>
	<tbody>
		<tr>
			<th>항목1</th>
			<td>
				<select class="select">
					<option selected="selected">사이트 분류 전체</option>
					<option>선택 옵션 값 1</option>
					<option>선택 옵션 값 2</option>
					<option>선택 옵션 값 3</option>
					<option>선택 옵션 값 4</option>
					<option>선택 옵션 값 5</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>항목2 <em>*</em></th>
			<td>
				<input type="text" style="width:178px" class="text" placeholder="placeholder"/>
				<em>예) 대구광역시 대표 홈페이지</em>
			</td>
		</tr>
		<tr>
			<th>항목2 <em>*</em></th>
			<td>
				<input type="text" style="width:178px" class="text" placeholder="placeholder"/>
				<a href="" class="btn">중복검사</a>
				<p><em>예) 대구광역시 대표 홈페이지</em></p>
			</td>
		</tr>
		<tr>
			<th>항목3 <em>*</em></th>
			<td>
				<input type="text" style="width:178px" class="text disabled" placeholder="고정값" disabled/>
				<div class="ui-state-highlight">
					<i class="fa fa-question-circle"></i><em>안내 문구를 출력합니다. 두줄 여러줄 상관 없습니다.</em>
				</div>
			</td>
		</tr>
		<tr>
			<th>항목4</th>
			<td>
				<div class="form-group">                       
				    <div class="radio">
				        <input type="radio" name="radio31" id="radio31" value="option1" checked="checked">
				        <label for="radio31">선택1</label>
				    </div>
				    <div class="radio">
				        <input type="radio" name="radio31" id="radio32" value="option2">
				        <label for="radio32">선택2</label>
				    </div>
				</div>
				<div class="ui-state-error">
					<i class="fa fa-warning"></i><em>주의사항 문구를 출력합니다. 두줄 여러줄 상관 없습니다.</em>
				</div>
			</td>
		</tr>
		<tr>
			<th>항목5</th>
			<td>
				<div class="form-group">                       
                        <div class="radio radio-inline">
                            <input type="radio" name="radio2" id="radio3" value="option3" checked="checked" disabled>
                            <label for="radio3">선택1</label>
                        </div>
                        <div class="radio radio-inline">
                            <input type="radio" name="radio2" id="radio4" value="option4" disabled>
                            <label for="radio4">선택2</label>
                        </div>
                    </div>
			</td>
		</tr>
		<tr>
			<td colspan="2" class="fan editor">
				<div style="height:400px;background:url('/resources/cms/img/editor.gif') no-repeat 0 0">
					<br/><br/>
					&nbsp; 에디터 미리보기
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="2" class="fan">
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
								<select id="boardFileArray" name="boardFileArray" multiple="multiple" size="5" class="on">
									<option>1</option>
									<option>1</option>
									<option>1</option>
									<option>1</option>
									<option>1</option>
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
									<a class="btn" id="swfUploadButton">파일추가</a>
									<!-- <object id="SWFUpload_0" type="application/x-shockwave-flash" data="">
										<param name="wmode" value="Transparent"/>
										<param name="movie" value="/resources/swfupload/swf/swfupload.swf?preventswfcaching=1472179127313"/>
										<param name="quality" value="high"/>
										<param name="menu" value="false"/>
										<param name="allowScriptAccess" value="always"/>
										<param name="flashvars" value=""/>
									</object> -->
									<a class="btn" id="swfUploadButton_del">선택삭제</a>
									<a class="btn" id="inEditorButton">에디터에 넣기</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</td>
		</tr>
	</tbody>
</table>