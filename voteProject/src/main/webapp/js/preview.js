$(function(){
          $('#inputFile').on('change', function(){
           readURL(this);
          })
          $('#anim').on('click', function(){
           //alert("클릭");
           //$('#img').fadeToggle('slow', function(){});
                 //alert("애니메이션 종료후");
           //프로그램은 하나의 함수 안에 일반코드와 화면을 갱신하는 코드가 같이 존재하면
           //일반 코드를 먼저 수행하고, 화면 갱신하는 코드를 수행합니다.
           //그 이유는 화면을 갱신하는 코드를 수행하는 시간이 일반 코드를 수행하는 시간보다 길기
           //때문입니다.  이런 이유로 화면 갱신을 하는 코드는 대부부느 스레드로 처리하도록 하고 콜백 함수를
           //지정해서 화면 갱신이 끝나고 난 후 처리할 문장을 기술하도록 합니다.
          })
         })
         
         function readURL(input){
          //선택된 파일 있다면
          if(input.files && input.files[0]){
           //선택된 파일 이름 가져오기
           var fileName=
           input.files[0].name;
           //파일 이름에서 뒤의 3글자 가져오기
           var ext=fileName.substr(
            fileName.length-3, fileName.length);
           //alert(ext);
           //alert(fileName.lastIndexof('.'));
           
           //파일 이름에서 확장자 가져오기
           //var ext=fileName.substr(fileName.lastIndexof('.')+1, fileName.length);
           
            //확장자를 확인해서 jpg, gif, png가 아니면
     //함수를 빠져나감
     var isCheck=false; 
     
           if(ext.toLowerCase()=='jpg' || ext.toLowerCase()=='gif' || ext.toLowerCase()=='png'){
            isCheck=true;
                        
           }
           if(isCheck==false){
            alert("이미지 파일 아닙니다.");
            return;
           }
           //alert("이미지 파일");
          
          //   파일의 내용을 읽어 올 수 있는 파일 객체
          var reader = new FileReader();
          //읽을 파일을 설정
          reader.readAsDataURL(input.files[0]);          
          //파일의 내용이 메모리에 전부 로드되면
          //img 태그에 출력
          reader.onload=function(e){
           $('#img').attr('src', e.target.result);
//           $('#img').attr('data-src="holder.js/300x200', e.target.result);
          }
          
          }
         }


$(function(){
    $('#inputFile1').on('change', function(){
     readURL1(this);
    })
    $('#anim').on('click', function(){
    })
   })
   
   function readURL1(input){
    if(input.files && input.files[0]){
     var fileName=
     input.files[0].name;
     var ext=fileName.substr(
      fileName.length-3, fileName.length);
var isCheck=false; 

     if(ext.toLowerCase()=='jpg' || ext.toLowerCase()=='gif' || ext.toLowerCase()=='png'){
      isCheck=true;
                  
     }
     if(isCheck==false){
      alert("이미지 파일 아님");
      return;
     }
    var reader = new FileReader();
    reader.readAsDataURL(input.files[0]);          
    //img 태그에 출력
    reader.onload=function(e){
     $('#img1').attr('src', e.target.result);
    }
    
              
    }
   }