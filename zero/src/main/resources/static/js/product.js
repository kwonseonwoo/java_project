let index = {
	init: function() {
		$("#btn-buy").on("click", () => {
			this.buy();
		});
	},
	buy: function() {
		let data = {
			product_no = $("#product_no").val(),
			product_name = $("#product_name").val(),
			sale_count = $("#sale_count").val(),
		};
		$.ajax({
			type: "PUT",
			url: "/product",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8"
		}).done(function(resp) {
			alert("구매 완료.");
			location.href = "/";
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	}

}
index.init();