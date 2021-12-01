let index = {
	init: function() {
		$("#btn-save").on("click", () => {
			this.save();
		});
		$("#btn-checkId").on("click", () => {
			this.checkId();
		});
		$("#btn-update").on("click", () => {
			this.update();
		});
	},

	save: function() {
		let data = {
			member_id: $("#member_id").val(),
			member_password: $("#member_password").val(),
			member_username: $("#member_username").val(),
			member_address: $("#member_address").val(),
			member_address_no: $("#member_address_no").val(),
			member_address_detail: $("#member_address_detail").val(),
			member_email: $("#member_email").val(),
			member_phone: $("#member_phone").val(),
			member_reference: $("#member_reference").val()
		};
		$.ajax({
			type: "POST",
			url: "/auth/joinProc",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8"
		}).done(function(resp) {
			alert("회원가입 완료.");
			location.href = "/";
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	},

	update: function() {
		let data = {
			member_no: $("#member_no").val(),
			member_id: $("#member_id").val(),
			member_password: $("#member_password").val(),
			member_username: $("#member_username").val(),
			member_address: $("#member_address").val(),
			member_address_no: $("#member_address_no").val(),
			member_address_detail: $("#member_address_detail").val(),
			member_email: $("#member_email").val(),
			member_phone: $("#member_phone").val(),
			member_reference: $("#member_reference").val()
		};
		$.ajax({
			type: "PUT",
			url: "/member",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8"
		}).done(function(resp) {
			alert("회원수정 완료.");
			location.href = "/";
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	},


	checkId: function() {
		let data = {
			member_id: $("#member_id").val(),
		};

		console.log(data.member_id);
		$.ajax({
			type:'POST',
			url:"/member/checkId",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
		}).done(function(result) {
			if(result == "success") {
				alert('사용할 수 있는 아이디입니다.')
			} else {
				alert('사용할 수 없는 아이디입니다.')
			}
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	}


}
index.init();