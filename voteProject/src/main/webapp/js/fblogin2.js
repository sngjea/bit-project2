

function statusChangeCallback(response) {
	console.log('statusChangeCallback');
	console.log(response);
	if (response.status === 'connected') {
		testAPI();
	} else if (response.status === 'not_authorized') {
		console.log("not connected")
	} else {
	}
}

function checkLoginState() {
	FB.getLoginStatus(function(response) {
		statusChangeCallback(response);
	});
}

function login() {
	FB.init({
		appId      : '1625255044379083',
		cookie     : true,  // enable cookies to allow the server to access 
		// the session
		xfbml      : true,  // parse social plugins on this page
		version    : 'v2.3' // use version 2.2
	});


	FB.getLoginStatus(function(response) {
		statusChangeCallback(response);
	}); //로그인 상태 확인 후 testAPI 에서 replrace 되도록 디자인되어 있다.
	

};
//Load the SDK asynchronously
(function(d, s, id) {
	var js, fjs = d.getElementsByTagName(s)[0];
	if (d.getElementById(id)) return;
	js = d.createElement(s); js.id = id;
	js.src = "//connect.facebook.net/en_US/sdk.js";
	fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

//페이스북 연동

//Here we run a very simple test of the Graph API after login is
//successful.  See statusChangeCallback() for when this call is made.
function testAPI() {
	console.log('Welcome!  Fetching your information.... ');
	FB.api('/me', function(response) {
		$.removeCookie("state_token");
		$.cookie("state_token", generateState() );
		window.location.replace("http://192.168.10.68:9999/voteProject/home.html?fb=&id=" + response.id + "&email=" + response.email);
	});
}



function loginFB(){
	FB.login(function(response) {
		if (response.status === 'connected') {
			testAPI();
			getUserInfo();

		} else if (response.status === 'not_authorized') {
			// The person is logged into Facebook, but not your app.
		} else {
			// The person is not logged into Facebook, so we're not sure if
			// they are logged into this app or not.
		}
	});
}


function getUserInfo() {
	FB.api('/me', function(response) {

		//response.name       - User Full name
		//response.link       - User Facebook URL
		//response.username   - User name
		//response.id         - id
		//response.email      - User email

	});

}

function facebook_send_message() {
    FB.ui({
        app_id:'1625255044379083',
        method: 'send',
        name: "sdfds jj jjjsdj j j ",
        link: 'https://apps.facebook.com/xxxxxxxaxsa',
        to:"gotoilhwan@naver.com",
        description:'sdf sdf sfddsfdd s d  fsf s '

    });
}



