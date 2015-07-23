//= require jquery
//=require jquery-ui
//= require jquery_ujs
//=require jquery-ui-timepicker-addon

$(document).ready(function() {
  jQuery('input.hasDatetimePicker').datetimepicker({
    dateFormat: "dd/mm/yy",
    beforeShow: function () {
      setTimeout(
        function () {
          $('#ui-datepicker-div').css("z-index", "3000");
        }, 100
      );
    }
  });
});
jQuery(document).ready(function() {
    jQuery('.datepicker').datepicker({
        dateFormat : 'yy-mm-dd'
    });
});