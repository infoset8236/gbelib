<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 메뉴 설정 -->

<script type="text/javascript">
$(function(){
	//검색 자동완성
	var availableTags = [
	  "인사말",
	  "사업목표",
	  "주요내용",
	  "사업비젼",
	  "기대효과",
	  "추진체계"
	];
	$('#menu-tags').autocomplete({
	  source: availableTags
	});

	//input change (메뉴명 입력 시 메뉴 경로에 자동으로 출력 됨)
	$.event.special.inputchange = {
	    setup: function(){
	        var self = this, val;
	        $.data(this, 'timer', window.setInterval(function(){
	            val = self.value;
	            if($.data(self, 'cache') != val){
	                $.data(self, 'cache', val);
	                $(self).trigger('inputchange');
	            }
	        }, 20));
	    },
	    teardown: function(){
	        window.clearInterval($.data(this,'timer'));
	    },
	    add: function(){
	        $.data(this, 'cache', this.value);
	    }
	};
	var txt = $('input.menuName').val();
	$('span.menuName').text(txt);
	$('input.menuName').on('inputchange',function(){
		var txt = $(this).val();
		$('span.menuName').text(txt);
	});

	//모달창
	$('.dialog-common').dialog({ //모달창 기본 스크립트 선언
		autoOpen: false,
		resizable: false,
		modal: true, 
	    open: function(){
	        $('.ui-widget-overlay').addClass('custom-overlay');
	    },
	    close: function(){
	        $('.ui-widget-overlay').removeClass('custom-overlay');
	    },
		buttons: [
			{
				text: "저장",
				"class": 'btn btn1',
				click: function(){
					$(this).dialog('destroy');
				}
			},{
				text: "취소",
				"class": 'btn',
				click: function(){
					$(this).dialog('destroy');
				}
			}
		]
	});
	$("#bbsTypeChoice").dialog({ //개별 모달창 띄울 시 선택자 선언 및 크기 값 설정
		width: 420,
		height: 450
	});
	//모달창 링크 버튼
	$('.modal-btn-test').on('click',function(event){
		$('#bbsTypeChoice').dialog('open');
		event.preventDefault();
	});
	$("#modal-id2").dialog({ //모달창 : 권한 설정
		width: 420,
		height: 450
	});
	//모달창 링크 버튼
	$('a[href*="#modal-id2"]').on('click',function(event){
		$('#modal-id2').dialog('open');
		event.preventDefault();
	});
	
	//메뉴 유형 선택 시 추가 옵션 (cont2.jsp)
	$('.menuType').each(function(i){
		var i = i+1;
		$(this).attr('id','menuType'+i);
	});
	$('.menuTypeBox .radio input').each(function(i){
		var i = i+1;
		$(this).on('click',function(){
			$('.menuType').hide();
			$('#menuType'+i).show();
		});
		if($(this).prop('checked')){
			$('.menuType').hide();
			$('#menuType'+i).show();
		}
	});

	//disable 사용 시 아래 스크립트 추가 및 해당 영역의 ID값 disable 부여
	/* $('.disableBox').append('<div class="mask"></div>'); */

});
</script>

<div class="wrapper wrapper-white">

<div class="page-subtitle">
	<h4>메뉴 설정</h4>
	<p>파일명 : <code>page02.jsp</code></p>
</div>

<div class="search">
	<form>
		<fieldset>
			<label class="blind">검색</label>
			<select class="selectmenu" style="width:150px">
				<option disabled selected="selected">홈페이지 분류 선택</option>
				<option>분류 전체</option>
				<option>선택 옵션 값 1</option>
				<option>선택 옵션 값 2</option>
				<option>선택 옵션 값 3</option>
				<option>선택 옵션 값 4</option>
				<option>선택 옵션 값 5</option>
			</select>
			<select class="selectmenu-search" style="width:150px">
				<option disabled selected="selected">홈페이지 선택</option>
				<option>분류 전체</option>
				<option>선택 옵션 값 1</option>
				<option>선택 옵션 값 2</option>
				<option>선택 옵션 값 3</option>
				<option>선택 옵션 값 4</option>
				<option>선택 옵션 값 5</option>
			</select>
			<input type="text" class="text" id="menu-tags"/>
			<button><i class="fa fa-search"></i><span>검색</span></button>
			<!-- <a href="" class="btn btn1"><i class="fa fa-search"></i><span>검색</span></a> -->
		</fieldset>
	</form>
