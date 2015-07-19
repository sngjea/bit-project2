

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
function logoutFB() {
	
    var state = $.cookie("state_token")

    naver.logout(state, function (a) {
        var aa = a;
        console.log("parameter " , aa);
    });
    $.removeCookie("state_token");
    //페이지를 옴긴다. 
    location.href=domain+'/vote/logout.do'
}

function loginx() {
	FB.init({
		appId      : '1625255044379083',
		cookie     : true,  // enable cookies to allow the server to access 
		// the session
		xfbml      : true,  // parse social plugins on this page
		version    : 'v2.3' // use version 2.2
	});
	
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
		getUserInfo();
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
		$.cookie("userName", response.name);
		$.cookie("userUID", response.id);
		console.log(response)
		post_to_url(domain + "/vote/IDcheck.do",{
			'userID' : response.email,
			'userName' : response.name
		})

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
function post_to_url(path, params, method) {
    method = "post";  //method 부분은 입력안하면 자동으로 post가 된다.
    var form = document.createElement("form");
    form.setAttribute("method", method);
    form.setAttribute("action", path);
    //input type hidden name(key) value(params[key]);
    for(var key in params) {
        var hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", key);
        hiddenField.setAttribute("value", params[key]);
        form.appendChild(hiddenField);
    }
    document.body.appendChild(form);
    form.submit();
}

function generateState() {

    var oDate = new Date();
    return oDate.getTime();
}
