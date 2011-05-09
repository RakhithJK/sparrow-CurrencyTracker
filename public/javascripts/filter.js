var Filter = {};

Filter.init = function(element) {
  var controller = new ViewController(element, {
    initialize: function() {
      var _this = this;
      this.$field = $(this.root.field);
      this.$area = $(this.root.area);
      this.$field.keyup(function(){
        $.get(_this.$field.attr('data-url'), {like: _this.$field.val()}, null, 'script');
      });
    },

    render: function(data){
      this.$area.html(data);
    }
  });

  for( var key in controller )
    if( typeof controller[key] == 'function' )
      Filter[key] = controller[key];
};

$(document).ready(function() {
  Filter.init({field: '#filter', area: '#filter_result_area'});
});