$(document).ready(function() {
  $('.visit').live('click', function(){
    var $this = $(this);
    $.get($this.val(), {visited: $this.is(':checked')}, null, 'script');
  });
})