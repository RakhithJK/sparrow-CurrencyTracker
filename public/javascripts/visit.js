$(document).ready(function() {
  $('.visit').live('click', function(){
    var $this = $(this);
    $.get($this.val(), {visited: $this.is(':checked'), country: $this.attr('data-country')}, null, 'script');
  });

  $('#visit_all').click(function(){
    var $this = $(this);
    var countries = [];
    $('.visit').each(function(){
      countries.push($(this).attr('data-country'));
    });
    $.get($this.val(), {visited: $this.is(':checked'), countries: countries}, null, 'script');
    if($this.is(':checked')){
      $('.visit').attr("checked", "checked");
    }
    else {
      $('.visit').removeAttr("checked");
    }
  });
})