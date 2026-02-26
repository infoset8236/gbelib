
var materialListPage = 1;
var ajaxLoading = false;
$(document).ready(function(){
		var data = {};
		data.pageIndex = 1;
		var filter = "win16|win32|win64|mac";
		if( navigator.platform  ){
			if( filter.indexOf(navigator.platform.toLowerCase())<0 ){
				// mobile접속
				data.recordCountPerPage= 1;
			}else{
				// pc접속
				data.recordCountPerPage= 2;
			}
		}
		
		data.searchType = 'Tags';
		data.searchKeyword = '경상북도교육청 통합공공도서관';
		data.orderType = 2;
		data.searchOrder = 'D';

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
				if(data.pageIndex>1 && rows.length==0){
					data.pageIndex =1;
					searchDgitalQ(data);
					return false;
				}
				html = '<div class="book-list-section">';
				html+= '<div class="bx-controls bx-has-controls-direction"><div style="width:100px;" class="bx-controls-direction"><a class="bx-prev" id="bxprev" href="javascript:void(0);">Prev</a><a class="bx-next" id="bxnext" href="javascript:void(0);">Next</a></div></div>';
				html+= '<ul>';
				for(var i=0; i< rows.length; i++){
					if(pcPlatform){
						if(rows.length > 2) break;
					}else{
						if(rows.length > 1) break;
					}
					obj = rows[i];

					html +='<li>';
					html +='<div class="thumbnail">';
					html +='<a href="'+obj.url+'" target="_blank" data-namose-orgahref="'+obj.url+'"><img src="'+obj.thumbnail_path+'" alt="'+obj.title+'" data-namose-orgahref="'+obj.thumbnail_path+'"/></a>';
					html +='</div>';
					html +='<div class="info">';
					html +='<h3 class="book-title"><a href="'+obj.url+'" target="_blank" data-namose-orgahref="'+obj.url+'">'+ obj.title +'</a></h3>';
					html +='<p class="book-desc">'+obj.cur_desc+'</p>';
					var ddt = obj.dist_dt;
					if(obj.dist_dt != undefined && obj.dist_dt != null && obj.dist_dt != '' && obj.dist_dt.length > 10){
						ddt = ddt.substr(0, 10);
					}
					html +='<span class="book-info">'+ddt+'</span>';
					html +='</div>';
					html +='</li>';
				}
				html += '</ul>';
				html += '</div>';
				html += '</div>';

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
