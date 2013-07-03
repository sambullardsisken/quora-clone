// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(function(){
  $(".answer_question").on("click", function(event) {
    var id = parseInt($(event.currentTarget).attr("data-id"));
    var answerForm = JST["templates/answer_form"]({ id: id });
    $("#question_box" + id).html(answerForm);

    $(".hide_answer_form").on("click", function(event) {
      $("#question_box" + id).html("");
    });

    $(".answer_form_submit").on("click", function() {
      var answer = {answer: {text: $("#answer_form").val()}}
      console.log(answer);
      $.ajax({
        url: "/questions/" + id + "/answers.json",
        type: "post",
        data: answer,
        success: function(answerData) {
          console.log(answerData);
        }
      });
    });
  });
});

