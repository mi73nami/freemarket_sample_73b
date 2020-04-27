$(function(){
  function appendOption(category){
    var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }
  function appendChidrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml =`<select class="products_new-product_explanation__category--children" id="child_category" name="product[category_id]">
                        <option value="" data-category="選択してください">選択してください</option>
                          ${insertHTML}
                      <select>`;
    $('.products_new-product_explanation__category--box').append(childSelectHtml);
  }
  function appendGrandchidrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `<select class="products_new-product_explanation__category--grandchildren" id="grandchild_category" name="product[category_id]">
                              <option value="" data-category="選択してください">選択してください</option>
                                ${insertHTML}
                            </select>`;
    $('.products_new-product_explanation__category--box').append(grandchildSelectHtml);
  }
  $('#parent_category').on("change",function(){
    var parentCategory = document.getElementById('parent_category').value;
    if (parentCategory != "選択してください"){
      $.ajax({
        url: 'get_category_children',
        type: 'GET',
        data: { parent_name: parentCategory },
        dataType: 'json'
      })
      .done(function(children){
        $('.products_new-product_explanation__category--children').remove();
        $('.products_new-product_explanation__category--grandchildren').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChidrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('.products_new-product_explanation__category--children').remove();
      $('.products_new-product_explanation__category--grandchildren').remove();
    }
  });
  $('.products_new-product_explanation__category--box').on('change', '#child_category', function(){
    var childId = $('#child_category option:selected').data('category');
    if (childId != "選択してください"){
      $.ajax({
        url: 'get_category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        console.log(grandchildren)
        if (grandchildren.length != 0) {
          $('.products_new-product_explanation__category--grandchildren').remove();
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchidrenBox(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('.products_new-product_explanation__category--grandchildren').remove();
    }
  });
});