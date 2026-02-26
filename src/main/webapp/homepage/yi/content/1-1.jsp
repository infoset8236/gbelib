<%@ page language="java" pageEncoding="utf-8" %>

<div class="op_wrap">
	<div class="smain">
		<% for(int i=1; i<=3; i++){ %>
		<div class="item">
			<div class="op_title category">
				<span class="ca ty2">어린이_수정 상반기_수정</span>
				<a href="" class="name">한문 테스트</a>
			</div>
			<div class="box">
				<div class="box2">
					<ul class="con2">
						<li class="first"><div><label>접수기간 </label> : 2017-02-09 11:20 ~ 2017-02-11 12:00</div></li>
						<li><div><label>장소</label> : 평생학습 1실</div></li>
						<li><div><label>강좌일</label> : 2017-02-21 ~ 2017-02-28 ( 목 ) 10:00 ~ 11:00</div></li>
						<li><div><label>강사명</label> : 강경민</div></li>
						<li><div><label>강좌설명</label> : 한문 테스트를 합니다.</div></li>
						<li><div class="status">
							<label>모집인원</label> :
							<span><strong>온라인</strong> 2명 ,</span>
							<span><strong>오프라인</strong> 1명,</span>
							<span>(<strong>대기자</strong> 1명 )</span>
						</div></li>
						<li><div class="status">
							<label>접수현황</label> :
							<span>
								온라인 :
								<span style="color:orange">0</span> / 2
							</span>
							<span>
								오프라인 :
								<span style="color:red">1 / 1</span>
							</span>
							<span>
								(
								대기자 :
								<span style="color:orange">0</span> / 1
								)
							</span>
						</div></li>
						<li><div><label>모집대상</label> : 성인</div></li>
					</ul>
				</div>
			</div>
			<div class="stat">
				<a href="" class="btn btn1 add"><i class="fa fa-pencil-square-o"></i><span>대기자신청</span></a>
			</div>
		</div>
		<% } %>
	</div>
	<div class="sview">
		<div class="sinfo">
			<div class="info">
				<ul>
					<li class="first"><div>
						<strong>한문 테스트</strong>
						<a href="javascript:void(0);" class="btn disabled" style="cursor: default;">
						<i class="fa fa-pencil"></i><span>접수마감</span></a>
					</div></li>
					<li><div>
		        		<label class="first label1">강의 분류</label>
		        		<span class="important span1">[성인] 상반기</span>
		        	</div></li>
		        	<li><div>
			         	<label class="label2">강의 설명</label>			
			         	<span class="important last span2">한문 테스트</span>
		        	</div></li>
					<li><div>
						<label class="first th1">강의장소</label>
						<span class="important td1">평생학습1실</span>
					</div></li>
					<li><div>
						<label class="th2">강사명</label>
						<span class="important last td2">강경민</span>
		        	</div></li>
		        	<li><div>
		        		<label class="first th1">준비물 및 재료비</label>
						<span class="important td1"></span>
					</div></li>
					<li><div>
						<label class="th2">강의대상</label>
						<span class="important last td2">성인</span>
		        	</div></li>	
		        	<li><div>
		        		<label class="first th1">강의계획서</label>
			         	<span class="important td1"><a style="color:#00f" href="download/h27/3/1/1.do"><i class="fa fa-floppy-o"></i> 개인정보보호 관련 안내</a></span>
			        </div></li>
					<li><div>
			         	<label class="th2">현재 참여 / 모집</label>
			         	<span class="important last td2">0 명 / 2 명</span>
			        </div></li>
			        <li><div>
			        	<label class="first th1">접수기간</label>
						<span class="important td1">
							2017-02-09 09:05 ~ 2017-02-10 12:00
						</span>
					</div></li>
					<li><div>
			        	<label class="th2">현재 오프라인 / 오프라인</label>
			         	<span class="important last td2">1 명 / 1 명</span>
			        </div></li>
			        <li><div>
			        	<label class="first th1">강의기간(*)</label>
						<span class="important td1">
							2017-02-23 ~ 2017-02-28
						</span>
					</div></li>
					<li><div>
			        	<label class="th2">현재 대기자 / 대기자</label>
			         	<span class="important last td2">0 명 / 1 명</span>
			        </div></li>
					<li><div>
						<label class="first th1">강의시간</label>
						<span class="important td1">
							10:00 ~ 11:00					
						</span>
					</div></li>
					<li><div>
			         	<label class="th2">강의요일</label>
						<span class="important last td2">
							매주 수
			        	</span>
					</div></li>
				</ul>
			</div>
		</div>

		<div class="sbtn">
			<a href="" class="btn"><span>목록으로</span></a>
		</div>

		<div class="button bbs-btn center">
			<button id="back-btn" class="btn"><i class="fa fa-reorder"></i><span>목록으로</span></button>
		</div>
	</div>
</div>