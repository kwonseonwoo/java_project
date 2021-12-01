let index = {
	init: function() {
		$("#btn-save").on("click", () => {
			this.save();
		});
		$("#btn-update").on("click", () => {
			this.update();
		});
		$("#btn-delete").on("click", () => {
			this.deleteById();
		});
		$("#btn-reply-save").on("click", () => {
			this.replySave();
		});
	},

	save: function() {
		let data = {
			board_title: $("#board_title").val(),
			board_content: $("#board_content").val()
		};
		$.ajax({
			type: "POST",
			url: "/api/board",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8"
		}).done(function(resp) {
			alert("글쓰기 완료.");
			location.href = "/board/list";
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	},

	update: function() {
		let bid = $('#bid').val();
		
		let data = {
			board_title: $("#board_title").val(),
			board_content: $("#board_content").val()	
		};
		$.ajax({
			type: "PUT",
			url: "/api/board/" + bid,
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8"
		}).done(function(resp) {
			alert("글 수정이 완료되었습니다.");
			location.href = "/board/list";
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	},
	
	deleteById: function() {
		let bid = $('#bid').text();
		$.ajax({
			type: "DELETE",
			url: "/api/board/"+ bid,
			dataType: "json"
		}).done(function(resp) {
			alert("글삭제 완료.");
			location.href = "/board/list";
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	},
	
	replySave: function() {
		let data = {
			member_no:$("#memberNo").val(),
			boardId:$("#boardId").val(),
			reply_content: $("#reply-content").val(),
		};
		console.log(data);
		
		$.ajax({
			type: "POST",
			url: `/api/board/${data.boardId}/reply`,
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8"
		}).done(function(resp) {
			alert("댓글작성 완료.");
			location.href = `/board/${data.boardId}`;
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	},
	
	replyDelete: function(boardId, replyId) {
		$.ajax({
			type: "DELETE",
			url: `/api/board/${boardId}/reply/${replyId}`,
			dataType: "json"
		}).done(function(resp) {
			alert("댓글삭제 성공.");
			location.href = `/board/${boardId}`;
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	},



}
index.init();