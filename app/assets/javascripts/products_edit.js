$(function(){
  // プレビュー用のimgタグを生成する関数
  const buildImg = (index, url)=> {
    const html = `<div data-index="${index}", class="products_edit-preview-box">
                    <div class="products_edit-upper-box">
                      <img class= "image${index} product_edit-input_images", data-index="${index}" src="${url}" width="100px" height="100px">
                      <div class="products_edit-js-remove">
                        削除
                      </div>
                    </div>
                  </div>`;
    return html;
  }
  // 画像用のinputを生成する関数
  const buildFileField = (num)=> {
    const html = `<div data-index="${num}" class="product_edit-js-file_group">
                    <input class="product_edit-js-file" type="file"
                    name="product[product_images_attributes][${num}][image]"
                    id="product_images_attributes_${num}_image"
                    style="display:none;">
                  </div>`;
    return html;
  }
  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  // 既に使われているindexを除外
  lastIndex = $('.product_edit-js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);

  $('.product_edit-hidden-destroy').hide();
  
  $('.products_edit-image-box').on('change', '.product_edit-js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('image', blobUrl);
    } else {  // 新規画像追加の処理
      $('.products_edit-content').append(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      $('.products_edit-lower-box__label').prepend(buildFileField(fileIndex[0]));
      $(this).css({'display':'none'});
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
  });

  // 削除ボタンの設定
  $('.products_edit-image-box').on('click', '.products_edit-js-remove', function() {
    const targetIndex = $(this).prev().data('index');
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].product_edit-hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);
    $(this).parent().parent().remove();
    $(`div[data-index="${targetIndex}"]`).remove();
    // 画像入力欄が0個にならないようにしておく
    if ($('.product_edit-js-file').length == 0) $('.products_edit-lower-box__label').prepend(buildFileField(fileIndex[0]));
  });
});