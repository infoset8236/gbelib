
var materialListPage = 1;
var ajaxLoading = false;
$(document).ready(function(){
		var data = {};
		data.pageIndex = 1;
		var filter = "win16|win32|win64|mac";
		if( navigator.platform  ){
			if( filter.indexOf(navigator.platform.toLowerCase())<0 ){
				// mobile접속
				data.recordCountPerPage= 2;
			}else{
				// pc접속
				data.recordCountPerPage= 4;
			}
		}
		
		data.searchType = 'Tags';
		data.searchKeyword = '경상북도교육청정보센터';
		data.orderType = 2;
		data.searchOrder = 'D';
/*
		var data 
		= 
		'pageIndex=1
		&recordCountPerPage=10
		&orderType=2
		&searchOrder=D
		&searchType=Tags
		&searchKeyword=%EA%B2%BD%EC%83%81%EB%B6%81%EB%8F%84%EA%B5%90%EC%9C%A1%EC%B2%AD%EC%A0%95%EB%B3%B4%EC%84%BC%ED%84%B0';
*/
		searchDgitalQ(data);
	},
	searchDgitalQ = function(data){
		$.ajax({
			url: '//q.gbelib.kr/curation/api/boardList.json',
			data : data,
			dataType: 'jsonp',
			type: 'GET',
			jsonpCallback : 'jsonp_callback',
			success: function(response) {

				var pcPlatform = true;
				var filter = "win16|win32|win64|mac";
				if( navigator.platform  ){
					if( filter.indexOf(navigator.platform.toLowerCase())<0 ){
						// mobile접속
						pcPlatform=false;
					}
				}

				var rows = response.rows;
				if(data.pageIndex > 1 && rows.length == 0){
					data.pageIndex = 1;
					searchDgitalQ(data);
					return false;
				}
				html = '<div class="info-box">';
				html += '<h4>L-큐레이션<a href="http://q.gbelib.kr/index.jsp?gid=1" title="큐레이션 새창열기" target="_blank"><img src="/resources/homepage/geic/img/more-view-btn-b.png" alt="" title=""></a></h4>';
				html += '<p>경상북도교육청정보센터의<br />행사&지식정보를<br />확인하실 수 있습니다.</p>';
				html += '<ul>';
				html += '<li><a class="bx-prev" id="bxprev" href="javascript:void(0);"><img src="/resources/homepage/geic/img/quration-prev-btn.png" alt="" title=""></a></li>';
				html += '<li><a class="bx-next" id="bxnext" href="javascript:void(0);"><img src="/resources/homepage/geic/img/quration-next-btn.png" alt="" title=""></a></li>';
				html += '</ul>';
				html += '</div>';
				html += '<div class="list-box">';
				html += '<ul>';
				for(var i = 0; i < rows.length; i++){
					if(pcPlatform){
						if(rows.length > 4) break;
					}else{
						if(rows.length > 2) break;
					}
					obj = rows[i];
					html +=           '<li>';
					html +=           '<a href="'+obj.url+'" target="_blank" data-namose-orgahref="'+obj.url+'">';
					html +=           '<img src="'+obj.thumbnail_path+'" alt="'+obj.title+'" data-namose-orgahref="'+obj.thumbnail_path+'"/>';
					html +=           '<p>'+ obj.title +'</p>';
					var ddt = obj.dist_dt;
					if(obj.dist_dt != undefined && obj.dist_dt != null && obj.dist_dt != '' && obj.dist_dt.length > 10){
						ddt = ddt.substr(0, 10);
					}
					html +=           '<span>'+ddt+'</span>';
					html +=           '</a>';
					html += 	      '</li>';
				}
				html += '</ul>';
				html += '</div>';
				html += '<div class="end"></div>';

				$('#result').html(html);

				var prev = $('#bxprev');
				if(prev!=undefined){
					prev.click(function(){
						if(data.pageIndex >1){
							data.pageIndex=data.pageIndex-1
						}
						searchDgitalQ(data);
					});
				}
				var next = $('#bxnext');
				if(next!=undefined){
					next.click(function(){
						data.pageIndex=data.pageIndex+1
						searchDgitalQ(data);
					});
				}
			},
			error:function(request,status,error){
				console.log(request);
				console.log(status);
				console.log(error);
			}
		});
	}
);
