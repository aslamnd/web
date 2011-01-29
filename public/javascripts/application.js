var update_sidebar_height  = function(){
  var content_height = $("#slideshow").height() + $("#content").height();
  var window_height = $(window).height();
  var total_height = 0;
  if(content_height > window_height){
    total_height = content_height;
  }else{
    total_height = window_height;
  }

  if($("#sidebar-inner").height() < total_height){
    $("#sidebar-inner").css('height',total_height);
  }
}();
