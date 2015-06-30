//첫번째 파라미터는 업로드하는 파일로 두번째는 프리뷰를 보여줄 파일이다 
// 프리뷰파일은 어팬드차일드한다는 것을 주의하라.
//사진의 넓이,높는 840으로 고정했다.
function uploadPriview(uploadObject,priviewObject) {
	uploadObject.onchange = function (e) {
		e.preventDefault();

		var file = uploadObject.files[0],
		reader = new FileReader();
		reader.onload = function (event) {
			var img = new Image();
			img.src = event.target.result;
			img.height = 840;
			// note: no onload required since we've got the dataurl...I think! :)
			if (img.width > 840) { // holder width
				img.width = 840;
			}
			if (img.height > 840) { // holder width
				img.width = 840;
			}
			if (img.height < 840) { // holder width
				img.width = 840;
			}
			if (img.width < 840) { // holder width
				img.width = 840;
			}
			priviewObject.innerHTML = '';
			priviewObject.appendChild(img);
		};
		reader.readAsDataURL(file);

		return false;
	}
}