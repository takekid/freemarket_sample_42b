$(document).on('turbolinks:load',function(){
$('input#item_item_images_attributes_0_image').parent().css('display', 'block');
  var preview = $('.sell-uploader-items-container');
  var inputnum = 0;
  var perviewnum = 0;
  var widthcount = 0;


  function appendImage(perviewnum){
        var html = `<div class=sell-upload-items>
                  <ul id=file_list>
                    <li class=sell-upload-item, id=upload-item>
                    <figure class=sell-upload-figure>
                      <img id=item-prev${perviewnum} >
                      </img>
                      <div class=sell-upload-item-button>
                        <a class=sell-upload-edit>編集</a>
                      </div>
                      <div class=sell-upload-item-button>
                        <a id=sell-upload-delete${perviewnum}>削除</a>
                      </div>
                    </figure>
                    </li>
                  </ul>
                </div>`
        preview.append(html)
    $('input#item_item_images_attributes_0_image').parent().css('display', 'none');
    $('input#item_item_images_attributes_'+ inputnum +'_image').parent().css('display', 'none');
    inputnum +=1;
    $('input#item_item_images_attributes_'+ inputnum +'_image').parent().css('display', 'block');
    widthcount += 1;
    $('input#item_item_images_attributes_'+ inputnum +'_image').parent().css('width','100' - widthcount * 20 + '%');
  }

$(function(){
  //画像ファイルプレビュー表示のイベント追加 fileを選択時に発火するイベントを登録
  $('form').on('change', 'input[type="file"]',function(e) {


    var file = e.target.files[0],
        reader = new FileReader();
        t = this;

    var file_length = file.type.indexOf("image");
    // 画像ファイル以外の場合は何もしない
    if(file_length < 0){
      return false;
    }

    // ファイル読み込みが完了した際のイベント登録
    reader.onload = (function(file) {
      return function(e) {
   appendImage(inputnum)


        $('.sell-upload-items').css('display', 'block');
        // .prevewの領域の中にロードした画像を表示するimageタグを追加

      if(inputnum == 1){
          $("#item-prev0" ).attr({
                  src: e.target.result
              });
        }
      if(inputnum ==2 ){
          $("#item-prev1" ).attr({
                  src: e.target.result
              });
        }
      if(inputnum ==3 ){
          $("#item-prev2" ).attr({
                  src: e.target.result
              });
        }
      if(inputnum ==4){
          $("#item-prev3" ).attr({
                  src: e.target.result
              });
        }
      if(inputnum ==5){
          $("#item-prev4" ).attr({
                  src: e.target.result
              });
        }
      };

    })(file);


    reader.readAsDataURL(file);

    perviewnum += 1;
  });
  $(document).on('click', '.sell-upload-item-button', function(){
    $(this).parent().parent().remove();
    $('input#item_item_images_attributes_'+ deletenum +'_image').parent().css('display', 'block');
  })
});
});

