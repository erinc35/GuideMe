$(document).ready(function() {
  signupPop();
});

function signupPop(){
  $("#signup").on("click", function(event){
    event.preventDefault();
    $(".modal-content").css("background-image", url("pichu.jpg"))
    // var containerElement = document.getElementById('main_container');
    //   $("#traveler").css("display", "block");

    //    // $("body").hide()

    //   $("#traveler").fadeIn();


  })
}
// // $(function() {

// //     function log_modal_event(event, modal) {
// //       if(typeof console != 'undefined' && console.log) console.log("[event] " + event.type);
// //     };

// //     $(document).on($.modal.BEFORE_BLOCK, log_modal_event);
// //     $(document).on($.modal.BLOCK, log_modal_event);
// //     $(document).on($.modal.BEFORE_OPEN, log_modal_event);
// //     $(document).on($.modal.OPEN, log_modal_event);
// //     $(document).on($.modal.BEFORE_CLOSE, log_modal_event);
// //     $(document).on($.modal.CLOSE, log_modal_event);
// //     $(document).on($.modal.AFTER_CLOSE, log_modal_event);
// //     $(document).on($.modal.AJAX_SEND, log_modal_event);
// //     $(document).on($.modal.AJAX_SUCCESS, log_modal_event);
// //     $(document).on($.modal.AJAX_COMPLETE, log_modal_event);

// //     $('#more').click(function() {
// //       $(this).parent().after($(this).parent().next().clone());
// //       return false;
// //     });

// //     $('#manual-ajax').click(function(event) {
// //       event.preventDefault();
// //       $.get(this.href, function(html) {
// //         $(html).appendTo('body').modal();
// //       });
// //     });

// //     $("#traveler").click(function(event) {
// //       event.preventDefault();
// //       $(this).modal({
// //         fadeDuration: 250
// //       });
// //     });
// // myBlurFunction = function(state) {

// //     var containerElement = document.getElementById('main_container');
// //     // var overlayEle = document.getElementById('overlay');

// //     if (state) {
// //         // overlayEle.style.display = 'block';
// //         containerElement.setAttribute('class', 'blur');
// //     }
// // };