</div>

<div class="group-menu">
	<div class="tree-area">
		<div class="group-menu-header">
			<div class="title"><i class="fa fa-navicon"></i><span>메뉴목록</span></div>
			<div class="button">
				<a href="" class="btn btn5"><i class="fa fa-plus"></i><span>추가</span></a>
				<a href="" class="btn"><i class="fa fa-minus"></i><span>삭제</span></a>
			</div>
		</div>
		<div class="tree-box">
			<div class="tree-menu" id="tree1">
				<%@ include file="tree.jsp"%>
			</div>
		</div>
	</div>
	<div class="set-area"><!-- 비활성화 시 disableBox 클래스명 추가 -->
		<div class="set-info">
			<strong>메뉴 상세정보</strong>
		</div>

		<table class="type3">
			<colgroup>
				<col width="120"/>
				<col width="*"/>
			</colgroup>
			<tbody>
				<tr>
					<th>메뉴 경로</th>
					<td>1차 메뉴 &gt; 2차 메뉴 &gt; <span class="menuName"></span></td>
				</tr>
				<tr>
					<th>메뉴 URL</th>
					<td>/content0001/</td>
				</tr>
				<tr class="group first">
					<th>메뉴명</th>
					<td><input type="text" class="text menuName" style="font-size:14px;font-weight:800" value="새로운 메뉴명"/></td>
				</tr>
				<tr class="group">
					<th>메뉴명 (html)</th>
					<td><input type="text" class="text menuName" style="font-size:13px" value="새로운 메뉴명"/></td>
				</tr>
				<tr class="group last">
					<th>메뉴명 (모바일)</th>
					<td><input type="text" class="text menuName" style="font-size:13px" value="새로운 메뉴명"/></td>
				</tr>
				<tr class="group first">
					<th>상단 이미지</th>
					<td>
						<input type="file"/>
					</td>
				</tr>
				<tr class="group last">
					<td colspan="2" class="subImgView">
						<div><img src="/resources/cms/img/sub01.jpg" alt="파일삭제"/>
							<a href="" class="btn btn5"><i class="fa fa-minus-circle"></i><span>파일삭제</span></a>
						</div>
					</td>
				</tr>
				<tr class="group first">
					<th>메뉴명 표시</th>
					<td>
						<div class="checkbox">
							<input type="checkbox" id="check_0" checked="checked"/>
							<label for="check_0">사용함</label>
							<p class="info">체크 해제 시 홈페이지에서 콘텐츠 상단의 메뉴명이 출력되지 않습니다.</p>
						</div>
					</td>
				</tr>
				<tr class="group">
					<th>메뉴 노출</th>
					<td>
						<div class="checkbox">
							<input type="checkbox" id="check_1" checked="checked"/>
							<label for="check_1">사용함</label>
							<p class="info">체크 해제 시 홈페이지에의 메뉴 목록에서 출력되지 않습니다. (URL로 직접 접근은 가능합니다.)</p>
						</div>
					</td>
				</tr>
				<tr class="group last">
					<th>사용 여부</th>
					<td>
						<div class="checkbox">
							<input type="checkbox" id="check_2" checked="checked"/>
							<label for="check_2">사용함</label>
							<p class="info">체크 해제 시 메뉴를 사용할 수 없습니다.</p>
						</div>
					</td>
				</tr>
				<tr>
					<th>출력 순서</th>
					<td>
						<input type="text" style="width:40px" class="text disabled" value="10" disabled/>
						<input class="text" style="width:50px" name="spinner" value="5"/>
						<script>
						$('.spinner').spinner({ //옵션값은
							min: 5,
							max: 2500,
							step: 1,
							start: 1000
						});
						</script>
					</td>
				</tr>
				<tr>
					<th>메뉴 유형</th>
					<td>
						<div class="form-group menuTypeBox">
							<div class="radio">
								<input type="radio" name="radio3" id="radio10" value="none"/>
								<label for="radio10">기능 없음</label>
							</div>
							<div class="radio">
								<input type="radio" name="radio3" id="radio11" value="html"/>
								<label for="radio11" class="html">HTML</label>
							</div>
							<div class="radio">
								<input type="radio" name="radio3" id="radio12" value="bbs" checked="checked"/>
								<label for="radio12" class="bbs">게시판</label>
							</div>
							<div class="radio">
								<input type="radio" name="radio3" id="radio13" value="module"/>
								<label for="radio13" class="module">프로그램 모듈 선택</label>
							</div>
							<div class="radio">
								<input type="radio" name="radio3" id="radio14" value="link1"/>
								<label for="radio14" class="link">내부 링크</label>
							</div>
							<div class="radio">
								<input type="radio" name="radio3" id="radio15" value="link2"/>
								<label for="radio15" class="link">외부 링크</label>
							</div>
							<div class="radio">
								<input type="radio" name="radio3" id="radio16" value="done" disabled/>
								<label for="radio16">선택할 수 없는 유형</label>
							</div>
							
							<div class="menuType none">
								&nbsp;
							</div>
							<div class="menuType html">
								<p class="info">흠...</p>
							</div>
							<div class="menuType bbs">
								<a href="" class="btn btn1 modal-btn-test">게시판 종류 선택</a>
								<select class="selectmenu">
									<option disabled selected="selected">선택하세요</option>
									<option>일반 목록형 게시판</option>
									<option>갤러리 게시판</option>
									<option>웹진형 게시판</option>
									<option>질문/답변 게시판</option>
									<option>일정(월간/주간 달력) 게시판</option>
									<option>1:1문의 게시판</option>
								</select>
								<div id="bbsTypeChoice" class="dialog-common" title="게시판 선택 (모달창)">
									<div class="search">
										<label>게시판 유형</label>
										<input type="text" class="text"/>
										<button>검색</button>
									</div>
									<table class="type2 menuType-data">
										<colgroup>
											<col width="110"/>
											<col width="120"/>
											<col width="*"/>
										</colgroup>
										<thead>
											<tr>
												<th>콘텐츠 코드</th>
												<th>콘텐츠 이름</th>
												<th>기능</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>123456</td>
												<td>일반 목록형 게시판</td>
												<td>
													<a href="" class="btn">미리보기</a>
													<a href="" class="btn">사용</a>
												</td>
											</tr>
											<tr>
												<td>123456</td>
												<td>갤러리 게시판</td>
												<td>
													<a href="" class="btn">미리보기</a>
													<a href="" class="btn">사용</a>
												</td>
											</tr>
											<tr>
												<td>123456</td>
												<td>웹진형 게시판</td>
												<td>
													<a href="" class="btn">미리보기</a>
													<a href="" class="btn">사용</a>
												</td>
											</tr>
											<tr>
												<td>123456</td>
												<td>질문/답변 게시판</td>
												<td>
													<a href="" class="btn">미리보기</a>
													<a href="" class="btn">사용</a>
												</td>
											</tr>
											<tr>
												<td>123456</td>
												<td>일정(달력)게시판</td>
												<td>
													<a href="" class="btn">미리보기</a>
													<a href="" class="btn">사용</a>
												</td>
											</tr>
											<tr>
												<td>123456</td>
												<td>1:1문의 게시판</td>
												<td>
													<a href="" class="btn">미리보기</a>
													<a href="" class="btn">사용</a>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<table>
									<tr>
										<th>콘텐츠 이름</th>
										<td>일반 목록형 게시판</td>
									</tr>
									<tr>
										<th>콘텐츠 코드</th>
										<td>em354525</td>
									</tr>
									<tr>
										<th>링크</th>
										<td><input type="text" class="text"/></td>
									</tr>
									<tr>
										<th>파라미터</th>
										<td><input type="text" class="text"/></td>
									</tr>
								</table>
							</div>
							<div class="menuType module">
								<a href="" class="btn btn1">모듈 선택</a>
								<select class="selectmenu">
									<option disabled selected="selected">선택하세요</option>
									<option>설문조사</option>
									<option>합격자 조회</option>
									<option>전자투표</option>
									<option>연혁</option>
									<option>사이트맵</option>
									<option>수강신청</option>
									<option>교직원 소개</option>
									<option>배너 전체목록</option>
								</select>
							</div>
							<div class="menuType link1">
								<a href="" class="btn btn1">내부 링크 선택</a>
								<table>
									<tr>
										<th>링크</th>
										<td><input type="text" class="text disabled" disabled/></td>
									</tr>
									<tr>
										<th>파라미터</th>
										<td><input type="text" class="text"/></td>
									</tr>
									<tr>
										<th>타겟</th>
										<td>
											<div class="checkbox">
												<input type="checkbox" id="link1-target" checked="checked"/>
												<label for="link1-target">새창 열림</label>
												<p class="info">체크 해제 시 현재창에서 이동합니다.</p>
											</div>
										</td>
									</tr>
								</table>
							</div>
							<div class="menuType link2">
								<p class="info"><i class="fa fa-info-circle"></i> 링크 URL주소를 입력합니다. 외부 링크는 새창으로 열립니다.</p>
								<table>
									<tr>
										<th>링크</th>
										<td><input type="text" class="text"/></td>
									</tr>
									<tr>
										<th>파라미터</th>
										<td><input type="text" class="text"/></td>
									</tr>
								</table>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th>메뉴 접근 권한</th>
					<td>
						<div class="permissionBox">
							<a href="#modal-id2" class="btn btn1"><i class="fa fa-cog"></i><span>권한 설정</span></a>
							<table>
								<tr>
									<th style="width:70px">모든 사용자</th>
									<td>모든 사용자</td>
								</tr>
								<tr>
									<th>관리자</th>
									<td>최고 관리자, 과제 관리자</td>
								</tr>
							</table>

							<br/><br/>

							<ul>
								<li><a href="#modal-id2" class="btn btn1"><i class="fa fa-cog"></i><span>모든 사용자</span></a>
									<em>모든 사용자</em>
								</li>
								<li><a href="#" class="btn btn1"><i class="fa fa-cog"></i><span>관리자</span></a>
									<em>최고 관리자</em>,
									<em>과제 관리자</em>
								</li>
								<li><a href="#" class="btn btn1"><i class="fa fa-cog"></i><span>기업</span></a>
									<em class="empty">선택된 권한이 없습니다.</em>
								</li>
								<li><a href="#" class="btn btn1"><i class="fa fa-cog"></i><span>사용자</span></a>
									<em>일반 회원</em>,
									<em>내부연구원</em>,
									<em>교직원</em>,
									<em>교장</em>
								</li>
							</ul>
						</div>

						<div id="modal-id2" class="dialog-common" title="그룹1 권한 설정">
							<dl>
								<dt>모든 사용자</dt>
								<dd class="styleBox">
									<div class="checkbox inline">
										<input type="checkbox" id="c01" checked="checked"/>
										<label for="c01">모든 사용자</label>
									</div>
								</dd>
								<dt>관리자</dt>
								<dd class="styleBox">
									<div class="checkbox inline">
										<input type="checkbox" id="c11"/>
										<label for="c11">최고 관리자</label>
									</div>
									<div class="checkbox inline">
										<input type="checkbox" id="c12"/>
										<label for="c12">과제 관리자</label>
									</div>
								</dd>
							</dl>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="button">
			<div class="left">
				<a href="" class="btn btn3"><i class="fa fa-eye"></i><span>미리보기</span></a>
			</div>
			<div class="right">
				마지막 수정일 : 2016-09-02
			</div>
		</div>

		<br/><br/>

		<!-- 메뉴 트리 클릭하기 전에 보여줄 영역 여기부터 -->
		<div class="set-info">
			<strong>메뉴 설정 안내</strong>
			<ul>
				<li>드래그 앤 드롭으로 메뉴 순서를 변경할 수 있습니다.</li>
				<li>메뉴별 상세설정 변경은 메뉴명을 클릭하여 오른쪽 화면에서 변경할 수 있습니다.</li>
				<li><span style="color:#2e9901;!important">메뉴를 편집한 후에 저장하기 버튼을 클릭해야 변경된 내용이 반영됩니다.</span></li>
			</ul>
		</div>
		<!-- 메뉴 트리 클릭하기 전에 보여줄 영역 여기까지 -->
	</div>
</div>

<br/>

<div class="txt-center">
	<a href="" class="btn">취소</a>
	<a href="" class="btn btn1">저장하기</a>
</div>

</div>