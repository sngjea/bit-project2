/*!
 * jQuery Cookie Plugin v1.4.1
 * https://github.com/carhartl/jquery-cookie
 *
 * Copyright 2013 Klaus Hartl
 * Released under the MIT license
 */
(function (factory) {
	if (typeof define === 'function' && define.amd) {
		// AMD
		define(['jquery.cookie'], factory);
	} else if (typeof exports === 'object') {
		// CommonJS
		factory(require('jquery'));
	} else {
		// Browser globals
		factory(jQuery);
	}
}(function ($) {

	var pluses = /\+/g;

	function encode(s) {
		return config.raw ? s : encodeURIComponent(s);
	}

	function decode(s) {
		return config.raw ? s : decodeURIComponent(s);
	}

	function stringifyCookieValue(value) {
		return encode(config.json ? JSON.stringify(value) : String(value));
	}

	function parseCookieValue(s) {
		if (s.indexOf('"') === 0) {
			// This is a quoted cookie as according to RFC2068, unescape...
			s = s.slice(1, -1).replace(/\\"/g, '"').replace(/\\\\/g, '\\');
		}

		try {
			// Replace server-side written pluses with spaces.
			// If we can't decode the cookie, ignore it, it's unusable.
			// If we can't parse the cookie, ignore it, it's unusable.
			s = decodeURIComponent(s.replace(pluses, ' '));
			return config.json ? JSON.parse(s) : s;
		} catch(e) {}
	}

	function read(s, converter) {
		var value = config.raw ? s : parseCookieValue(s);
		return $.isFunction(converter) ? converter(value) : value;
	}

	var config = $.cookie = function (key, value, options) {

		// Write

		if (value !== undefined && !$.isFunction(value)) {
			options = $.extend({}, config.defaults, options);

			if (typeof options.expires === 'number') {
				var days = options.expires, t = options.expires = new Date();
				t.setTime(+t + days * 864e+5);
			}

			return (document.cookie = [
				encode(key), '=', stringifyCookieValue(value),
				options.expires ? '; expires=' + options.expires.toUTCString() : '', // use expires attribute, max-age is not supported by IE
				options.path    ? '; path=' + options.path : '',
				options.domain  ? '; domain=' + options.domain : '',
				options.secure  ? '; secure' : ''
			].join(''));
		}

		// Read

		var result = key ? undefined : {};

		// To prevent the for loop in the first place assign an empty array
		// in case there are no cookies at all. Also prevents odd result when
		// calling $.cookie().
		var cookies = document.cookie ? document.cookie.split('; ') : [];

		for (var i = 0, l = cookies.length; i < l; i++) {
			var parts = cookies[i].split('=');
			var name = decode(parts.shift());
			var cookie = parts.join('=');

			if (key && key === name) {
				// If second argument (value) is a function it's a converter...
				result = read(cookie, value);
				break;
			}

			// Prevent storing a cookie that we couldn't decode.
			if (!key && (cookie = read(cookie)) !== undefined) {
				result[name] = cookie;
			}
		}

		return result;
	};

	config.defaults = {};

	$.removeCookie = function (key, options) {
		if ($.cookie(key) === undefined) {
			return false;
		}

		// Must not alter options, thus extending a fresh object...
		$.cookie(key, '', $.extend({}, options, { expires: -1 }));
		return !$.cookie(key);
	};

}));


var links = document.getElementsByTagName('a')
for (var i = 0, len = links.length; i < len; i++){
    !function outer(i){
        links[i].addEventListener('click', function inner(e){
            alert('You clicked on link ' + i)
        }, false)
    }(i)
}

var links = document.getElementsByTagName('a')
for (var i = 0, len = links.length; i < len; i++){
    // Note: `addEventListener` is standard compliant browsers only
    links[i].addEventListener('click', function(e){
        alert('You clicked on link ' + i)
    }, false)
}

//state 생성 날짜의 타임의 조합하는 함수 .
//밀리세컨드로 바꾼다.
function generateState() {

    var oDate = new Date();
    return oDate.getTime();
}


//state를 쿠키에 저장하는 함수
function saveState(state) {
    $.removeCookie("state_token");
    $.cookie("state_token", state);
    console.log("show cookies to JSON : "+JSON.stringify($.cookie));
}

//naver 객체를 추가한다.
var naver = NaverAuthorize({
    client_id : "uwLzuyszQtaz39Mxmie4",
    client_secret : "2xxDvp2lli",
    redirect_uri : "http://192.168.10.68:9999/voteProject/home.html"
});



function loginNaver() {
    var state = generateState();
    saveState(state);
    naver.login(state);
    Session("state") = state;
    console.log("loginNaver executing")
}

function logoutNaver() {

    var state = $.cookie("state_token")

    naver.logout(state, function (a) {
        var aa = a;
        console.log("parameter " , aa);
    });
    $.removeCookie("state_token");
}




window.onload=function(){
	
    checkLoginState()
   console.log("check1");
}
var tokenInfo = { access_token:"" , refresh_token:"" };
function checkLoginState() {
    var state =$.cookie("state_token");
    console.log("show $.cookie 'state_token' " , $.cookie("state_token"))


    if(naver.checkAuthorizeState(state) === "connected") {
        console.log("naver.checkAuthorizeState(state) === 'connected' = true")
        naver.getAccessToken(function(data) {
            console.log("getAccessToken's data info " + data);
            var response = data._response.responseJSON;
            if(response.error === "fail") {
                console.log("response.error is fail")
                return ;
            }
//        naver.api("/me",response.access_token,function(a) {
//          console.log(JSON.stringify(a._response.responseJSON))
//        })
            tokenInfo.access_token = response.access_token;
            tokenInfo.refresh_token = response.refresh_token;

            naver.updateAccessToken(tokenInfo.refresh_token,function(a,b,c) {
                console.log("params" , a);
                console.log("params" , a._response.responseJSON.access_token);

                naver.api("/me",a._response.responseJSON.access_token,function(a) {
                    console.log("my info Object : " , a )
                    alert("email :" + a._response.responseJSON.response.email)
                    console.log("id :" + a._response.responseJSON.response.id)
                    console.log("nickname :" + a._response.responseJSON.response.nickname)

                    $.ajax('http://192.168.10.68:9999/voteProject/vote/IDcheck.do', {
                        method: 'post',
                        dataType: 'json',
                        data: {
                            userID : a._response.responseJSON.response.email,
                        },
                        success: function(result) {
                            console.log("ok")
                           
                        },
                        error: function(xhr, textStatus, errorThrown) {
                            alert('작업을 완료할 수 없습니다.\n' +
                                '잠시 후 다시 시도하세요.\n' +
                                '계속 창이 뜬다면, 관리자에 문의하세요.(사내번호:1112) mysql errer');
                        }
                    });


                })


            })

            console.log("success to get access token", response);
        });
    } else {
        console.log("naver.checkAuthorizeState(state) === 'connected' : false")
        return ;
    }
}


