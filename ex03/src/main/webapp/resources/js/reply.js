console.log("Reply Module........");

var replyService = (function() {

	function add(reply, callback) {
		console.log("reply.................");
		
		// $.ajax is not a function 오류 발생 
		// <script src="https://code.jquery.com/jquery-3.5.1.slim.js"></script> => slim 제거
        
		$.ajax({
			type : 'post',
			url : '/replies/new',
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if(callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}
		})
	}
	
	function getList(param, callback, error) {
	
		var bno = param.bno;
		var page = param.page || 1;
		
		$.getJSON("/replies/pages/" + bno + "/" + page + ".json",
			function(data) {
				if(callback) {
					callback(data);
				}
			}).fail(function(xhr, status, err) {
			if(error) {
				error();
			}
		});
	}
	
	return {
		add : add,
		getList : getList
	};
	
})();