$(function(){

  $('.list__category').hover(function() {
    var category_parent = $(this).children('.parent__tree');
    category_parent.show();
  }, function() {
    $(this).children('.parent__tree').hide();
  });

  $('.parent__tree__item').hover(function() {
    var category_child = $(this).children('.children__tree');
    category_child.show();
  }, function() {
    $(this).children('.children__tree').hide();
  });

  $('.children__tree__item').hover(function() {
    var category_grandchild = $(this).children('.grandchildren__tree');
    category_grandchild.show();
  }, function() {
    $(this).children('.grandchildren__tree').hide();
  });
});