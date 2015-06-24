

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
    redirect_uri : "http://192.168.10.68:9999/voteProject/vote/set"
});



function loginNaver() {
    var state = generateState();
    saveState(state);
    naver.login(state);
    Session("state") = state;
}

function logoutNaver() {
    var state = $.cookie("state_token");

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
    var state = $.cookie("state_token");
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
                    console.log("email :" + a._response.responseJSON.response.email)
                    console.log("id :" + a._response.responseJSON.response.id)
                    console.log("nickname :" + a._response.responseJSON.response.nickname)

                    $.ajax('http://192.168.10.65:3000/id', {
                        method: 'post',
                        dataType: 'json',
                        data: {
                            id : a._response.responseJSON.response.id ,
                            email : a._response.responseJSON.response.email,
                            nicname : a._response.responseJSON.response.nickname,
                            age : a._response.responseJSON.response.age
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


