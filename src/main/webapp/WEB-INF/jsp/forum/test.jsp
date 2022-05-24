<script>
	$(document).ready(function(){
	});

	$('#btn_query').on('click',function () {
	/*查詢某個班級所有的女生，先獲取查詢條件值*/
		var class_name= $('#class_name').val();
		var sex = $('#sex option:selected').val();
	/*從後臺獲取資料並進行分頁*/
		$.ajax({
			type : 'GET',
			url: 'http://localhost:8080/query/studentsQuery',
			contentType: "application/json",
			data:{
				"class_name":class_name,
				"sex":sex
			},
			success : function(data) {
			/*首先將要顯示資料的部分清空*/
				$('#data_table tbody').html('');
				$('.Pagination').pagination({
					totalData: data.total,//資料的總數量
					showData: 10,//每頁顯示幾條資料
					coping: true,//首頁和尾頁
					jump: true,//是否可以跳轉
					keepShowPN: true,
					homePage: '首頁',
					endPage: '末頁',
					prevContent: '上頁',
					nextContent: '下頁',
					callback: function (api) {
					/*當點選第X頁時會觸發callback函式,所以我把除第一頁以外的資料渲染放到callback中，其中api.getCurrent()是獲取當前頁碼*/
				    console.log("this is current" +   api.getCurrent());
						$('.now').text(api.getCurrent());
						if(api.getCurrent()!=1){
							$('#data_table tbody').html('');
							/*每頁10條，第二頁顯示的是10-20的資料，此時next=20，當到最後一頁時，next就等於資料總數total*/
							var next = (api.getCurrent()-1)*10+10;
							if((api.getCurrent()-1)*10+10>data.total){
								next = data.total;
							}
							/*依次渲染資料*/
							for(var i =(api.getCurrent()-1)*10;i<next;i++){

								str=" <tr><th>"+(data.list[i].class_name!=null?data.list[i].class_name:'')+
										"</th><th>"+(data.list[i].sex!=null?data.list[i].sex:'')+
										"</th><th>"+(data.list[i].sNo!=null?data.list[i].sNo:'')+
										"</th></tr>";
								$('#data_table tbody').append(str);
							}
						}
					}
				}, function(api) {
					//console.log("this is pagination")
					$('.now').text(api.getCurrent());
					/*因為第一頁要在點選查詢按鈕的時候就觸發，所以我把它放在這裡*/
					if (api.getCurrent() == 1) {
						for (var i = 0; i < 10; i++) {
							var str = "";
							str=" <tr><th>"+(data.list[i].class_name!=null?data.list[i].class_name:'')+
										"</th><th>"+(data.list[i].sex!=null?data.list[i].sex:'')+
										"</th><th>"+(data.list[i].sNo!=null?data.list[i].sNo:'')+
										"</th></tr>";
							$('#data_table tbody').append(str);
						}
					}
				});
				console.log("success");
				var success=JSON.stringify(data);
				console.log(success);
			},
			error:function (result) {
				console.log("error");
			}
		});
	})
	$('#btn_cancel').on('click',function () {
		console.log('cancel');
		$('#class_name').val("");
	    $('#sex').val('');
		$('#data_table tbody').html('');
	})
</script>
